using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.IO;
using System.Web;
using System.Web.UI;

public partial class TTAppProjectDetailSAAS : System.Web.UI.Page
{
    string strIsMobileDevice;
    string strProjectType;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        string strProjectID, strProjectName, strPMUserCode, strStatus;
        string strImpactByDetail;

        string strUserCode;
        string strUserName;
        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        //CKEditor初始化      
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(HE_TodaySummary);

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        strProjectID = Request.QueryString["ProjectID"];
        LB_ProjectID.Text = strProjectID;

        if (Page.IsPostBack == false)
        {
            if (strIsMobileDevice == "YES")
            {
                HT_TodaySummary.Visible = true;
                HT_TodaySummary.Toolbar = "";
            }
            else
            {
                HE_TodaySummary.Visible = true;
            }

            //检查用户是否项目成员
            if (ShareClass.CheckUserIsProjectManager(strProjectID, strUserCode) == false)
            {
                Response.Redirect("TTDisplayErrors.aspx");
                return;
            }

            Project project = ShareClass.GetProject(strProjectID);
            strProjectName = project.ProjectName.Trim();
            strProjectType = project.ProjectType.Trim();
            strPMUserCode = project.PMCode.Trim();

            LB_Status.Text = project.Status.Trim();
            LB_CreatorCode.Text = project.UserCode.Trim();//项目创建者

            //如果项目进度受细节影响，则直接取得
            strImpactByDetail = ShareClass.GetProjectTypeImpactByDetail(strProjectID);
            if (strImpactByDetail == "YES")
            {
                //NB_FinishPercent.Enabled = false;
                //NB_ManHour.Enabled = false;
            }

            //strHQL = "from Project as project where project.ProjectID = " + strProjectID;
            //ProjectBLL projectBLL = new ProjectBLL();
            //lst = projectBLL.GetAllProjects(strHQL);
            //DataList1.DataSource = lst;
            //DataList1.DataBind();

            strHQL = "from DailyWork as dailyWork where dailyWork.ProjectID = " + strProjectID + " and " + " dailyWork.UserCode = " + "'" + strUserCode + "'" + " and " + "to_char(dailyWork.WorkDate,'yyyymmdd') = " + "'" + DateTime.Now.ToString("yyyyMMdd") + "'";
            DailyWorkBLL dailyWorkBLL = new DailyWorkBLL();
            lst = dailyWorkBLL.GetAllDailyWorks(strHQL);
            if (lst.Count > 0)
            {
                DailyWork dailyWork = (DailyWork)lst[0];
                if (strIsMobileDevice == "NO")
                {
                    HE_TodaySummary.Visible = true;
                    HE_TodaySummary.Text = dailyWork.DailySummary;
                    HE_TodaySummary.Toolbar = "";
                }
                else
                {
                    HT_TodaySummary.Visible = true;
                    HT_TodaySummary.Text = dailyWork.DailySummary;
                    HT_TodaySummary.Toolbar = "";
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

                LB_WorkID.Text = dailyWork.WorkID.ToString();
                TB_Charge.Amount = dailyWork.Charge;
                TB_WorkAddress.Text = dailyWork.Address;
                TB_Achievement.Text = dailyWork.Achievement;

                try
                {
                    DL_Authority.SelectedValue = dailyWork.Authority.Trim();
                }
                catch
                {
                }
            }

            strStatus = ShareClass.GetProjectStatus(strProjectID);
            if (strStatus == "结案" || strStatus == "挂起" || strStatus == "取消")
            {
                BT_Summit.Enabled = false;
                BT_Activity.Enabled = false;
                BT_Receive.Enabled = false;
                BT_Refuse.Enabled = false;
                HL_ConfirmManHour.Enabled = false;

                HL_RelatedDoc.NavigateUrl = "TTProRelatedDocView.aspx?RelatedID=" + strProjectID;
                HL_RelatedRisk.NavigateUrl = "TTProRelatedRiskView.aspx?ProjectID=" + strProjectID;
                HL_Expense.NavigateUrl = "TTProjectExpenseReport.aspx?ProjectID=" + strProjectID + "&TaskID=0&RecordID=0&QuestionID=0";
                HL_RelatedUser.NavigateUrl = "TTProRelatedUserSummary.aspx?ProjectID=" + strProjectID;

                //HL_RelatedReq.NavigateUrl = "TTProRelatedReqSummary.aspx?ProjectID=" + strProjectID;
                //HL_AssignTask.NavigateUrl = "TTProRelatedTaskView.aspx?ProjectID=" + strProjectID;

                HL_MeetingArrange.NavigateUrl = "TTProMeetingView.aspx?ProjectID=" + strProjectID;
                HL_ProjectReviewWL.NavigateUrl = "TTProjectReviewWLView.aspx?ProjectID=" + strProjectID;
                HL_ExpenseApplyWL.NavigateUrl = "TTExpenseApplyWFView.aspx?RelatedType=Project&RelatedID=" + strProjectID;

                HL_CustomerInfo.NavigateUrl = "TTProjectCustomerView.aspx?ProjectID=" + strProjectID;
                HL_VendorInfo.NavigateUrl = "TTProjectVendorView.aspx?ProjectID=" + strProjectID;
                HL_MakePlan.NavigateUrl = "TTWorkPlanViewMain.aspx?ProjectID=" + strProjectID;
                HL_RelatedContactInfor.NavigateUrl = "TTContactListView.aspx?RelatedType=Project&RelatedID=" + strProjectID;
                HL_ProjectAssetPurchase.NavigateUrl = "TTProjectAssetPurchaseReport.aspx?RelatedType=Project&RelatedID=" + strProjectID;
                HL_ProjectAssetApplication.NavigateUrl = "TTAssetApplicationReport.aspx?RelatedType=Project&RelatedID=" + strProjectID;
                //2013-09-09 LiuJianping 项目文控模块 只读
                HyperLink1.NavigateUrl = "TTProjDocumentControlView.aspx?ProjectID=" + strProjectID;
                //项目经理才可以添加实际项目成本，其他人只能查看 2013-11-27 LiuJianping 
                HyperLink2.NavigateUrl = "TTProjectCostOperationView.aspx?ProjectID=" + strProjectID;
                //项目经理才可以添加人力资源管理，其他人只能查看 2014-01-21 LiuJianping 
                HyperLink3.NavigateUrl = "TTProjectMemberScheduleView.aspx?ProjectID=" + strProjectID;
            }
            else
            {
                HL_RelatedDoc.NavigateUrl = "TTProjectRelatedDoc.aspx?ProjectID=" + strProjectID;
                HL_RelatedRisk.NavigateUrl = "TTProRelatedRisk.aspx?ProjectID=" + strProjectID;
                HL_Expense.NavigateUrl = "TTProExpense.aspx?ProjectID=" + strProjectID + "&TaskID=0&RecordID=0&QuestionID=0";

                HL_ProjectItemBom.NavigateUrl = "TTProjectRelatedItem.aspx?ProjectID=" + strProjectID;
                HL_RelatedUser.NavigateUrl = "TTProjectRelatedUser.aspx?ProjectID=" + strProjectID;

                HL_MeetingArrange.NavigateUrl = "TTMakeProMeeting.aspx?ProjectID=" + strProjectID;
                HL_ProjectReviewWL.NavigateUrl = "TTProjectReviewWL.aspx?ProjectID=" + strProjectID + "&Type=Project&ProjectStatus=NONE";
                HL_ExpenseApplyWL.NavigateUrl = "TTProjectExpenseApplyWF.aspx?RelatedType=Project&RelatedID=" + strProjectID;

                HL_ConfirmManHour.NavigateUrl = "TTConfirmProjectManHour.aspx?ProjectId=" + strProjectID;

                HL_CustomerInfo.NavigateUrl = "TTProjectCustomerInfo.aspx?ProjectID=" + strProjectID;
                HL_VendorInfo.NavigateUrl = "TTProjectVendorInfo.aspx?ProjectID=" + strProjectID;
                HL_MakePlan.NavigateUrl = "TTWorkPlanMain.aspx?ProjectID=" + strProjectID;
                //HL_MakePlan.NavigateUrl = "TTWorkPlanTest.aspx?ProjectID=" + strProjectID;
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
                //if (strUserCode.Trim().Equals(LB_CreatorCode.Text.Trim()) || strUserCode.Trim().Equals(strPMUserCode.ToString()))
                if (ISActorGroupByUserCode(strUserCode.Trim(), "文控专员", strProjectID) || strUserCode.Trim().Equals(strPMUserCode.ToString()))
                {
                    HyperLink1.NavigateUrl = "TTProjDocumentControl.aspx?ProjectID=" + strProjectID;
                }
                else
                {
                    HyperLink1.NavigateUrl = "TTProjDocumentControlView.aspx?ProjectID=" + strProjectID;
                }
                //项目经理才可以添加实际项目成本，其他人只能查看 2013-11-27 LiuJianping 
                if (strUserCode.Trim().Equals(strPMUserCode.ToString()))
                {
                    HyperLink2.NavigateUrl = "TTProjectCostOperationEdit.aspx?ProjectID=" + strProjectID;
                    HyperLink3.NavigateUrl = "TTProjectMemberScheduleEdit.aspx?ProjectID=" + strProjectID;
                }
                else
                {
                    HyperLink2.NavigateUrl = "TTProjectCostOperationView.aspx?ProjectID=" + strProjectID;
                    HyperLink3.NavigateUrl = "TTProjectMemberScheduleView.aspx?ProjectID=" + strProjectID;
                }
            }

            HL_RelatedReq.NavigateUrl = "TTProjectRelatedReqMain.aspx?ProjectID=" + strProjectID;
            HL_AssignTask.NavigateUrl = "TTProAssignTask.aspx?ProjectID=" + strProjectID;

            HL_RelatedConstract.NavigateUrl = "TTProjectRelatedConstract.aspx?ProjectID=" + strProjectID;
            HL_LeadReview.NavigateUrl = "TTLeadReviewSummary.aspx?ProjectID=" + strProjectID;
            HL_DailyWork.NavigateUrl = "TTProjectSummaryAnalystChart.aspx?ProjectID=" + strProjectID;
            HL_StatusChangeRecord.NavigateUrl = "TTProStatusChangeRecord.aspx?ProjectID=" + strProjectID;
            HL_TransferProject.NavigateUrl = "TTTransferProjectRecord.aspx?ProjectID=" + strProjectID;
            HL_ExpenseSummary.NavigateUrl = "TTProjectExpenseReport.aspx?ProjectID=" + strProjectID;
            HL_TaskSummary.NavigateUrl = "TTProRelatedTaskView.aspx?ProjectID=" + strProjectID;
            HL_TaskRecordAssignSummary.NavigateUrl = "TTTaskAssignRecordSummary.aspx?ProjectID=" + strProjectID;
            HL_IncomeAndExpense.NavigateUrl = "TTProjectIncomeAndExpenseReport.aspx?ProjectID=" + strProjectID;
            HL_ExpenseApplySummary.NavigateUrl = "TTProjectExpenseApplyReport.aspx?ProjectID=" + strProjectID;
            HL_ExpenseClaimSummary.NavigateUrl = "TTProjectExpenseClaimReport.aspx?ProjectID=" + strProjectID;
            HL_ActorGroup.NavigateUrl = "TTRelatedActorGroup.aspx?RelatedType=Project&RelatedID=" + strProjectID;
            HL_ProjectChildTree.NavigateUrl = "TTProjectChildTree.aspx?ProjectID=" + strProjectID;
            HL_RelatedWorkFlowTemplate.Enabled = true;
            HL_RelatedWorkFlowTemplate.NavigateUrl = "TTAttachWorkFlowTemplate.aspx?RelatedType=Project&RelatedID=" + strProjectID;
            HL_DailyWorkReport.NavigateUrl = "TTAppDailyWorkReport.aspx?ProjectID=" + strProjectID;
            HL_RelatedWorkFlow.NavigateUrl = "TTProjectRelatedWorkFlowView.aspx?ProjectID=" + strProjectID;
            HL_MakeCollaboration.NavigateUrl = "TTMakeCollaboration.aspx?RelatedType=PROJECT&RelatedID=" + strProjectID;

            HL_AssetShipmentReport.NavigateUrl = "TTAssetShipmentReport.aspx?RelatedType=Project&RelatedID=" + strProjectID;
        }
    }

