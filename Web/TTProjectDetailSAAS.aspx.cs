using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Data;
using System.Web;
using System.Web.UI;


public partial class TTProjectDetailSAAS : System.Web.UI.Page
{
    string strIsMobileDevice;
    string strProjectType;

    string strLangCode;
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strProjectID, strProjectName, strStatus;

        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        //CKEditor初始化      
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(HE_TodaySummary);

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        strProjectID = Request.QueryString["ProjectID"];
        LB_ProjectID.Text = strProjectID;

        //检查用户是否项目经理
        if (ShareClass.CheckUserIsProjectManager(strProjectID, strUserCode) == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        Project project = ShareClass.GetProject(strProjectID);
        strProjectName = project.ProjectName.Trim();
        strProjectType = project.ProjectType.Trim();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            if (strIsMobileDevice == "YES")
            {
                HT_TodaySummary.Visible = true;
            }
            else
            {
                HE_TodaySummary.Visible = true;
            }


            //如果项目进度受细节影响，则直接取得
            string strImpactByDetail = ShareClass.GetProjectTypeImpactByDetail(strProjectID);
            if (strImpactByDetail == "YES")
            {
                //NB_FinishPercent.Enabled = false;
                //NB_ManHour.Enabled = false;
            }

            HL_ProjectDetailView.NavigateUrl = "TTProjectDetailView.aspx?ProjectID=" + strProjectID;
            ShareClass.LoadProjectForPMStatus(strProjectType, strLangCode,DL_Status);

            try
            {
                DL_Status.SelectedValue = project.Status;
                DL_StatusValue.SelectedValue = project.StatusValue.Trim();
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }

            strHQL = "from Project as project where project.ProjectID = " + strProjectID;
            ProjectBLL projectBLL = new ProjectBLL();
            lst = projectBLL.GetAllProjects(strHQL);
            DataList1.DataSource = lst;
            DataList1.DataBind();

            LB_Status.Text = project.Status.Trim();
            LB_CreatorCode.Text = project.UserCode.Trim();//项目创建者

            if (GetProjectAllowPMChangeStatus(strProjectType) == "YES")
            {
                DL_Status.Enabled = true;
                DL_StatusValue.Enabled = true;
            }
            else
            {
                DL_Status.Enabled = false;
                DL_StatusValue.Enabled = false;
            }

            //当天任务分派记录汇总
            HL_CurrentDailyWorkTask.NavigateUrl = "TTDailyWorkTaskView.aspx?ProjectID=" + strProjectID + "&UserCode=" + strUserCode + "&WorkDate=" + DateTime.Now;

            //2013-09-13 By LiuJianping 项目经理
            string strPMUserCode = project.PMCode.Trim();//

            strHQL = "from DailyWork as dailyWork where dailyWork.ProjectID = " + strProjectID + " and " + " dailyWork.UserCode = " + "'" + strUserCode + "'" + " and " + "to_char(dailyWork.WorkDate,'yyyymmdd') = " + "'" + DateTime.Now.ToString("yyyyMMdd") + "'";
            DailyWorkBLL dailyWorkBLL = new DailyWorkBLL();
            lst = dailyWorkBLL.GetAllDailyWorks(strHQL);

            if (lst.Count > 0)
            {
                DailyWork dailyWork = (DailyWork)lst[0];
                NB_FinishPercent.Amount = dailyWork.FinishPercent;

                if (strIsMobileDevice == "NO")
                {
                    HE_TodaySummary.Visible = true;
                    HE_TodaySummary.Text = dailyWork.DailySummary;
                }
                else
                {
                    HT_TodaySummary.Visible = true;
                    HT_TodaySummary.Text = dailyWork.DailySummary;
                }
                LB_WorkID.Text = dailyWork.WorkID.ToString();
                TB_Charge.Amount = dailyWork.Charge;
                NB_ManHour.Amount = dailyWork.ManHour;
                TB_WorkAddress.Text = dailyWork.Address;
                TB_Achievement.Text = dailyWork.Achievement;

                try
                {
                    DL_Authority.SelectedValue = dailyWork.Authority.Trim();
                }
                catch
                {
                }

                //如果项目进度受细节影响，则直接取得
                if (strImpactByDetail == "YES")
                {
                    NB_FinishPercent.Amount = decimal.Parse(ShareClass.getCurrentDateTotalProgressForMember(strProjectID, strUserCode));
                    NB_ManHour.Amount = decimal.Parse(ShareClass.getCurrentDateTotalManHourByOneOperator(strProjectID, strUserCode, DateTime.Now.ToString("yyyyMMdd")));
                }
                else
                {
                    NB_FinishPercent.Amount = dailyWork.FinishPercent;
                    NB_ManHour.Amount = dailyWork.ManHour;
                }
            }

            DataSet ds;
            strHQL = "Select HomeModuleName, PageName || " + "'" + strProjectID + "' as ModulePage  From T_ProModuleLevelForPage Where ParentModule = '主管项目第一行SAAS' and LangCode = '" + strLangCode + "' and Visible ='YES' Order By SortNumber ASC";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");
            Repeater1.DataSource = ds;
            Repeater1.DataBind();

            strHQL = "Select HomeModuleName, PageName || " + "'" + strProjectID + "' as ModulePage  From T_ProModuleLevelForPage Where ParentModule = '主管项目第二行SAAS' and LangCode = '" + strLangCode + "' and Visible ='YES' Order By SortNumber ASC";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");
            Repeater2.DataSource = ds;
            Repeater2.DataBind();

            strHQL = "Select HomeModuleName, PageName || " + "'" + strProjectID + "' as ModulePage  From T_ProModuleLevelForPage Where ParentModule = '主管项目第三行SAAS' and LangCode = '" + strLangCode + "' and Visible ='YES' Order By SortNumber ASC";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");
            Repeater3.DataSource = ds;
            Repeater3.DataBind();

            strStatus = ShareClass.GetProjectStatus(strProjectID);
            if (strStatus == "结案" || strStatus == "挂起" || strStatus == "取消")
            {
                Repeater1.Visible = false;
                Repeater2.Visible = false;
                Repeater3.Visible = false;

                BT_Summit.Enabled = false;
                BT_Activity.Enabled = false;
                BT_Receive.Enabled = false;
                BT_Refuse.Enabled = false;

                HL_RelatedRisk.NavigateUrl = "TTProRelatedRiskView.aspx?ProjectID=" + strProjectID;

                HL_MeetingArrange.NavigateUrl = "TTProMeetingView.aspx?ProjectID=" + strProjectID;
                HL_ExpenseApplyWL.NavigateUrl = "TTExpenseApplyWFView.aspx?RelatedType=Project&RelatedID=" + strProjectID;

                HL_CustomerInfo.NavigateUrl = "TTProjectCustomerView.aspx?ProjectID=" + strProjectID;
                HL_VendorInfo.NavigateUrl = "TTProjectVendorView.aspx?ProjectID=" + strProjectID;
                HL_RelatedContactInfor.NavigateUrl = "TTContactListView.aspx?RelatedType=Project&RelatedID=" + strProjectID;

                HL_ProjectAssetPurchase.NavigateUrl = "TTProjectAssetPurchaseReport.aspx?RelatedType=Project&RelatedID=" + strProjectID;
                HL_ProjectAssetApplication.NavigateUrl = "TTAssetApplicationReport.aspx?RelatedType=Project&RelatedID=" + strProjectID;
                //2013-09-09 LiuJianping 项目文控模块 只读
                HL_ProjectDocControl.NavigateUrl = "TTProjDocumentControlView.aspx?ProjectID=" + strProjectID;
                //项目经理才可以添加实际项目成本，其他人只能查看 2013-11-27 LiuJianping 
                HL_ProjectCost.NavigateUrl = "TTProjectCostOperationView.aspx?ProjectID=" + strProjectID;
                //项目经理才可以添加人力资源管理，其他人只能查看 2014-01-21 LiuJianping 
                HL_ProjectHR.NavigateUrl = "TTProjectMemberScheduleView.aspx?ProjectID=" + strProjectID;
            }
            else
            {
                HL_RelatedRisk.NavigateUrl = "TTProRelatedRisk.aspx?ProjectID=" + strProjectID;

                HL_ProjectItemBom.NavigateUrl = "TTProjectRelatedItem.aspx?ProjectID=" + strProjectID;

                HL_MeetingArrange.NavigateUrl = "TTMakeProMeeting.aspx?ProjectID=" + strProjectID;
                HL_ExpenseApplyWL.NavigateUrl = "TTProjectExpenseApplyWF.aspx?RelatedType=Project&RelatedID=" + strProjectID;


                HL_CustomerInfo.NavigateUrl = "TTProjectCustomerInfo.aspx?ProjectID=" + strProjectID;
                HL_VendorInfo.NavigateUrl = "TTProjectVendorInfo.aspx?ProjectID=" + strProjectID;
  
                HL_RelatedContactInfor.NavigateUrl = "TTContactList.aspx?RelatedType=Project&RelatedID=" + strProjectID;

                HL_ProjectAssetPurchase.NavigateUrl = "TTMakeProjectAssetPO.aspx?RelatedType=Project&RelatedID=" + strProjectID;
                HL_ProjectAssetApplication.NavigateUrl = "TTProjectAssetApplicationWL.aspx?RelatedType=Project&RelatedID=" + strProjectID;

                HL_RelatedWorkFlowTemplate.Enabled = true;
                HL_RelatedWorkFlowTemplate.NavigateUrl = "TTAttachWorkFlowTemplate.aspx?RelatedType=Project&RelatedID=" + strProjectID;
                HL_WLTem.Enabled = true;
                HL_WLTem.NavigateUrl = "TTRelatedWorkFlowTemplate.aspx?RelatedType=Project&RelatedID=" + strProjectID;

                HL_RunProjectByWF.Enabled = true;
                HL_RunProjectByWF.NavigateUrl = "TTRelatedDIYWorkflowForm.aspx?RelatedType=Project&RelatedID=" + strProjectID;

                //2013-10-11 LiuJianping 项目文控模块 可编辑 判断用户是否是文控专员的角色或项目经理，若是则可编辑，否则只能查看
                if (ISActorGroupByUserCode(strUserCode.Trim(), "文控专员", strProjectID) || strUserCode.Trim().Equals(strPMUserCode.ToString()))
                {
                    HL_ProjectDocControl.NavigateUrl = "TTProjDocumentControl.aspx?ProjectID=" + strProjectID;
                }
                else
                {
                    HL_ProjectDocControl.NavigateUrl = "TTProjDocumentControlView.aspx?ProjectID=" + strProjectID;
                }
                //项目经理才可以添加实际项目成本，其他人只能查看 2013-11-27 LiuJianping 
                if (strUserCode.Trim().Equals(strPMUserCode.ToString()))
                {
                    HL_ProjectCost.NavigateUrl = "TTProjectCostOperationEdit.aspx?ProjectID=" + strProjectID;
                    HL_ProjectHR.NavigateUrl = "TTProjectMemberScheduleEdit.aspx?ProjectID=" + strProjectID;
                }
                else
                {
                    HL_ProjectCost.NavigateUrl = "TTProjectCostOperationView.aspx?ProjectID=" + strProjectID;
                    HL_ProjectHR.NavigateUrl = "TTProjectMemberScheduleView.aspx?ProjectID=" + strProjectID;
                }
            }

            HL_RelatedReq.NavigateUrl = "TTProjectRelatedReqMain.aspx?ProjectID=" + strProjectID;

            HL_RelatedConstract.NavigateUrl = "TTProjectRelatedConstract.aspx?ProjectID=" + strProjectID;
            HL_LeadReview.NavigateUrl = "TTLeadReviewSummary.aspx?ProjectID=" + strProjectID;

            HL_DailyWorkReportForCustomer.NavigateUrl = "TTProjectDailyWorkReportForCustomer.aspx?ProjectID=" + strProjectID;

            HL_StatusChangeRecord.NavigateUrl = "TTProStatusChangeRecord.aspx?ProjectID=" + strProjectID;
            HL_TransferProject.NavigateUrl = "TTTransferProjectRecord.aspx?ProjectID=" + strProjectID;
            HL_ExpenseSummary.NavigateUrl = "TTProjectExpenseReport.aspx?ProjectID=" + strProjectID;
            HL_TaskSummary.NavigateUrl = "TTProRelatedTaskView.aspx?ProjectID=" + strProjectID;
            HL_TaskRecordAssignSummary.NavigateUrl = "TTTaskAssignRecordSummary.aspx?ProjectID=" + strProjectID;
            HL_ExpenseApplySummary.NavigateUrl = "TTProjectExpenseApplyReport.aspx?ProjectID=" + strProjectID;
            HL_ExpenseClaimSummary.NavigateUrl = "TTProjectExpenseClaimReport.aspx?ProjectID=" + strProjectID;
            HL_ActorGroup.NavigateUrl = "TTRelatedActorGroup.aspx?RelatedType=Project&RelatedID=" + strProjectID;
            HL_ProjectChildTree.NavigateUrl = "TTProjectChildTree.aspx?ProjectID=" + strProjectID;
            HL_RelatedWorkFlowTemplate.Enabled = true;
            HL_RelatedWorkFlowTemplate.NavigateUrl = "TTAttachWorkFlowTemplate.aspx?RelatedType=Project&RelatedID=" + strProjectID;
            HL_RelatedWorkFlow.NavigateUrl = "TTProjectRelatedWorkFlowView.aspx?ProjectID=" + strProjectID;
            HL_MakeCollaboration.NavigateUrl = "TTMakeCollaboration.aspx?RelatedType=PROJECT&RelatedID=" + strProjectID;

            HL_AssetShipmentReport.NavigateUrl = "TTAssetShipmentReport.aspx?RelatedType=Project&RelatedID=" + strProjectID;

            HL_WorkPlan.NavigateUrl = "TTMakePlan.aspx?RelatedType=PROJECT&RelatedID=" + strProjectID;

            //推送实施路线和实施文档
            HL_ImpleRoute.NavigateUrl = "TTSelectorPlan.aspx?projectID=" + strProjectID;
            HL_ImplePush.NavigateUrl = "TTDownloadPlanTools_YYUP.aspx?ProjectID=" + strProjectID;

            try
            {
                string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];
                if (strProductType != "EDPMP" & strProductType != "ECMP" & strProductType != "SIMP" & strProductType != "DEMO")
                {
                    HL_ImpleRoute.Visible = false;
                    HL_ImplePush.Visible = false;
                }

                string strSystemVersionType = Session["SystemVersionType"].ToString();
                if (strSystemVersionType != "GROUP" & strSystemVersionType != "ENTERPRISE")
                {
                    HL_ProjectItemBom.Visible = false;
                    HL_RunProjectByWF.Visible = false;
                    HL_ExpenseApplyWL.Visible = false;
                    HL_ProjectCost.Visible = false;
                    //HL_ProjectReviewWL.Visible = false;

                    HL_WorkPlan.Visible = false;
                    HL_ImpleRoute.Visible = false;
                    HL_ImplePush.Visible = false;
                    HL_ProjectDocControl.Visible = false;
                    HL_ProjectHR.Visible = false;

                    HL_WLTem.Visible = false;
                    HL_RelatedWorkFlowTemplate.Visible = false;
                    HL_MakeCollaboration.Visible = false;

                    HL_DailyWorkReportForCustomer.Visible = false;

                    HL_RelatedRisk.Visible = false;

                    DivProject1.Visible = false;
                    DivProject2.Visible = false;

                    HL_RelatedReq.Visible = false;
                }
                else
                {
                }

                strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];
                if (strSystemVersionType == "SAAS" || strProductType.IndexOf("SAAS") > -1)
                {
                    //HL_ProjectContactList.Visible = true;

                    HL_RelatedContactInfor.Visible = false;
                    HL_MeetingArrange.Visible = false;
                }
            }
            catch
            {

            }
        }
    }


    protected string GetProjectAllowPMChangeStatus(string strProjectType)
    {
        string strHQL;
        string strAllowPMChangeStatus;

        strHQL = "Select AllowPMChangeStatus From T_ProjectType Where Type = " + "'" + strProjectType + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectType");
        if (ds.Tables[0].Rows.Count > 0)
        {
            strAllowPMChangeStatus = ds.Tables[0].Rows[0][0].ToString().Trim();
            return strAllowPMChangeStatus;
        }
        else
        {
            return "NO";
        }
    }

    protected void DL_Status_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        string strProjectID, strOldStatus, strOldStatusValue, strNewStatus, strNewStatusValue;

        strProjectID = LB_ProjectID.Text.Trim();

        Project project = ShareClass.GetProject(strProjectID);
        strOldStatus = project.Status.Trim();
        strOldStatusValue = project.StatusValue.Trim();

        strNewStatus = DL_Status.SelectedValue.Trim();

        strNewStatusValue = GetProjectStatusLatestValue(strProjectID, strNewStatus);
        DL_StatusValue.SelectedValue = strNewStatusValue;

        try
        {
            strHQL = "Update T_Project Set Status = " + "'" + strNewStatus + "'" + ",StatusValue = " + "'" + strNewStatusValue + "'" + " Where ProjectID = " + strProjectID;
            ShareClass.RunSqlCommand(strHQL);

            AddStatusChangeRecord(strProjectID, strOldStatus, strNewStatus, strOldStatusValue, strNewStatusValue, strUserCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZTGBCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZTGBSBJC + "')", true);
        }
    }

    protected void DL_StatusValue_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strWLID, strProjectID, strOldStatus, strOldStatusValue, strNewStatus, strNewStatusValue, strReviewControl;

        strProjectID = LB_ProjectID.Text.Trim();

        Project project = ShareClass.GetProject(strProjectID);
        strOldStatus = project.Status.Trim();
        strOldStatusValue = project.StatusValue.Trim();

        strNewStatus = DL_Status.SelectedValue.Trim();
        strNewStatusValue = DL_StatusValue.SelectedValue.Trim();

        strReviewControl = GetProjectStatusReviewControl(strProjectType, strNewStatus);

        if (strReviewControl == "是")
        {
            if (strNewStatusValue == "通过")
            {
                strHQL = "from StatusRelatedWF as statusRelatedWF where statusRelatedWF.Status = " + "'" + strNewStatus + "'" + " and  statusRelatedWF.RelatedType = '项目' and statusRelatedWF.RelatedID = " + strProjectID + " Order by statusRelatedWF.ID DESC";
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

        strNewStatusValue = DL_StatusValue.SelectedValue.Trim();
        try
        {
            strHQL = "Update T_Project Set StatusValue = " + "'" + strNewStatusValue + "'" + " Where ProjectID = " + strProjectID;
            ShareClass.RunSqlCommand(strHQL);

            AddStatusChangeRecord(strProjectID, strOldStatus, strNewStatus, strOldStatusValue, strNewStatusValue, strUserCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZTZGBCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZTZGBSBJC + "')", true);
        }
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

    /// <summary>
    /// 根据用户编码，角色名称，项目编号，判断该用户是否存在  By LiuJianping 2013-10-12
    /// </summary>
    /// <param name="strusercode">用户编码</param>
    /// <param name="strgroupname">角色名称</param>
    /// <param name="strprojectid">项目编号</param>
    /// <returns></returns>
    protected bool ISActorGroupByUserCode(string strusercode, string strgroupname, string strprojectid)
    {
        bool flag = true;
        string strHQL = "from RelatedUser as relatedUser where relatedUser.UserCode = '" + strusercode + "' and relatedUser.Actor = '" + strgroupname + "' and relatedUser.ProjectID='" + strprojectid + "' ";
        RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
        IList lst = relatedUserBLL.GetAllRelatedUsers(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            flag = true;
        }
        else
            flag = false;

        return flag;
    }

    protected void BT_Summit_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strBTText;
        string strLBWorkID;
        string strUserCode = LB_UserCode.Text.Trim();
        string strProjectID = LB_ProjectID.Text.Trim();
        decimal deManHour = NB_ManHour.Amount;
        decimal deUnitHourSalary = 0, deFinishPercent = 0, deBonus = 0;

        string strTodaySummary;

        if (strIsMobileDevice == "YES")
        {
            strTodaySummary = HT_TodaySummary.Text.Trim();
        }
        else
        {
            strTodaySummary = HE_TodaySummary.Text.Trim();
        }

        if (strTodaySummary == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZJNRBNWKJC + "')", true);
            return;
        }

        try
        {
            if (NB_FinishPercent.Amount > 100)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZWCBFBBNCG100JC + "')", true);
            }
            else
            {
                DailyWorkBLL dailyWorkBLL = new DailyWorkBLL();
                DailyWork dailyWork = new DailyWork();

                strBTText = BT_Summit.Text.Trim();
                strLBWorkID = LB_WorkID.Text.Trim();
                deUnitHourSalary = GetUnitHourSalary(strUserCode, strProjectID);
                deFinishPercent = NB_FinishPercent.Amount;

                if (strLBWorkID == "-1")
                {
                    dailyWork.Type = "主导";
                    dailyWork.UserCode = strUserCode;
                    dailyWork.UserName = ShareClass.GetUserName(strUserCode);
                    dailyWork.WorkDate = DateTime.Now;
                    dailyWork.RecordTime = DateTime.Now;
                    dailyWork.Address = TB_WorkAddress.Text.Trim();
                    dailyWork.ProjectID = int.Parse(strProjectID);
                    dailyWork.ProjectName = ShareClass.GetProjectName(strProjectID);
                    dailyWork.DailySummary = strTodaySummary;
                    dailyWork.Achievement = TB_Achievement.Text;
                    dailyWork.Charge = 0;
                    dailyWork.ManHour = deManHour;
                    dailyWork.ConfirmManHour = deManHour;
                    dailyWork.Salary = deManHour * deUnitHourSalary;
                    dailyWork.FinishPercent = deFinishPercent;

                    deBonus = ShareClass.GetDailyWorkLogLength(dailyWork.DailySummary) * ShareClass.GetEveryCharPrice() + ShareClass.GetDailyUploadDocNumber(strUserCode, strProjectID) * ShareClass.GetEveryDocPrice();

                    dailyWork.Bonus = deBonus;
                    dailyWork.ConfirmBonus = deBonus;
                    dailyWork.Authority = DL_Authority.SelectedValue.Trim();

                    try
                    {
                        dailyWorkBLL.AddDailyWork(dailyWork);
                        ShareClass.UpdateProjectCompleteDegree(strProjectID, deFinishPercent);

                        strHQL = "from DailyWork as dailyWork where dailyWork.Type = '主导' and dailyWork.ProjectID = " + strProjectID + " and " + " dailyWork.UserCode = " + "'" + strUserCode + "'" + " and " + "to_char(dailyWork.WorkDate,'yyyymmdd') = " + "'" + DateTime.Now.ToString("yyyyMMdd") + "'";
                        lst = dailyWorkBLL.GetAllDailyWorks(strHQL);
                        dailyWork = (DailyWork)lst[0];
                        LB_WorkID.Text = dailyWork.WorkID.ToString();

                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTJCG + "')", true);
                    }
                    catch
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTJCCJC + "')", true);
                    }
                }
                else
                {
                    strHQL = "from DailyWork as dailyWork where dailyWork.WorkID = " + LB_WorkID.Text;

                    lst = dailyWorkBLL.GetAllDailyWorks(strHQL);
                    dailyWork = (DailyWork)lst[0];

                    strProjectID = dailyWork.ProjectID.ToString();
                    deFinishPercent = NB_FinishPercent.Amount;

                    dailyWork.RecordTime = DateTime.Now;
                    dailyWork.Address = TB_WorkAddress.Text.Trim();
                    dailyWork.FinishPercent = deFinishPercent;
                    dailyWork.DailySummary = strTodaySummary;
                    dailyWork.Achievement = TB_Achievement.Text;
                    dailyWork.ManHour = deManHour;
                    dailyWork.ConfirmManHour = deManHour;

                    dailyWork.Salary = deManHour * deUnitHourSalary;

                    deBonus = ShareClass.GetDailyWorkLogLength(dailyWork.DailySummary) * ShareClass.GetEveryCharPrice() + ShareClass.GetDailyUploadDocNumber(strUserCode, strProjectID) * ShareClass.GetEveryDocPrice();

                    dailyWork.Bonus = deBonus;
                    dailyWork.ConfirmBonus = deBonus;

                    dailyWork.Authority = DL_Authority.SelectedValue.Trim();

                    try
                    {
                        dailyWorkBLL.UpdateDailyWork(dailyWork, int.Parse(LB_WorkID.Text));

                        ShareClass.UpdateProjectCompleteDegree(strProjectID, deFinishPercent);

                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTJCG + "')", true);

                    }
                    catch
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTJSBJCZ + "')", true);
                    }
                }
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('提交失败，'百分比不能为小数，请检查！')", true);
        }
    }

    protected void BT_Receive_Click(object sender, EventArgs e)
    {
        string strProjectID = LB_ProjectID.Text.Trim();
        string strUserCode = LB_UserCode.Text.Trim();
        string strUserName = ShareClass.GetUserName(strUserCode);
        string strOldStatus, strOldStatusValue;
        string strNewStatus = "受理";
        string strNewStatusValue = "通过";
        string strProjectName, strStatus;

        ProjectBLL projectBLL = new ProjectBLL();

        string strHQL = "from Project as project where project = " + strProjectID;
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        strOldStatus = project.Status.Trim();
        strOldStatusValue = project.StatusValue.Trim();

        strStatus = project.Status.Trim();

        //推送实施路线
        HL_ImpleRoute.NavigateUrl = "TTSelectorPlan.aspx?projectID=" + strProjectID;

        if (strStatus == "新建" | strStatus == "评审" | strStatus == "计划" | strStatus == "拒绝")
        {
            strProjectName = project.ProjectName.Trim();

            project.Status = "受理";
            project.StatusValue = "通过";

            try
            {
                projectBLL.UpdateProject(project, int.Parse(strProjectID));

                AddStatusChangeRecord(strProjectID, strOldStatus, strNewStatus, strOldStatusValue, strNewStatusValue, strUserCode);
                LB_Status.Text = strNewStatus;

                TB_Message.Text = strUserName + " 受理了你建立的项目：" + strProjectID + " " + strProjectName;

                LoadProject(strProjectID);


                //弹出推送实施路线
                HL_ImpleRoute.NavigateUrl = "TTSelectorPlan.aspx?projectID=" + strProjectID;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "AlertProjectPage('TTSelectorPlan.aspx?projectID=" + strProjectID + "');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSLSBJC + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZNYSLGBNZFSL + "')", true);
        }
    }

    protected void BT_Refuse_Click(object sender, EventArgs e)
    {
        string strProjectID = LB_ProjectID.Text.Trim();
        string strUserCode = LB_UserCode.Text.Trim();
        string strUserName = ShareClass.GetUserName(strUserCode);
        string strOldStatus, strOldStatusValue;
        string strNewStatus = "拒绝";
        string strNewStatusValue = "通过";
        string strProjectName, strStatus;
        string strHQL;
        IList lst;


        ProjectBLL projectBLL = new ProjectBLL();
        strHQL = "from Project as project where project = " + strProjectID;
        lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        strOldStatus = project.Status.Trim();
        strOldStatusValue = project.StatusValue.Trim();

        strStatus = project.Status.Trim();

        if (strStatus == "新建" | strStatus == "评审" | strStatus == "计划" | strStatus == "受理")
        {
            strProjectName = project.ProjectName.Trim();

            project.Status = "拒绝";
            project.StatusValue = "通过";

            try
            {
                projectBLL.UpdateProject(project, int.Parse(strProjectID));

                AddStatusChangeRecord(strProjectID, strOldStatus, strNewStatus, strOldStatusValue, strNewStatusValue, strUserCode);
                LB_Status.Text = strNewStatus;

                TB_Message.Text = strUserName + " 拒绝了你建立的项目：" + strProjectID + " " + strProjectName;

                LoadProject(strProjectID);
            }
            catch
            {

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJJSBJCZ + "')", true);

            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCXMYZJXZBNJJL + "')", true);
        }
    }

    protected void BT_Activity_Click(object sender, EventArgs e)
    {
        string strProjectID = LB_ProjectID.Text.Trim();
        string strUserCode = LB_UserCode.Text.Trim();
        string strUserName = ShareClass.GetUserName(strUserCode);
        string strOldStatus, strOldStatusValue;
        string strNewStatus = "处理中";
        string strNewStatusValue = "通过";
        string strProjectName, strStatus;

        string strHQL;
        IList lst;

        ProjectBLL projectBLL = new ProjectBLL();
        strHQL = "from Project as project where project = " + strProjectID;
        lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        strOldStatus = project.Status.Trim();
        strOldStatusValue = project.StatusValue.Trim();

        strStatus = project.Status.Trim();

        if (strStatus == "新建" | strStatus == "评审" | strStatus == "计划" | strStatus == "拒绝" | strStatus == "受理")
        {
            strProjectName = project.ProjectName.Trim();

            project.Status = "处理中";
            project.StatusValue = "通过";

            try
            {
                projectBLL.UpdateProject(project, int.Parse(strProjectID));

                AddStatusChangeRecord(strProjectID, strOldStatus, strNewStatus, strOldStatusValue, strNewStatusValue, strUserCode);
                LB_Status.Text = strNewStatus;

                TB_Message.Text = strUserName + " 开始处理你建立的项目：" + strProjectID + " " + strProjectName;

                LoadProject(strProjectID);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZHDSBJCZ + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCXMYZHDJXZBYJHL + "')", true);
        }
    }

    protected void BT_Send_Click(object sender, EventArgs e)
    {
        string strSubject, strMsg;
        string strUserCode = LB_UserCode.Text.Trim();
        string strCreatorCode = LB_CreatorCode.Text.Trim();

        Msg msg = new Msg();

        if (CB_ReturnMsg.Checked == true | CB_ReturnMail.Checked == true)
        {
            strSubject = "项目处理情况反馈";
            strMsg = TB_Message.Text.Trim();

            if (CB_ReturnMsg.Checked == true)
            {
                msg.SendMSM("Message", strCreatorCode, strMsg, strUserCode);
            }

            if (CB_ReturnMail.Checked == true)
            {
                msg.SendMail(strCreatorCode, strSubject, strMsg, strUserCode);
            }
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFSWB + "')", true);
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

    protected string GetProjectStatus(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);

        Project project = (Project)lst[0];

        return project.Status.Trim();
    }

    protected void LoadProject(string strProjectID)
    {
        string strHQL = "from Project as project where project = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        DataList1.DataSource = lst;
        DataList1.DataBind();
    }

 
    protected decimal GetUnitHourSalary(string strUserCode, string strProjectID)
    {
        decimal deUnitHourSalary;
        string strHQL;
        IList lst;

        strHQL = "from RelatedUser as relatedUser where relatedUser.UserCode = " + "'" + strUserCode + "'" + " and relatedUser.ProjectID = " + strProjectID;
        RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
        lst = relatedUserBLL.GetAllRelatedUsers(strHQL);

        if (lst.Count > 0)
        {
            RelatedUser relatedUser = (RelatedUser)lst[0];
            deUnitHourSalary = relatedUser.UnitHourSalary;
        }
        else
        {
            deUnitHourSalary = 0;
        }

        return deUnitHourSalary;
    }

}
