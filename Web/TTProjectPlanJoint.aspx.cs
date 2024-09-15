using System;
using System.Collections;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

using TakeTopCore;
using Npgsql;

using Microsoft.Win32.SafeHandles;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTProjectPlanJoint : System.Web.UI.Page
{
    string strUserCode, strNewProjectID, strNewProjectName, strSelectedPlanID;


    protected void Page_Load(object sender, EventArgs e)
    {
        string strTemProjectID, strSelectedPlanVerID, strSelectedPlanVerCode;


        strSelectedPlanID = Request.QueryString["PlanID"];

        try
        {
            strNewProjectID = Request.QueryString["ProjectID"];
            strNewProjectName = ShareClass.GetProjectName(strNewProjectID);
        }
        catch
        {
            strNewProjectID = ShareClass.getProjectIDByPlanID(strSelectedPlanID);
        }

        strTemProjectID = Request.QueryString["TemProjectID"];

        strSelectedPlanVerCode = ShareClass.getProjectWorkPlanVerIDByPlanID(strSelectedPlanID);
        strSelectedPlanVerID = GetProjectPlanVersionIDByVerCode(strNewProjectID, strSelectedPlanVerCode).ToString();

        strUserCode = Session["UserCode"].ToString();

        string strVerID, strID;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            InitialTemplatePrjectTreeForPlan(TreeView2, strUserCode, strTemProjectID, Resources.lang.ZongXiangMu, Resources.lang.ZZTSDSSFF, Resources.lang.MuBanXiangMu, Resources.lang.CommonProject);

            LoadProjectPlanVersion(strNewProjectID);

            if (DL_VersionID.Items.Count > 0)
            {
                if (int.Parse(strSelectedPlanVerID) > 0)
                {
                    DL_VersionID.SelectedValue = strSelectedPlanVerID;
                }

                strID = DL_VersionID.SelectedValue.Trim();

                strVerID = DL_VersionID.SelectedItem.Text.Trim();
                TakeTopPlan.InitialProjectPlanTreeForPlanJoint(TreeView1, strNewProjectID, strVerID, strSelectedPlanID);

                LB_ProjectID.Text = strNewProjectID;

                HL_ProPlanGanttNew.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strNewProjectID + "&VerID=" + strVerID;
            }

            //判断能否拼接计划
            if (ShareClass.CheckStartupPlanIsLock(strNewProjectID) == "YES" & ShareClass.CheckProjectPlanIsStartup(strNewProjectID) == "YES")
            {
                BT_Joint.Enabled = false;
            }
        }
    }

    //取得版本号ID
    public static int GetProjectPlanVersionIDByVerCode(string strProjectID, string strVerCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strProjectID + " and projectPlanVersion.VerID = " + strVerCode;

        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        if (lst.Count > 0)
        {
            ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];
            return projectPlanVersion.ID;
        }
        else
        {
            return 0;
        }
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strProjectID2, strVerID;


        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        strProjectID2 = treeNode.Target.Trim();

        LB_OldProjectID.Text = strProjectID2;

        LoadOldProjectPlanVersion(strProjectID2);

        if (DL_OldVersionID.Items.Count > 0)
        {
            strVerID = DL_OldVersionID.SelectedItem.Text;
            TakeTopPlan.InitialProjectPlanTreeForPlanJoint(TreeView3, strProjectID2, strVerID, "0");


            HL_ProPlanGanttOld.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID2 + "&VerID=" + strVerID;
        }
        else
        {
            TakeTopPlan.InitialProjectPlanTreeForPlanJoint(TreeView3, strProjectID2, "0", "0");
        }
    }

    protected void DL_OldVersionID_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strID, strVerID, strOldProjectID;

        strID = DL_OldVersionID.SelectedValue.Trim();
        strOldProjectID = LB_OldProjectID.Text.Trim();
        strVerID = DL_OldVersionID.SelectedItem.Text.Trim();

        TakeTopPlan.InitialProjectPlanTreeForPlanJoint(TreeView3, strOldProjectID, strVerID, "0");
        HL_ProPlanGanttOld.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strOldProjectID + "&VerID=" + strVerID;
    }

    protected void BT_Joint_Click(object sender, EventArgs e)
    {
        string strFromVerID, strNewVerID, strFromProjectID, strFromParentPlanID, strNewParentPlanID;
        string strPlanIDString;

        strFromProjectID = LB_OldProjectID.Text.Trim();
        strFromVerID = DL_OldVersionID.SelectedItem.Text.Trim();

        try
        {
            strFromParentPlanID = TreeView3.SelectedNode.Target;
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTSQXZLYJD + "')", true);
            return;
        }

        strNewProjectID = LB_ProjectID.Text;
        strNewVerID = DL_VersionID.SelectedItem.Text.Trim();

        try
        {
            strNewParentPlanID = TreeView1.SelectedNode.Target;
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTSQXZMBJD + "')", true);
            return;
        }

        try
        {
            strNewParentPlanID = TakeTopPlan.AddProjectPlanFromNode(strFromProjectID, strFromVerID, strFromParentPlanID, strNewProjectID, strNewVerID, strNewParentPlanID, strUserCode);

            strPlanIDString = TakeTopPlan.JointProjectPlanFromNode(strFromProjectID, strFromVerID, strFromParentPlanID, strNewProjectID, strNewVerID, strNewParentPlanID, strUserCode);
            LB_PlanIDString.Text = "(" + strPlanIDString + strNewParentPlanID + ")";

            //COPY原计划的约束和资源到新计划
            string strOldGanttPID, strNewGanttPID;
            strOldGanttPID = GetPIDForGantt(int.Parse(strFromProjectID), int.Parse(strFromVerID)).ToString();
            strNewGanttPID = GetPIDForGantt(int.Parse(strNewProjectID), int.Parse(strNewVerID)).ToString();
            string strHQL = string.Format(@"insert into dependency(pid, from_id, to_id, type) Select {0},A.ID,B.ID,C.Type From T_ImPlePlan A,T_ImplePlan B,dependency C
                                Where A.projectid = b.projectid and A.verid = B.verid and A.ProjectID = {1} and A.verid = {2}
							    and A.FromPlanID = C.from_id and B.FromPlanID = C.to_id and c.pid = {3} and A.ID in {4} and B.ID in {4}",
                                strNewGanttPID, strNewProjectID, strNewVerID, strOldGanttPID, LB_PlanIDString.Text);
            ShareClass.RunSqlCommand(strHQL);

            TakeTopPlan.InitialProjectPlanTreeForPlanJoint(TreeView1, strNewProjectID, strNewVerID, strSelectedPlanID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('"+Resources.lang.ZZZPingJieChengGong + "')", true);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + err.Message.ToString() + "\n" + err.StackTrace);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZPingJieShiBaiQJZ + "')", true);
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

        strVerID = projectPlanVersion.VerID.ToString();
        TakeTopPlan.InitialProjectPlanTreeForPlanJoint(TreeView1, strNewProjectID, strVerID, strSelectedPlanID);

        HL_ProPlanGanttNew.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strNewProjectID + "&VerID=" + strVerID;
    }


    protected void LoadProjectPlanVersion(string strNewProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strNewProjectID + " Order by projectPlanVersion.VerID DESC";
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        DL_VersionID.DataSource = lst;
        DL_VersionID.DataBind();
    }

    protected void LoadOldProjectPlanVersion(string strNewProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strNewProjectID + " Order by projectPlanVersion.VerID DESC";
        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        DL_OldVersionID.DataSource = lst;
        DL_OldVersionID.DataBind();
    }

    //------------------------------------------------

   


    public static string getProjectPlanMemberLeader(string strPlanID)
    {
        string strHQL;

        strHQL = "Select UserName From T_PlanMember Where PlanID = " + strPlanID + " and IsLeader = 'YES'";
        DataSet ds = CoreShareClass.GetDataSetFromSql(strHQL, "T_PlanMember");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "";
        }
    }

    public static string getProjectPlanLeaderName(string strPlanID)
    {
        string strHQL;

        strHQL = "Select Leader From T_ImplePlan Where ID = " + strPlanID;
        DataSet ds = CoreShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");

        try
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                return ds.Tables[0].Rows[0][0].ToString().Trim();
            }
            else
            {
                return "";
            }
        }
        catch
        {
            return "";
        }
    }

    //取得GANTT图控件用的项目和计划版本号
    public static int GetPIDForGantt(int intProjectID, int intVerID)
    {
        string strVerID, strPID;

        if (intVerID < 10)
        {
            strVerID = "0" + intVerID.ToString();
        }
        else
        {
            strVerID = intVerID.ToString();
        }

        strPID = intProjectID.ToString() + strVerID;

        return int.Parse(strPID);
    }

    //取得GANTT图控件用的父计划号
    public static int GetParentIDGantt(string strProjectID, string strVerID, string strParentIDGantt)
    {
        string strHQL;

        strHQL = "Select ID From T_ImplePlan Where ProjectID =" + strProjectID + "and VerID = " + strVerID + "  and Parent_ID = " + strParentIDGantt;
        DataSet ds = CoreShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return int.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }

    //把模板项目的计划复制给新项目
    public static bool CopyProjectPlanVersionToNewProject(string strOldProjectID, string strNewProjectID, string strNewProjectName, string strOldVerID, string strNewVerID, string strPlanDocCopy, string strWFTemplateCopy, string strOperatorCode)
    {
        string strHQL;
        string strOldGanttPID, strNewGanttPID;
        int intDays;

        strHQL = "Select  MIN(A.BeginDate)::date- MIN(B.Start_Date)::date From T_Project A,T_ImplePlan B Where A.ProjectID = " + strNewProjectID + " and B.ProjectID = " + strOldProjectID + " and B.VerID = " + strOldVerID;
        DataSet ds = CoreShareClass.GetDataSetFromSql(strHQL, "T_Project");
        ds = CoreShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");
        if (ds.Tables[0].Rows.Count > 0)
        {
            intDays = int.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            intDays = 0;
        }

        strOldGanttPID = GetPIDForGantt(int.Parse(strOldProjectID), int.Parse(strOldVerID)).ToString();
        strNewGanttPID = GetPIDForGantt(int.Parse(strNewProjectID), int.Parse(strNewVerID)).ToString();

        try
        {
            strHQL = "delete from T_ImplePlan where VerID = " + strNewVerID + " and ProjectID = " + strNewProjectID;
            CoreShareClass.RunSqlCommand(strHQL);

            strHQL = "delete from dependency Where PID = " + strNewGanttPID;
            CoreShareClass.RunSqlCommand(strHQL);

            strHQL = "delete from assignment Where task_id in (Select ID From T_ImplePlan Where PID = " + strNewGanttPID + ")";
            CoreShareClass.RunSqlCommand(strHQL);

            strHQL = "insert into T_ImplePlan(ProjectID,WorkID,Name,Start_Date,End_Date,Resource,WorkHour,Budget,MakeDate,";
            strHQL += "Status,PriorID,Type,VerID,Percent_Done,DefaultSchedule,DefaultCost,LockStatus,UpdateManCode,CreatorCode,UpdateTime,FromProjectID,FromProjectPlanVerID,FromPlanID,pid,LeaderCode,Leader,TaskColor,Index)";
            strHQL += " select " + strNewProjectID + ",WorkID,Name,Start_Date+" + intDays.ToString() + "*'1 day'::interval ,End_Date+" + intDays.ToString() + "*'1 day'::interval,Resource,WorkHour,Budget,now(),";
            strHQL += " Status,PriorID,Type," + strNewVerID + ",Percent_Done,DefaultSchedule,DefaultCost,'No'," + "'" + strOperatorCode + "'" + "," + "'" + strOperatorCode + "'" + ",now()," + strOldProjectID + "," + strOldVerID + ",ID," + strNewGanttPID + ",LeaderCode,Leader,TaskColor,Index";
            strHQL += " from T_ImplePlan where ProjectID = " + strOldProjectID + " and VerID = " + strOldVerID;
            strHQL += " order by Parent_ID Asc,PriorID ASC";
            CoreShareClass.RunSqlCommand(strHQL);

            //更新父计划，用于不同项目复制
            UpdateParentIDGanttForImplePlan(strNewProjectID, strNewVerID);

            strHQL = "Update T_ProjectPlanVersion Set FromProjectID = " + strOldProjectID + " Where ProjectID = " + strNewProjectID + " and VerID = " + strNewVerID;
            CoreShareClass.RunSqlCommand(strHQL);

            strHQL = "Update T_ProjectPlanVersion Set FromProjectPlanVerID = " + strOldVerID + " Where ProjectID = " + strNewProjectID + " and VerID = " + strNewVerID;
            CoreShareClass.RunSqlCommand(strHQL);

            strHQL = "Update T_ImplePlan Set Name = " + "'" + strNewProjectName + "'";
            strHQL += " Where ProjectID = " + strNewProjectID + " and VerID = " + strNewVerID;
            strHQL += " And Parent_ID = 0";
            CoreShareClass.RunSqlCommand(strHQL);

            //COPY模板项目计划关联模板文档到新的项目
            if (strPlanDocCopy == "YES")
            {
                strHQL = "insert into T_Document(RelatedType,DocTypeID,DocType,RelatedID,DocName,Description,Address,Author,UploadManCode,UploadManName,UploadTime,DepartCode,Visible,Status)";
                strHQL += " select A.RelatedType,A.DocTypeID,A.DocType,C.ID,A.DocName,A.Description,A.Address,A.Author,A.UploadManCode,A.UploadManName,A.UploadTime,A.DepartCode,A.Visible,A.Status ";
                strHQL += " from T_Document A,T_ImplePlan B ,T_ImplePlan C ";
                strHQL += " where A.RelatedType = '计划' and A.RelatedID = B.ID and B.ID = C.FromPlanID ";
                strHQL += " and B.ProjectID = " + strOldProjectID + " and B.VerID = " + strOldVerID;
                strHQL += " and C.ProjectID = " + strNewProjectID + " and C.VerID = " + strNewVerID;
                CoreShareClass.RunSqlCommand(strHQL);
            }

            //COPY模板项目计划关联流程模板到新的项目的项目计划
            strHQL = "insert into t_relatedworkflowtemplate(relatedtype, relatedid, wftemplatename, identifystring, relatedname)";
            strHQL += " select A.relatedtype, C.id, wftemplatename, identifystring, relatedname";
            strHQL += " from t_relatedworkflowtemplate A,t_impleplan B,t_impleplan C";
            strHQL += " where A.RelatedType = 'ProjectPlan' and A.RelatedID = B.id and B.id = c.fromplanid";
            strHQL += " and B.ProjectID = " + strOldProjectID + " and B.VerID = " + strOldVerID;
            strHQL += " and C.ProjectID = " + strNewProjectID + " and C.VerID = " + strNewVerID;
            CoreShareClass.RunSqlCommand(strHQL);


            //COPY原计划的约束和资源到新计划
            strHQL = string.Format(@"call Pr_CopyImplePlanDependencyAndResources({0},{1})", strOldGanttPID, strNewGanttPID);
            ShareClass.RunSqlCommand(strHQL);

            return true;
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + err.Message.ToString() + "\n" + err.StackTrace);

            return false;
        }
    }

    //创建模板项目树（用于计划复制）
    public static void InitialTemplatePrjectTreeForPlan(TreeView TemplateProjectTreeView, string strUserCode, string strTemProjectID, string strTotalProject, string strPushImplementationMethod, string strTemplateProject, string strCommonProject)
    {
        string strHQL, strProjectID2, strProject;
        IList lst;

        //添加根节点
        TemplateProjectTreeView.Nodes.Clear();

        TreeNode node1 = new TreeNode();
        TreeNode node2 = new TreeNode();
        TreeNode node3 = new TreeNode();
        TreeNode node4 = new TreeNode();
        TreeNode node5 = new TreeNode();
        TreeNode node6 = new TreeNode();
        TreeNode node7 = new TreeNode();

        node1.Text = "<B>" + strTotalProject + "</B>";
        node1.Target = "1";
        node1.Expanded = true;
        TemplateProjectTreeView.Nodes.Add(node1);

        if (strTemProjectID != null)
        {
            node6.Text = strPushImplementationMethod;
            node6.Target = strPushImplementationMethod;
            node6.Expanded = true;
            node1.ChildNodes.Add(node6);
        }

        node2.Text = strTemplateProject;
        node2.Target = strTemplateProject;
        node2.Expanded = true;
        node1.ChildNodes.Add(node2);

        node3.Text = strCommonProject;
        node3.Target = strCommonProject;
        node3.Expanded = true;
        node1.ChildNodes.Add(node3);

        ProjectBLL projectBLL = new ProjectBLL();
        Project project = new Project();

        if (strTemProjectID != null)
        {
            strHQL = "from Project as project where project.ProjectID = " + strTemProjectID;
            lst = projectBLL.GetAllProjects(strHQL);

            if (lst.Count > 0)
            {
                project = (Project)lst[0];

                strProjectID2 = project.ProjectID.ToString(); ;
                strProject = project.ProjectName.Trim();

                node7 = new TreeNode();

                node7.Text = strProjectID2 + "." + strProject;
                node7.Target = strProjectID2;
                node7.Expanded = false;

                node6.ChildNodes.Add(node7);

                TemplateProjectTreeView.DataBind();
            }
        }

        strHQL = "from Project as project where project.ProjectClass = '模板项目' ";
        strHQL += " and project.Status not in ('删除','归档') order by project.ProjectID DESC";
        lst = projectBLL.GetAllProjects(strHQL);

        for (int i = 0; i < lst.Count; i++)
        {
            project = (Project)lst[i];

            strProjectID2 = project.ProjectID.ToString(); ;
            strProject = project.ProjectName.Trim();

            node4 = new TreeNode();

            node4.Text = strProjectID2 + "." + strProject;
            node4.Target = strProjectID2;
            node4.Expanded = false;

            node2.ChildNodes.Add(node4);

            TemplateProjectTreeView.DataBind();
        }

        strHQL = "from Project as project where project.ProjectClass = '常规项目' and  project.PMCode = " + "'" + strUserCode + "'";
        strHQL += " and project.ParentID not in (select project.ProjectID from Project as project where project.PMCode = " + "'" + strUserCode + "'" + ")";
        strHQL += "  and project.Status not in ('删除','归档') order by project.ProjectID DESC";

        lst = projectBLL.GetAllProjects(strHQL);

        for (int i = 0; i < lst.Count; i++)
        {
            project = (Project)lst[i];

            strProjectID2 = project.ProjectID.ToString(); ;
            strProject = project.ProjectName.Trim();

            node5 = new TreeNode();

            node5.Text = strProjectID2 + "." + strProject;
            node5.Target = strProjectID2;
            node5.Expanded = false;

            node3.ChildNodes.Add(node5);
            TemplateProjectTreeShowForPlan(strProjectID2, node5);
            TemplateProjectTreeView.DataBind();
        }
    }

    public static void TemplateProjectTreeShowForPlan(string strParentID, TreeNode treeNode)
    {
        string strHQL, strProjectID2, strProject;
        IList lst1, lst2;

        ProjectBLL projectBLL = new ProjectBLL();
        Project project = new Project();

        strHQL = "from Project as project where project.ProjectClass = '常规项目' and project.ParentID = " + strParentID;
        strHQL += " and project.Status not in ('删除','归档') ";
        strHQL += " order by project.ProjectID DESC";
        lst1 = projectBLL.GetAllProjects(strHQL);

        for (int i = 0; i < lst1.Count; i++)
        {
            project = (Project)lst1[i];
            strProjectID2 = project.ProjectID.ToString();
            strProject = project.ProjectName.Trim();

            TreeNode node = new TreeNode();
            node.Target = strProjectID2;
            node.Text = strProjectID2 + ". " + strProject;
            treeNode.ChildNodes.Add(node);
            node.Expanded = false;

            strHQL = "from Project as project where project.ParentID = " + strProjectID2;
            strHQL += " Order by project.ProjectID DESC";
            lst2 = projectBLL.GetAllProjects(strHQL);

            if (lst2.Count > 0)
            {
                TemplateProjectTreeShowForPlan(strProjectID2, node);
            }
        }
    }

    //更新实施计划表用于GANTT的ParentID
    public static void UpdateParentIDGanttForImplePlan(string strProjectID, string strVerID)
    {
        string strHQL1, strHQL2, strHQL3, strHQL4;
        string strPlanID, strParentIDGantt, strFromPlanID, strTargetPlanID;

        DataSet ds1, ds2, ds3;

        strHQL1 = "SELECT ID,FromPlanID From T_ImplePlan Where ProjectID = " + strProjectID + " and VerID = " + strVerID;
        strHQL1 += " Order By ID ASC";
        ds1 = CoreShareClass.GetDataSetFromSql(strHQL1, "T_ImplePlan");
        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            strPlanID = ds1.Tables[0].Rows[i][0].ToString();
            strFromPlanID = ds1.Tables[0].Rows[i][1].ToString();

            try
            {
                strHQL2 = "Select Parent_ID From T_ImplePlan Where ID = " + strFromPlanID;
                ds2 = CoreShareClass.GetDataSetFromSql(strHQL2, "T_ImplePlan");
                if (ds2.Tables[0].Rows.Count > 0)
                {
                    strTargetPlanID = ds2.Tables[0].Rows[0][0].ToString();

                    strHQL3 = "Select ID From T_ImplePlan Where ProjectID = " + strProjectID + " and VerID = " + strVerID + " and FromPlanID = " + strTargetPlanID;
                    ds3 = CoreShareClass.GetDataSetFromSql(strHQL3, "T_ImplePlan");
                    if (ds3.Tables[0].Rows.Count > 0)
                    {
                        strParentIDGantt = ds3.Tables[0].Rows[0][0].ToString();

                        strHQL4 = "Update T_ImplePlan Set Parent_ID = " + strParentIDGantt + "  Where ID = " + strPlanID;
                        CoreShareClass.RunSqlCommand(strHQL4);
                    }
                    else
                    {
                        strParentIDGantt = "0";
                    }
                }
                else
                {
                    strTargetPlanID = "0";
                }
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + err.Message.ToString() + "\n" + err.StackTrace);
            }

        }
    }
}
