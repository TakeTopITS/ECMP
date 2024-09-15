using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace TakeTopGantt.handler
{
    /// <summary>
    /// DeleteAllTardyPlansToRedColor 的摘要说明
    /// </summary>
    public class DeleteAllTardyPlansToRedColor : IHttpHandler, IReadOnlySessionState
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
                context.Response.Write("项目号为空，请检查！");
                return;
            }

            if (GanttShareClass.CheckUserCanUpdatePlan(strPID) == false || GanttShareClass.CheckIsCanUpdatePlanByProjectStatus(strPID) == false)
            {
                context.Response.Write("没有权限更改计划，请检查！");
                return;
            }

            string strHQL;
            strHQL = "Update T_ImplePLan Set TaskColor = '' Where ";
            strHQL += " to_char(end_date,'yyyymmdd') < to_char(now(),'yyyymmdd')";
            strHQL += " And Percent_Done < 100";
            strHQL += " And ProjectID = " + strProjectID + " and VerID = " + strPlanVerID;

            try
            {
                GanttShareClass.RunSqlCommand(strHQL);
                context.Response.Write("Sucess, " + strHQL); ;
            }
            catch
            {
                context.Response.Write("Failer, " + strHQL);
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
