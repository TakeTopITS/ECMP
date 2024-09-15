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

public partial class TTMyMembersKPI : System.Web.UI.Page
{
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //泰顶软件2006－2012

        strUserCode = Session["UserCode"].ToString();
        strUserName = GetUserName(strUserCode);

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            ShareClass.LoadMemberByUserCodeForDataGrid(strUserCode, "KPI", DataGrid1);
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

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strKPICheckID = treeNode.Target.Trim();
            strKPICheckName = treeNode.Text.Trim();

            LoadKPI(strKPICheckID);

            LB_KPICheckID.Text = strKPICheckID;
            LB_KPICheckName.Text = strKPICheckName;

            //计算KPI的系统评分
            LB_TotalSqlPoint.Text = ShareClass.CalculateSystemPoint(strKPICheckID).ToString();

            UserKPICheck userKPICheck = GetUserKPICheck(strKPICheckID);

            LB_TotalSelfPoint.Text = userKPICheck.TotalSelfPoint.ToString();
            LB_TotalLeaderPoint.Text = userKPICheck.TotalLeaderPoint.ToString();
            LB_TotalThirdPartPoint.Text = userKPICheck.TotalThirdPartPoint.ToString();
            LB_TotalSqlPoint.Text = userKPICheck.TotalSqlPoint.ToString();
            LB_TotalHRPoint.Text = userKPICheck.TotalHRPoint.ToString();
            LB_TotalPoint.Text = userKPICheck.TotalPoint.ToString();
            LB_Status.Text = userKPICheck.Status.Trim();

            //生成同部门同职称员工绩效评分对比柱状图
            CreateSameDepartmentJobTitleKPIScoringChart(strUserCode, userKPICheck);
        }
    }

    protected void CreateSameDepartmentJobTitleKPIScoringChart(string strUserCode, UserKPICheck userKPICheck)
    {
        string strHQL;
        string strChartTitle;
        string strDepartCode, strDepartName, strJobTitle;
        DateTime dtStartTime, dtEndTime;

        //strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        //strDepartName = ShareClass.GetDepartName(strDepartCode);
        //strJobTitle = ShareClass.GetUserJobTitle(strUserCode);

        dtStartTime = userKPICheck.StartTime;
        dtEndTime = userKPICheck.EndTime;

        strChartTitle = "我的直接成员绩效总评分对比图";

        strHQL = "Select UserName as XName,TotalPoint as YNumber From T_UserKPICheck ";
        strHQL += " Where UserCode in (Select UnderCode From T_MemberLevel Where Usercode = " + "'" + strUserCode + "')";
        strHQL += " and  to_char(StartTime,'yyyymmdd') >= " + "'" + dtStartTime.ToString("yyyyMMdd") + "'" + " and to_char(EndTime,'yyyymmdd') <= " + "'" + dtEndTime.ToString("yyyyMMdd") + "'";
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

            LB_KPIID.Text = strID;

            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

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

            strHQL = "From UserKPICheckDetail as userKPICheckDetail Where userKPICheckDetail.ID = " + strID;
            UserKPICheckDetailBLL userKPICheckDetailBLL = new UserKPICheckDetailBLL();
            lst = userKPICheckDetailBLL.GetAllUserKPICheckDetails(strHQL);
            DataList1.DataSource = lst;
            DataList1.DataBind();

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

    protected void UpdateUserKPICheckPoint(string strKPICheckID, string strKPICheckDetailID)
    {
        string strHQL;
        string strAverageLeaderPoint, strTotalLeaderPoint;

        DataSet ds;

        strHQL = "Select Avg(Point) From T_KPILeaderReview Where UserKPIID = " + strKPICheckDetailID;
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_KPILeaderReview");
        strAverageLeaderPoint = ds.Tables[0].Rows[0][0].ToString();

        strHQL = "Update T_UserKPICheckDetail Set LeaderPoint = " + strAverageLeaderPoint + " Where ID = " + strKPICheckDetailID;
        ShareClass.RunSqlCommand(strHQL);

        strHQL = "Select Sum(LeaderPoint * Weight) From T_UserKPICheckDetail Where KPICheckID = " + strKPICheckID;
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserKPICheckDetail");
        strTotalLeaderPoint = ds.Tables[0].Rows[0][0].ToString();

        strHQL = "Update T_UserKPICheck Set TotalLeaderPoint = " + strTotalLeaderPoint + " where KPICheckID = " + strKPICheckID;
        ShareClass.RunSqlCommand(strHQL);

        LB_TotalLeaderPoint.Text = strTotalLeaderPoint;
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