    protected void BT_Summit_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strBTText;
        string strLBWorkID;
        string strUserCode = LB_UserCode.Text.Trim();
        string strProjectID = LB_ProjectID.Text.Trim();
        decimal deManHour = 0;
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
            Project project = ShareClass.GetProject(strProjectID);
            strProjectType = project.ProjectType.Trim();

            //如果项目进度受细节影响，则直接取得
            if (ShareClass.GetProjectTypeImpactByDetail(strProjectID) == "YES")
            {
                NB_FinishPercent.Amount = decimal.Parse(ShareClass.getCurrentDateTotalProgressForMember(strProjectID, strUserCode));
                NB_ManHour.Amount = decimal.Parse(ShareClass.getCurrentDateTotalManHourByOneOperator(strProjectID, strUserCode, DateTime.Now.ToString("yyyyMMdd")));
            }

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
                deManHour = NB_ManHour.Amount;

                if (strLBWorkID == "-1")
                {
                    dailyWork.Type = "主导";
                    dailyWork.UserCode = strUserCode;
                    dailyWork.UserName = ShareClass.GetUserName(strUserCode);
                    dailyWork.WorkDate = DateTime.Now;
                    dailyWork.ProjectID = int.Parse(strProjectID);
                    dailyWork.ProjectName = ShareClass.GetProjectName(strProjectID);
                    dailyWork.DailySummary = strTodaySummary;
                    dailyWork.Charge = 0;
                    dailyWork.ManHour = deManHour;
                    dailyWork.ConfirmManHour = deManHour;
                    dailyWork.Salary = deManHour * deUnitHourSalary;
                    dailyWork.FinishPercent = deFinishPercent;

                    deBonus = ShareClass.GetDailyWorkLogLength(dailyWork.DailySummary) * ShareClass.GetEveryCharPrice() + ShareClass.GetDailyUploadDocNumber(strUserCode, strProjectID) * ShareClass.GetEveryDocPrice();

                    dailyWork.Bonus = deBonus;
                    dailyWork.ConfirmBonus = deBonus;
                    dailyWork.Authority = DL_Authority.SelectedValue.Trim();
                    dailyWork.Address = TB_WorkAddress.Text.Trim();
                    dailyWork.Achievement = TB_Achievement.Text.Trim();
                    dailyWork.RecordTime = DateTime.Now;

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
                    catch (Exception err)
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "')", true);
                    }
                }
                else
                {
                    strHQL = "from DailyWork as dailyWork where dailyWork.WorkID = " + LB_WorkID.Text;

                    lst = dailyWorkBLL.GetAllDailyWorks(strHQL);
                    dailyWork = (DailyWork)lst[0];

                    strProjectID = dailyWork.ProjectID.ToString();
                    deFinishPercent = NB_FinishPercent.Amount;

                    dailyWork.WorkDate = DateTime.Now;
                    dailyWork.FinishPercent = deFinishPercent;
                    dailyWork.DailySummary = strTodaySummary;
                    dailyWork.ManHour = deManHour;
                    dailyWork.ConfirmManHour = deManHour;
                    dailyWork.Salary = deManHour * deUnitHourSalary;

                    deBonus = ShareClass.GetDailyWorkLogLength(dailyWork.DailySummary) * ShareClass.GetEveryCharPrice() + ShareClass.GetDailyUploadDocNumber(strUserCode, strProjectID) * ShareClass.GetEveryDocPrice();

                    dailyWork.Bonus = deBonus;
                    dailyWork.ConfirmBonus = deBonus;

                    dailyWork.Authority = DL_Authority.SelectedValue.Trim();
                    dailyWork.Address = TB_WorkAddress.Text.Trim();
                    dailyWork.Achievement = TB_Achievement.Text.Trim();
                    dailyWork.RecordTime = DateTime.Now;

                    try
                    {
                        dailyWorkBLL.UpdateDailyWork(dailyWork, int.Parse(LB_WorkID.Text));

                        ShareClass.UpdateProjectCompleteDegree(strProjectID, deFinishPercent);

                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTJCG + "')", true);

                    }
                    catch (Exception err)
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "')", true);
                    }
                }
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('提交失败，'百分比不能为小数，请检查！')", true);
        }
    }


    protected void BtnUP_Click(object sender, EventArgs e)
    {
        if (AttachFile.HasFile)
        {
            string strUserCode = LB_UserCode.Text.Trim();
            string strProjectID = LB_ProjectID.Text.Trim();


            string strFileName1, strExtendName;

            strFileName1 = this.AttachFile.FileName;//获取上传文件的文件名,包括后缀
            strExtendName = System.IO.Path.GetExtension(strFileName1);//获取扩展名

            DateTime dtUploadNow = DateTime.Now; //获取系统时间

            string strFileName2 = System.IO.Path.GetFileName(strFileName1);
            string strExtName = Path.GetExtension(strFileName2);
            string strFileName3 = Path.GetFileNameWithoutExtension(strFileName2) + DateTime.Now.ToString("yyyyMMddHHMMssff") + strExtendName;
            string strDocSavePath = Server.MapPath("Doc") + "\\UserPhoto\\";

            string strPhotoURL = "<p><img src=Doc/UserPhoto/" + strFileName3 + " width=200 height=200 /></p>";

            FileInfo fi = new FileInfo(strDocSavePath + strFileName3);

            if (fi.Exists)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZCZTMWJSCSBGMHZSC + "');</script>");
            }
            else
            {
                try
                {
                    AttachFile.MoveTo(strDocSavePath + strFileName3, Brettle.Web.NeatUpload.MoveToOptions.Overwrite);

                    if (strExtName.ToUpper().IndexOf("JPG|JPEG|PNG|BMP|GIF") >= 0)
                    {
                        //缩小尺寸，便于上传
                        ShareClass.ReducesPic(strDocSavePath, strFileName3, 640, 480, 3);
                    }


                    HT_TodaySummary.Text += strPhotoURL;
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSCSBJC + "');</script>");
                }
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZZYSCDWJ + "');</script>");
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

        if (strStatus == "新建" | strStatus == "评审" | strStatus == "计划" | strStatus == "拒绝")
        {
            strProjectName = project.ProjectName.Trim();

            project.Status = "受理";
            project.StatusValue = "通过";

            try
            {
                projectBLL.UpdateProject(project, int.Parse(strProjectID));

                AddStatusChangeRecord(strProjectID, strOldStatus, strNewStatus, strOldStatusValue, strNewStatusValue);
                LB_Status.Text = strNewStatus;

                TB_Message.Text = strUserName + " 受理了你建立的项目：" + strProjectID + " " + strProjectName;

                LoadProject(strProjectID);
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

                AddStatusChangeRecord(strProjectID, strOldStatus, strNewStatus, strOldStatusValue, strNewStatusValue);
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

                AddStatusChangeRecord(strProjectID, strOldStatus, strNewStatus, strOldStatusValue, strNewStatusValue);
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
