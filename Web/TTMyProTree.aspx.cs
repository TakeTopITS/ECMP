using System; using System.Resources;
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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTMyProTree : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        LB_UserCode.Text = strUserCode;
        //LB_UserName.Text = GetUserName(strUserCode);

        //this.Title = "我的项目树---" + System.Configuration.ConfigurationManager.AppSettings["SystemName"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            ShareClass.InitialMyProjectTree(TreeView1, strUserCode);
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strProjectID, strHQL;
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        strProjectID = treeNode.Target.Trim();

        ProjectBLL projectBLL = new ProjectBLL();
        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        lst = projectBLL.GetAllProjects(strHQL);

        DataList1.DataSource = lst;
        DataList1.DataBind();

        DailyWorkBLL dailyWorkBLL = new DailyWorkBLL();
        strHQL = "from DailyWork as dailyWork where dailyWork.ProjectID = " + strProjectID + " Order by dailyWork.WorkID DESC";
        lst = dailyWorkBLL.GetAllDailyWorks(strHQL);

        DataList2.DataSource = lst;
        DataList2.DataBind();

        LB_ProDetail.Visible = true;
        LB_DailyWork.Visible = true;

        HL_RelatedDoc.Visible = true;
        HL_RelatedReq.Visible = true;
        HL_RelatedUser.Visible = true;
        HL_ImplePlan.Visible = true;
        HL_RelatedRisk.Visible = true;
        HL_ExpenseSummary.Visible = true;
        HL_TaskRecordAssignSummary.Visible = true;
        HL_StatusChangeRecord.Visible = true;
        HL_LeadReview.Visible = true;
        HL_TransferProject.Visible = true;
        HL_DailyWorkReport.Visible = true;
        HL_RelatedMeeting.Visible = true;
        HL_CustomerInfo.Visible = true;
        HL_VendorInfo.Visible = true;

        HL_RelatedRisk.NavigateUrl = "TTProRelatedRiskView.aspx?ProjectID=" + strProjectID;
        HL_RelatedDoc.NavigateUrl = "TTDocumentTreeView.aspx?RelatedType=Project&RelatedID=" + strProjectID;
        HL_RelatedReq.NavigateUrl = "TTProRelatedReqSummary.aspx?ProjectID=" + strProjectID;
        HL_RelatedUser.NavigateUrl = "TTProRelatedUserSummary.aspx?ProjectID=" + strProjectID;
        HL_ImplePlan.NavigateUrl = "TTWorkPlanView.aspx?ProjectID=" + strProjectID;
        HL_ExpenseSummary.NavigateUrl = "TTProjectExpenseReport.aspx?ProjectId=" + strProjectID;
        HL_TaskRecordAssignSummary.NavigateUrl = "TTTaskAssignRecordSummary.aspx?ProjectID=" + strProjectID;
        HL_StatusChangeRecord.NavigateUrl = "TTProStatusChangeRecord.aspx?ProjectID=" + strProjectID;
        HL_LeadReview.NavigateUrl = "TTLeadReviewSummary.aspx?ProjectID=" + strProjectID;
        HL_TransferProject.NavigateUrl = "TTTransferProjectRecord.aspx?ProjectID=" + strProjectID;
        HL_DailyWorkReport.NavigateUrl = "TTProjectDailyWorkReport.aspx?ProjectID=" + strProjectID;
        HL_RelatedMeeting.NavigateUrl = "TTProMeetingView.aspx?ProjectID=" + strProjectID;
        HL_CustomerInfo.NavigateUrl = "TTProjectCustomerView.aspx?ProjectID=" + strProjectID;
        HL_VendorInfo.NavigateUrl = "TTProjectVendorView.aspx?ProjectID=" + strProjectID;
    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strUserName = projectMember.UserName.Trim();
        return strUserName.Trim();
    }
}
