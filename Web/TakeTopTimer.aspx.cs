using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TakeTopWF;

public partial class TakeTopTimer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            DateTime dtLastPushTime = ShareClass.systemStartupTime;

            LB_RefresTime.Text = dtLastPushTime.ToString("yyyyMMddHHmmssffff");

            TimeSpan ts = dtLastPushTime.Subtract(DateTime.Now).Duration();

            try
            {
                //初始化实体类，以加快后续的操作速度
                ShareClass.InitialNhibernateEntryClass();
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }

            try
            {
                //处理超时时，自动批准工作流
                AutoAgreeWorkflow();
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }

            if (DateTime.Now.Hour > 7 & DateTime.Now.Hour < 19)
            {
                try
                {
                    ////推送系统信息
                    SendUNSendMessage();
                }
                catch (Exception err)
                {
                    LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
                }
            }

            try
            {
                //插入日志
                string strHQL = "Insert Into T_MsgPushLog(PushTime,UserCode,UserName) Values(now(),'Timer','Timer')";
                ShareClass.RunSqlCommand(strHQL);
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }

            try
            {
                //备份系统数据
                BackupSystemData();
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }

            ShareClass.systemStartupTime = DateTime.Now;

            LB_RefresTime.Text = DateTime.Now.ToString("yyyyMMddHHmmssffff");
            LB_Timer.Text = ShareClass.GetCurrentSiteRootPath() + "TakeTopTimer.aspx";
        }
    }

    //自动批准工作流
    private void AutoAgreeWorkflow()
    {
        string strHQL;
        DataSet ds;
        int i;

        string strTemName, strWLType, strWLID, strWFName, strStatus, strContent, strStepID, strStepName, strID, strRelatedType, strRelatedID, strOperatorCode, strOperatorName, strSignDate;
        string strTStepID, strCreatorCode;

        WFDetailHandle wFDetailHandle = new WFDetailHandle();

        strHQL = @"Select A.ID,A.StepID,B.StepName,A.WorkDetail,C.CreatorCode,C.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || C.WLName as WLName,C.Status,D.StepID TStepID, D.SortNumber,C.CreatorCode,A.OperatorCode,A.OperatorName From T_WorkFlowStepDetail A,T_WorkflowStep B,T_WorkFlow C,T_WorkflowTStep D,T_WorkFlowTemplate E
             Where A.WLID = B.WLID and B.WLID = C.WLID and B.SortNumber = D.SortNumber and C.TemName = D.TemName and D.TemName = E.TemName And A.Status In ('处理中','审核中','会签中','复核中') And C.Status Not In ('修改中','关闭','通过','结案')
             and ((E.OverTimeAutoAgree = 'YES'
             and (round(date_part('epoch', now() - A.checkingtime))::NUMERIC / 3600) > E.OverTimeHourNumber)
             Or (D.OverTimeAutoAgree = 'YES'
             and (round(date_part('epoch', now() - A.checkingtime))::NUMERIC / 3600) > D.OverTimeHourNumber))
             and A.IsOperator = 'YES'
             Order By A.StepID DESC";

        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            strWLID = ds.Tables[0].Rows[i]["WLID"].ToString();
            strTemName = ShareClass.GetWorkflowTemNameByWLID(strWLID);
            strWLType = ShareClass.GetWorkFlowType(strWLID);
            strWFName = ShareClass.GetWorkFlowName(strWLID);
            strStatus = ds.Tables[0].Rows[i]["Status"].ToString().Trim();
            strContent = "同意完成通过";
            strStepID = ds.Tables[0].Rows[i]["StepID"].ToString();
            strStepName = ds.Tables[0].Rows[i]["StepName"].ToString();
            strID = ds.Tables[0].Rows[i]["ID"].ToString();

            strRelatedType = ShareClass.GetWorkFlowRelatedType(strWLID);
            strRelatedID = ShareClass.GetWorkFlowRelatedID(strWLID);

            strOperatorCode = ds.Tables[0].Rows[i]["OperatorCode"].ToString();
            strOperatorName = ds.Tables[0].Rows[i]["OperatorName"].ToString();

            strSignDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            strTStepID = ds.Tables[0].Rows[i]["TStepID"].ToString();

            strCreatorCode = ds.Tables[0].Rows[i]["CreatorCode"].ToString();


            try
            {
                int intResult = wFDetailHandle.AgreeWFByAuto(strTemName, strWLType, strWLID, strWFName, strStatus, strContent, strStepID, strID, strRelatedID, strOperatorCode, strSignDate);

                if (intResult >= 0)
                {
                    //添加签名域
                    WFDataHandle wfDataHandle = new WFDataHandle();
                    wfDataHandle.AddUserSignPictureField(strWLID, strID, strSignDate,strOperatorCode);

                    if (intResult == 11)
                    {
                        //更改相关业务对象的状态值
                        UpdateRelatedBusinessStatus(strWLType, strRelatedID, "Agree");
                    }

                    try
                    {
                        new System.Threading.Thread(delegate ()
                        {
                            try
                            {
                                //发送信息通知申请者
                                Msg msg = new Msg();
                                msg.SendMSM("Message", strCreatorCode, strOperatorCode + strOperatorName + Resources.lang.YiJing + Resources.lang.CaoShi + Resources.lang.ZiDong + Resources.lang.PiZhun + Resources.lang.GongZuoLiuShenQing + " : " + strWLID + strWFName + "," + Resources.lang.BuZhou + ": " + strStepID + strStepName, strOperatorCode);
                            }
                            catch
                            {
                            }
                        }).Start();
                    }
                    catch
                    {
                    }

                    try
                    {
                        //发送消息给额外的人员
                        new System.Threading.Thread(delegate ()
                        {
                            try
                            {
                                Msg msg = new Msg();
                                msg.SendMsgToOtherMemberForWorkflow(strOperatorCode, strTemName, strTStepID, strWLID, strWFName, strStepID, strStepName, "AgreeNotice", Resources.lang.CaoShi + Resources.lang.ZiDong + Resources.lang.PiZhun);
                            }
                            catch
                            {

                            }
                        }).Start();
                    }
                    catch
                    {
                    }


                    try
                    {
                        //如流程是项目计划发起的，更新关联项目计划完成程度
                        if (strRelatedType == "计划" & strRelatedID != "0")
                        {
                            //更改关联的计划进度
                            if (ShareClass.GetPlanProgressNeedPlanerConfirmByProject(ShareClass.GetProjectIDByPlanID(strRelatedID)) == "NO")
                            {
                                ShareClass.UpdateProjectPlanSchedule(strRelatedType, strRelatedID);
                            }
                        }

                        //如果流程是由项目或项目计划发起的，那么增加项目日志到项目中
                        if (strContent == "")
                        {
                            strContent = "Approve workflow：" + strWLID + strWFName;
                        }
                        ShareClass.UpdateProjectDaiyWorkByWorkflow(strRelatedType, strRelatedID, strWLID, strContent, strOperatorCode);
                    }
                    catch (Exception err)
                    {
                        //LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
                    }
                }
                else
                {
                }

                try
                {
                    //更新处理流程花费的工时
                    ShareClass.UpdateWorkFlowManHour(strRelatedType, strRelatedID, strWLID, strID, 0);
                    //更新处理流程花费的费用
                    ShareClass.UpdateWorkFlowExpense(strRelatedType, strRelatedID, strWLID, strID);
                }
                catch (Exception err)
                {
                    //LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
                }

            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }
        }
    }

    //更改流程相关对象状态
    public bool UpdateRelatedBusinessStatus(string strWFType, string strRelatedID, string strOperation)
    {
        string strHQL;

        try
        {
            if (strOperation == "Agree")
            {
                if (strWFType == "客服评审")
                {
                    strHQL = "Update T_CustomerQuestion Set Status = '完成' Where ID = " + strRelatedID;
                    WFShareClass.RunSqlCommand(strHQL);
                }

                if (strWFType == "车辆申请")
                {
                    strHQL = "Update T_CarApplyForm Set Status = '通过' Where ID  = " + strRelatedID;
                    WFShareClass.RunSqlCommand(strHQL);
                }

                if (strWFType == "会议申请")
                {
                    strHQL = "Update T_Meeting Set Status = '通过' Where ID = " + strRelatedID;
                    WFShareClass.RunSqlCommand(strHQL);
                }

                if (strWFType == "费用申请")
                {
                    strHQL = "Update T_ExpenseApplyWL Set Status = '通过' Where ID = " + strRelatedID;
                    WFShareClass.RunSqlCommand(strHQL);
                }

                if (strWFType == "费用报销")
                {
                    strHQL = "Update T_ExpenseClaim Set Status = '通过' Where ID = " + strRelatedID;
                    WFShareClass.RunSqlCommand(strHQL);
                }
            }

            if (strOperation == "Cancel")
            {
                if (strWFType == "客服评审")
                {
                    strHQL = "Update T_CustomerQuestion Set Status = '处理中' Where ID = " + strRelatedID;
                    WFShareClass.RunSqlCommand(strHQL);
                }

                if (strWFType == "车辆申请")
                {
                    strHQL = "Update T_CarApplyForm Set Status = '处理中' Where ID  = " + strRelatedID;
                    WFShareClass.RunSqlCommand(strHQL);
                }

                if (strWFType == "会议申请")
                {
                    strHQL = "Update T_Meeting Set Status = '处理中' Where ID = " + strRelatedID;
                    WFShareClass.RunSqlCommand(strHQL);
                }

                if (strWFType == "费用申请")
                {
                    strHQL = "Update T_ExpenseApplyWL Set Status = '处理中' Where ID = " + strRelatedID;
                    WFShareClass.RunSqlCommand(strHQL);
                }

                if (strWFType == "费用报销")
                {
                    strHQL = "Update T_ExpenseClaim Set Status = '处理中' Where ID = " + strRelatedID;
                    WFShareClass.RunSqlCommand(strHQL);
                }
            }

            return true;
        }
        catch
        {
            return false;
        }
    }

    private void BackupSystemData()
    {
        //需要的操作写在这个方法中
        try
        {
            string strCurrentTime, strDBBackupDataTime, strDocBackupDataTime;
            string strWeekDay = Convert.ToInt32(DateTime.Now.DayOfWeek).ToString();

            strCurrentTime = DateTime.Now.Hour.ToString();
            strDBBackupDataTime = GetDBBackupDataTime();
            if (strDBBackupDataTime == DateTime.Now.ToString("yyyyMMdd") & strCurrentTime == "2")
            {
                //自动备份系统数据库数据
                AutoBackupDBDataBySystem();
            }

            strDocBackupDataTime = GetDocBackupDataTime();
            if (strDocBackupDataTime == DateTime.Now.ToString("yyyyMMdd") & strCurrentTime == "2")
            {
                //自动备份系统文档数据
                AutoBackupDocDataBySystem();
            }

        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }

    //取得数据库合理备份日期
    protected string GetDBBackupDataTime()
    {
        string strHQL1, strBackDBHQL;
        string strBackPeriodDay;

        strBackDBHQL = "select BackPeriodDay from T_BackDBPrame";
        DataSet ds = ShareClass.GetDataSetFromSql(strBackDBHQL, "strBackDBHQL");
        if (ds.Tables[0].Rows.Count > 0)
        {
            strBackPeriodDay = ds.Tables[0].Rows[0][0].ToString();

            strHQL1 = "Select to_char( Max(BackTime)+" + strBackPeriodDay + " * interval '1 day','yyyymmdd') From T_BackDBLog";
            DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL1, "T_BackDBLog");
            if (ds1.Tables[0].Rows.Count > 0)
            {
                if (ds1.Tables[0].Rows[0][0].ToString() != "")
                {
                    return ds1.Tables[0].Rows[0][0].ToString();
                }
                else
                {
                    return DateTime.Now.ToString("yyyyMMdd");
                }
            }
            else
            {
                return DateTime.Now.ToString("yyyyMMdd");
            }
        }
        else
        {
            return "00000000";
        }
    }

    //取得文档合理备份日期
    protected string GetDocBackupDataTime()
    {
        string strHQL1, strBackDocHQL;
        string strBackPeriodDay;

        strBackDocHQL = "select BackPeriodDay from T_BackDocPrame";
        DataSet ds = ShareClass.GetDataSetFromSql(strBackDocHQL, "strBackDocHQL");
        if (ds.Tables[0].Rows.Count > 0)
        {
            strBackPeriodDay = ds.Tables[0].Rows[0][0].ToString();

            strHQL1 = "Select to_char(Max(BackTime) + " + strBackPeriodDay + " * interval '1 day', 'yyyymmdd') From T_BackDocLog";
            DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL1, "T_BackocBLog");
            if (ds1.Tables[0].Rows.Count > 0)
            {
                if (ds1.Tables[0].Rows[0][0].ToString() != "")
                {
                    return ds1.Tables[0].Rows[0][0].ToString();
                }
                else
                {
                    return DateTime.Now.ToString("yyyyMMdd");
                }
            }
            else
            {
                return DateTime.Now.ToString("yyyyMMdd");
            }
        }
        else
        {
            return "00000000";
        }
    }

    //自动备份系统数据库数据
    public static void AutoBackupDBDataBySystem()
    {
        string strHQL1;
        strHQL1 = "Select * From T_BackDBLog Where to_char(BackTime,'yyyymmdd') = to_char(now(),'yyyymmdd')";
        DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL1, "T_BackDBLog");
        if (ds1.Tables[0].Rows.Count == 0)
        {
            try
            {
                //备份数据库
                ShareClass.BackupCurrentSiteDB(ShareClass.GetSystemDBName(), ShareClass.GetSystemDBBackupSaveDir(), "Timer", "SELF");
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + HttpContext.Current.Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }
        }

    }

    //自动备份系统文档数据
    public static void AutoBackupDocDataBySystem()
    {
        string strHQL2;

        strHQL2 = "Select * From T_BackDocLog Where to_char(BackTime,'yyyymmdd') = to_char(now(),'yyyymmdd')";
        DataSet ds2 = ShareClass.GetDataSetFromSql(strHQL2, "T_BackDocLog");
        if (ds2.Tables[0].Rows.Count == 0)
        {
            try
            {
                //备份文档
                ShareClass.BackupCurrentSiteDoc("Timer");
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + HttpContext.Current.Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }
        }
    }

    private void SendUNSendMessage()
    {
        try
        {
            //推送末推送的消息
            if (ShareClass.SystemLatestLoginUser == "")
            {
                ShareClass.SystemLatestLoginUser = "Timer";

                Msg msg = new Msg();
                try
                {
                    msg.SendUNSentSMSBySP();
                }
                catch
                {
                }

                ShareClass.SystemLatestLoginUser = "";
            }
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }

    protected DateTime GetLastestPushTimeByTimer()
    {
        string strHQL;
        string strPushTime;

        strHQL = "Select Max(PushTime) From T_MsgPushLog Where UserCode = 'Timer'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_MsgPushLog");

        try
        {
            strPushTime = ds.Tables[0].Rows[0][0].ToString();
            return DateTime.Parse(strPushTime);
        }
        catch
        {
            return DateTime.Parse("1901-01-01");
        }
    }
}