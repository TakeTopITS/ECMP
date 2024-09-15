using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProjectDailyWorkReport_aspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strProjectID, strProjectName;
        string strUserCode, strUserName;
        string strHQL;
        decimal deExpense = 0, deManHour = 0, deConfirmManHour = 0, deSalary = 0, deConfirmSalary = 0;
        IList lst;

        strProjectID = Request.QueryString["ProjectID"];
        Project project = GetProject(strProjectID);

        strProjectName = project.ProjectName.Trim();

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        LB_ReportName.Text = "项目工作日志";
        //this.Title = "项目： " + strProjectID + " " + strProjectName + " 工作日志报表！";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            DLC_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;
            LB_ProjectID.Text = strProjectID;
            LB_ProjectName.Text = strProjectName;
            LB_PMName.Text = project.PMName;


            strHQL = "from ProjectDailyWork as projectDailyWork where projectDailyWork.ProjectID = " + strProjectID + " order by projectDailyWork.WorkDate DESC";
            ProjectDailyWorkBLL projectDailyWorkBLL = new ProjectDailyWorkBLL();
            lst = projectDailyWorkBLL.GetAllProjectDailyWorks(strHQL);
            DataList1.DataSource = lst;
            DataList1.DataBind();

            ProjectDailyWork projectDailyWork = new ProjectDailyWork();

            for (int i = 0; i < lst.Count; i++)
            {
                projectDailyWork = (ProjectDailyWork)lst[i];
                deExpense += projectDailyWork.Charge;
                deManHour += projectDailyWork.ManHour;
                deSalary += projectDailyWork.DailySalary;
                deConfirmManHour += projectDailyWork.ConfirmManHour;
                deConfirmSalary += projectDailyWork.ConfirmDailySalary;
            }

            LB_Amount.Text = deExpense.ToString();
            LB_ManHour.Text = deManHour.ToString();
            LB_Income.Text = deSalary.ToString();
            LB_ConfirmManHour.Text = deConfirmManHour.ToString();
            LB_ConfirmIncome.Text = deConfirmSalary.ToString();


            LB_QueryScope.Text = Resources.lang.ZZZhiXingZheAll;
            LB_Sql.Text = strHQL;
        }
    }

    protected void BT_AllMember_Click(object sender, EventArgs e)
    {
        decimal deExpense = 0, deManHour = 0, deConfirmManHour = 0, deSalary = 0, deConfirmSalary = 0;
        string strProjectID = LB_ProjectID.Text.Trim();
        string strHQL = "from ProjectDailyWork as projectDailyWork where projectDailyWork.ProjectID = " + strProjectID + " order by projectDailyWork.WorkDate DESC";
        ProjectDailyWorkBLL projectDailyWorkBLL = new ProjectDailyWorkBLL();
        IList lst = projectDailyWorkBLL.GetAllProjectDailyWorks(strHQL);
        DataList1.DataSource = lst;
        DataList1.DataBind();

        ProjectDailyWork projectDailyWork = new ProjectDailyWork();

        for (int i = 0; i < lst.Count; i++)
        {
            projectDailyWork = (ProjectDailyWork)lst[i];
            deExpense += projectDailyWork.Charge;
            deManHour += projectDailyWork.ManHour;
            deSalary += projectDailyWork.DailySalary;
            deConfirmManHour += projectDailyWork.ConfirmManHour;
            deConfirmSalary += projectDailyWork.ConfirmDailySalary;
        }

        LB_Amount.Text = deExpense.ToString();
        LB_ManHour.Text = deManHour.ToString();
        LB_Income.Text = deSalary.ToString();
        LB_ConfirmManHour.Text = deConfirmManHour.ToString();
        LB_ConfirmIncome.Text = deConfirmSalary.ToString();

        LB_QueryScope.Text = Resources.lang.ZZZhiXingZheAll;
    }

    protected void BT_DateFind_Click(object sender, EventArgs e)
    {
        string strHQL, strProjectID, strStartDate, strEndDate;
        IList lst;
        decimal deExpense = 0, deManHour = 0, deConfirmManHour = 0, deSalary = 0, deConfirmSalary = 0;

        strStartDate = DateTime.Parse(DLC_BeginDate.Text).ToString("yyyyMMdd");
        strEndDate = DateTime.Parse(DLC_EndDate.Text).ToString("yyyyMMdd");

        strProjectID = LB_ProjectID.Text.Trim();
        strHQL = "from ProjectDailyWork as projectDailyWork where projectDailyWork.ProjectID = " + strProjectID;
        strHQL += " and to_char( projectDailyWork.WorkDate,'yyyymmdd') >= " + "'" + strStartDate + "'" + " and to_char( projectDailyWork.WorkDate,'yyyymmdd') <= " + "'" + strEndDate + "'";
        strHQL += " order by projectDailyWork.WorkDate DESC";
        ProjectDailyWorkBLL projectDailyWorkBLL = new ProjectDailyWorkBLL();
        lst = projectDailyWorkBLL.GetAllProjectDailyWorks(strHQL);
        DataList1.DataSource = lst;
        DataList1.DataBind();

        ProjectDailyWork projectDailyWork = new ProjectDailyWork();

        for (int i = 0; i < lst.Count; i++)
        {
            projectDailyWork = (ProjectDailyWork)lst[i];
            deExpense += projectDailyWork.Charge;
            deManHour += projectDailyWork.ManHour;
            deSalary += projectDailyWork.DailySalary;
            deConfirmManHour += projectDailyWork.ConfirmManHour;
            deConfirmSalary += projectDailyWork.ConfirmDailySalary;
        }

        LB_Amount.Text = deExpense.ToString();
        LB_ManHour.Text = deManHour.ToString();
        LB_Income.Text = deSalary.ToString();
        LB_ConfirmManHour.Text = deConfirmManHour.ToString();
        LB_ConfirmIncome.Text = deConfirmSalary.ToString();


        LB_QueryScope.Text = Resources.lang.KaiShiRiQi + ":" + strStartDate + Resources.lang.JieShuRiQi + ":" + strEndDate;

        LB_TimeScope.Text = strStartDate + "-" + strEndDate;
    }

    protected void LoadDailyWork()
    {
        string strHQL;
        IList lst;

        strHQL = LB_Sql.Text.Trim();
        ProjectDailyWorkBLL projectDailyWorkBLL = new ProjectDailyWorkBLL();
        lst = projectDailyWorkBLL.GetAllProjectDailyWorks(strHQL);
        DataList1.DataSource = lst;
        DataList1.DataBind();
    }


    protected string GetProjectName(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];
        string strProjectName = project.ProjectName.Trim();

        LB_ProExpense.Text = project.Budget.ToString();
        LB_ProManHour.Text = project.ManHour.ToString();

        return strProjectName;
    }

    protected Project GetProject(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        return project;
    }

}
