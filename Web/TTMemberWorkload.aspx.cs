using DayPilot.Utils;
using DayPilot.Web.Ui;
using DayPilot.Web.Ui.Enums;
using System;
using System.Collections;
using System.Data;
using System.Drawing;


public partial class TTMemberWorkload : System.Web.UI.Page
{
    private DataTable table;
    string strHQL1, strHQL2;

    protected void Page_Load(object sender, EventArgs e)
    {
        ArrayList year;
        int i, intYear;

        string strOperatorCode, strOperatorName;


        try
        {
            strOperatorCode = Request.QueryString["UserCode"];
            strOperatorName = ShareClass.GetUserName(strOperatorCode);
        }
        catch
        {
            return;
        }

        try
        {
            intYear = int.Parse(DL_Year.SelectedValue);
        }
        catch
        {
            intYear = DateTime.Now.Year;
        }

        DayPilotScheduler1.StartDate = new DateTime(intYear, 1, 1);
        DayPilotScheduler1.Days = Year.Days(intYear);
        DayPilotScheduler1.Separators.Add(DateTime.Today, Color.Red);

        DayPilotScheduler1.SetScrollX(DateTime.Today);
        DayPilotScheduler1.ScrollY = 10;

        string strScale;
        strScale = RB_HaveWorkload.SelectedValue;

        if (strScale == "hour")
        {
            DayPilotScheduler1.CellGroupBy = GroupByEnum.Hour;
        }
        if (strScale == "week")
        {
            DayPilotScheduler1.CellGroupBy = GroupByEnum.Week;
        }
        if (strScale == "month")
        {
            DayPilotScheduler1.CellGroupBy = GroupByEnum.Month;
        }
        if (strScale == "year")
        {
            DayPilotScheduler1.CellGroupBy = GroupByEnum.Year; ;
        }

        //设置日程控件语言
        Culture = ShareClass.GetDayPilotLanguage();

        if (!IsPostBack)
        {
            year = new ArrayList();
            for (i = DateTime.Now.Year - 10; i <= DateTime.Now.Year + 10; i++)
                year.Add(i.ToString());

            DL_Year.DataSource = year;
            DL_Year.DataBind();
            DL_Year.SelectedValue = System.DateTime.Now.Year.ToString();

            strHQL1 = "Select UserCode, UserName,Type,ProjectID ,ProjectName,BeginDate,EndDate  From V_ProjectMember_WorkLoad";
            strHQL1 += " Where UserCode = " + "'" + strOperatorCode + "'";
            initData(strHQL1);
            LB_SQL1.Text = strHQL1;

            strHQL2 = "Select distinct UserName  From V_ProjectMember_WorkLoad";
            strHQL2 += " Where UserCode = " + "'" + strOperatorCode + "'";
            setDataSourceAndBind(strHQL2);
            LB_SQL2.Text = strHQL2;
        }
    }

    protected void DL_Year_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        int intYear = int.Parse(DL_Year.SelectedValue);

        DayPilotScheduler1.StartDate = new DateTime(intYear, 1, 1);
        DayPilotScheduler1.Days = Year.Days(intYear);
        DayPilotScheduler1.Separators.Add(DateTime.Today, Color.Red);

        strHQL1 = LB_SQL1.Text.Trim();
        strHQL2 = LB_SQL2.Text.Trim();

