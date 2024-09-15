using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;

public partial class TTWorkPlanGanttForProjectStandardActivityCompareMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strProjectID;
        string strStandardPlanURL, strActivityPlanURL;

        strProjectID = Request.QueryString["ProjectID"];


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

        //依在用版项目计划进度更改当前时间项目完成进度
        ShareClass.UpdateProjectScheduleByActivityPlanSchedule(strProjectID);

        strActivityPlanURL = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID + "&verID=" + ShareClass.GetProjectPlanVerID(strProjectID, "在用") + "&BusinessType=COMPARE";
        IFrame_ActivityGanttPlan.Attributes.Add("src", strActivityPlanURL);

        strStandardPlanURL = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID + "&verID=" + ShareClass.GetProjectPlanVerID(strProjectID, "基准") + "&BusinessType=COMPARE";
        IFrame_StandardGanttPlan.Attributes.Add("src", strStandardPlanURL);
    }
}