using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Security.Permissions;


using System.Data.SqlClient;

using System.Data.OleDb;
using NickLee.Web.UI.VB;

using System.Globalization;
using System.Threading;

using DayPilot.Web.Ui;
using DayPilot.Utils;
using DayPilot.Web.Ui.Events;
using DayPilot.Web.Ui.Enums;
using DayPilot.Web.Ui.Events.Bubble;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;
using Npgsql;

public partial class TTMyMemWorkLoad : System.Web.UI.Page
{
    private DataTable table;
    string strHQL1, strHQL2, strHQL3;
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strLangCode = Session["LangCode"].ToString();

        string strUserCode = Session["UserCode"].ToString();

        Session["Scheduler"] = null;

        ArrayList year;
        int i, intYear;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "成员负荷", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
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
            DLC_BeginDate.Text = DateTime.Now.Year.ToString() + "-01-01";
            DLC_EndDate.Text = DateTime.Now.Year.ToString() + "-12-31";

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT, TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;
            ShareClass.LoadMemberByUserCodeForDataGrid(strUserCode, "Workload", DataGrid2);

            year = new ArrayList();
            for (i = DateTime.Now.Year - 10; i <= DateTime.Now.Year + 10; i++)
                year.Add(i.ToString());

            DL_Year.DataSource = year;
            DL_Year.DataBind();
            DL_Year.SelectedValue = System.DateTime.Now.Year.ToString();

            if (LB_SQL1.Text == "")
            {
                strHQL1 = "Select distinct UserCode, UserName,Type,ProjectID ,ProjectName,BeginDate,EndDate  From V_MyMember_WorkLoad";
                strHQL1 += " Where UserCode in (Select UnderCode From T_MemberLevel Where WorkloadVisible = 'YES' and UserCode = " + "'" + strUserCode + "'" + ")";
            }
            else
            {
                strHQL1 = LB_SQL1.Text;
            }
            initData(strHQL1);
            LB_SQL1.Text = strHQL1;

            if (LB_SQL2.Text == "")
            {
                strHQL2 = "Select distinct UserName From V_MyMember_WorkLoad";
                strHQL2 += " Where UserCode in (Select UnderCode From T_MemberLevel Where WorkloadVisible = 'YES' and UserCode = " + "'" + strUserCode + "'" + ")";
            }
            else
            {
                strHQL2 = LB_SQL2.Text;
            }
            setDataSourceAndBind(strHQL2);
            LB_SQL2.Text = strHQL2;

            strHQL3 = "Select distinct ProjectID,ProjectName From T_Project Where ProjectID in ( Select ProjectID from T_RelatedUser where UserCode in (Select UnderCode From T_MemberLevel Where WorkloadVisible = 'YES' and UserCode = " + "'" + strUserCode + "'" + "))";
            strHQL3 += " and Status Not in ('归档','删除','取消','挂起')";
            strHQL3 += " Order by ProjectID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL3, "T_RelatedUser");
            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
            LB_SQL3.Text = strHQL3;

            ShareClass.LoadTaskStatus(DL_Status, strLangCode);
            DL_Status.Items.Insert(0, new ListItem("--Select--", ""));

            LoadProjectTask();
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartCode, strOpretorName, strProjectID, strProjectName, strTaskName, strStatus;
        string strTaskBeginTime, strTaskEndTime;

        strProjectID = LB_ProjectID.Text.Trim();
        strDepartCode = "%" + LB_BelongDepartCode.Text.Trim() + "%";
        strOpretorName = "%" + TB_TaskOperator.Text.Trim() + "%";
        strProjectName = "%" + TB_ProjectName.Text.Trim() + "%";
        strTaskName = "%" + TB_TaskName.Text.Trim() + "%";
        strTaskBeginTime = DateTime.Parse(DLC_BeginDate.Text).ToString("yyyyMMdd");
        strTaskEndTime = DateTime.Parse(DLC_EndDate.Text).ToString("yyyyMMdd");

