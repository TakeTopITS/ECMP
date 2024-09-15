using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

using TakeTopGantt;

public partial class Handler_SyncProjectBaselinePlanTime : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string strPID = context.Request.Form["pid"];   //文本框内容(Get传参对应QueryString)

        string strPID = Request.QueryString["pid"].Trim();

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
            HttpContext.Current.Response.Write(Resources.lang.ZZSBXMIDWKQJC);
            return;
        }

        if (GanttShareClass.CheckUserCanUpdatePlan(strPID) == false || GanttShareClass.CheckIsCanUpdatePlanByProjectStatus(strPID) == false)
        {
            HttpContext.Current.Response.Write(Resources.lang.ZZSBZYXMJLJHYHLXZZXMZTBUQJC);
            return;
        }

        string strHQL;
        strHQL = "Update T_ImplePLan Set BaseLine_Start_Date = start_date,BaseLine_End_Date = end_date,baseline_percent_done = Percent_Done Where ProjectID = " + strProjectID + " and VerID = " + strPlanVerID;

        try
        {
            GanttShareClass.RunSqlCommand(strHQL);

            HttpContext.Current.Response.Write(Resources.lang.ZZCGTBJZJHWC);
        }
        catch
        {
            HttpContext.Current.Response.Write(Resources.lang.ZZShiBaiQJC);
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