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

public partial class TTProjectImplementationBudgetAndExpenseReport : System.Web.UI.Page
{
    string strLangCode, strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();

        LB_ReportName.Text = "项目预算与费用报表";

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

        string strDepartCode, strPMName, strProjectID, strProjectName;
        string strBeginTime, strEndTime;

        strProjectID = LB_ProjectID.Text.Trim();
        strDepartCode = "%" + LB_BelongDepartCode.Text.Trim() + "%";
        strPMName = "%" + TB_PMName.Text.Trim() + "%";
        strProjectName = "%" + TB_ProjectName.Text.Trim() + "%";

        strBeginTime = DateTime.Parse(DLC_BeginDate.Text).ToString("yyyy-MM-dd");
        strEndTime = DateTime.Parse(DLC_EndDate.Text).ToString("yyyy-MM-dd");

        LB_ReportName.Text = Resources.lang.XiangMu + Resources.lang.YSYFYBB;
        LB_ReportTime.Text = "( " + strBeginTime + "---" + strEndTime + " )";

        if (strProjectID != "")
        {
            strHQL = string.Format(@"Select 科目, sum(COALESCE(预算,0)) as 预算, sum(COALESCE(费用,0)) as 费用 From(
   Select * From(Select A.ProjectID, A.Account as 科目, COALESCE(sum(A.Amount), 0) as 预算 From T_ProjectBudget A Where A.ProjectID = {0}  Group By A.Account, A.ProjectID) as AA
   LEFT JOIN(Select A.ProjectID AS BProjectID, A.Account as 科目A, SUM(A.ConfirmAmount) as 费用 From T_ProExpense A Where A.ProjectID = {0} And A.EffectDate >= '{2}' And A.EffectDate <= '{3}'  Group By A.Account, A.ProjectID) as BB ON BB.科目A = AA.科目
   LEFT JOIN(Select A.ProjectID AS CProjectID, A.PMName From T_PROJECT A) as CC  ON CC.CProjectID = {0} AND CC.PMName LIKE '{1}') AS KK Group By 科目", strProjectID, strPMName,strBeginTime,strEndTime);

        }
        else
        {
            strHQL = string.Format(@"Select 科目, sum(COALESCE(预算,0)) as 预算, sum(COALESCE(费用,0)) as 费用 From(
   Select * From(Select A.ProjectID, A.Account as 科目, COALESCE(sum(A.Amount), 0) as 预算 From T_ProjectBudget A Where  A.ProjectID in (Select ProjectID From T_Project Where ProjectName Like '{0}')  Group By A.Account, A.ProjectID) as AA
   LEFT JOIN(Select A.ProjectID AS BProjectID, A.Account as 科目A, SUM(A.ConfirmAmount) as 费用 From T_ProExpense A Where  A.EffectDate >= '{2}' And A.EffectDate <= '{3}' and  A.ProjectID in (Select ProjectID From T_Project Where ProjectName Like '{0}')  Group By A.Account, A.ProjectID) as BB ON BB.科目A = AA.科目
   LEFT JOIN(Select A.ProjectID AS CProjectID, A.PMName From T_PROJECT A) as CC  ON CC.CProjectID in (Select ProjectID From T_Project Where ProjectName Like '{0}') AND CC.PMName LIKE '{1}') AS KK Group By 科目", strProjectName, strPMName, strBeginTime, strEndTime);

        }

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ProjectImplementMileStoneReceivePayReport");

        GridView1.DataSource = ds;
        GridView1.DataBind();

        LB_ResultNumber.Text = GridView1.Rows.Count.ToString();

