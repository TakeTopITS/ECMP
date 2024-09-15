using ExcelLibrary.BinaryFileFormat;
using Microsoft.Office.Interop.InfoPath.SemiTrust;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Collections;

using ProjectMgt.BLL;
using ProjectMgt.Model;

using TakeTopCore;

public partial class TTProjectPlanScheduleReport : System.Web.UI.Page
{
    string strProjectID, strVerID;
    int PageNo = 0; //当前页
    int MonsPerPage = 12; //每页显示月数
    int rowIndex = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        strProjectID = Request.QueryString["ProjectID"];
        strVerID = Request.QueryString["VerID"];
        PageNo = Convert.ToInt32(Request.QueryString["PageNo"]);

        if(strVerID == null)
        {
            strVerID = ShareClass.GetProjectPlanVersionIDByType(strProjectID, "在用").ToString();
            if(strVerID == "0")
            {
                Response.Write("错误，此项目没有【在用】的计划版本，请检查！");
                return;
            }
        }

        if (!IsPostBack)
        {
            DateTime dtBegin = DateTime.Now;
            DateTime dtEnd = DateTime.Now;
            getBeginEndTime(strProjectID, strVerID, ref dtBegin, ref dtEnd);
            int nMonth = (dtEnd.Year - dtBegin.Year) * 12 + (dtEnd.Month - dtBegin.Month);
            if (PageNo <= 0)
            {
                LinkButton_Up.Visible = false;
            }
            if ((PageNo + 1) * MonsPerPage >= nMonth)
            {
                LinkButton_Down.Visible = false;
            }

            if (dtBegin.AddMonths(MonsPerPage * PageNo) < dtEnd)
                dtBegin = dtBegin.AddMonths(MonsPerPage * PageNo);

            if (dtBegin.AddMonths(MonsPerPage) < dtEnd)
                dtEnd = dtBegin.AddMonths(MonsPerPage);

            LB_ReportTable.Text = getReportTable(dtBegin, dtEnd);
        }
    }

    //取得计划最小开始时间
    protected DateTime GetProjectPlanMinBeginTime(string strProjectID, string strVerID)
    {
        DateTime minbegintime = DateTime.Now;
        try
        {
            string strHQL;

            strHQL = "Select Min(EndTime) From T_ImplePlan Where ProjectID =" + strProjectID + " and VerID =" + strVerID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");

            minbegintime = Convert.ToDateTime(ds.Tables[0].Rows[0][0].ToString());
        }
        catch (Exception)
        {

        }

        return minbegintime;
    }

    //取得计划最大结束时间
    protected DateTime GetProjectPlanMaxEndTime(string strProjectID, string strVerID)
    {
        DateTime maxbegintime = DateTime.Now;
        try
        {
            string strHQL;

            strHQL = "Select Max(EndTime) From T_ImplePlan Where ProjectID =" + strProjectID + " and VerID =" + strVerID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");
            maxbegintime = Convert.ToDateTime(ds.Tables[0].Rows[0][0].ToString());
        }
        catch (Exception)
        {

        }

        return maxbegintime;
    }

    //获取填入最后结束时间
    protected DateTime GetProjectTaskMaxEndTime(string strProjectID, string strVerID)
    {
        DateTime taskmaxbegintime = DateTime.Now;
        try
        {
            string strHQL;

            strHQL = "Select Max(b.MakeDate) From T_TaskAssignRecord A,T_ProjectTask B,T_ImplePlan C Where A.TaskID = B.TaskID AND B.PlanID = C.PlanID and C.ProjectID =" + strProjectID + " and C.VerID =" + strVerID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");

            taskmaxbegintime = Convert.ToDateTime(ds.Tables[0].Rows[0][0].ToString());
        }
        catch (Exception)
        {

        }

        return taskmaxbegintime;
    }

    //创建项目计划树(依展开类型）
    private List<Report_Frame_Row> InitialProjectPlanTreeByExpandTypeForExport(DateTime dtBegin, DateTime dtEnd)
    {
        List<Report_Frame_Row> rows = new List<Report_Frame_Row>();

        string strHQL, strPlanID;
        IList lst1;

        strHQL = "from WorkPlan as workPlan where workPlan.VerID = " + strVerID + " and workPlan.ProjectID = " + strProjectID + " and workPlan.Parent_ID = 0 order by workPlan.SortNumber ASC";
        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        lst1 = workPlanBLL.GetAllWorkPlans(strHQL);
        if (lst1.Count == 0)
        {
            return rows;
        }

        WorkPlan workPlan = new WorkPlan();
        for (int i = 0; i < lst1.Count; i++)
        {
            workPlan = (WorkPlan)lst1[i];

            strPlanID = workPlan.ID.ToString();

            //传入 strPlanID,构造一行记录
            Report_Frame_Row row = getRowData(0, strPlanID, dtBegin, dtEnd);
            if (row != null)
            {
                rows.Add(row);
            }

            TreeShowForAllByExpandTypeForExport(1, workPlan.ID, dtBegin, dtEnd, ref rows);
        }

        return rows;
    }


    private void TreeShowForAllByExpandTypeForExport(int level, int strPlanIDGantt, DateTime dtBegin, DateTime dtEnd, ref List<Report_Frame_Row> rows)
    {
        string strHQL;
        IList lst1, lst2;
        string strPlanID;


        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        WorkPlan workPlan = new WorkPlan();

        strHQL = "from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + " and workPlan.VerID = " + strVerID + " and workPlan.Parent_ID =" + strPlanIDGantt + " and workPlan.Parent_ID > 0  order by workPlan.SortNumber ASC";
        lst1 = workPlanBLL.GetAllWorkPlans(strHQL);

        for (int i = 0; i < lst1.Count; i++)
        {
            workPlan = (WorkPlan)lst1[i];

            strPlanID = workPlan.ID.ToString();

            //传入 strPlanID,构造一行记录
            Report_Frame_Row row = getRowData(level, strPlanID, dtBegin, dtEnd);
            if (row != null)
            {
                rows.Add(row);
            }

            strHQL = "from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + " and workPlan.Parent_ID = " + strPlanID + "  order by workPlan.SortNumber ASC";
            lst2 = workPlanBLL.GetAllWorkPlans(strHQL);
            if (lst2.Count > 0)
            {
                TreeShowForAllByExpandTypeForExport(level + 1, workPlan.ID, dtBegin, dtEnd, ref rows);
            }
        }
    }
    private string getReportTable(DateTime dtBegin, DateTime dtEnd)
    {
        rowIndex = 0;
        StringBuilder sb = new StringBuilder("<table width=\"180%\" cellspacing=\"0\" cellpadding=\"4\" rules=\"all\" border=\"1\" id=\"GridView1\" style=\"color:#333333;border-collapse:collapse;\">");

        //第一批次----------------------------------------------------------------------------------------------
        int nMonth = (dtEnd.Year - dtBegin.Year) * 12 + (dtEnd.Month - dtBegin.Month);
        Report_Table rt = new Report_Table();
        rt.monthNum = nMonth;
        //标题
        rt.Report_Title = "项目建设进度表";
        //画表头
        Report_Frame_Header HeaderLevel = new Report_Frame_Header();

        HeaderLevel.headrow.Add(new Report_Frame_Cell("序号", 1, 2, 0));
        HeaderLevel.headrow.Add(new Report_Frame_Cell("施工类型", 1, 2, 500));
        HeaderLevel.headrow.Add(new Report_Frame_Cell("合同数", 1, 2, 0));
        HeaderLevel.headrow.Add(new Report_Frame_Cell("完成数", 1, 2, 0));
        HeaderLevel.headrow.Add(new Report_Frame_Cell("单位", 1, 2, 0));

        for (DateTime dt = dtBegin; dt < dtEnd; dt = dt.AddMonths(1))
        {
            HeaderLevel.headrow.Add(new Report_Frame_Cell(string.Format("{0}年{1}月", dt.Year, dt.Month), 4, 1, 0));
        }

        rt.headers.Add(HeaderLevel);

        Report_Frame_Header HeaderLevel2 = new Report_Frame_Header();
        for (int i = 0; i < nMonth; i++)
        {
            for (int j = 1; j <= 4; j++)
            {
                HeaderLevel2.headrow.Add(new Report_Frame_Cell(string.Format("第{0}周", j), 1, 1, 0));
            }
        }
        rt.headers.Add(HeaderLevel2);

        rt.rows = InitialProjectPlanTreeByExpandTypeForExport(dtBegin, dtEnd);

        sb.Append(rt.ToString());

        sb.Append("</table>");

        return sb.ToString();
    }

    private string getQueryString(string planId, DateTime dtBegin, DateTime dtEnd, int monthNum)
    {
        StringBuilder sb = new StringBuilder("select a.Name,a.UnitName,a.RequireNumber,a.FinishedNumber,");
        int index = 0;
        DateTime tmp = dtBegin;
        StringBuilder sub = new StringBuilder();
        for (int i = 0; i < monthNum; i++)
        {
            List<DateTime> mondays = getMondayList(tmp);
            for (int j = 0; j < mondays.Count - 1; j++)
            {
                sub.Append(string.Format("(select COALESCE(sum(b.FinishedNumber), 0) from T_TaskAssignRecord b,T_ProjectTask c where b.TaskID = c.TaskID AND c.PlanID = a.ID and b.MakeDate >= '{0}' and b.MakeDate < '{1}') as mw{2},", mondays[j], mondays[j + 1], index++));
            }
            tmp = tmp.AddMonths(1);
        }
        sb.Append(sub.ToString().TrimEnd(','));
        sb.Append(string.Format(" from T_ImplePlan a where a.ProjectID = {0} and a.VerID = {1} and a.id={2} order by a.Start_Date ASC;", strProjectID, strVerID, planId));

        return sb.ToString();
    }

    private List<DateTime> getMondayList(DateTime thisday)
    {
        List<DateTime> mondayList = new List<DateTime>();
        mondayList.Add(thisday);
        DateTime nmday = thisday;
        int daysofweek = (int)thisday.DayOfWeek;
        if (1 != daysofweek)
        {
            //get next monday
            nmday = thisday.AddDays(8 - daysofweek);
        }
        mondayList.Add(nmday);
        for (DateTime dt = nmday.AddDays(7); dt < thisday.AddMonths(1); dt = dt.AddDays(7))
        {
            mondayList.Add(dt);
            if (mondayList.Count >= 4) //最后两周算一个月最后一周的
                break;
        }
        mondayList.Add(thisday.AddMonths(1));

        return mondayList;
    }

    private Report_Frame_Row getRowData(int level, string planId, DateTime dtBegin, DateTime dtEnd)
    {
        Report_Frame_Row row = null;

        int nMonth = (dtEnd.Year - dtBegin.Year) * 12 + (dtEnd.Month - dtBegin.Month);
        string sql = getQueryString(planId, dtBegin, dtEnd, nMonth);
        DataSet ds = ShareClass.GetDataSetFromSql(sql, "T_ImplePlan");

        if (ds == null || ds.Tables.Count <= 0)
            return row;

        StringBuilder prefix = new StringBuilder();
        if (level > 0)
        {
            for (int i = 0; i < level; i++)
            {
                prefix.Append("-");
            }
        }

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            row = new Report_Frame_Row();
            row.id = ++rowIndex;
            row.Type = string.IsNullOrEmpty(ds.Tables[0].Rows[i]["Name"].ToString()) ? prefix.ToString() : (prefix.ToString() + ds.Tables[0].Rows[i]["Name"].ToString());
            row.UnitName = string.IsNullOrEmpty(ds.Tables[0].Rows[i]["UnitName"].ToString()) ? "0" : ds.Tables[0].Rows[i]["UnitName"].ToString();
            row.reqiredNumer = string.IsNullOrEmpty(ds.Tables[0].Rows[i]["RequireNumber"].ToString()) ? 0 : Convert.ToDecimal(ds.Tables[0].Rows[i]["RequireNumber"].ToString());
            row.FinishedNumber = string.IsNullOrEmpty(ds.Tables[0].Rows[i]["FinishedNumber"].ToString()) ? 0 : Convert.ToDecimal(ds.Tables[0].Rows[i]["FinishedNumber"].ToString());
            for (int index = 0; index < nMonth * 4; index++) //每个月额四周
            {
                string mvf = "mw" + index.ToString();
                decimal count = string.IsNullOrEmpty(ds.Tables[0].Rows[i][mvf].ToString()) ? 0 : Convert.ToDecimal(ds.Tables[0].Rows[i][mvf].ToString());
                row.CountPerWeek.Add(count);
            }
        }

        return row;
    }

    protected void getBeginEndTime(string strProjectID, string strVerID, ref DateTime dtBegin, ref DateTime dtEnd)
    {
        //开始时间
        dtBegin = GetProjectPlanMinBeginTime(strProjectID, strVerID);
        dtBegin = new DateTime(dtBegin.Year, dtBegin.Month, 1);
        //结束时间，若MakeDate在项目计划的结束时间以后，则取最大的MakeDate
        dtEnd = GetProjectPlanMaxEndTime(strProjectID, strVerID);
        DateTime dtTaskEnd = GetProjectTaskMaxEndTime(strProjectID, strVerID);
        if (dtEnd < dtTaskEnd)
            dtEnd = dtTaskEnd;
        dtEnd = dtEnd.AddMonths(1);
        dtEnd = new DateTime(dtEnd.Year, dtEnd.Month, 1);
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DateTime dtBegin = DateTime.Now;
        DateTime dtEnd = DateTime.Now;
        getBeginEndTime(strProjectID, strVerID, ref dtBegin, ref dtEnd);

        if (dtBegin.AddMonths(MonsPerPage * (PageNo + 1)) < dtEnd)
        {
            PageNo++;
        }

        Response.Redirect(string.Format("TTProjectPlanScheduleReport.aspx?ProjectID=" + strProjectID + "&VerID= " + strVerID + "&PageNo={0}", PageNo));
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        DateTime dtBegin = DateTime.Now;
        DateTime dtEnd = DateTime.Now;
        getBeginEndTime(strProjectID, strVerID, ref dtBegin, ref dtEnd);

        PageNo = PageNo > 0 ? PageNo - 1 : 0;

        Response.Redirect(string.Format("TTProjectPlanScheduleReport.aspx?ProjectID=" + strProjectID + "&VerID= " + strVerID + "&PageNo={0}", PageNo));
    }
}

