using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Data.SqlClient;


using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProjectImplementTotalFinanceReport : System.Web.UI.Page
{
    string strLangCode, strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();

        LB_ReportName.Text = "项目里程碑数据报表";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DLC_BeginDate.Text = DateTime.Now.Year.ToString() + "-01-01";
            DLC_EndDate.Text = DateTime.Now.Year.ToString() + "-12-31";

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT, TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            ShareClass.InitialAllProjectTree(TreeView2, strDepartString);
            ShareClass.LoadProjectStatusForDropDownList(strLangCode, DL_Status);

            CreateProjectMalesStoneAnalystChart(strUserCode);
        }
    }

    //创建分析图形
    protected void CreateProjectMalesStoneAnalystChart(string strUserCode)
    {
        string strChartTitle, strCmdText;

        strChartTitle = DateTime.Now.Year.ToString() + "年度实施项目产值";
         strCmdText = @"Select SUBSTRING(to_char(A.ReceiverTime,'yyyymmdd'),0,7) as XName,COALESCE(Sum(A.ReceiverAccount),0) as YNumber
                     From T_ConstractReceivables A
                     Left Join T_Project B On A.RelatedProjectID = B.ProjectID 
                     Where  SUBSTRING (to_char(A.ReceiverTime,'yyyymmdd'),0,5) = SUBSTRING (to_char(now(),'yyyymmdd'),0,5)
                     Group By SUBSTRING (to_char(A.ReceiverTime,'yyyymmdd'),0,7) ";
        IFrame_Chart_ProjectAnnualOutput.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Line&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);


        strChartTitle = DateTime.Now.Year.ToString() + "年度实施项目财务状态统计";
        strCmdText = @"Select B.Status as XName,COALESCE(Sum(A.ReceiverAccount),0) as YNumber
                     From T_ConstractReceivables A,T_Project B
                     Where A.RelatedProjectID = B.ProjectID
                     and SUBSTRING (to_char(A.ReceiverTime,'yyyymmdd'),0,5) = SUBSTRING (to_char(now(),'yyyymmdd'),0,5)
                     Group By B.Status";
        IFrame_Chart_ConstractStatus.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

       
        strChartTitle = DateTime.Now.Year.ToString() + "年度实施项目状态一览表";
        strCmdText = @"Select Status as XName, Count(*) as YNumber
            From T_Project Where SUBSTRING (to_char(BeginDate,'yyyymmdd'),0,5) = SUBSTRING (to_char(now(),'yyyymmdd'),0,5) 
            Group By Status ";
        IFrame_Chart_ProjectImplementStatus.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Bar&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);
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

            CreateProjectMalesStoneAnalystChart(strUserCode);
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartCode, strPMName, strProjectID, strProjectName, strStatus;
        string strBeginTime, strEndTime;

        strProjectID = LB_ProjectID.Text.Trim();
        strDepartCode = "%" + LB_BelongDepartCode.Text.Trim() + "%";
        strPMName = "%" + TB_PMName.Text.Trim() + "%";
        strProjectName = "%" + TB_ProjectName.Text.Trim() + "%";

        strBeginTime = DateTime.Parse(DLC_BeginDate.Text).ToString("yyyy-MM-dd");
        strEndTime = DateTime.Parse(DLC_EndDate.Text).ToString("yyyy-MM-dd");

        strStatus = "%" + DL_Status.SelectedValue + "%";

        strHQL = "Exec Pro_GetProjectImplementTotalFinanceReport";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "Pro_GetProjectImplementTotalFinanceReport");

        DataView dv = ds.Tables[0].DefaultView;

        if (strProjectID != "")
        {
            dv.RowFilter = "ProjectID2 = " + strProjectID;
        }
        else
        {
            dv.RowFilter = "项目 Like '%" + strProjectName + "%'";
        }

        dv.RowFilter += " And 项目经理 Like '%" + strPMName + "%'";
        dv.RowFilter += " And 开始时间 >= '" + strBeginTime + "' And 结束时间 <= '" + strEndTime + "'";
        dv.Sort += " ProjectID2 DESC";

        GridView1.DataSource = dv;
        GridView1.DataBind();

        LB_ResultNumber.Text = GridView1.Rows.Count.ToString();

        CreateProjectMalesStoneAnalystChart(strUserCode);
    }

    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartCode, strPMName, strProjectID, strProjectName, strStatus;
        string strBeginTime, strEndTime;

        strProjectID = LB_ProjectID.Text.Trim();
        strDepartCode = "%" + LB_BelongDepartCode.Text.Trim() + "%";
        strPMName = "%" + TB_PMName.Text.Trim() + "%";
        strProjectName = "%" + TB_ProjectName.Text.Trim() + "%";

        strBeginTime = DateTime.Parse(DLC_BeginDate.Text).ToString("yyyy-MM-dd");
        strEndTime = DateTime.Parse(DLC_EndDate.Text).ToString("yyyy-MM-dd");

        strStatus = "%" + DL_Status.SelectedValue + "%";

        strHQL = "Exec Pro_GetProjectImplementTotalFinanceReport";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "Pro_GetProjectImplementTotalFinanceReport");

        DataView dv = ds.Tables[0].DefaultView;

        if (strProjectID != "")
        {
            dv.RowFilter = "ProjectID2 = " + strProjectID;
        }
        else
        {
            dv.RowFilter = "项目 Like '%" + strProjectName + "%'";
        }
        dv.RowFilter += " And 项目经理 Like '%" + strPMName + "%'";
        dv.RowFilter += " And 开始时间 >= '" + strBeginTime + "' And 结束时间 <= '" + strEndTime + "'";
        dv.Sort += " ProjectID2 DESC";

        GridView1.DataSource = dv;
        GridView1.DataBind();

        DataTable dtProject = dv.ToTable();

        Export3Excel(dtProject, "项目里程碑数据报表.xls");

        LB_ResultNumber.Text = GridView1.Rows.Count.ToString();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('导出成功！');", true);
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

            CreateProjectMalesStoneAnalystChart(strUserCode);
        }
    }

    protected void LoadProjectManHourAndExpenseReportForJHKC()
    {
        string strHQL;

        strHQL = "Exec Pro_GetProjectManHourIncomeAndExpenseReport";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "Pro_GetProjectManHourIncomeAndExpenseReport");

        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

}