        CreateProjectMalesStoneAnalystChart(strUserCode);
    }

    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartCode, strPMName, strProjectID, strProjectName;
        string strBeginTime, strEndTime;

        strProjectID = LB_ProjectID.Text.Trim();
        strDepartCode = "%" + LB_BelongDepartCode.Text.Trim() + "%";
        strPMName = "%" + TB_PMName.Text.Trim() + "%";
        strProjectName = "%" + TB_ProjectName.Text.Trim() + "%";

        strBeginTime = DateTime.Parse(DLC_BeginDate.Text).ToString("yyyy-MM-dd");
        strEndTime = DateTime.Parse(DLC_EndDate.Text).ToString("yyyy-MM-dd");

        LB_ReportName.Text = Resources.lang.XiangMu + Resources.lang.YSYFYBB;
        LB_ReportTime.Text = "( " + strBeginTime + "---" + strEndTime + " )";

        if (strProjectID != "")
        {
            strHQL = string.Format(@"Select 科目, sum(COALESCE(预算,0)) as 预算, sum(COALESCE(费用,0)) as 费用 From(
   Select * From(Select A.ProjectID, A.Account as 科目, COALESCE(sum(A.Amount), 0) as 预算 From T_ProjectBudget A Where A.ProjectID = {0}  Group By A.Account, A.ProjectID) as AA
   LEFT JOIN(Select A.ProjectID AS BProjectID, A.Account as 科目A, SUM(A.ConfirmAmount) as 费用 From T_ProExpense A Where A.ProjectID = {0} And A.EffectDate >= '{2}' And A.EffectDate <= '{3}'  Group By A.Account, A.ProjectID) as BB ON BB.科目A = AA.科目
   LEFT JOIN(Select A.ProjectID AS CProjectID, A.PMName From T_PROJECT A) as CC  ON CC.CProjectID = {0} AND CC.PMName LIKE '{1}') AS KK Group By 科目", strProjectID, strPMName, strBeginTime, strEndTime);

        }
        else
        {
            strHQL = string.Format(@"Select 科目, sum(COALESCE(预算,0)) as 预算, sum(COALESCE(费用,0)) as 费用 From(
   Select * From(Select A.ProjectID, A.Account as 科目, COALESCE(sum(A.Amount), 0) as 预算 From T_ProjectBudget A Where  A.ProjectID in (Select ProjectID From T_Project Where ProjectName Like '{0}')  Group By A.Account, A.ProjectID) as AA
   LEFT JOIN(Select A.ProjectID AS BProjectID, A.Account as 科目A, SUM(A.ConfirmAmount) as 费用 From T_ProExpense A Where  A.EffectDate >= '{2}' And A.EffectDate <= '{3}' and  A.ProjectID in (Select ProjectID From T_Project Where ProjectName Like '{0}')  Group By A.Account, A.ProjectID) as BB ON BB.科目A = AA.科目
   LEFT JOIN(Select A.ProjectID AS CProjectID, A.PMName From T_PROJECT A) as CC  ON CC.CProjectID in (Select ProjectID From T_Project Where ProjectName Like '{0}') AND CC.PMName LIKE '{1}') AS KK Group By 科目", strProjectName, strPMName, strBeginTime, strEndTime);

        }

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ProjectImplementMileStoneReceivePayReport");
        GridView1.DataSource = ds;
        GridView1.DataBind();

        DataTable dtProject = ds.Tables[0];

        Export3Excel(dtProject, "项目预算与费用统计报表.xls");

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

        string strDepartCode, strPMName, strProjectID, strProjectName;
        string strBeginTime, strEndTime;

        strProjectID = LB_ProjectID.Text.Trim();
        strDepartCode = "%" + LB_BelongDepartCode.Text.Trim() + "%";
        strPMName = "%" + TB_PMName.Text.Trim() + "%";
        strProjectName = "%" + TB_ProjectName.Text.Trim() + "%";

        strBeginTime = DateTime.Parse(DLC_BeginDate.Text).ToString("yyyy-MM-dd");
        strEndTime = DateTime.Parse(DLC_EndDate.Text).ToString("yyyy-MM-dd");

        LB_ReportName.Text = Resources.lang.XiangMu + Resources.lang.YSYFYBB;
        LB_ReportTime.Text = "( " + strBeginTime + "---" + strEndTime + " )";
        strChartTitle = "预算费用分布图";

        if (strProjectID != "")
        {
            strHQL = string.Format(@"Select 科目 as XName, sum(COALESCE(预算,0)) as YNumber, sum(COALESCE(费用,0)) as ZNumber From(
   Select * From(Select A.ProjectID, A.Account as 科目, COALESCE(sum(A.Amount), 0) as 预算 From T_ProjectBudget A Where A.ProjectID = {0}  Group By A.Account, A.ProjectID) as AA
   LEFT JOIN(Select A.ProjectID AS BProjectID, A.Account as 科目A, SUM(A.ConfirmAmount) as 费用 From T_ProExpense A Where A.ProjectID = {0} And A.EffectDate >= '{2}' And A.EffectDate <= '{3}'  Group By A.Account, A.ProjectID) as BB ON BB.科目A = AA.科目
   LEFT JOIN(Select A.ProjectID AS CProjectID, A.PMName From T_PROJECT A) as CC  ON CC.CProjectID = {0} AND CC.PMName LIKE '{1}') AS KK Group By 科目", strProjectID, strPMName, strBeginTime, strEndTime);

        }
        else
        {
            strHQL = string.Format(@"Select 科目 as XName, sum(COALESCE(预算,0)) as YNumber, sum(COALESCE(费用,0)) as ZNumber From(
   Select * From(Select A.ProjectID, A.Account as 科目, COALESCE(sum(A.Amount), 0) as 预算 From T_ProjectBudget A Where  A.ProjectID in (Select ProjectID From T_Project Where ProjectName Like '{0}')  Group By A.Account, A.ProjectID) as AA
   LEFT JOIN(Select A.ProjectID AS BProjectID, A.Account as 科目A, SUM(A.ConfirmAmount) as 费用 From T_ProExpense A Where  A.EffectDate >= '{2}' And A.EffectDate <= '{3}' and  A.ProjectID in (Select ProjectID From T_Project Where ProjectName Like '{0}')  Group By A.Account, A.ProjectID) as BB ON BB.科目A = AA.科目
   LEFT JOIN(Select A.ProjectID AS CProjectID, A.PMName From T_PROJECT A) as CC  ON CC.CProjectID in (Select ProjectID From T_Project Where ProjectName Like '{0}') AND CC.PMName LIKE '{1}') AS KK Group By 科目", strProjectName, strPMName, strBeginTime, strEndTime);

        }

        IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Column2&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);
       

        LB_TotalBudgetAmount.Text = SumBudgetAmount();
        LB_TotalExpenseAmount.Text = SumExpenseAmount();
        LB_BudgetExpenseAmount.Text = SumBudgetCostDifference();
    }

    protected string SumBudgetAmount()
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


        strHQL = @"Select COALESCE(SUM(B.Amount),0) as ProjectBudget 
   From T_ProExpense A LEFT JOIN T_ProjectBudget B ON A.ProjectID = B.ProjectID AND A.Account = B.Account
   LEFT JOIN T_Project C ON A.ProjectID = C.ProjectID AND B.ProjectID = C.ProjectID
   
                      WHERE  ";

        if (strProjectID != "")
        {
            strHQL += "  A.ProjectID  = " + strProjectID;
        }
        else
        {
            strHQL += " C.ProjectName Like '%" + strProjectName + "%'";
        }
        strHQL += " And C.PMName Like '%" + strPMName + "%'";
        strHQL += " And A.EffectDate >= '" + strBeginTime + "' And A.EffectDate <= '" + strEndTime + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ProjectImplementMileStoneReceivePayReport");

        return ds.Tables[0].Rows[0][0].ToString();
    }

    protected string SumExpenseAmount()
    {
        string strHQL;

        string strDepartCode, strPMName, strProjectID, strProjectName;
        string strBeginTime, strEndTime;

        strProjectID = LB_ProjectID.Text.Trim();
        strDepartCode = "%" + LB_BelongDepartCode.Text.Trim() + "%";
        strPMName = "%" + TB_PMName.Text.Trim() + "%";
        strProjectName = "%" + TB_ProjectName.Text.Trim() + "%";

        strBeginTime = DateTime.Parse(DLC_BeginDate.Text).ToString("yyyy-MM-dd");
        strEndTime = DateTime.Parse(DLC_EndDate.Text).ToString("yyyy-MM-dd");

        strHQL = @"Select COALESCE(SUM(A.ConfirmAmount),0) as ProjectExpense 
   From T_ProExpense A LEFT JOIN T_ProjectBudget B ON A.ProjectID = B.ProjectID AND A.Account = B.Account
   LEFT JOIN T_Project C ON A.ProjectID = C.ProjectID AND B.ProjectID = C.ProjectID
   
                      WHERE  ";

        if (strProjectID != "")
        {
            strHQL += "  A.ProjectID  = " + strProjectID;
        }
        else
        {
            strHQL += " C.ProjectName Like '%" + strProjectName + "%'";
        }
        strHQL += " And C.PMName Like '%" + strPMName + "%'";
        strHQL += " And A.EffectDate >= '" + strBeginTime + "' And A.EffectDate <= '" + strEndTime + "'";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ProjectImplementMileStoneReceivePayReport");

        return ds.Tables[0].Rows[0][0].ToString();
    }

    protected string SumBudgetCostDifference()
    {
        string strChartTitle;
        string strHQL;

        string strDepartCode, strPMName, strProjectID, strProjectName;
        string strBeginTime, strEndTime;

        strProjectID = LB_ProjectID.Text.Trim();
        strDepartCode = "%" + LB_BelongDepartCode.Text.Trim() + "%";
        strPMName = "%" + TB_PMName.Text.Trim() + "%";
        strProjectName = "%" + TB_ProjectName.Text.Trim() + "%";

        strBeginTime = DateTime.Parse(DLC_BeginDate.Text).ToString("yyyy-MM-dd");
        strEndTime = DateTime.Parse(DLC_EndDate.Text).ToString("yyyy-MM-dd");

        LB_ReportName.Text = Resources.lang.XiangMu + Resources.lang.YSYFYBB;
        LB_ReportTime.Text = "( " + strBeginTime + "---" + strEndTime + " )";
        strChartTitle = Resources.lang.XMFYYSFBT;


        strHQL = @"Select COALESCE(SUM(B.Amount),0) - COALESCE(SUM(A.ConfirmAmount),0)
   From T_ProExpense A LEFT JOIN T_ProjectBudget B ON A.ProjectID = B.ProjectID AND A.Account = B.Account
   LEFT JOIN T_Project C ON A.ProjectID = C.ProjectID AND B.ProjectID = C.ProjectID
   
                      WHERE  ";

        if (strProjectID != "")
        {
            strHQL += "  A.ProjectID  = " + strProjectID;
        }
        else
        {
            strHQL += " C.ProjectName Like '%" + strProjectName + "%'";
        }
        strHQL += " And C.PMName Like '%" + strPMName + "%'";
        strHQL += " And A.EffectDate >= '" + strBeginTime + "' And A.EffectDate <= '" + strEndTime + "'";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "V_ProjectImplementMileStoneReceivePayReport");

        return ds.Tables[0].Rows[0][0].ToString();
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