using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class TTGoodsAfterSaleTaskDetail : System.Web.UI.Page
{
    string strMakeManCode, strAssignManCode, strTaskStatus, strRecordStatus;
    string strProjectID, strTaskID, strTaskName, strGoodsSN, strGoodsCode, strGoodsName;
    string strUserCode, strUserName;

    string strLangCode;

    string strIsMobileDevice;

    protected void Page_Load(object sender, EventArgs e)
    {
        strLangCode = Session["LangCode"].ToString();

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        string strID = Request.QueryString["ID"];
        strGoodsSN = Request.QueryString["GoodsSN"];


        string strHQL;
        IList lst;

        string strProjectName;
        string strCreatorCode;

        //CKEditor初始化
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(HE_FinishContent);
        _FileBrowser.SetupCKEditor(HE_Operation);


        strHQL = "from GoodsShipmentDetail as goodsShipmentDetail where goodsShipmentDetail.SN = " + "'" + strGoodsSN + "'";
        GoodsShipmentDetailBLL goodsShipmentDetailBLL = new GoodsShipmentDetailBLL();
        lst = goodsShipmentDetailBLL.GetAllGoodsShipmentDetails(strHQL);
        GoodsShipmentDetail goodsShipmentDetail = (GoodsShipmentDetail)lst[0];
        strGoodsCode = goodsShipmentDetail.GoodsCode.Trim();
        strGoodsName = goodsShipmentDetail.GoodsName.Trim();

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.ID = " + strID;
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        DataList2.DataSource = lst;
        DataList2.DataBind();

        TaskAssignRecord taskAssignRecord = new TaskAssignRecord();
        taskAssignRecord = (TaskAssignRecord)lst[0];
        strTaskID = taskAssignRecord.TaskID.ToString();
        strTaskName = taskAssignRecord.Task.Trim();
        strRecordStatus = taskAssignRecord.Status.Trim();
        strAssignManCode = taskAssignRecord.AssignManCode.Trim();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            if (strIsMobileDevice == "YES")
            {
                HT_FinishContent.Visible = true;
                HT_FinishContent.Text = taskAssignRecord.OperatorContent.Trim();

                HT_Operation.Visible = true; HT_Operation.Toolbar = "";
            }
            else
            {
                HE_FinishContent.Visible = true;
                HE_FinishContent.Text = taskAssignRecord.OperatorContent.Trim();

                 HE_Operation.Visible = true; 
            }

            strHQL = "Select HomeModuleName, PageName || " + "'" + strTaskID + "' as ModulePage  From T_ProModuleLevelForPage Where ParentModule = '任务处理' and LangCode = '" + strLangCode + "' and Visible ='YES' Order By SortNumber ASC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");
            Repeater1.DataSource = ds;
            Repeater1.DataBind();

            DLC_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            TB_Expense.Amount = taskAssignRecord.Expense;
            NB_ManHour.Amount = taskAssignRecord.ManHour;
            NB_FinishPercent.Amount = taskAssignRecord.FinishPercent;

            LB_AssignID.Text = taskAssignRecord.ID.ToString();

            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = ShareClass.GetUserName(strUserCode);

            LB_TaskID.Text = strTaskID;
            LB_Task.Text = strTaskName;
            LB_RouteNumber.Text = taskAssignRecord.RouteNumber.ToString();

            HL_ProjectTaskView.NavigateUrl = "TTProjectTaskView.aspx?TaskID=" + strTaskID;

            strHQL = "from TaskRecordType as taskRecordType order by taskRecordType.SortNumber ASC";
            TaskRecordTypeBLL taskRecordTypeBLL = new TaskRecordTypeBLL();
            lst = taskRecordTypeBLL.GetAllTaskRecordTypes(strHQL);

            DL_RecordType.DataSource = lst;
            DL_RecordType.DataBind();

            strHQL = "from ProjectTask as projectTask where projectTask.TaskID = " + strTaskID; ;
            ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
            lst = projectTaskBLL.GetAllProjectTasks(strHQL);
            ProjectTask projectTask = (ProjectTask)lst[0];
            strProjectID = projectTask.ProjectID.ToString();
            strProjectName = ShareClass.GetProjectName(strProjectID);

            LB_ProjectID.Text = strProjectID;
            LB_TaskID.Text = projectTask.TaskID.ToString();
            strTaskStatus = projectTask.Status.Trim();
            strMakeManCode = projectTask.MakeManCode.Trim();
            strCreatorCode = projectTask.MakeManCode.Trim();
            NB_TaskProgress.Amount = projectTask.FinishPercent;

            string strProjectStatus = ShareClass.GetProjectStatus(strProjectID);
            if (strProjectStatus == "挂起" || strProjectStatus == "取消"  || strProjectStatus == "验收" || strProjectStatus == "结案" || strProjectStatus == "归档")
            {
                BT_Activity.Enabled = false;

                BT_Finish.Enabled = false;
                BT_TBD.Enabled = false;
                BT_Assign.Enabled = false;
                HL_Expense.Enabled = false;

                Repeater1.Visible = false;
            }

            if (strUserCode == strCreatorCode)
            {
                BT_CloseTask.Enabled = true;
                BT_ActiveTask.Enabled = true;
            }

            ShareClass.LoadMemberByUserCodeForDropDownList(strUserCode, DL_OperatorCode);

            LoadChildRecord(strID);

            ShareClass.LoadTaskWorkRequest(DL_WorkRequest);

            HL_Expense.NavigateUrl = "TTProExpense.aspx?ProjectID=" + strProjectID + "&TaskID=" + strTaskID + "&RecordID=" + strID;

            HL_RelatedGoods.Text = strGoodsSN + " " + strGoodsName;
            HL_RelatedGoods.NavigateUrl = "TTGoodsInforView.aspx?GoodsCode=" + strGoodsCode;

            HL_TaskReview.Enabled = true;
            HL_TaskReview.NavigateUrl = "TTProjectTaskReviewWL.aspx?TaskID=" + projectTask.TaskID.ToString();

            HL_MakeProjectReq.NavigateUrl = "TTMakeProjectRequirement.aspx?ProjectID=" + strProjectID;

            //BusinessForm，如果不含业务表单，就隐藏“相关表单按钮”
            if (ShareClass.getRelatedBusinessFormTemName("TaskRecord", strID) == "")
            {
                BT_StartupBusinessForm.Visible = false;
            }
        }
    }

    protected void BT_Approve_Click(object sender, EventArgs e)
    {
        string strHQL, strContent;
        string strID, strTaskID;
        int intFinishPercent;

        strTaskID = LB_TaskID.Text.Trim();

        if (strIsMobileDevice == "YES")
        {
            strContent = HT_FinishContent.Text.Trim();
        }
        else
        {
            strContent = HE_FinishContent.Text.Trim();
        }
        intFinishPercent = int.Parse(NB_FinishPercent.Amount.ToString());

        if (strContent == "")
        {
            strContent = "受理";
            if (strIsMobileDevice == "YES")
            {
                HT_FinishContent.Text = strContent;
            }
            else
            {
                HE_FinishContent.Text = strContent;
            }
        }

        strID = LB_AssignID.Text.Trim();
        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.ID = " + strID;
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        TaskAssignRecord taskAssignRecord = (TaskAssignRecord)lst[0];

        taskAssignRecord.OperatorContent = strContent;
        taskAssignRecord.Status = "受理";
        taskAssignRecord.FinishPercent = intFinishPercent;
        taskAssignRecord.MakeDate = DateTime.Now;


        try
        {
            taskAssignRecordBLL.UpdateTaskAssignRecord(taskAssignRecord, int.Parse(strID));
            LoadAssignRecord(strID);


            TB_Message.Text = strUserName + " 受理了你的任务： " + strTaskID + " " + strTaskName;
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSLSBJC + "')", true);
        }
    }

    protected void BT_Refuse_Click(object sender, EventArgs e)
    {
        string strHQL, strContent;
        string strID, strTaskID;
        string strUserCode;
        int intFinishPercent;

        strUserCode = LB_UserCode.Text.Trim();

        strTaskID = LB_TaskID.Text.Trim();
        if (strIsMobileDevice == "YES")
        {
            strContent = HT_FinishContent.Text.Trim();
        }
        else
        {
            strContent = HE_FinishContent.Text.Trim();
        }
        intFinishPercent = int.Parse(NB_FinishPercent.Amount.ToString());

        if (strContent == "")
        {
            strContent = "拒绝";

            if (strIsMobileDevice == "YES")
            {
                HT_FinishContent.Text = strContent;
            }
            else
            {
                HE_FinishContent.Text = strContent;
            }
        }

        strID = LB_AssignID.Text.Trim();
        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.ID = " + strID;
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        TaskAssignRecord taskAssignRecord = (TaskAssignRecord)lst[0];
        taskAssignRecord.OperatorContent = HE_FinishContent.Text.Trim();
        taskAssignRecord.Status = "拒绝";
        taskAssignRecord.FinishPercent = intFinishPercent;
        taskAssignRecord.MakeDate = DateTime.Now;


        try
        {
            taskAssignRecordBLL.UpdateTaskAssignRecord(taskAssignRecord, int.Parse(strID));
            LoadAssignRecord(strID);


            TB_Message.Text = strUserName + " 拒绝了你的任务： " + strTaskID + " " + strTaskName;

        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJJSBJC + "')", true);
        }
    }


    protected void DLC_BeginDate_TextChanged(object sender, EventArgs e)
    {
        string strHQL1;

        int intTaskID;
        DateTime dtBeginDate, dtEndDate;
        string strUserCode;

        strUserCode = LB_UserCode.Text.Trim();
        intTaskID = int.Parse(LB_TaskID.Text.Trim());
        dtBeginDate = DateTime.Parse(DLC_BeginDate.Text);
        dtEndDate = DateTime.Parse(DLC_EndDate.Text);

        strHQL1 = "Select *  From V_ProjectMember_WorkLoadSchedule";
        strHQL1 += " Where UserCode = " + "'" + strUserCode + "'";
        strHQL1 += " and ((to_char(BeginDate,'yyyymmdd') >= to_char(cast('" + DLC_BeginDate.Text + "' as timestamp) ,'yyyymmdd') and to_char(BeginDate,'yyyymmdd') <= to_char( cast('" + DLC_EndDate.Text + "' as timestamp),'yyyymmdd'))";
        strHQL1 += " or (to_char(EndDate,'yyyymmdd') >= to_char(cast('" + DLC_BeginDate.Text + "' as timestamp),'yyyymmdd') and to_char(EndDate,'yyyymmdd') <= to_char(cast('" + DLC_EndDate.Text + "' as timestamp),'yyyymmdd'))";
        strHQL1 += " or (to_char(BeginDate,'yyyymmdd') <= to_char(cast('" + DLC_BeginDate.Text + "' as timestamp),'yyyymmdd') and to_char(EndDate,'yyyymmdd') >= to_char(cast('" + DLC_EndDate.Text + "' as timestamp),'yyyymmdd')))";
        strHQL1 += " and Type ='任务' and ProjectID <> " + strTaskID;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL1, "V_ProjectMember_WorkLoadSchedule");

        if (ds.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click111", "alert('" + Resources.lang.ZZTSCCYZCSJDYQTRWJX + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DLC_EndDate_TextChanged(object sender, EventArgs e)
    {
        string strHQL1;

        int intTaskID;
        DateTime dtBeginDate, dtEndDate;
        string strUserCode;

        strUserCode = LB_UserCode.Text.Trim();
        intTaskID = int.Parse(LB_TaskID.Text.Trim());
        dtBeginDate = DateTime.Parse(DLC_BeginDate.Text);
        dtEndDate = DateTime.Parse(DLC_EndDate.Text);

        strHQL1 = "Select *  From V_ProjectMember_WorkLoadSchedule";
        strHQL1 += " Where UserCode = " + "'" + strUserCode + "'";
        strHQL1 += " and ((to_char(BeginDate,'yyyymmdd') >= to_char(cast('" + DLC_BeginDate.Text + "' as timestamp) ,'yyyymmdd') and to_char(BeginDate,'yyyymmdd') <= to_char( cast('" + DLC_EndDate.Text + "' as timestamp),'yyyymmdd'))";
        strHQL1 += " or (to_char(EndDate,'yyyymmdd') >= to_char(cast('" + DLC_BeginDate.Text + "' as timestamp),'yyyymmdd') and to_char(EndDate,'yyyymmdd') <= to_char(cast('" + DLC_EndDate.Text + "' as timestamp),'yyyymmdd'))";
        strHQL1 += " or (to_char(BeginDate,'yyyymmdd') <= to_char(cast('" + DLC_BeginDate.Text + "' as timestamp),'yyyymmdd') and to_char(EndDate,'yyyymmdd') >= to_char(cast('" + DLC_EndDate.Text + "' as timestamp),'yyyymmdd')))";
        strHQL1 += " and Type ='任务' and ProjectID <> " + strTaskID;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL1, "V_ProjectMember_WorkLoadSchedule");

        if (ds.Tables[0].Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click111", "alert('" + Resources.lang.ZZTSCCYZCSJDYQTRWJX + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_Assign_Click(object sender, EventArgs e)
    {
        int intTaskID, intPriorID;
        string strTask, strOperatorCode, strOperatorName, strAssignManCode, strAssignManName;
        string strOperation, strType;
        string strRouteNumber;
        DateTime dtBeginDate, dtEndDate, dtMakeDate;
        string strUserCode;

        strUserCode = LB_UserCode.Text.Trim();

        intTaskID = int.Parse(LB_TaskID.Text.Trim());
        strType = DL_RecordType.SelectedValue.Trim();
        strTask = LB_Task.Text.Trim();
        strOperatorCode = DL_OperatorCode.SelectedValue;
        strOperatorName = ShareClass.GetUserName(strOperatorCode);
        strAssignManCode = LB_UserCode.Text.Trim();
        strAssignManName = LB_UserName.Text.Trim();

        if (strIsMobileDevice == "YES")
        {
            strOperation = HT_Operation.Text.Trim();
        }
        else
        {
            strOperation = HE_Operation.Text.Trim();
        }

        intPriorID = int.Parse(LB_AssignID.Text.Trim());
        dtBeginDate = DateTime.Parse(DLC_BeginDate.Text);
        dtEndDate = DateTime.Parse(DLC_EndDate.Text);
        dtMakeDate = DateTime.Now;
        strRouteNumber = LB_RouteNumber.Text.Trim();

        if (strOperation == "" | strOperatorCode == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPSBGZYHSLRBNWKJC + "')", true);
            return;
        }

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        TaskAssignRecord taskAssignRecord = new TaskAssignRecord();

        taskAssignRecord.TaskID = intTaskID;
        taskAssignRecord.Type = strType;
        taskAssignRecord.Task = strTask;
        taskAssignRecord.OperatorCode = strOperatorCode;
        taskAssignRecord.OperatorName = strOperatorName;
        taskAssignRecord.OperationTime = DateTime.Now;
        taskAssignRecord.OperatorContent = " ";
        taskAssignRecord.BeginDate = dtBeginDate;
        taskAssignRecord.EndDate = dtEndDate;
        taskAssignRecord.AssignManCode = strAssignManCode;
        taskAssignRecord.AssignManName = strAssignManName;
        taskAssignRecord.Content = "";
        taskAssignRecord.Operation = strOperation;
        taskAssignRecord.PriorID = intPriorID;
        taskAssignRecord.RouteNumber = int.Parse(strRouteNumber);
        taskAssignRecord.MakeDate = dtMakeDate;
        taskAssignRecord.Status = "待处理";

        taskAssignRecord.FinishedNumber = 0;
        taskAssignRecord.UnitName = "";
        taskAssignRecord.MoveTime = DateTime.Now;

        try
        {
            taskAssignRecordBLL.AddTaskAssignRecord(taskAssignRecord);
            string strAssignID = ShareClass.GetMyCreatedMaxTaskAssignRecordID(intTaskID.ToString(), strUserCode);

            //更改前分派记录状态
            updateTaskAssignRecordStatus(intPriorID, "已分派");

            //BusinessForm,处理关联的业务表单数据
            ShareClass.InsertOrUpdateTaskAssignRecordWFXMLData("TaskRecord", intPriorID.ToString(), "TaskRecord", strAssignID, strUserCode);

            LoadAssignRecord(LB_AssignID.Text);
            LoadChildRecord(intPriorID.ToString());

            ShareClass.SendInstantMessage(Resources.lang.RenWuFenPaiTongZhi, ShareClass.GetUserName(strUserCode) + Resources.lang.GeiNiFenPaiLeRenWu + " :" + intTaskID.ToString() + "  " + strTask + "，" + Resources.lang.QingJiShiChuLi, strUserCode, strOperatorCode);

            TB_AssignMessage.Text = ShareClass.GetUserName(strUserCode) + Resources.lang.GeiNiFenPaiLeRenWu + " :" + intTaskID.ToString() + "  " + "，" + Resources.lang.QingJiShiChuLi;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPSBJC + "')", true);
        }
    }

    //更改任务分派记录状态
    protected void updateTaskAssignRecordStatus(int intAssignID, string strStatus)
    {
        string strHQL;

        strHQL = string.Format(@"Update T_TaskAssignRecord Set Status = '{0}',MoveTime = now()  Where ID = {1}", strStatus, intAssignID);
        ShareClass.RunSqlCommand(strHQL);
    }

    //BusinessForm,启动关联的业务表单
    protected void BT_StartupBusinessForm_Click(object sender, EventArgs e)
    {
        string strURL;
        string strTaskRedordID = LB_AssignID.Text;

        string strTemName, strIdentifyString;

        strTemName = ShareClass.getRelatedBusinessFormTemName("TaskRecord", strTaskRedordID);
        strIdentifyString = ShareClass.GetWLTemplateIdentifyString(strTemName);
        if (strTemName != "")
        {
            strURL = "popShowByURL(" + "'TTRelatedDIYBusinessForm.aspx?RelatedType=TaskRecord&RelatedID=" + strTaskRedordID + "&IdentifyString=" + strIdentifyString + "','" + Resources.lang.XiangGuanYeWuDan + "', 800, 600,window.location);";
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop12", strURL, true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    protected void BT_Activity_Click(object sender, EventArgs e)
    {
        string strHQL, strContent;
        string strID, strTaskID;
        string strUserCode;
        int intFinishPercent;

        strUserCode = LB_UserCode.Text.Trim();

        strProjectID = LB_ProjectID.Text.Trim();
        strTaskID = LB_TaskID.Text.Trim();

        if (strIsMobileDevice == "YES")
        {
            strContent = HT_FinishContent.Text.Trim();
        }
        else
        {
            strContent = HE_FinishContent.Text.Trim();
        }


        intFinishPercent = int.Parse(NB_FinishPercent.Amount.ToString());

        Msg msg = new Msg();

        if (strContent == "")
        {
            strContent = "处理中";

            if (strIsMobileDevice == "YES")
            {
                HT_FinishContent.Text = strContent;
            }
            else
            {
                HE_FinishContent.Text = strContent;
            }
        }

        strID = LB_AssignID.Text.Trim();
        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.ID = " + strID;
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        TaskAssignRecord taskAssignRecord = (TaskAssignRecord)lst[0];

        taskAssignRecord.OperatorContent = strContent;
        taskAssignRecord.Status = "处理中";

        taskAssignRecord.ManHour = NB_ManHour.Amount;
        taskAssignRecord.FinishPercent = intFinishPercent;
        taskAssignRecord.MakeDate = DateTime.Now;


        try
        {
            taskAssignRecordBLL.UpdateTaskAssignRecord(taskAssignRecord, int.Parse(strID));
            LoadAssignRecord(strID);
            ShareClass.UpdateTaskExpenseManHourSummary(strTaskID);

            //当更改任务进度
            NB_TaskProgress.Amount = ShareClass.UpdateTaskProgress(strTaskID);

            ShareClass.UpdateDailyWork(strUserCode, strProjectID, "Task", strTaskID, strContent);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

            TB_Message.Text = strUserName + " 正在处理你的任务： " + strTaskID + " " + strTaskName;

        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_Finish_Click(object sender, EventArgs e)
    {
        string strHQL, strContent;
        string strID, strTaskID;
        string strUserCode;
        int intFinishPercent;

        strUserCode = LB_UserCode.Text.Trim();

        strProjectID = LB_ProjectID.Text.Trim();
        strTaskID = LB_TaskID.Text.Trim();
        if (strIsMobileDevice == "YES")
        {
            strContent = HT_FinishContent.Text.Trim();
        }
        else
        {
            strContent = HE_FinishContent.Text.Trim();
        }
        intFinishPercent = int.Parse(NB_FinishPercent.Amount.ToString());

        Msg msg = new Msg();

        if (strContent == "")
        {
            strContent = "完成";

            if (strIsMobileDevice == "YES")
            {
                HT_FinishContent.Text = strContent;
            }
            else
            {
                HE_FinishContent.Text = strContent;
            }
        }

        strID = LB_AssignID.Text.Trim();
        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.ID = " + strID;
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        TaskAssignRecord taskAssignRecord = (TaskAssignRecord)lst[0];

        taskAssignRecord.OperatorContent = strContent;
        taskAssignRecord.Status = "完成";

        taskAssignRecord.ManHour = NB_ManHour.Amount;
        taskAssignRecord.FinishPercent = intFinishPercent;
        taskAssignRecord.MakeDate = DateTime.Now;


        try
        {
            taskAssignRecordBLL.UpdateTaskAssignRecord(taskAssignRecord, int.Parse(strID));

            LoadAssignRecord(strID);
            ShareClass.UpdateTaskExpenseManHourSummary(strTaskID);

            //当更改任务进度
            NB_TaskProgress.Amount = ShareClass.UpdateTaskProgress(strTaskID);

            ShareClass.UpdateDailyWork(strUserCode, strProjectID, "Task", strTaskID, strContent);

            TB_Message.Text = strUserName + " 完成了你的任务： " + strTaskID + " " + strTaskName;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZWCCGNRYTJDDTXMRZDXMCLYMZL + "')", true);

        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZWCSBJC + "')", true);
        }
    }

 

    protected void BT_TBD_Click(object sender, EventArgs e)
    {
        string strHQL, strContent;
        string strID, strTaskID;

        strProjectID = LB_ProjectID.Text.Trim();
        strTaskID = LB_TaskID.Text.Trim();

        if (strIsMobileDevice == "YES")
        {
            strContent = HT_FinishContent.Text.Trim();
        }
        else
        {
            strContent = HE_FinishContent.Text.Trim();
        }

        if (strContent == "")
        {
            strContent = "挂起";

            if (strIsMobileDevice == "YES")
            {
                HT_FinishContent.Text = strContent;
            }
            else
            {
                HE_FinishContent.Text = strContent;
            }
        }

        strID = LB_AssignID.Text.Trim();
        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.ID = " + strID;
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        TaskAssignRecord taskAssignRecord = (TaskAssignRecord)lst[0];
        taskAssignRecord.OperatorContent = strContent;
        taskAssignRecord.Status = "挂起";


        try
        {
            taskAssignRecordBLL.UpdateTaskAssignRecord(taskAssignRecord, int.Parse(strID));
            LoadAssignRecord(strID);


            TB_Message.Text = strUserName + " 挂起了你的任务： " + strTaskID + " " + strTaskName;

        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGSBJC + "')", true);
        }
    }

    protected void BT_CloseTask_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectTask as projectTask where projectTask.TaskID = " + strTaskID;
        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        lst = projectTaskBLL.GetAllProjectTasks(strHQL);

        ProjectTask projectTask = (ProjectTask)lst[0];

        projectTask.Status = "关闭";


        try
        {
            projectTaskBLL.UpdateProjectTask(projectTask, int.Parse(strTaskID));
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZRWGBCG + "')", true);

            BT_Finish.Enabled = false;
            BT_TBD.Enabled = false;
            BT_Assign.Enabled = false;
            HL_Expense.Enabled = false;
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZRWGBSBJC + "')", true);
        }
    }

    protected void BT_ActiveTask_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectTask as projectTask where projectTask.TaskID = " + strTaskID;
        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        lst = projectTaskBLL.GetAllProjectTasks(strHQL);

        ProjectTask projectTask = (ProjectTask)lst[0];

        projectTask.Status = "处理中";

        try
        {
            projectTaskBLL.UpdateProjectTask(projectTask, int.Parse(strTaskID));
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZRWJHCG + "')", true);

            BT_Finish.Enabled = true;
            BT_TBD.Enabled = true;
            BT_Assign.Enabled = true;
            HL_Expense.Enabled = true;
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZRWJHSBJC + "')", true);
        }
    }

    protected void BT_Send_Click(object sender, EventArgs e)
    {
        string strSubject, strMsg;

        Msg msg = new Msg();

        if (CB_ReturnMsg.Checked == true | CB_ReturnMail.Checked == true)
        {
            strSubject = Resources.lang.ZZRWCLQKFK;
            strMsg = TB_Message.Text.Trim();

            if (CB_ReturnMsg.Checked == true)
            {
                msg.SendMSM("Message",strAssignManCode, strMsg, strUserCode);
            }

            if (CB_ReturnMail.Checked == true)
            {
                msg.SendMail(strAssignManCode, strSubject, strMsg, strUserCode);
            }
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFSWB + "')", true);
    }

    protected void BT_SendAssignMsg_Click(object sender, EventArgs e)
    {
        string strSubject, strMsg, strOperatorCode;

        strOperatorCode = DL_OperatorCode.SelectedValue;

        Msg msg = new Msg();

        if (CB_SendMsg.Checked == true | CB_SendMail.Checked == true)
        {
            strSubject = Resources.lang.RenWuFenPaiTongZhi;
            strMsg = TB_AssignMessage.Text.Trim();

            if (CB_SendMsg.Checked == true)
            {
                msg.SendMSM("Message",strOperatorCode, strMsg, strUserCode);
            }

            if (CB_SendMail.Checked == true)
            {
                msg.SendMail(strOperatorCode, strSubject, strMsg, strUserCode);
            }
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFSWB + "')", true);
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strID = e.Item.Cells[0].Text;
            IList lst;
            string strHQL, strProjectStatus;

            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.ID = " + strID;
            TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
            TaskAssignRecord taskAssignRecord = new TaskAssignRecord();
            lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

            taskAssignRecord = (TaskAssignRecord)lst[0];

            LB_ID.Text = taskAssignRecord.ID.ToString();

            DL_OperatorCode.SelectedValue = taskAssignRecord.OperatorCode;
            DL_RecordType.SelectedValue = taskAssignRecord.Type;

            HE_Operation.Text = taskAssignRecord.Operation.Trim();
            DLC_BeginDate.Text = taskAssignRecord.BeginDate.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = taskAssignRecord.EndDate.ToString("yyyy-MM-dd");

            if (strTaskStatus == "关闭")
            {
                BT_UpdateAssign.Enabled = false;
                BT_DeleteAssign.Enabled = false;
            }
            else
            {
                BT_UpdateAssign.Enabled = true;
                BT_DeleteAssign.Enabled = true;
            }

            strProjectID = LB_ProjectID.Text.Trim();
            strProjectStatus = ShareClass.GetProjectStatus(strProjectID);
            if (strProjectStatus == "挂起" || strProjectStatus == "取消")
            {
                BT_UpdateAssign.Enabled = false;
                BT_DeleteAssign.Enabled = false;
                BT_Assign.Enabled = false;
            }
        }
    }

    protected void LoadAssignRecord(string strID)
    {
        string strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.ID = " + strID;
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void LoadChildRecord(string strPriorID)
    {
        string strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.PriorID = " + strPriorID;
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void BT_UpdateAssign_Click(object sender, EventArgs e)
    {
        string strHQL, strID;
        IList lst;

        strID = LB_ID.Text.Trim();

        string strPriorID = LB_AssignID.Text.Trim();

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.ID = " + strID;
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        TaskAssignRecord taskAssignRecord = new TaskAssignRecord();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        taskAssignRecord = (TaskAssignRecord)lst[0];

        taskAssignRecord.Type = DL_RecordType.SelectedValue.Trim();
        taskAssignRecord.OperatorContent = "";

        if (strIsMobileDevice == "YES")
        {
            taskAssignRecord.Operation = HT_Operation.Text.Trim();
        }
        else
        {
            taskAssignRecord.Operation = HE_Operation.Text.Trim();
        }
        taskAssignRecord.OperatorCode = DL_OperatorCode.SelectedValue;
        taskAssignRecord.OperatorName = DL_OperatorCode.SelectedItem.Text;
        taskAssignRecord.BeginDate = DateTime.Parse(DLC_BeginDate.Text);
        taskAssignRecord.EndDate = DateTime.Parse(DLC_EndDate.Text);

        try
        {
            taskAssignRecordBLL.UpdateTaskAssignRecord(taskAssignRecord, int.Parse(strID));
            LoadChildRecord(strPriorID);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_DeleteAssign_Click(object sender, EventArgs e)
    {
        string strHQL, strID;
        IList lst;

        string strPriorID = LB_AssignID.Text.Trim();

        strID = LB_ID.Text.Trim();

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.ID = " + strID;
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        TaskAssignRecord taskAssignRecord = new TaskAssignRecord();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL); taskAssignRecord = (TaskAssignRecord)lst[0];

        try
        {
            taskAssignRecordBLL.DeleteTaskAssignRecord(taskAssignRecord);
            LoadChildRecord(strPriorID);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }
    }

    protected void DL_WorkRequest_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strWorkRequest = DL_WorkRequest.SelectedValue.Trim();

        if (strIsMobileDevice == "YES")
        {
            HT_Operation.Text = strWorkRequest;
        }
        else
        {
            HE_Operation.Text = strWorkRequest;
        }
    }

    protected void UpdateTaskStatus(string strTaskID, decimal deExpenseSum)
    {
        string strHQL = "from ProjectTask as projectTask where projectTask.TaskID = " + strTaskID;
        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        IList lst = projectTaskBLL.GetAllProjectTasks(strHQL);

        ProjectTask projectTask = (ProjectTask)lst[0];

        projectTask.Expense = deExpenseSum;

        projectTaskBLL.UpdateProjectTask(projectTask, projectTask.TaskID);
    }

    protected string GetProjectStatus(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        string strStatus = project.Status.Trim();

        return strStatus;
    }

}
