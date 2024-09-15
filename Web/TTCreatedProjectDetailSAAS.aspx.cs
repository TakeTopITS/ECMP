using System;
using System.Collections;
using System.Data;
using System.Web.UI;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTCreatedProjectDetailSAAS : System.Web.UI.Page
{
    string strProjectID, strProjectName;
    string strIsMobileDevice;
    string strLangCode;
    string strUserCode, strUserName, strUserType, strProjectType;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode, strUserName;

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();
        strUserType = Session["UserType"].ToString();

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        strLangCode = Session["LangCode"].ToString();
        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        //CKEditor初始化
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(HE_AcceptStandard);
        _FileBrowser.SetupCKEditor(HE_ProjectDetail);

        strProjectID = Request.QueryString["ProjectID"];
        strProjectName = ShareClass.GetProjectName(strProjectID);

        //检查用户是否项目成员
        if (ShareClass.CheckUserIsProjectCreator(strProjectID, strUserCode) == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            try
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

                LB_PMCode.Enabled = false;

                ShareClass.LoadProjectType(DL_ProjectType);
                ShareClass.LoadCurrencyType(DL_CurrencyType);

                //列出可用的工作流模板
                ShareClass.LoadProjectPlanStartupRelatedWorkflowTemplate(strUserCode, DL_PlanStartupRelatedWorkflowTemplate);

                LoadProjectDetail(strProjectID);

                try
                {
                    DataSet ds;
                    strHQL = "Select HomeModuleName, PageName || " + "'" + strProjectID + "' as ModulePage  From T_ProModuleLevelForPage Where ParentModule = '建立项目第一行' and LangCode = '" + strLangCode + "' and Visible ='YES' Order By SortNumber ASC";
                    ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");
                    Repeater1.DataSource = ds;
                    Repeater1.DataBind();

                    strHQL = "Select HomeModuleName, PageName || " + "'" + strProjectID + "' as ModulePage  From T_ProModuleLevelForPage Where ParentModule = '建立项目第二行'  and LangCode = '" + strLangCode + "'and Visible ='YES' Order By SortNumber ASC";
                    ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");
                    Repeater2.DataSource = ds;
                    Repeater2.DataBind();

                    HL_BusinessForm.NavigateUrl = "TTRelatedDIYBusinessForm.aspx?RelatedType=Project&RelatedID=" + strProjectID + "&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(ShareClass.getBusinessFormTemName("Project", strProjectID));
                    //BusinessForm，如果不含业务表单，就隐藏“相关表单按钮”
                    if (ShareClass.getRelatedBusinessFormTemName("Project", strProjectID) == "")
                    {
                        HL_BusinessForm.Visible = false;
                    }
                }
                catch (Exception err)
                {
                    LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
                }
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }
        }
    }

    protected void BT_Update_Click(object sender, EventArgs e)
    {
        string strUserCode, strCustomerPMName, strUserName, strStatus, strStatusValue, strBeginDate;
        string strEndDate, strProject, strDetail, strAcceptStandard, strParentID;
        string strBudget;
        string strHQL;
        string strProjectID;
        string strProjectType;
        IList lst;
        string strPMCode;
        decimal deProjectAmount, deManHour, deManNumber;

        string strOldStatus, strNewStatus, strOldStatusValue, strNewStatusValue;

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
        strBudget = NB_Budget.Amount.ToString();

        strNewStatus = DL_Status.SelectedValue.Trim();
        strNewStatusValue = DL_StatusValue.SelectedValue.Trim();

        if (strPMCode == "" | strStatus == "" | strBeginDate == "" | strEndDate == "" | strProject == "" | strDetail == "" | strAcceptStandard == "" | strParentID == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
        }
        else
        {
            strHQL = "from Project as project where project.ProjectID = " + strProjectID;
            ProjectBLL projectBLL = new ProjectBLL();
            lst = projectBLL.GetAllProjects(strHQL);
            Project project = (Project)lst[0];

            strOldStatus = project.Status.Trim();
            strOldStatusValue = project.StatusValue.Trim();

            project.ProjectCode = TB_ProjectCode.Text.Trim();
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

            project.ParentID = int.Parse(strParentID);

            if (strProjectID == "")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWXXMBNXGJC + "')", true);
            }
            else
            {
                try
                {
                    projectBLL.UpdateProject(project, int.Parse(strProjectID));

                    AddStatusChangeRecord(strProjectID, strOldStatus, strNewStatus, strOldStatusValue, strNewStatusValue);
                    LB_Status.Text = strNewStatus;

                    //保存项目的其它属性
                    UpdateProjectOtherFieldValue(strProjectID);


                    TB_Message.Text = strUserName + " 更新了项目： " + strProjectID + " " + strProject + "的内容,请关注，特此通知！";

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
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


    protected void BT_Delete_Click(object sender, EventArgs e)
    {
        string strProjectID, strProjectName, strHQL;
        string strPMCode, strUserCode, strUserName; ;
        IList lst;

        strProjectID = LB_ProjectID.Text.Trim();

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
            projectBLL.UpdateProject(project, int.Parse(strProjectID));


            TB_Message.Text = strUserName + " 删除了项目： " + strProjectID + " " + strProjectName + "的内容,请关注，特此通知！";

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }
    }

    protected void DL_ProjectType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strType;

        try
        {
            strType = DL_ProjectType.SelectedValue.Trim();
            ShareClass.LoadProjectForPMStatus(strType,strLangCode,DL_Status);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
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
    }

    protected void DL_Status_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strProjectID, strStatus;

        try
        {
            strProjectID = LB_ProjectID.Text.Trim();
            strStatus = DL_Status.SelectedValue.Trim();

            DL_StatusValue.SelectedValue = GetProjectStatusLatestValue(strProjectID, strStatus);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }

    protected void DL_StatusValue_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL, strWLID, strProjectID, strProjectType, strStatus, strStatusValues, strReviewControl;
        IList lst;

        try
        {
            strProjectType = DL_ProjectType.SelectedValue.Trim();
            strStatus = DL_Status.SelectedValue.Trim();
            strStatusValues = DL_StatusValue.SelectedValue.Trim();
            strProjectID = LB_ProjectID.Text.Trim();

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
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }

    protected void AddStatusChangeRecord(string strProjectID, string strOldStatus, string strNewStatus, string strOldStatusValue, string strNewStatusValue)
    {
        string strUserCode, strUserName;

        if ((strOldStatus != strNewStatus) | (strOldStatusValue != strNewStatusValue))
        {
            strUserCode = LB_UserCode.Text.Trim();
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

    protected void LoadProjectDetail(string strProjectID)
    {
        string strProjectName, strHQL, strStatus;
        string strUserName;
        IList lst;

        try
        {
            ProjectBLL projectBLL = new ProjectBLL();
            strHQL = "from Project as project where project.ProjectID = " + strProjectID;
            lst = projectBLL.GetAllProjects(strHQL);
            Project project = (Project)lst[0];

            strUserName = LB_UserName.Text.Trim();
            strProjectName = project.ProjectName.Trim();

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

            try
            {
                DL_CurrencyType.SelectedValue = project.CurrencyType;
            }
            catch 
            {
            }

            TB_ProjectCode.Text = project.ProjectCode.Trim();
            LB_PMCode.Text = project.PMCode;
            LB_PMName.Visible = true;
            LB_PMName.Text = ShareClass.GetUserName(project.PMCode.Trim());
            TB_CustomerPMName.Text = project.CustomerPMName;
            LB_Status.Text = project.Status.Trim();
            DLC_BeginDate.Text = project.BeginDate.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = project.EndDate.ToString("yyyy-MM-dd");
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
            DLC_BeginDate.Text = project.BeginDate.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = project.EndDate.ToString("yyyy-MM-dd");
            NB_ProjectAmount.Amount = project.ProjectAmount;
            NB_ManHour.Amount = project.ManHour;
            NB_ManNubmer.Amount = project.ManNumber;

            HL_ProjectBudget.NavigateUrl = "TTMakeProjectBudget.aspx?ProjectID=" + strProjectID;


            //会出错，这个错误是防止修改总项目
            try
            {
                LB_ParentProjectID.Text = project.ParentID.ToString();
                TB_ParentProject.Text = ShareClass.GetProjectName(project.ParentID.ToString());
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGZXMBNXGJC + "')", true);
                return;
            }

            BT_Upate.Enabled = true;
            BT_Delete.Enabled = true;

            CB_SMS.Enabled = true;
            CB_Mail.Enabled = true;
            BT_Send.Enabled = true;

            TB_Message.Text = strUserName + " 给你建立了项目 ：" + strProjectID + " " + strProjectName + "，请及时收理！";
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }


    protected string GetProjectStatusReviewControl(string strProjectType, string strStatus)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectStatus as projectStatus where projectStatus.ProjectType = " + "'" + strProjectType + "'" + " and projectStatus.Status = " + "'" + strStatus + "'";
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