        initData(strHQL1);
        setDataSourceAndBind(strHQL2);
    }



    protected void RB_HaveWorkload_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strScale;

        strScale = RB_HaveWorkload.SelectedValue;

        if (strScale == "hour")
        {
            DayPilotScheduler1.CellDuration = 60;
            DayPilotScheduler1.CellGroupBy = GroupByEnum.Hour;
        }

        if (strScale == "day")
        {
            DayPilotScheduler1.CellDuration = 60;
            DayPilotScheduler1.CellGroupBy = GroupByEnum.Day;
        }

        if (strScale == "week")
        {
            DayPilotScheduler1.CellDuration = 1440;
            DayPilotScheduler1.CellGroupBy = GroupByEnum.Week;
        }

        if (strScale == "month")
        {
            DayPilotScheduler1.CellDuration = 1440;

            DayPilotScheduler1.CellGroupBy = GroupByEnum.Month;
        }

        if (strScale == "year")
        {
            DayPilotScheduler1.CellDuration = 1440;

            DayPilotScheduler1.CellGroupBy = GroupByEnum.Year; ;
        }

        Session["Scheduler"] = null;

        string strUserCode = Session["UserCode"].ToString();

        int intYear = int.Parse(DL_Year.SelectedValue);

        DayPilotScheduler1.StartDate = new DateTime(intYear, 1, 1);
        DayPilotScheduler1.Days = Year.Days(intYear);
        DayPilotScheduler1.Separators.Add(DateTime.Today, Color.Red);

        strHQL1 = LB_SQL1.Text.Trim();
        strHQL2 = LB_SQL2.Text.Trim();

        initData(strHQL1);
        setDataSourceAndBind(strHQL2);
    }


    private void initData(string strHQL)
    {
        if (Session["Scheduler"] == null)
        {
            Session["Scheduler"] = GetData(strHQL);
        }
        table = (DataTable)Session["Scheduler"];
    }

    private void setDataSourceAndBind(string strHQL)
    {
        // ensure that filter is loaded

        DayPilotScheduler1.Resources.Clear();

        GenerateResource(strHQL);

        string filter = (string)DayPilotScheduler1.ClientState["filter"];
        DayPilotScheduler1.DataSource = getData(DayPilotScheduler1.StartDate, DayPilotScheduler1.EndDate, filter);


        DayPilotScheduler1.DataBind();
    }

    private DataTable getData(DateTime start, DateTime end, string filter)
    {
        String select;
        if (String.IsNullOrEmpty(filter))
        {
            select = String.Format("NOT (([end] <= '{0:s}') OR ([start] >= '{1:s}'))", start, end);
        }
        else
        {
            select = String.Format("NOT (([end] <= '{0:s}') OR ([start] >= '{1:s}')) and [name] like '%{2}%'", start, end, filter);
        }
        //throw new Exception(select);

        DataRow[] rows = table.Select(select);
        DataTable filtered = table.Clone();
        foreach (DataRow r in rows)
        {
            filtered.ImportRow(r);
        }
        return filtered;
    }

    protected void GenerateResource(string strHQL)
    {
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkLoad");

        Resource resource = new Resource();

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            resource = new Resource();
            resource.Name = ds.Tables[0].Rows[i][0].ToString();
            resource.Id = ds.Tables[0].Rows[i][0].ToString();
            DayPilotScheduler1.Resources.Add(resource);
        }
    }

    protected DataTable GetData(string strHQL)
    {
        int i;

        string strBeginTime, strEndTime;
        DateTime t1, t2;
        int day;

        DataTable dt;
        dt = new DataTable();
        dt.Columns.Add("id", typeof(string));
        dt.Columns.Add("start", typeof(DateTime));
        dt.Columns.Add("end", typeof(DateTime));
        dt.Columns.Add("name", typeof(string));
        dt.Columns.Add("column", typeof(string));
        dt.Columns.Add("allday", typeof(bool));
        dt.Columns.Add("color", typeof(string));

        DataRow dr;


        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkLoad");
        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            try
            {
                strBeginTime = ds.Tables[0].Rows[i][5].ToString().Replace(" 0:00", " 8:00");
                strEndTime = ds.Tables[0].Rows[i][6].ToString().Replace(" 0:00", " 18:00");
                t1 = DateTime.Parse(strBeginTime);
                t2 = DateTime.Parse(strEndTime);
                day = Math.Abs(((TimeSpan)(t1 - t2)).Days);


                dr = dt.NewRow();
                dr["id"] = i.ToString();
                dr["start"] = DateTime.Parse(strBeginTime);
                dr["end"] = DateTime.Parse(strEndTime);
                dr["name"] = ds.Tables[0].Rows[i][2].ToString().Trim() + ":" + ds.Tables[0].Rows[i][3].ToString().Trim() + " " + ds.Tables[0].Rows[i][4].ToString().Trim();
                dr["name"] += " (" +ds.Tables[0].Rows[i][5].ToString().Trim() + "---" + ds.Tables[0].Rows[i][6].ToString().Trim() + ")";
                dr["column"] = ds.Tables[0].Rows[i][1].ToString();
                dt.Rows.Add(dr);
            }
            catch
            {
            }
        }
        return dt;
    }
}