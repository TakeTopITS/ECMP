using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using TakeTopCore;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTWorkPlanView : System.Web.UI.Page
{
    string strUserCode, strProjectID, strProjectName;
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strProjectID = Request.QueryString["ProjectID"];
        strProjectName = ShareClass.GetProjectName(strProjectID);

        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();

        string strHQL, strVerID;
        IList lst;


        HL_ProPlanGanttNew.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID;
        HL_WorkPlanListView.NavigateUrl = "TTWorkPlanListView.aspx?ProjectID=" + strProjectID;

        LB_ProjectID.Text = strProjectID;

        ScriptManager.RegisterOnSubmitStatement(this.Page, this.Page.GetType(), "SavePanelScroll", "SaveScroll();");
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "SetPanelScroll", "RestoreScroll();", true);

            DLC_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strHQL = "from PlanStatus as planStatus";
            strHQL += " Where planStatus.LangCode = " + "'" + strLangCode + "'";
            strHQL += " order by planStatus.SortNumber Asc";
            PlanStatusBLL planStautsBLL = new PlanStatusBLL();
            lst = planStautsBLL.GetAllPlanStatuss(strHQL);
            DL_Status.DataSource = lst;
            DL_Status.DataBind();

            if (Session["VerIDForGantt"] == null)
            {
                strVerID = ShareClass.GetProjectPlanVersionID(strProjectID, "在用").ToString();
                if (strVerID != "0")
                {
                    strVerID = ShareClass.GetProjectPlanVersion(strProjectID, "在用").ToString();
                }
                else
                {
                    strVerID = ShareClass.GetLargestProjectPlanVerID(strProjectID);
                }
            }
            else
            {
                strVerID = Session["VerIDForGantt"].ToString();
            }
          
            TakeTopPlan.InitialProjectPlanTree(TreeView1, strProjectID, strVerID);

            HL_ProPlanGanttNew.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID + "&VerID=" + strVerID;
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strPlanID, strParentPlanID, strProjectCreatorCode, strPMCode, strLockStatus, strPlanCreatorCode, strParentPlanCreatorCode, strPlanUpdateManCode;
        int intDepth;


        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        intDepth = treeNode.Depth;

        strPlanID = treeNode.Target.Trim();

        strHQL = "from WorkPlan as workPlan where workPlan.ID= " + strPlanID;

        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        lst = workPlanBLL.GetAllWorkPlans(strHQL);
        WorkPlan workPlan = (WorkPlan)lst[0];

        LB_BackupID.Text = workPlan.ID.ToString();

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

        NB_DefaultSchedule.Amount = workPlan.DefaultSchedule;
        NB_DefaultCost.Amount = workPlan.DefaultCost;
        DL_LockStatus.SelectedValue = workPlan.LockStatus.Trim();

        NB_SortNumber.Amount = workPlan.SortNumber;


        strPlanCreatorCode = workPlan.CreatorCode.Trim();

        strHQL = "Select Percent_Done,Duration_Unit From T_ImplePlan Where ID = " + strPlanID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");
        NB_Percent_Done.Amount = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        LB_DurationUnit.Text = ds.Tables[0].Rows[0][1].ToString();


        strLockStatus = workPlan.LockStatus.Trim();
        strProjectCreatorCode = GetProjectCreatorCode(strProjectID);
        strPMCode = GetProjectPMCode(strProjectID);

        try
        {
            strParentPlanID = treeNode.Parent.Target.ToString();

        }
        catch
        {
            strParentPlanID = "";
            strParentPlanCreatorCode = "";
        }


        HL_RelatedDoc.Visible = true;
        HL_RelatedDoc.NavigateUrl = "TTDocumentTreeView.aspx?RelatedType=ProjectPlan&RelatedID=" + strPlanID;

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


    protected int GetProjectPlanID(string strPriorID, string strVerID)
    {
        string strHQL;
        IList lst;

        if (strPriorID == "0")
        {
            return 0;
        }

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

    protected int GetPlanMemberCount(string strPlanID, string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from PlanMember as planMember where planMember.PlanID = " + strPlanID + " and planMember.UserCode = " + "'" + strUserCode + "'";
        PlanMemberBLL planMemberBLL = new PlanMemberBLL();
        lst = planMemberBLL.GetAllPlanMembers(strHQL);

        return lst.Count;
    }

    protected int GetProjectPlanVersion(string strProjectID, string strType)
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

    protected string GetProjectCreatorCode(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        return project.UserCode.Trim();
    }

    protected string GetProjectPMCode(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        return project.PMCode.Trim();
    }


    protected string GetProjectStatusValue(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        return project.StatusValue.Trim();
    }

    protected string GetProjectPlanVersionType(string strProjectID, string strID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strProjectID + " and projectPlanVersion.ID = " + strID;
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];

        return projectPlanVersion.Type.Trim();
    }

}
