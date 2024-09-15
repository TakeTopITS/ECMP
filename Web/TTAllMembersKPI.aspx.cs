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
using Npgsql;

public partial class TTAllMembersKPI : System.Web.UI.Page
{
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //泰顶软件2006－2012

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "查看所有成员绩效", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT, TreeView1, strUserCode);
        }
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

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid1);
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string strOperatorName = GetUserName(strOperatorCode);

        LB_OperatorCode.Text = strOperatorCode;
        LB_OperatorName.Text = strOperatorName;


        ShareClass.InitialKPICheckTreeByUserCode(TreeView2, strOperatorCode);
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strKPICheckID, strKPICheckName;
        string strStatus;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strKPICheckID = treeNode.Target.Trim();
            strKPICheckName = treeNode.Text.Trim();

            LoadKPI(strKPICheckID);

            LB_KPICheckID.Text = strKPICheckID;
            LB_KPICheckName.Text = strKPICheckName;


            UserKPICheck userKPICheck = GetUserKPICheck(strKPICheckID);
            strStatus = userKPICheck.Status.Trim();
            LB_Status.Text = strStatus;

            //计算KPI的系统评分
            ShareClass.CalculateSystemPoint(strKPICheckID);

            LB_TotalSelfPoint.Text = userKPICheck.TotalSelfPoint.ToString();
            LB_TotalLeaderPoint.Text = userKPICheck.TotalLeaderPoint.ToString();
            LB_TotalThirdPartPoint.Text = userKPICheck.TotalThirdPartPoint.ToString();
            LB_TotalSqlPoint.Text = userKPICheck.TotalSqlPoint.ToString();
            LB_TotalHRPoint.Text = userKPICheck.TotalHRPoint.ToString();
            LB_TotalPoint.Text = userKPICheck.TotalPoint.ToString();

            //生成同部门同职称员工绩效评分对比柱状图
            CreateSameDepartmentJobTitleKPIScoringChart(userKPICheck.UserCode.Trim(), userKPICheck);

            TreeView2.SelectedNode.Selected = false;
        }
    }

    protected void CreateSameDepartmentJobTitleKPIScoringChart(string strUserCode, UserKPICheck userKPICheck)
    {
        string strHQL;
        string strChartTitle;
        string strDepartCode, strDepartName, strJobTitle;
        DateTime dtStartTime, dtEndTime;

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        strDepartName = ShareClass.GetDepartName(strDepartCode);
        strJobTitle = ShareClass.GetUserJobTitle(strUserCode);

        dtStartTime = userKPICheck.StartTime;
        dtEndTime = userKPICheck.EndTime;

        strChartTitle =  " 部门：" + strDepartName + " 成员绩效总评分对比图";

        strHQL = "Select UserName as XName,TotalPoint as YNumber From T_UserKPICheck ";
        strHQL += " Where UserCode in (Select UserCode From T_ProjectMember Where DepartCode = " + "'" + strDepartCode + "')";
        strHQL += " and to_char(StartTime,'yyyymmdd') >= " + "'" + dtStartTime.ToString("yyyyMMdd") + "'" + " and to_char(EndTime,'yyyymmdd') <= " + "'" + dtEndTime.ToString("yyyyMMdd") + "'";
        strHQL += " Order by TotalPoint ASC";
        IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strHQL);


    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strID;

        if (e.CommandName != "Page")
        {
            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "From UserKPICheckDetail as userKPICheckDetail Where userKPICheckDetail.ID = " + strID;
            UserKPICheckDetailBLL userKPICheckDetailBLL = new UserKPICheckDetailBLL();
            lst = userKPICheckDetailBLL.GetAllUserKPICheckDetails(strHQL);
            DataList1.DataSource = lst;
            DataList1.DataBind();

            strHQL = "From KPIThirdPartReview as kpiThirdPartReview Where kpiThirdPartReview.UserKPIID = " + strID;
            KPIThirdPartReviewBLL kpiThirdPartReviewBLL = new KPIThirdPartReviewBLL();
            lst = kpiThirdPartReviewBLL.GetAllKPIThirdPartReviews(strHQL);
            DataList3.DataSource = lst;
            DataList3.DataBind();

            strHQL = "From KPILeaderReview as kpiLeaderReview Where kpiLeaderReview.UserKPIID = " + strID;
            KPILeaderReviewBLL kpiLeaderReviewBLL = new KPILeaderReviewBLL();
            lst = kpiLeaderReviewBLL.GetAllKPILeaderReviews(strHQL);
            DataList2.DataSource = lst;
            DataList2.DataBind();

            strHQL = "From KPIHRReview as kpiHRReview Where kpiHRReview.UserKPIID = " + strID;
            KPIHRReviewBLL kpiHRReviewBLL = new KPIHRReviewBLL();
            lst = kpiHRReviewBLL.GetAllKPIHRReviews(strHQL);
            DataList4.DataSource = lst;
            DataList4.DataBind();

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop11", "popShow('popwindow','true') ", true);
        }
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;
        IList lst;

        UserKPICheckDetailBLL userKPICheckDetailBLL = new UserKPICheckDetailBLL();
        lst = userKPICheckDetailBLL.GetAllUserKPICheckDetails(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }


    protected void LoadKPI(string strKPICheckID)
    {
        string strHQL;
        IList lst;

        strHQL = "From UserKPICheckDetail as userKPICheckDetail where userKPICheckDetail.KPICheckID = " + strKPICheckID;
        strHQL += " Order by userKPICheckDetail.ID ASC";

        UserKPICheckDetailBLL userKPICheckDetailBLL = new UserKPICheckDetailBLL();
        lst = userKPICheckDetailBLL.GetAllUserKPICheckDetails(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected UserKPICheck GetUserKPICheck(string strKPICheckID)
    {
        string strHQL;
        IList lst;

        strHQL = "From UserKPICheck as userKPICheck Where userKPICheck.KPICheckID = " + strKPICheckID;
        UserKPICheckBLL userKPICheckBLL = new UserKPICheckBLL();
        lst = userKPICheckBLL.GetAllUserKPIChecks(strHQL);

        UserKPICheck userKPICheck = (UserKPICheck)lst[0];

        return userKPICheck;
    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName;

        string strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        strUserName = projectMember.UserName;
        return strUserName.Trim();
    }
}