//自定义报表类
class Report_Table
{
    public int monthNum { set; get; }
    //标题
    public string Report_Title { get; set; }
    public List<Report_Frame_Header> headers { get; set; }

    public List<Report_Frame_Row> rows { get; set; }

    public Report_Table()
    {
        headers = new List<Report_Frame_Header>();
        rows = new List<Report_Frame_Row>();
    }

    public override string ToString()
    {
        StringBuilder sb = new StringBuilder();// "<table cellspacing=\"0\" cellpadding=\"4\" rules=\"all\" border=\"1\" id=\"GridView1\" style=\"color:#333333;border-collapse:collapse;\">");
        //标题栏
        StringBuilder sbt = new StringBuilder("<tr>");
        Report_Frame_Cell ctitle = new Report_Frame_Cell(Report_Title, monthNum * 4 + 5, 1, 0);
        sbt.Append(ctitle.ToHeaderString());
        sbt.Append("</tr>");
        sb.Append(sbt);
        //表头
        StringBuilder sbh = new StringBuilder("<tr>");
        foreach (Report_Frame_Header cell in headers)
        {
            sbh.Append(cell.ToString());
        }
        sbh.Append("</tr>");
        sb.Append(sbh);
        //表内容
        StringBuilder sbc = new StringBuilder();
        foreach (Report_Frame_Row cell in rows)
        {
            sbc.Append(cell.ToString());
        }
        sb.Append(sbc);

        return sb.ToString();
    }
}

