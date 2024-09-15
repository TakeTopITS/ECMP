using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

using TakeTopCore;


public partial class TTImplePlanView : System.Web.UI.Page
{
    string strUserCode, strProjectID, strProjectName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strProjectID = Request.QueryString["ProjectID"];
        strProjectName = ShareClass. GetProjectName(strProjectID);

        strUserCode = Session["UserCode"].ToString();

        string strHQL, strVerID, strID, strVerType;
        IList lst;
        int intPlanID;

        //this.Title = Resources.lang.Project + strProjectID + " " + strProjectName + " 的实施计划！";


        HL_ProPlanGanttRight.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID;
        HL_ProPlanGanttNew.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID;
        HL_WorkPlanView.NavigateUrl = "TTWorkPlanView.aspx?ProjectID=" + strProjectID;

        LB_ProjectID.Text = strProjectID;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            DLC_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strHQL = "from PlanStatus as planStatus order by planStatus.SortNumber Asc";
            PlanStatusBLL planStautsBLL = new PlanStatusBLL();
            lst = planStautsBLL.GetAllPlanStatuss(strHQL);
            DL_Status.DataSource = lst;
            DL_Status.DataBind();

            LoadProjectPlanVersion(strProjectID);

            if (DL_VersionID.Items.Count > 0)
            {
                intPlanID = ShareClass.GetProjectPlanVersionID(strProjectID, "在用");

                if (intPlanID > 0)
                {
                    DL_VersionID.SelectedValue = intPlanID.ToString();
                    DL_ChangeVersionType.SelectedValue = "在用";
                }

                strID = DL_VersionID.SelectedValue.Trim();
                strVerType = GetProjectPlanVersionType(strID);

                DL_ChangeVersionType.SelectedValue = strVerType;

                strVerID = DL_VersionID.SelectedItem.Text.Trim();
                TakeTopPlan.InitialProjectPlanTree(TreeView1, strProjectID, strVerID);

                HL_ProPlanGanttRight.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID + "&VerID=" + strVerID;
                HL_ProPlanGanttNew.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID + "&VerID=" + strVerID;

            }
        }
    }

    protected void DL_Version_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strID, strVerID;
        string strHQL;
        IList lst;

        strID = DL_VersionID.SelectedValue.Trim();

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ID = " + strID;
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);
        ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];

        DL_ChangeVersionType.SelectedValue = projectPlanVersion.Type.Trim();

        strVerID = projectPlanVersion.VerID.ToString();
        TakeTopPlan.InitialProjectPlanTree(TreeView1, strProjectID, strVerID);


        HL_ProPlanGanttRight.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID + "&VerID=" + strVerID;
        HL_ProPlanGanttNew.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID + "&VerID=" + strVerID;
    }
  
    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strPlanID, strParentID, strProjectCreatorCode, strPMCode, strLockStatus;
        string strHQL;
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        strPlanID = treeNode.Target.Trim();

        try
        {
            strParentID = treeNode.Parent.Target.ToString();
        }
        catch
        {
            strParentID = treeNode.Target.Trim();
        }

        LB_ParentID.Text = strParentID;

        strHQL = "from WorkPlan as workPlan where workPlan.ID= " + strPlanID;

        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        lst = workPlanBLL.GetAllWorkPlans(strHQL);
        WorkPlan workPlan = (WorkPlan)lst[0];


        LB_PlanID.Text = workPlan.ID.ToString();
        LB_PlanDetail.Text = workPlan.Name.Trim();
        DL_PlanType.SelectedValue = workPlan.Type.Trim();

        LB_ParentID.Text = workPlan.Parent_ID.ToString();
        TB_PlanDetail.Text = workPlan.Name;
        TB_Resource.Text = workPlan.Resource;
        DLC_BeginDate.Text = workPlan.Start_Date.ToString("yyyy-MM-dd");
        DLC_EndDate.Text = workPlan.End_Date.ToString("yyyy-MM-dd");
        TB_PlanBudget.Amount = workPlan.Budget;
        LB_MakeTime.Text = workPlan.MakeDate.ToString();
        DL_Status.SelectedValue = workPlan.Status;
        TB_PriorID.Amount = GetProjectPlanID(workPlan.PriorID.ToString());
        NB_DefaultSchedule.Amount = workPlan.DefaultSchedule;
        NB_DefaultCost.Amount = workPlan.DefaultCost;
        DL_LockStatus.SelectedValue = workPlan.LockStatus.Trim();

        strLockStatus = workPlan.LockStatus.Trim();
        strProjectCreatorCode = ShareClass . GetProjectCreatorCode(strProjectID);
        strPMCode = ShareClass . GetProjectPMCode(strProjectID);

        HL_RelatedDoc.Enabled = true;
        HL_RelatedDoc.NavigateUrl = "TTProPlanRelatedDocView.aspx?PlanID=" + strPlanID;

        LoadPlanMember(strPlanID);
    }

    protected void LoadPlanMember(string strPlanID)
    {
        string strHQL;
        IList lst;

        strHQL = "from PlanMember as planMember where planMember.PlanID = " + strPlanID;
        PlanMemberBLL planMemberBLL = new PlanMemberBLL();
        lst = planMemberBLL.GetAllPlanMembers(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected int GetProjectPlanID(string strPriorID)
    {
        string strHQL, strVerID;
        IList lst;

        if (strPriorID == "0")
        {
            return 0;
        }

        strVerID = DL_VersionID.SelectedItem.Text.Trim();
        strHQL = "from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + " and workPlan.VerID = " + strVerID + " and workPlan.ID = " + strPriorID;
        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        lst = workPlanBLL.GetAllWorkPlans(strHQL);

        WorkPlan workPlan = (WorkPlan)lst[0];
        return workPlan.ID;
    }

    protected string GetProjectPlanVersionType(string strID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ID = " + strID;
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];

        return projectPlanVersion.Type.Trim();
    }

    protected int GetProjectPlanVersionCount(string strProjectID, string strVerID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strProjectID + " and projectPlanVersion.VerID =" + strVerID;
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        return lst.Count;
    }

    protected void LoadProjectPlanVersion(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strProjectID + " Order by projectPlanVersion.VerID DESC";
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        DL_VersionID.DataSource = lst;
        DL_VersionID.DataBind();
    }
}
