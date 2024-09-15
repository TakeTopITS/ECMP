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

public partial class TTMyMemberProjectChildTree : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strProjectID = Request.QueryString["ProjectID"].Trim();
        string strProjectName = GetProjectName(strProjectID);

        LB_UserCode.Text = strUserCode;
        LB_ProjectID.Text = strProjectID;
        LB_ProjectName.Text = strProjectName;


        //this.Title = Resources.lang.Project + strProjectID + " " + strProjectName + " 的子项目树";


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            InitialProTree();
        }
    }

    protected void InitialProTree()
    {
        string strHQL, strUserCode, strProjectID, strProject;
        IList lst;

        strProjectID = LB_ProjectID.Text.Trim();
        strProject = LB_ProjectName.Text.Trim();

        //添加根节点
        TreeView1.Nodes.Clear();

        TreeNode node1 = new TreeNode();
        TreeNode node3 = new TreeNode();

        node1.Text = "<B>" + strProject + "</B>";
        node1.Target = strProjectID;
        node1.Expanded = true;
        TreeView1.Nodes.Add(node1);

        strUserCode = LB_UserCode.Text.Trim();
        strHQL = "from Project as project where project.ParentID = " + strProjectID;
        strHQL += "  and project.Status not in ('删除','归档') order by project.ProjectID DESC";
        ProjectBLL projectBLL = new ProjectBLL();
        Project project = new Project();

        lst = projectBLL.GetAllProjects(strHQL);

        for (int i = 0; i < lst.Count; i++)
        {
            project = (Project)lst[i];

            strProjectID = project.ProjectID.ToString(); ;
            strProject = project.ProjectName.Trim();

            node3 = new TreeNode();

            node3.Text = strProjectID + "." + strProject;
            node3.Target = strProjectID;
            node3.Expanded = false;

            node1.ChildNodes.Add(node3);
            TreeShow(strProjectID, node3);
            TreeView1.DataBind();
        }
    }

    private void TreeShow(string strParentID, TreeNode treeNode)
    {
        string strHQL, strProjectID, strProject;
        IList lst1, lst2;

        ProjectBLL projectBLL = new ProjectBLL();
        Project project = new Project();

        strHQL = "from Project as project where project.ParentID = " + strParentID + " and project.Status not in ('删除','归档') order by project.ProjectID DESC";
        lst1 = projectBLL.GetAllProjects(strHQL);

        for (int i = 0; i < lst1.Count; i++)
        {
            project = (Project)lst1[i];
            strProjectID = project.ProjectID.ToString();
            strProject = project.ProjectName.Trim();

            TreeNode node = new TreeNode();
            node.Target = strProjectID;
            node.Text = strProjectID + ". " + strProject;
            treeNode.ChildNodes.Add(node);
            node.Expanded = false;

            strHQL = "from Project as project where project.ParentID = " + strProjectID + " Order by project.ProjectID DESC";
            lst2 = projectBLL.GetAllProjects(strHQL);

            if (lst2.Count > 0)
            {
                TreeShow(strProjectID, node);
            }
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
        HL_ConfirmManHour.Visible = true;
        HL_RelatedMeeting.Visible = true;
        HL_RelatedTask.Visible = true;
        HL_CustomerInfo.Visible = true;
        HL_VendorInfo.Visible = true;

        HL_RelatedRisk.NavigateUrl = "TTProRelatedRiskView.aspx?ProjectID=" + strProjectID;
        HL_RelatedDoc.NavigateUrl = "TTProRelatedDocView.aspx?DocType=Project&RelatedID=" + strProjectID;
        HL_RelatedReq.NavigateUrl = "TTProRelatedReqSummary.aspx?ProjectID=" + strProjectID;
        HL_RelatedUser.NavigateUrl = "TTProRelatedUserSummary.aspx?ProjectID=" + strProjectID;
        HL_ImplePlan.NavigateUrl = "TTWorkPlanView.aspx?ProjectID=" + strProjectID;
        HL_ExpenseSummary.NavigateUrl = "TTProjectExpenseReport.aspx?ProjectId=" + strProjectID;
        HL_TaskRecordAssignSummary.NavigateUrl = "TTTaskAssignRecordSummary.aspx?ProjectID=" + strProjectID;
        HL_StatusChangeRecord.NavigateUrl = "TTProStatusChangeRecord.aspx?ProjectID=" + strProjectID;
        HL_LeadReview.NavigateUrl = "TTLeadReviewSummary.aspx?ProjectID=" + strProjectID;
        HL_TransferProject.NavigateUrl = "TTTransferProjectRecord.aspx?ProjectID=" + strProjectID;
        HL_ConfirmManHour.NavigateUrl = "TTProjectSummaryAnalystChart.aspx?ProjectID=" + strProjectID;
        HL_RelatedTask.NavigateUrl = "TTProRelatedTaskView.aspx?ProjectID=" + strProjectID;
        HL_RelatedMeeting.NavigateUrl = "TTProMeetingView.aspx?ProjectID=" + strProjectID;
        HL_CustomerInfo.NavigateUrl = "TTProjectCustomerView.aspx?ProjectID=" + strProjectID;
        HL_VendorInfo.NavigateUrl = "TTProjectVendorView.aspx?ProjectID=" + strProjectID;
    }

    protected string GetProjectName(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);

        Project project = (Project)lst[0];

        return project.ProjectName.Trim();
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
