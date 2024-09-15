using System;
using System.Linq;
using TakeTopGantt.models;


public partial class TTWorkPlanGanttForProjectForTraditional : System.Web.UI.Page
{
    protected int pid = 1;
    protected int projectID = 1;

    protected long g_start = 0;
    protected long g_end = 0;

    protected static string strUserCode, strProjectID, strProjectName, strVerID;

    public string strSystemVerType, strBusinessType, strProjectStatus, strUserIsCanUpdatePlan;

    protected void Page_Load(object sender, EventArgs e)
    {
        //ToInt32会将不能识别为int的数据变为0
        pid = Convert.ToInt32(Request["pid"]);
        //获取最小的开始时间和最大的结束时间
        //pid = Math.Max(pid, 1);

        strProjectStatus = ShareClass.GetProjectStatus(pid.ToString());
        strSystemVerType = Session["SystemVersionType"].ToString();
        strBusinessType = Request.QueryString["BusinessType"];

        try
        {
            if (Session["WeekendFirstDay"] == null)
            {
                //取得周末开始日
                Session["WeekendFirstDay"] = ShareClass.GetWeekendFirstDay();
            }

            if (Session["WeekendSecondDay"] == null)
            {
                //取得周末结束日
                Session["WeekendSecondDay"] = ShareClass.GetWeekendSecondDay();
            }

            if (Session["WeekendsAreWorkdays"] == null)
            {
                //取得周末是否工作日
                Session["WeekendsAreWorkdays"] = ShareClass.GetWeekendsAreWorkdays();
            }
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }

        string strUserCode = Session["UserCode"].ToString();
        strProjectID = Request.QueryString["pid"];
        if (strProjectID == null)
        {
            strProjectID = "1";
            strProjectName = ShareClass.GetProjectName(strProjectID);
        }

        Session["ProjectIDForGantt"] = strProjectID;

        strVerID = Request.QueryString["VerID"];
        if (strVerID == null)
        {
            if (Session["VerIDForGantt"] != null)
            {
                strVerID = Session["VerIDForGantt"].ToString();
            }
            else
            {
                strVerID = ShareClass.GetProjectPlanVersion(strProjectID, "在用").ToString();
                if (strVerID == "0")
                {
                    strVerID = ShareClass.GetLargestProjectPlanVerID(strProjectID);
                }
            }
        }
        else
        {
            Session["VerIDForGantt"] = strVerID;
        }

        //判断当前用户能否更改计划
        strUserIsCanUpdatePlan = LB_UserIsCanUpdatePlan.Text;

        LB_VerID.Text = strVerID;

        projectID = pid;

        pid = GetPIDForGantt(int.Parse(strProjectID), int.Parse(strVerID));

        if (pid <= 0)
        {
            Response.Redirect("TTWorkPlanGanttForProjectForTraditional.aspx?pid=1");
        }

        //在c#中,应该使用DateTime.Now而不是new DateTime() 来获取当前时间
        DateTime today = DateTime.Now;
        g_start = datetime2MS(today);
        g_end = datetime2MS(today.AddYears(1));


        //获取整个项目的时间范围
        TakeTopGantt.models.extganttDataContext db = new extganttDataContext();
        var allTasks = db.task.Where(b => b.pid == pid);
        try
        {
            //定义甘特图的时间范围
            g_start = datetime2MS(allTasks.Min(s => s.start_date).Value);
            g_end = datetime2MS(allTasks.Max(s => s.end_date).Value);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }

        if (Page.IsPostBack == false)
        {

            try
            {
                //依在用版项目计划进度更改当前时间项目完成进度
                ShareClass.UpdateProjectScheduleByActivityPlanSchedule(strProjectID);

                //把负责人代码为空更新为不为空
                ShareClass.UpdateProjectWorkPlanLeaderCodeToNotNull(strProjectID, strVerID);

                //更新基准版本计划的进度
                if (strVerID == ShareClass.GetProjectPlanVerID(strProjectID, "基准").ToString())
                {
                    string strHQL;

                    strHQL = "Update T_ImplePlan Set Percent_Done = 100,baseline_percent_done = 100,Expense = Budget,ActualHour = WorkHour";
                    strHQL += " Where ProjectID = " + strProjectID + " and VerID = " + strVerID + " And End_Date <= now()";
                    ShareClass.RunSqlCommand(strHQL);
                }

                //判断当前用户能否更改计划
                LB_UserIsCanUpdatePlan.Text = ShareClass.CheckUserIsCanUpdatePlan(projectID.ToString(), strVerID);
                strUserIsCanUpdatePlan = LB_UserIsCanUpdatePlan.Text;
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }
        }
    }

    protected long datetime2MS(DateTime dt)
    {
        return (long)(dt - new DateTime(1970, 1, 1)).TotalMilliseconds;
    }

    protected int GetPIDForGantt(int intProjectID, int intVerID)
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

        strPID = strProjectID + strVerID;

        return int.Parse(strPID);
    }
}