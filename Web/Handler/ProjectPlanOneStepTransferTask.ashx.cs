using System;
using System.Web;
using System.Web.SessionState;

namespace TakeTopGantt.handler
{
    /// <summary>
    /// ProjectPlanOneStepTransferTask 的摘要说明
    /// </summary>
    public class ProjectPlanOneStepTransferTask : IHttpHandler, IReadOnlySessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            //string strPID = context.Request.Form["pid"];   //文本框内容(Get传参对应QueryString)

            string strPID = context.Request.QueryString["pid"].ToString().Trim();
            string strProjectID, strPlanVerID;

            if (strPID != "0" | strPID == null)
            {
                strProjectID = strPID.Substring(0, strPID.Length - 2);

                strPlanVerID = strPID.Substring(strProjectID.Length, 2);
                if (strPlanVerID.Substring(0, 1) == "0")
                {
                    strPlanVerID = strPlanVerID.Substring(1, 1);
                }
            }
            else
            {
                context.Response.Write(Resources.lang.ZZSBXMIDWKQJC);
                return;
            }

            if (GanttShareClass.CheckUserCanUpdatePlan(strPID) == false || GanttShareClass.CheckIsCanUpdatePlanByProjectStatus(strPID) == false)
            {
                context.Response.Write(Resources.lang.ZZSBZYXMJLJHYHLXZZXMZTBUQJC);
                return;
            }

            string strHQL1 = "", strHQL2 = "", strHQL3 = "";

            string strCurrentUserCode = HttpContext.Current.Session["UserCode"].ToString().Trim();

            if (GanttShareClass.GetNoLeaderPlanNumber(strProjectID, strPlanVerID) > 0)
            {
                context.Response.Write(Resources.lang.ZZSBYRWMYZDHZRQJC);
                return;
            }

            try
            {
                strHQL1 = "Update T_ImplePlan Set LeaderCode = dbo.F_GetUserCodeByUserName(Leader)";
                strHQL1 += " Where ProjectID = " + strProjectID + " and VerID = " + strPlanVerID;
                GanttShareClass.RunSqlCommand(strHQL1);

                strHQL2 = "Insert Into T_ProjectTask(PlanID,ProjectID,Type,Task,Budget,Expense,ManHour,RealManHour,BeginDate,EndDate,MakeManCode,MakeManName,MakeDate,Status,FinishPercent,Priority,IsPlanMainTask)";
                strHQL2 += " SELECT ID ,ProjectID ,'Plan',Name,Budget,0,WorkHour,0 ,Start_Date,End_Date,'" + strCurrentUserCode + "','" + GanttShareClass.GetUserNameByUserCode(strCurrentUserCode) + "',now(),'新建',0,'Normal','NO'";
                strHQL2 += " From  T_ImplePlan Where ProjectID = " + strProjectID + " and VerID = " + strPlanVerID;
                strHQL2 += " and ID Not In (Select PlanID From T_ProjectTask)";
                GanttShareClass.RunSqlCommand(strHQL2);

                strHQL3 = "Insert Into T_TaskAssignRecord(TaskID,Task,Type,OperatorCode,OperatorName,OperatorContent,OperationTime,BeginDate,EndDate,AssignManCode,AssignManName,Content,Operation,PriorID,RouteNumber,MakeDate,Status)";
                strHQL3 += " Select A.TaskID,A.Task,'Plan',B.LeaderCode,B.Leader,'',now(),A.BeginDate,A.EndDate,A.MakeManCode,A.MakeManName,'',A.Task,0,A.TaskID,getdate(),'计划'";
                strHQL3 += " From T_ProjectTask A,T_ImplePlan B Where A.PlanID = B.ID and A.PlanID In (Select ID From T_ImplePlan Where ProjectID = " + strProjectID + " and VerID = " + strPlanVerID + ")";
                strHQL3 += " and A.TaskID Not In (Select TaskID From T_TaskAssignRecord)";
                GanttShareClass.RunSqlCommand(strHQL3);

                context.Response.Write(Resources.lang.ZZCGZRWQBWC);

            }
            catch (Exception err)
            {
                //LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}