using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTMakeProjectSAAS : System.Web.UI.Page
{
    string strIsMobileDevice, strProjectUserCode;
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strUserName;
        string strProjectType;

        strLangCode = Session["LangCode"].ToString();
        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        //CKEditor初始化
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(HE_AcceptStandard);
        _FileBrowser.SetupCKEditor(HE_ProjectDetail);

        strProjectUserCode = Session["UserCode"].ToString().Trim();
        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            if (strIsMobileDevice == "YES")
            {
                HT_ProjectDetail.Visible = true;
                HT_AcceptStandard.Visible = true;
            }
            else
            {
                HE_ProjectDetail.Visible = true;
                HE_AcceptStandard.Visible = true;
            }

            DLC_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            ShareClass.LoadCurrencyType(DL_CurrencyType);
            ShareClass.InitialPrjectTreeByAuthority(TreeView1, strUserCode);

            ShareClass.LoadProjectType(DL_ProjectType);

            strProjectType = DL_ProjectType.SelectedItem.Text.Trim();
            ShareClass.LoadProjectForPMStatus(strProjectType, strLangCode,DL_Status);

            LB_PMCode.Text = strUserCode;
            LB_PMName.Text = strUserName;

            //如果自动产生客户编码，禁用客户代码输入框 
            if (ShareClass.GetCodeRuleStatusByType("ProjectCode") == "YES")
            {
                TB_ProjectCode.Enabled = false;
                TB_ProjectCode.Text = DateTime.Now.ToString("yyyyMMddHHMMss");
            }

            LoadMyCreateProjectList(strUserCode);

        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode, strProjectName, strPMName;

        strUserCode = Session["UserCode"].ToString();

        strProjectName = TB_FindProjectName.Text.Trim();
        strProjectName = "%" + strProjectName + "%";

        strPMName = TB_FindPMName.Text.Trim();
        strPMName = "%" + strPMName + "%";

        strHQL = "From Project as project Where project.ProjectName Like  " + "'" + strProjectName + "'" + " and project.PMName Like " + "'" + strPMName + "'";
        strHQL += " And project.UserCode = " + "'" + strUserCode + "'";
        strHQL += " Order By project.ProjectID DESC";
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strProjectID, strProjectName, strHQL;
        string strUserName;
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        strProjectID = treeNode.Target.Trim();

        ProjectBLL projectBLL = new ProjectBLL();
        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        strUserName = LB_UserName.Text.Trim();
        strProjectName = project.ProjectName.Trim();

        LB_ParentProjectID.Text = project.ProjectID.ToString();
        TB_ParentProject.Text = project.ProjectName.Trim();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_ProjectID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strProjectID;

        strProjectID = LB_ProjectID.Text.Trim();

        if (strProjectID == "")
        {

            //如果自动产生客户编码，禁用客户代码输入框 
            if (ShareClass.GetCodeRuleStatusByType("ProjectCode") == "YES")
            {
                TB_ProjectCode.Enabled = false;
                TB_ProjectCode.Text = "PJ" + DateTime.Now.ToString("yyyyMMddHHMMss");
            }
            AddProject();
        }
        else
        {
            UpdateProject();
        }
    }

    protected void AddProject()
    {
        string strProjectID, strProjectCode, strPMCode, strCustomerPMName, strUserCode, strUserName, strStatus, strStatusValue, strBeginDate;
        string strEndDate, strProject, strDetail, strAcceptStandard, strParentID;
        string strBudget = NB_Budget.Amount.ToString();
        string strProjectType, strCurrencyType, strPriority;
        decimal deProjectAmount, deManHour, deManNumber;

        strProjectCode = TB_ProjectCode.Text.Trim();
        strUserCode = LB_UserCode.Text.Trim();
        strUserName = LB_UserName.Text.Trim();
        strPMCode = LB_PMCode.Text.Trim();
        strCustomerPMName = TB_CustomerPMName.Text.Trim();

        strBeginDate = DLC_BeginDate.Text;
        strEndDate = DLC_EndDate.Text;
        strProject = TB_ProjectName.Text.Trim();
        strProjectType = DL_ProjectType.SelectedValue.Trim();
        strCurrencyType = DL_CurrencyType.SelectedValue.Trim();
        strBudget = NB_Budget.Amount.ToString();

        if (strIsMobileDevice == "YES")
        {
            strDetail = HT_ProjectDetail.Text.Trim();
            strAcceptStandard = HT_AcceptStandard.Text.Trim();
        }
        else
        {
            strDetail = HE_ProjectDetail.Text.Trim();
            strAcceptStandard = HE_AcceptStandard.Text.Trim();
        }

        strParentID = LB_ParentProjectID.Text.Trim();
        deProjectAmount = NB_ProjectAmount.Amount;
        deManHour = NB_ManHour.Amount;
        deManNumber = NB_ManNubmer.Amount;
        strStatus = DL_Status.SelectedValue;
        strStatusValue = DL_StatusValue.SelectedValue.Trim();
        strPriority = DL_Priority.SelectedValue.Trim();

        if (strBudget == "")
            strBudget = "0";

        if (strParentID == "")
        {
            strParentID = "1";
        }

        if (strPMCode == "" | strStatus == "" | strBeginDate == "" | strEndDate == "" | strProject == "" | strDetail == "" | strAcceptStandard == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
        else
        {
            ProjectBLL projectBLL = new ProjectBLL();
            projectBLL = new ProjectBLL();
            Project project = new Project();

            project.ProjectCode = strProjectCode;
            project.UserCode = strUserCode;
            project.UserName = ShareClass.GetUserName(strUserCode);
            project.PMCode = strPMCode;
            project.PMName = ShareClass.GetUserName(strPMCode);
            project.CustomerPMName = strCustomerPMName;
            project.ProjectName = strProject;
            project.ProjectType = strProjectType;
            project.ProjectClass = "常规项目";
            project.ProjectAmount = NB_ProjectAmount.Amount;
            project.Budget = decimal.Parse(strBudget);
            project.ManHour = deManHour;
            project.CurrencyType = strCurrencyType;
            project.ManNumber = deManNumber;
            project.ProjectDetail = strDetail;
            project.AcceptStandard = strAcceptStandard;
            project.BeginDate = DateTime.Parse(strBeginDate);
            project.EndDate = DateTime.Parse(strEndDate);
            project.MakeDate = DateTime.Now;
            project.Status = strStatus;
            project.StatusValue = "进行中";
            project.ParentID = int.Parse(strParentID);
            project.Priority = strPriority;

            project.BelongDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            project.BelongDepartName = ShareClass.GetDepartName(project.BelongDepartCode.Trim());

            try
            {
                projectBLL.AddProject(project);

                strProjectID = ShareClass.GetMyCreatedMaxProjectID(strUserCode);
                LB_ProjectID.Text = strProjectID;

                //更改项目其它字段值 
                UpdateProjectOtherFieldValue(strProjectID);
             
                string strNewProjectCode = ShareClass.GetCodeByRule("ProjectCode", strProjectType, strProjectID);
                if (strNewProjectCode != "")
                {
                    TB_ProjectCode.Text = strNewProjectCode;
                    string strHQL = "Update T_Project Set ProjectCode = " + "'" + strNewProjectCode + "'" + " Where ProjectID = " + strProjectID;
                    ShareClass.RunSqlCommand(strHQL);
                }


                CB_SMS.Enabled = true;
                CB_Mail.Enabled = true;
                BT_Send.Enabled = true;

                //2013-08-26 LiuJianping
                HL_ProjectTask.Enabled = true;
                HL_ProjectTask.NavigateUrl = "TTProjectPrimaveraTask.aspx?ProjectID=" + strProjectID;//end

                HL_ProjectCostManageEdit.Enabled = true;
                HL_ProjectCostManageEdit.NavigateUrl = "TTProjectCostManageEdit.aspx?ProjectID=" + strProjectID;

                TB_Message.Text = strUserName + " 给你建立了项目 ：" + strProjectID + " " + strProject + "，请及时收理！";

                LoadProject(strUserCode);

                //依项目类型添加关联的工作流模板和文档模板
                ShareClass.AddRelatedWorkFlowTemplateByProjectType(strProjectType, strProjectID, "Project", "Project", "ProjectType");
                //ShareClass.AddRelatedDocumentTemplateByProjectType(strProjectType, strProjectID, "项目", "ProjectType");

                ShareClass.InitialPrjectTreeByAuthority(TreeView1, strUserCode);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
    }

    protected void UpdateProject()
    {
        string strProjectID, strProjectCode;
        string strProjectType;
        string strUserCode, strCustomerPMName, strUserName, strStatus, strStatusValue, strBeginDate;
        string strEndDate, strProject, strDetail, strAcceptStandard, strParentID;
        string strBudget;
        string strHQL;

        IList lst;
        string strPMCode;
        decimal deProjectAmount, deManHour, deManNumber;

        string strOldStatus, strNewStatus, strOldStatusValue, strNewStatusValue, strPriority;

        RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
        RelatedUser relatedUser = new RelatedUser();

        strUserCode = LB_UserCode.Text;
        strUserName = ShareClass.GetUserName(strUserCode);
        strPMCode = LB_PMCode.Text.Trim();
        strCustomerPMName = TB_CustomerPMName.Text.Trim();

        strBeginDate = DLC_BeginDate.Text;
        strEndDate = DLC_EndDate.Text;
        strProject = TB_ProjectName.Text.Trim();
        strProjectType = DL_ProjectType.SelectedValue.Trim();

        if (strIsMobileDevice == "YES")
        {
            strDetail = HT_ProjectDetail.Text.Trim();
            strAcceptStandard = HT_AcceptStandard.Text.Trim();
        }
        else
        {
            strDetail = HE_ProjectDetail.Text.Trim();
            strAcceptStandard = HE_AcceptStandard.Text.Trim();
        }

        deProjectAmount = NB_ProjectAmount.Amount;
        deManHour = NB_ManHour.Amount;
        deManNumber = NB_ManNubmer.Amount;
        strStatus = DL_Status.SelectedValue.Trim();
        strStatusValue = DL_StatusValue.SelectedValue.Trim();

        strParentID = LB_ParentProjectID.Text.Trim();
        strProjectID = LB_ProjectID.Text;
        strProjectCode = TB_ProjectCode.Text.Trim();
        strBudget = NB_Budget.Amount.ToString();

        strNewStatus = DL_Status.SelectedValue.Trim();
        strNewStatusValue = DL_StatusValue.SelectedValue.Trim();
        strPriority = DL_Priority.SelectedValue.Trim();

        if (strProjectCode != "")
        {
            if (ShareClass.GetProjecCountByProjectCodeAndID(strProjectCode, strProjectID) > 0)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBCZXTDXMDMDXMJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
        }

        if (strParentID == strProjectID)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWBNZSHZXMZWFXMJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }

        if (strPMCode == "" | strStatus == "" | strBeginDate == "" | strEndDate == "" | strProject == "" | strDetail == "" | strAcceptStandard == "" | strParentID == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
        else
        {
            strHQL = "from Project as project where project.ProjectID = " + strProjectID;
            ProjectBLL projectBLL = new ProjectBLL();
            lst = projectBLL.GetAllProjects(strHQL);
            Project project = (Project)lst[0];

            strOldStatus = project.Status.Trim();
            strOldStatusValue = project.StatusValue.Trim();

            project.ProjectCode = strProjectCode;
            project.UserCode = strUserCode;
            project.UserName = ShareClass.GetUserName(strUserCode);
            project.PMCode = strPMCode;
            project.PMName = ShareClass.GetUserName(strPMCode);
            project.CustomerPMName = strCustomerPMName;
            project.ProjectName = strProject;
            project.ProjectType = strProjectType;
            project.Budget = decimal.Parse(strBudget);
            project.CurrencyType = DL_CurrencyType.SelectedValue.Trim();
            project.ProjectDetail = strDetail;
            project.AcceptStandard = strAcceptStandard;
            project.BeginDate = DateTime.Parse(strBeginDate);
            project.EndDate = DateTime.Parse(strEndDate);
            project.MakeDate = DateTime.Now;
            project.Status = strStatus;
            project.StatusValue = strStatusValue;
            project.ProjectAmount = deProjectAmount;
            project.ManHour = deManHour;
            project.ManNumber = deManNumber;
            project.Priority = strPriority;

            project.BelongDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            project.BelongDepartName = ShareClass.GetDepartName(project.BelongDepartCode.Trim());

            project.ParentID = int.Parse(strParentID);

            if (strProjectID == "")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWXXMBNXGJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
            else
            {
                try
                {
                    projectBLL.UpdateProject(project, int.Parse(strProjectID));

                    //更改项目其它字段值 
                    UpdateProjectOtherFieldValue(strProjectID);

                    AddStatusChangeRecord(strProjectID, strOldStatus, strNewStatus, strOldStatusValue, strNewStatusValue, strUserCode);
                    LB_Status.Text = strNewStatus;

                    LoadProject(strUserCode);

                    //依项目类型添加关联的工作流模板和文档模板
                    ShareClass.AddRelatedWorkFlowTemplateByProjectType(strProjectType, strProjectID, "Project", "Project", "ProjectType");
                    //ShareClass.AddRelatedDocumentTemplateByProjectType(strProjectType, strProjectID, "项目", "ProjectType");

                    ShareClass.InitialPrjectTreeByAuthority(TreeView1, strUserCode);

                    TB_Message.Text = strUserName + " 更新了项目： " + strProjectID + " " + strProject + "的内容,请关注，特此通知！";

                    LB_Sql.Text = strHQL;

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }
            }
        }
    }

    //更改项目其它字段值 
    public void UpdateProjectOtherFieldValue(string strProjectID)
    {
        string strHQL;

        string strLockStartupedPlan;
        strLockStartupedPlan = DL_LockStartupedPlan.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set LockStartupedPlan = '{0}' Where ProjectID = {1}", strLockStartupedPlan, strProjectID);
        ShareClass.RunSqlCommand(strHQL);

        string strAllowPMChangeStatus;
        strAllowPMChangeStatus = DL_AllowPMChangeStatus.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set AllowPMChangeStatus = '{0}' Where ProjectID = {1}", strAllowPMChangeStatus, strProjectID);
        ShareClass.RunSqlCommand(strHQL);

        string strProgressByDetailImpact;
        strProgressByDetailImpact = DL_ProgressByDetailImpact.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set ProgressByDetailImpact = '{0}' Where ProjectID = {1}", strProgressByDetailImpact, strProjectID);
        ShareClass.RunSqlCommand(strHQL);

        string strPlanProgressNeedPlanerConfirm;
        strPlanProgressNeedPlanerConfirm = DL_PlanProgressNeedPlanerConfirm.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set PlanProgressNeedPlanerConfirm = '{0}' Where ProjectID = {1}", strPlanProgressNeedPlanerConfirm, strProjectID);
        ShareClass.RunSqlCommand(strHQL);

        string strAutoRunWFAfterMakeProject;
        strAutoRunWFAfterMakeProject = DL_AutoRunWFAfterMakeProject.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set AutoRunWFAfterMakeProject = '{0}' Where ProjectID = {1}", strAutoRunWFAfterMakeProject, strProjectID);
        ShareClass.RunSqlCommand(strHQL);

        string strProjectStartupNeedSupperConfirm;
        strProjectStartupNeedSupperConfirm = DL_ProjectStartupNeedSupperConfirm.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set ProjectStartupNeedSupperConfirm = '{0}' Where ProjectID = {1}", strProjectStartupNeedSupperConfirm, strProjectID);
        ShareClass.RunSqlCommand(strHQL);

        string strProjectPlanStartupStauts;
        strProjectPlanStartupStauts = DL_ProjectPlanStartupSatus.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set ProjectPlanStartupStatus = '{0}' Where ProjectID = {1}", strProjectPlanStartupStauts, strProjectID);
        ShareClass.RunSqlCommand(strHQL);

        string strProjectPlanStartupRelatedWorkflowTemplate;
        strProjectPlanStartupRelatedWorkflowTemplate = DL_PlanStartupRelatedWorkflowTemplate.SelectedValue.Trim();
        strHQL = string.Format(@"Update T_Project Set PlanStartupRelatedWorkflowTemplate = '{0}' Where ProjectID = {1}", strProjectPlanStartupRelatedWorkflowTemplate, strProjectID);
        ShareClass.RunSqlCommand(strHQL);
    }

    //设置项目其它属性的值 
    public void SetProjectOtherFieldValue(string strProjectID)
    {
        string strHQL;

        strHQL = string.Format(@"Select * From T_Project Where ProjectID={0}", strProjectID);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Project");

        DL_LockStartupedPlan.SelectedValue = ds.Tables[0].Rows[0]["LockStartupedPlan"].ToString().Trim();
        DL_AllowPMChangeStatus.SelectedValue = ds.Tables[0].Rows[0]["AllowPMChangeStatus"].ToString().Trim();

        DL_ProgressByDetailImpact.SelectedValue = ds.Tables[0].Rows[0]["ProgressByDetailImpact"].ToString().Trim();
        DL_PlanProgressNeedPlanerConfirm.SelectedValue = ds.Tables[0].Rows[0]["PlanProgressNeedPlanerConfirm"].ToString().Trim();

        DL_AutoRunWFAfterMakeProject.SelectedValue = ds.Tables[0].Rows[0]["AutoRunWFAfterMakeProject"].ToString().Trim();
        DL_ProjectStartupNeedSupperConfirm.SelectedValue = ds.Tables[0].Rows[0]["ProjectStartupNeedSupperConfirm"].ToString().Trim();

        DL_ProjectPlanStartupSatus.SelectedValue = ds.Tables[0].Rows[0]["ProjectPlanStartupStatus"].ToString().Trim();

        DL_PlanStartupRelatedWorkflowTemplate.SelectedValue = ds.Tables[0].Rows[0]["PlanStartupRelatedWorkflowTemplate"].ToString().Trim();
    }

    protected void DL_ProjectType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strType;

        strType = DL_ProjectType.SelectedValue.Trim();

        ShareClass.LoadProjectForPMStatus(strType,strLangCode,DL_Status);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_Send_Click(object sender, EventArgs e)
    {
        string strProjectID, strHQL;
        string strUserCode, strUserName, strRelatedUserCode;
        IList lst;
        string strMsg, strSubject;

        strUserCode = LB_UserCode.Text.Trim();
        strUserName = LB_UserName.Text.Trim();

        strProjectID = LB_ProjectID.Text.Trim();

        strHQL = "from RelatedUser as relatedUser where relatedUser.ProjectID = " + strProjectID;
        RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
        lst = relatedUserBLL.GetAllRelatedUsers(strHQL);

        RelatedUser relatedUser = new RelatedUser();

        strMsg = TB_Message.Text.Trim();

        strSubject = "项目通知";

        Msg msg = new Msg();

        try
        {
            for (int i = 0; i < lst.Count; i++)
            {
                relatedUser = (RelatedUser)lst[i];
                strRelatedUserCode = relatedUser.UserCode.Trim();

                if (CB_SMS.Checked == true | CB_Mail.Checked == true)
                {
                    if (CB_SMS.Checked == true)
                    {
                        msg.SendMSM("Message",strRelatedUserCode, strMsg, strUserCode);
                    }

                    if (CB_Mail.Checked == true)
                    {
                        msg.SendMail(strRelatedUserCode, strSubject, strMsg, strUserCode);
                    }
                }
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXXFSCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXXFSSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strProjectID, strProjectName, strHQL, strStatus;
        string strUserName;

        if (e.CommandName != "Page")
        {
            strUserName = LB_UserName.Text.Trim();
            strProjectID = e.Item.Cells[2].Text.Trim();

            if (e.CommandName == "Update")
            {
                try
                {
                    for (int i = 0; i < DataGrid2.Items.Count; i++)
                    {
                        DataGrid2.Items[i].ForeColor = Color.Black;
                    }

                    e.Item.ForeColor = Color.Red;

                    strHQL = "from Project as project where project.ProjectID = " + strProjectID;

                    ProjectBLL projectBLL = new ProjectBLL();
                    IList lst = projectBLL.GetAllProjects(strHQL);

                    Project project = (Project)lst[0];

                    strProjectName = project.ProjectName.Trim();

                    TB_ProjectCode.Text = project.ProjectCode.Trim();
                    LB_ProjectID.Text = project.ProjectID.ToString();

                    try
                    {
                        DL_ProjectType.SelectedValue = project.ProjectType;
                        ShareClass.LoadProjectForPMStatus(project.ProjectType.Trim(), strLangCode, DL_Status);
                    }
                    catch
                    {
                    }
                    try
                    {
                        DL_ProjectType.SelectedValue = project.ProjectType.Trim();
                        ShareClass.LoadProjectForPMStatus(project.ProjectType.Trim(), strLangCode, DL_Status);
                    }
                    catch
                    {
                    }
                    try
                    {
                        DL_Status.SelectedValue = project.Status;
                        DL_StatusValue.SelectedValue = project.StatusValue.Trim();
                    }
                    catch
                    {
                    }
                    try
                    {
                        DL_Status.SelectedValue = project.Status.Trim();
                        DL_StatusValue.SelectedValue = project.StatusValue.Trim();
                    }
                    catch
                    {
                    }
                    strStatus = project.Status.Trim();

                    LB_PMCode.Text = project.PMCode.Trim();
                    LB_PMName.Text = project.PMName.Trim();

                    TB_CustomerPMName.Text = project.CustomerPMName;
                    LB_Status.Text = project.Status.Trim();
                    DLC_BeginDate.Text = project.BeginDate.ToString();
                    DLC_EndDate.Text = project.EndDate.ToString();
                    TB_ProjectName.Text = project.ProjectName;

                    if (strIsMobileDevice == "YES")
                    {
                        HT_ProjectDetail.Text = project.ProjectDetail;
                        HT_AcceptStandard.Text = project.AcceptStandard;
                    }
                    else
                    {
                        HE_ProjectDetail.Text = project.ProjectDetail;
                        HE_AcceptStandard.Text = project.AcceptStandard;
                    }
                    NB_Budget.Amount = project.Budget;
                    try
                    {
                        DL_CurrencyType.SelectedValue = project.CurrencyType;
                    }
                    catch
                    {
                    }

                    DLC_BeginDate.Text = project.BeginDate.ToString("yyyy-MM-dd");
                    DLC_EndDate.Text = project.EndDate.ToString("yyyy-MM-dd");
                    NB_ProjectAmount.Amount = project.ProjectAmount;


                    NB_ManHour.Amount = project.ManHour;
                    NB_ManNubmer.Amount = project.ManNumber;

                    DL_Priority.SelectedValue = project.Priority.Trim();

                    //2013-08-26 LiuJianping
                    HL_ProjectTask.Enabled = true;
                    HL_ProjectTask.NavigateUrl = "TTProjectPrimaveraTask.aspx?ProjectID=" + strProjectID;//end

                    //项目成本控制-预算，仅仅创建人可以对预算进行管理
                    if (project.UserCode.Trim() == strProjectUserCode.Trim())
                    {
                        HL_ProjectCostManageEdit.Enabled = true;
                        HL_ProjectCostManageEdit.NavigateUrl = "TTProjectCostManageEdit.aspx?ProjectID=" + strProjectID;
                    }
                    else
                    {
                        HL_ProjectCostManageEdit.Enabled = false;
                    }

                    //会出错，这个错误是防止修改总项目
                    LB_ParentProjectID.Text = project.ParentID.ToString();
                    TB_ParentProject.Text = ShareClass.GetProjectName(project.ParentID.ToString());

                    //设置项目其它属性的值 
                    SetProjectOtherFieldValue(strProjectID);


                    CB_SMS.Enabled = true;
                    CB_Mail.Enabled = true;
                    BT_Send.Enabled = true;

                    TB_Message.Text = strUserName + " 给你建立了项目 ：" + strProjectID + " " + strProjectName + "，请及时收理！";

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }
                catch (Exception err)
                {
                    LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

                    BT_Send.Enabled = false;
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCCYYKNS1STXGZXM2CXMFXMBCZ3XMZTLBZMYCXMDZTJC + "')", true);
                }
            }

            if (e.CommandName == "Delete")
            {
                string strPMCode, strUserCode;
                IList lst;

                strUserCode = LB_UserCode.Text;
                strUserName = LB_UserName.Text;
                strPMCode = LB_PMCode.Text.Trim();

                ProjectBLL projectBLL = new ProjectBLL();
                strHQL = "from Project as project where project.ProjectID = " + strProjectID;
                lst = projectBLL.GetAllProjects(strHQL);
                Project project = (Project)lst[0];
                project.Status = "删除";

                strProjectName = project.ProjectName.Trim();

                try
                {
                    //会出错，这个错误是防止修改总项目
                    LB_ParentProjectID.Text = project.ParentID.ToString();
                    TB_ParentProject.Text = ShareClass.GetProjectName(project.ParentID.ToString());

                    projectBLL.UpdateProject(project, int.Parse(strProjectID));

                    LoadProject(strUserCode);

                    ShareClass.InitialPrjectTreeByAuthority(TreeView1, strUserCode);

                    HL_ProjectTask.Enabled = false;
                    HL_ProjectCostManageEdit.Enabled = false;

                    TB_Message.Text = strUserName + " 删除了项目： " + strProjectID + " " + strProjectName + "的内容,请关注，特此通知！";

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "(" + Resources.lang.ZZCCYYKNS1STXGZXM2CXMFXMBCZ3XMZTLBZMYCXMDZTJC + ")" + "')", true);
                }
            }
        }
    }

    protected void BT_AllProjects_Click(object sender, EventArgs e)
    {
        string strUserCode = LB_UserCode.Text.Trim();

        LoadMyCreateProjectList(strUserCode);

        DLC_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        DLC_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        TB_ProjectName.Text = "";

        if (strIsMobileDevice == "YES")
        {
            HT_ProjectDetail.Text = "";
            HT_AcceptStandard.Text = "";
        }
        else
        {
            HE_ProjectDetail.Text = "";
            HE_AcceptStandard.Text = "";
        }

        LB_ProjectID.Text = "";
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void DL_Status_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strProjectID, strStatus;

        strProjectID = LB_ProjectID.Text.Trim();
        strStatus = DL_Status.SelectedValue.Trim();

        if (strProjectID != "")
        {
            DL_StatusValue.SelectedValue = GetProjectStatusLatestValue(strProjectID, strStatus);
        }
        else
        {
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DL_StatusValue_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL, strWLID, strProjectID, strProjectType, strStatus, strStatusValues, strReviewControl;
        IList lst;

        strStatus = DL_Status.SelectedValue.Trim();
        strStatusValues = DL_StatusValue.SelectedValue.Trim();
        strProjectID = LB_ProjectID.Text.Trim();
        strProjectType = DL_ProjectType.SelectedValue.Trim();

        if (strProjectID != "")
        {
            strReviewControl = GetProjectStatusReviewControl(strProjectType, strStatus);

            if (strReviewControl == "是")
            {
                if (strStatusValues == "通过")
                {
                    strHQL = "from StatusRelatedWF as statusRelatedWF where statusRelatedWF.Status = " + "'" + strStatus + "'" + " and  statusRelatedWF.RelatedType = '项目' and statusRelatedWF.RelatedID = " + strProjectID + " Order by statusRelatedWF.ID DESC";
                    StatusRelatedWFBLL statusRelatedWFBLL = new StatusRelatedWFBLL();
                    lst = statusRelatedWFBLL.GetAllStatusRelatedWFs(strHQL);
                    if (lst.Count > 0)
                    {
                        StatusRelatedWF statusRelatedWF = (StatusRelatedWF)lst[0];
                        strWLID = statusRelatedWF.WLID.ToString();

                        strHQL = "from WorkFlow as workFlow where workFlow.Status in ('通过','结案') and workFlow.WLID = " + strWLID;
                        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
                        lst = workFlowBLL.GetAllWorkFlows(strHQL);

                        if (lst.Count == 0)
                        {
                            DL_StatusValue.SelectedValue = "进行中";
                            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGCZTMYTJPSHPSMTGZTZBNGWTG + "')", true);
                        }
                    }
                    else
                    {
                        DL_StatusValue.SelectedValue = "进行中";
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGCZTMYTJPSHPSMTGZTZBNGWTG + "')", true);
                    }
                }
            }
        }
        else
        {
            DL_StatusValue.SelectedValue = "进行中";
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGCWKJLBNGBZTZXZXM + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void AddStatusChangeRecord(string strProjectID, string strOldStatus, string strNewStatus, string strOldStatusValue, string strNewStatusValue, string strUserCode)
    {
        string strUserName;

        if ((strOldStatus != strNewStatus) | (strOldStatusValue != strNewStatusValue))
        {
            strUserName = ShareClass.GetUserName(strUserCode);

            ProStatusChangeBLL proStatusChangeBLL = new ProStatusChangeBLL();
            ProStatusChange proStatusChange = new ProStatusChange();

            proStatusChange.ProjectID = int.Parse(strProjectID);
            proStatusChange.UserCode = strUserCode;
            proStatusChange.UserName = strUserName;
            proStatusChange.OldStatus = strOldStatus;
            proStatusChange.NewStatus = strNewStatus;
            proStatusChange.OldStatusValue = strOldStatusValue;
            proStatusChange.NewStatusValue = strNewStatusValue;
            proStatusChange.ChangeTime = DateTime.Now;

            try
            {
                proStatusChangeBLL.AddProStatusChange(proStatusChange);
            }
            catch
            {

            }
        }
    }

    //基于直接成员列表到DropDownList
    public static void LoadPMByUserCodeForDropDownList(string strUserCode, DropDownList dropDownList)
    {
        string strHQL;

        strHQL = "Select UserCode,UserName From T_ProjectMember Where UserCode in (Select UnderCode From T_MemberLevel Where Usercode = " + "'" + strUserCode + "'" + ")";
        strHQL += " And Status = '在职'";
        strHQL += " Order By SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_MemberLevel");

        dropDownList.DataSource = ds;
        dropDownList.DataBind();
    }

    protected void LoadMyCreateProjectList(string strUserCode)
    {
        string strHQL;
        IList lst;
 
        strHQL = "from Project as project where project.UserCode = " + "'" + strUserCode + "'";
        strHQL += " and project.Status <> '归档' order by project.ProjectID DESC";

        ProjectBLL projectBLL = new ProjectBLL();

        lst = projectBLL.GetAllProjects(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql.Text = strHQL;
    }


    protected void LoadProject(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where  project.UserCode = " + "'" + strUserCode + "'" + " and project.Status <> '归档' order by project.ProjectID DESC";
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected string GetProjectStatusReviewControl(string strProjectType, string strStatus)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectStatus as projectStatus where projectType = " + "'" + strProjectType + "'" + " and projectStatus.Status = " + "'" + strStatus + "'";
        ProjectStatusBLL projectStatusBLL = new ProjectStatusBLL();
        lst = projectStatusBLL.GetAllProjectStatuss(strHQL);

        ProjectStatus projectStatus = (ProjectStatus)lst[0];

        return projectStatus.ReviewControl.Trim();
    }

    protected string GetProjectStatusLatestValue(string strProjectID, string strStatus)
    {
        string strHQL;
        IList lst;

        strHQL = " from ProStatusChange as proStatusChange where proStatusChange.ProjectID = " + strProjectID;
        strHQL += " and proStatusChange.NewStatus = " + "'" + strStatus + "'";
        strHQL += " Order by proStatusChange.ChangeTime DESC";
        ProStatusChangeBLL proStatusChangeBLL = new ProStatusChangeBLL();
        lst = proStatusChangeBLL.GetAllProStatusChanges(strHQL);

        if (lst.Count > 0)
        {
            ProStatusChange proStatusChange = (ProStatusChange)lst[0];
            return proStatusChange.NewStatusValue.Trim();
        }
        else
        {
            return "进行中";
        }
    }

    protected string GetProjectStatusIdentityString(string strStatus)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectStatus as projectStatus where projectStatus.Status = " + "'" + strStatus + "'";
        ProjectStatusBLL projectStatusBLL = new ProjectStatusBLL();
        lst = projectStatusBLL.GetAllProjectStatuss(strHQL);

        ProjectStatus projectStatus = (ProjectStatus)lst[0];

        return projectStatus.IdentityString.Trim();
    }


}