        try
        {
            strStatus = "%" + DL_Status.SelectedValue + "%";
        }
        catch
        {
            strStatus = "%%";
        }

        strHQL = "Select * From V_ProjectMemberTaskDetailReport  ";
        strHQL += " Where DepartCode Like " + "'" + strDepartCode + "'";
        strHQL += " and UserName Like " + "'" + strOpretorName + "'";
        if (strProjectID != "")
        {
            strHQL += " and ProjectID = " + strProjectID;
        }
        else
        {
            strHQL += " and ProjectName Like " + "'" + strProjectName + "'";
        }
        strHQL += " and TaskName Like " + "'" + strTaskName + "'";
        strHQL += " and to_char(TaskBeginDate,'yyyymmdd') >= " + "'" + strTaskBeginTime + "'";
        strHQL += " and to_char(TaskEndDate,'yyyymmdd') <= " + "'" + strTaskEndTime + "'";
        strHQL += " and Status Like " + "'" + strStatus + "'";

        strHQL += " and UserCode in (Select UnderCode From T_MemberLevel Where WorkloadVisible = 'YES' and UserCode = " + "'" + Session["UserCode"].ToString() + "'" + ")";

        strHQL += " Order By ProjectID DESC, TaskBeginDate ASC,UserName ASC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ProjectMemberTaskDetailReport");

        DataList1.DataSource = ds;
        DataList1.DataBind();
    }

    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;


        string strDepartCode, strOpretorName, strProjectID, strProjectName, strTaskName, strStatus;
        string strTaskBeginTime, strTaskEndTime;

        strProjectID = LB_ProjectID.Text.Trim();
        strDepartCode = "%" + LB_BelongDepartCode.Text.Trim() + "%";
        strOpretorName = "%" + TB_TaskOperator.Text.Trim() + "%";
        strProjectName = "%" + TB_ProjectName.Text.Trim() + "%";
        strTaskName = "%" + TB_TaskName.Text.Trim() + "%";
        strTaskBeginTime = DateTime.Parse(DLC_BeginDate.Text).ToString("yyyyMMdd");
        strTaskEndTime = DateTime.Parse(DLC_EndDate.Text).ToString("yyyyMMdd");

        strStatus = "%" + DL_Status.SelectedValue + "%";

        strHQL = @"Select DepartCode as 组别,
                   UserName as 姓名,
                   ProjectName as 项目,
                   PlanName as 计划,
                   TaskName as 任务,
                   PlanBeginTime as 计划预计开始时间,
                   PlanEndTime as 计划预计结束时间,
                   TaskBeginDate as 任务预计开始时间,
                   TaskFirstOperateTime as 任务受理时间,
                   TaskEndDate as 任务预计结束时间,
                   TaskLastestOperateTime as 任务最新操作时间,
                   Status as 任务状态,
                   TaskLog as 任务日志
                   From V_ProjectMemberTaskDetailReport";

        strHQL += " Where DepartCode Like " + "'" + strDepartCode + "'";
        strHQL += " and UserName Like " + "'" + strOpretorName + "'";
        if (strProjectID != "")
        {
            strHQL += " and ProjectID = " + strProjectID;
        }
        else
        {
            strHQL += " and ProjectName Like " + "'" + strProjectName + "'";
        }
        strHQL += " and TaskName Like " + "'" + strTaskName + "'";
        strHQL += " and to_char(TaskBeginDate,'yyyymmdd') >= " + "'" + strTaskBeginTime + "'";
        strHQL += " and to_char(TaskEndDate,'yyyymmdd') <= " + "'" + strTaskEndTime + "'";
        strHQL += " and Status Like " + "'" + strStatus + "'";

        strHQL += " and UserCode in (Select UnderCode From T_MemberLevel Where WorkloadVisible = 'YES' and UserCode = " + "'" + Session["UserCode"].ToString() + "'" + ")";

        strHQL += " Order By ProjectID DESC, TaskBeginDate ASC,UserName ASC";

        DataTable dtProject = ShareClass.GetDataSetFromSql(strHQL, "project").Tables[0];

        Export3Excel(dtProject, "项目成员任务.xls");

        //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('导出成功！');", true);
    }

    public void Export3Excel(DataTable dtData, string strFileName)
    {
        DataGrid dgControl = new DataGrid();
        dgControl.DataSource = dtData;
        dgControl.DataBind();

        Response.Clear();
        Response.Buffer = true;
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + strFileName);
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        Response.ContentType = "application/shlnd.ms-excel";
        Response.Charset = "GB2312";
        EnableViewState = false;
        System.Globalization.CultureInfo mycitrad = new System.Globalization.CultureInfo("ZH-CN", true);
        System.IO.StringWriter ostrwrite = new System.IO.StringWriter(mycitrad);
        System.Web.UI.HtmlTextWriter ohtmt = new HtmlTextWriter(ostrwrite);
        dgControl.RenderControl(ohtmt);
        Response.Clear();
        Response.Write("<meta http-equiv=\"content-type\" content=\"application/ms-excel; charset=gb2312\"/>" + ostrwrite.ToString());
        Response.End();
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strDepartName;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = ShareClass.GetDepartName(strDepartCode);

            LB_BelongDepartCode.Text = strDepartCode;
            TB_BelongDepartName.Text = strDepartName;
        }
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strProjectID, strProjectName;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strProjectID = treeNode.Target;

            strProjectName = ShareClass.GetProjectName(strProjectID);

            LB_ProjectID.Text = strProjectID;
            TB_ProjectName.Text = strProjectName;
        }
    }


    protected void BT_FindPlanRate_Click(object sender, EventArgs e)
    {
        LB_ReportName.Text = MonthPicker1.Year + "年" + MonthPicker1.Month + "月计划完成情况";

        string strProjectID = LB_ProjectID.Text.Trim();

        if (strProjectID != "")
        {
            string strPlanVerID = GetProjectPlanVersionVerID(strProjectID, "在用").ToString();



            string strCmdText = "select Percent_Done  as XName,count(*) as YNumber from T_ImplePlan ";
            strCmdText += " where ProjectID = " + strProjectID;
            strCmdText += " And VerID = " + strPlanVerID;
            strCmdText += " and extract(month from End_Date) = " + MonthPicker1.Month.ToString() + " and extract(year from End_Date) = " + MonthPicker1.Year.ToString();

            if (CB_Scope.Checked == true)
            {
                strCmdText += " and (Percent_Done = 100 or Percent_Done = 0)";
            }
            strCmdText += " and ID not In(Select Parent_ID From T_ImplePlan)";
            strCmdText += " Group By Percent_Done";
            string strChartTitle = "PlanReport";


            IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('提示，请先选择项目！')", true);

        }
    }


    //取得版本号ID
    public int GetProjectPlanVersionVerID(string strProjectID, string strType)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strProjectID + " and projectPlanVersion.Type = " + "'" + strType + "'";

        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        if (lst.Count > 0)
        {
            ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];
            return projectPlanVersion.VerID;
        }
        else
        {
            return 0;
        }
    }


    protected void DL_Year_SelectedIndexChanged(object sender, EventArgs e)
    {
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

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        Session["Scheduler"] = null;

        string strUnderlingCode = LB_UnderlingCode.Text.Trim();
        string strUnderLingName = LB_UnderLingName.Text.Trim();

        for (int i = 0; i < DataGrid1.Items.Count; i++)
        {
            DataGrid1.Items[i].ForeColor = Color.Black;
        }
        e.Item.ForeColor = Color.Red;

        try
        {
            string strProjectID = ((Button)e.Item.FindControl("BT_ProjectID")).Text;

            if (strUnderlingCode != "")
            {
                strHQL1 = "Select UserCode, UserName,Type,ProjectID ,ProjectName,BeginDate,EndDate From V_ProjectMember_WorkLoadByProjectTask";
                strHQL1 += " Where PJID =" + strProjectID;
                strHQL1 += " and Type <> '项目'";
                strHQL1 += " and UserCode = " + "'" + strUnderlingCode + "'";
                LB_SQL1.Text = strHQL1;
                initData(strHQL1);

                strHQL2 = "Select distinct UserName  From V_ProjectMember_WorkLoadByProjectTask";
                strHQL2 += " Where PJID =" + strProjectID;
                strHQL2 += " and Type <> '项目'";
                strHQL2 += " and UserCode = " + "'" + strUnderlingCode + "'";
                LB_SQL2.Text = strHQL2;
                setDataSourceAndBind(strHQL2);
            }
            else
            {
                string strUserCode = Session["UserCode"].ToString();
                strHQL1 = "Select UserCode, UserName,Type,ProjectID ,ProjectName,BeginDate,EndDate From V_ProjectMember_WorkLoadByProjectTask";
                strHQL1 += " Where PJID =" + strProjectID;
                strHQL1 += " and Type <> '项目'";
                strHQL1 += " and UserCode in (Select UnderCode From T_MemberLevel Where WorkloadVisible = 'YES' and UserCode = " + "'" + strUserCode + "'" + ")";
                LB_SQL1.Text = strHQL1;
                initData(strHQL1);

                strHQL2 = "Select distinct UserName  From V_ProjectMember_WorkLoadByProjectTask";
                strHQL2 += " Where PJID =" + strProjectID;
                strHQL2 += " and Type <> '项目'";
                strHQL2 += " and UserCode in (Select UnderCode From T_MemberLevel Where WorkloadVisible = 'YES' and UserCode = " + "'" + strUserCode + "'" + ")";
                LB_SQL2.Text = strHQL2;
                setDataSourceAndBind(strHQL2);
            }

            LB_ProjectID.Text = strProjectID;
            TB_ProjectName.Text = ShareClass.GetProjectName(strProjectID);

            LoadProjectTask();


            string strPlanVerID;
            strPlanVerID = GetProjectPlanVersionVerID(strProjectID, "在用").ToString();

            LB_ProjectName.Text = Resources.lang.XiangMu + ": " + strProjectID + " " + ShareClass.GetProjectName(strProjectID);
            LB_ReportName.Text = MonthPicker1.Year + "年" + MonthPicker1.Month + "月计划完成情况";
            string strCmdText = "select cast(Percent_Done as CHAR(10)) as XName,count(*) as YNumber from T_ImplePlan ";
            strCmdText += " where ProjectID = " + strProjectID;
            strCmdText += " and extract(month from End_Date) = extract(month from now()) and extract(year from End_Date) = extract(year from now())";
            strCmdText += " And VerID = " + strPlanVerID;

            if (CB_Scope.Checked == true)
            {
                strCmdText += " and (Percent_Done = 100 or Percent_Done = 0)";
            }
            strCmdText += " and PlanID not In(Select Parent_ID From T_ImplePlan)";
            strCmdText += " Group By Percent_Done";
            string strChartTitle = "ReportView";

            IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);
        
            //ShareClass.CreateAnalystBarChart(strCmdText, Chart1, SeriesChartType.Column, strChartTitle, "XName", "YNumber", "Default");
            //Chart1.Visible = true;

            LB_ProjectID.Text = strProjectID;
        }
        catch(Exception err)
        {
            LogClass.WriteLogFile(err.Message.ToString());
        }
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_SQL3.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Project");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        Session["Scheduler"] = null;

        string strUnderlingCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        string strUnderLingName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();

        LB_UnderlingCode.Text = strUnderlingCode;
        LB_UnderLingName.Text = strUnderLingName;

        for (int i = 0; i < DataGrid2.Items.Count; i++)
        {
            ((Button)DataGrid2.Items[i].FindControl("BT_UserCode")).ForeColor = Color.Black;
            ((Button)DataGrid2.Items[i].FindControl("BT_UserName")).ForeColor = Color.Black;
        }
        ((Button)e.Item.FindControl("BT_UserCode")).ForeColor = Color.Red;
        ((Button)e.Item.FindControl("BT_UserName")).ForeColor = Color.Red;

        try
        {
            strHQL1 = "Select UserCode, UserName,Type,ProjectID ,ProjectName,BeginDate,EndDate From V_ProjectMember_WorkLoad";
            strHQL1 += " Where UserCode = " + "'" + strUnderlingCode + "'";
            initData(strHQL1);
            LB_SQL1.Text = strHQL1;

            strHQL2 = "Select distinct UserName From V_ProjectMember_WorkLoad";
            strHQL2 += " Where UserCode = " + "'" + strUnderlingCode + "'";
            setDataSourceAndBind(strHQL2);
            LB_SQL2.Text = strHQL2;

            strHQL3 = "Select distinct ProjectID,ProjectName From T_Project Where ";
            strHQL3 += " ProjectID in ( Select ProjectID from T_RelatedUser where UserCode = " + "'" + strUnderlingCode + "')";
            strHQL3 += " and Status Not in ('归档','删除','取消','挂起')";
            strHQL3 += " Order by ProjectID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL3, "T_RelatedUser");
            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();

            LB_SQL3.Text = strHQL3;
        }
        catch
        {
        }

        TB_TaskOperator.Text = strUnderLingName;

        LoadProjectTask();
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
                dr["name"] += " (" + ds.Tables[0].Rows[i][5].ToString().Trim() + "---" + ds.Tables[0].Rows[i][6].ToString().Trim() + ")";
                dr["column"] = ds.Tables[0].Rows[i][1].ToString();
                dt.Rows.Add(dr);
            }
            catch
            {
            }
        }
        return dt;
    }

    protected void LoadProjectTask()
    {
        string strHQL;

        string strDepartCode, strOpretorName, strProjectID, strProjectName, strTaskName, strStatus;
        string strTaskBeginTime, strTaskEndTime;

        strProjectID = LB_ProjectID.Text.Trim();
        strDepartCode = "%" + LB_BelongDepartCode.Text.Trim() + "%";
        strOpretorName = "%" + TB_TaskOperator.Text.Trim() + "%";
        strProjectName = "%" + TB_ProjectName.Text.Trim() + "%";
        strTaskName = "%" + TB_TaskName.Text.Trim() + "%";
        strTaskBeginTime = DateTime.Parse(DLC_BeginDate.Text).ToString("yyyyMMdd");
        strTaskEndTime = DateTime.Parse(DLC_EndDate.Text).ToString("yyyyMMdd");

        try
        {
            strStatus = "%" + DL_Status.SelectedValue + "%";
        }
        catch
        {
            strStatus = "%%";
        }

        strHQL = "Select * From V_ProjectMemberTaskDetailReport  ";
        strHQL += " Where DepartCode Like " + "'" + strDepartCode + "'";
        strHQL += " and UserName Like " + "'" + strOpretorName + "'";
        if (strProjectID != "")
        {
            strHQL += " and ProjectID = " + strProjectID;
        }
        else
        {
            strHQL += " and ProjectName Like " + "'" + strProjectName + "'";
        }
        strHQL += " and TaskName Like " + "'" + strTaskName + "'";
        strHQL += " and to_char(TaskBeginDate,'yyyymmdd') >= " + "'" + strTaskBeginTime + "'";
        strHQL += " and to_char(TaskEndDate,'yyyymmdd') <= " + "'" + strTaskEndTime + "'";
        strHQL += " and Status Like " + "'" + strStatus + "'";

        strHQL += " and UserCode in (Select UnderCode From T_MemberLevel Where WorkloadVisible = 'YES' and UserCode = " + "'" + Session["UserCode"].ToString() + "'" + ")";
        strHQL += " Order By ProjectID DESC, TaskBeginDate ASC,UserName ASC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ProjectMemberTaskDetailReport");

        DataList1.DataSource = ds;
        DataList1.DataBind();
    }
}