class Report_Frame_Cell
{
    private int Colspan = 1;

    private int Rowspan = 1;

    private string Content;

    private int Width = 0;

    public Report_Frame_Cell(string content)
    {
        Content = content;
    }

    public Report_Frame_Cell(string content, int col, int row, int width)
    {
        Content = content;
        Colspan = col;
        Rowspan = row;
        Width = width;
    }

    public override string ToString()
    {
        StringBuilder sb = new StringBuilder();

        if (Width <= 0)
            sb.Append(string.Format("<td colspan=\"{0}\" rowspan=\"{1}\">{2}</td>", Colspan, Rowspan, Content));
        else
            sb.Append(string.Format("<td colspan=\"{0}\" rowspan=\"{1}\" width=\"{2}\">{3}</td>", Colspan, Rowspan, Width, Content));

        return sb.ToString();
    }

    public string ToHeaderString()
    {
        StringBuilder sb = new StringBuilder();

        if (Width <= 0)
            sb.Append(string.Format("<th colspan=\"{0}\" rowspan=\"{1}\">{2}</th>", Colspan, Rowspan, Content));
        else
            sb.Append(string.Format("<th colspan=\"{0}\" rowspan=\"{1}\" width=\"{2}\">{3}</th>", Colspan, Rowspan, Width, Content));

        return sb.ToString();
    }
}
class Report_Frame_Header
{
    public List<Report_Frame_Cell> headrow { get; set; }

