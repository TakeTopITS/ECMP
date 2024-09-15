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

public partial class TTProjectImplementMonthlyBudgetChartReport : System.Web.UI.Page
{
    string strLangCode, strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();

        LB_ReportName.Text = "项目每月预算统计报表";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DLC_BeginDate.Text = DateTime.Now.Year.ToString() + "-01-01";
            DLC_EndDate.Text = DateTime.Now.Year.ToString() + "-12-31";

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT, TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            ShareClass.InitialAllProjectTree(TreeView2, strDepartString);
            ShareClass.LoadProjectStatusForDropDownList(strLangCode, DL_Status);
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

        strHQL = @"Select (SUBSTRING (to_char(CreateTime,'yyyymmdd'),0,7) + '预算') as '预算',SUM(COALESCE(Amount,0)) as '金额' From V_ProjectBudgetChartForEveryMonth
                 Where ";
        if (strProjectID != "")
        {
            strHQL += " ProjectID = " + strProjectID;
        }
        else
        {
            strHQL += " ProjectName Like '%" + strProjectName + "%'";
        }
        strHQL += " And PMName Like '%" + strPMName + "%'";
        strHQL += " And BeginDate >= '" + strBeginTime + "' And BeginDate <= '" + strEndTime + "'";
        strHQL += " Group By (SUBSTRING (to_char(CreateTime,'yyyymmdd'),0,7) +'预算') ";
        strHQL += " Order By (SUBSTRING (to_char(CreateTime,'yyyymmdd'),0,7) +'预算')  ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ProjectBudgetChartForEveryMonth");

        GridView1.DataSource = ds;
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

        strHQL = @"Select (SUBSTRING (to_char(CreateTime,'yyyymmdd'),0,7) + '预算') as '预算',SUM(COALESCE(Amount,0)) as '金额' From V_ProjectBudgetChartForEveryMonth
                 Where ";
        if (strProjectID != "")
        {
            strHQL += " ProjectID = " + strProjectID;
        }
        else
        {
            strHQL += " ProjectName Like '%" + strProjectName + "%'";
        }
        strHQL += " And PMName Like '%" + strPMName + "%'";
        strHQL += " And BeginDate >= '" + strBeginTime + "' And BeginDate <= '" + strEndTime + "'";
        strHQL += " Group By (SUBSTRING (to_char(CreateTime,'yyyymmdd'),0,7) +'预算') ";
        strHQL += " Order By (SUBSTRING (to_char(CreateTime,'yyyymmdd'),0,7) +'预算')  ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ProjectBudgetChartForEveryMonth");


        GridView1.DataSource = ds;
        GridView1.DataBind();

        DataTable dtProject = ds.Tables[0];

        Export3Excel(dtProject, "项目每月预算统计报表.xls");

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

    //创建分析图形
    protected void CreateProjectMalesStoneAnalystChart(string strUserCode)
    {
        string strChartTitle;
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

        LB_ReportTime.Text = "( " + strBeginTime + "---" + strEndTime + " )";
        strChartTitle = "月度预算";

        strHQL = @"Select (SUBSTRING (to_char(CreateTime,'yyyymmdd'),0,7) + '预算') as XName,SUM(COALESCE(Amount,0)) as YNumber From V_ProjectBudgetChartForEveryMonth
                 Where ";
        if (strProjectID != "")
        {
            strHQL += " ProjectID = " + strProjectID;
        }
        else
        {
            strHQL += " ProjectName Like '%" + strProjectName + "%'";
        }
        strHQL += " And PMName Like '%" + strPMName + "%'";
        strHQL += " And BeginDate >= '" + strBeginTime + "' And BeginDate <= '" + strEndTime + "'";
        strHQL += " Group By (SUBSTRING (to_char(CreateTime,'yyyymmdd'),0,7) +'预算') ";
        strHQL += " Order By (SUBSTRING (to_char(CreateTime,'yyyymmdd'),0,7) +'预算')  ASC";
        IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);

        LB_ReceivableAmount.Text = SumReceivableAmount();
        LB_ReceiverAmount.Text = SumReceiverAmount();
        LB_UnReceiverAmount.Text = SumUnReceiverAmount();
    }

    protected string SumReceivableAmount()
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

        strHQL = @"Select COALESCE(SUM(ProjectAmount),0)  From T_Project Where ";
        if (strProjectID != "")
        {
            strHQL += " ProjectID = " + strProjectID;
        }
        else
        {
            strHQL += " ProjectName Like '%" + strProjectName + "%'";
        }
        strHQL += " And PMName Like '%" + strPMName + "%'";
        strHQL += " And BeginDate >= '" + strBeginTime + "' And BeginDate <= '" + strEndTime + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ProjectImplementMileStoneReceivePayReport");

        return ds.Tables[0].Rows[0][0].ToString();
    }

    protected string SumReceiverAmount()
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

        strHQL = @"Select COALESCE(SUM(Amount),0)  From V_ProjectBudgetChartForEveryMonth Where ";
        if (strProjectID != "")
        {
            strHQL += " ProjectID = " + strProjectID;
        }
        else
        {
            strHQL += " ProjectName Like '%" + strProjectName + "%'";
        }
        strHQL += " And PMName Like '%" + strPMName + "%'";
        strHQL += " And BeginDate >= '" + strBeginTime + "' And BeginDate <= '" + strEndTime + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ProjectImplementMileStoneReceivePayReport");

        return ds.Tables[0].Rows[0][0].ToString();
    }

    protected string SumUnReceiverAmount()
    {
        return (decimal.Parse(SumReceivableAmount()) - decimal.Parse(SumReceiverAmount())).ToString();
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

    protected void LoadProjectManHourAndExpenseReportForJHKC()
    {
        string strHQL;

        strHQL = "Exec Pro_GetProjectManHourIncomeAndExpenseReport";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "Pro_GetProjectManHourIncomeAndExpenseReport");

        GridView1.DataSource = ds;
        GridView1.DataBind();
    }


}