    public Report_Frame_Header()
    {
        headrow = new List<Report_Frame_Cell>();
    }

    public override string ToString()
    {
        System.Text.StringBuilder sb = new System.Text.StringBuilder("<tr>");
        foreach (Report_Frame_Cell cell in headrow)
        {
            sb.Append(cell.ToHeaderString());
        }
        sb.Append("</tr>");

        return sb.ToString();
    }
}

class Report_Frame_Row
{
    public int id { get; set; } //序号
    public string Type { get; set; }  //施工类型
    public decimal reqiredNumer { get; set; } //合同数
    public decimal FinishedNumber { get; set; }
    public string UnitName { get; set; }//单位

    public List<decimal> CountPerWeek { get; set; }

    public Report_Frame_Row()
    {
        CountPerWeek = new List<decimal>();
    }

    public override string ToString()
    {
        StringBuilder sb = new StringBuilder("<tr>");

        Report_Frame_Cell cid = new Report_Frame_Cell(id.ToString());
        sb.Append(cid.ToString());
        Report_Frame_Cell ctype = new Report_Frame_Cell(Type);
        sb.Append(ctype.ToString());
        Report_Frame_Cell reqired = new Report_Frame_Cell(reqiredNumer.ToString("F2"));
        sb.Append(reqired.ToString());
        Report_Frame_Cell finished = new Report_Frame_Cell(FinishedNumber.ToString("F2"));
        sb.Append(finished.ToString());
        Report_Frame_Cell cUnitName = new Report_Frame_Cell(UnitName);
        sb.Append(cUnitName.ToString());

        foreach (decimal val in CountPerWeek)
        {
            Report_Frame_Cell cpw = new Report_Frame_Cell(val > 0 ? val.ToString() : "");
            sb.Append(cpw.ToString());
        }

        sb.Append("</tr>");

        return sb.ToString();
    }
}