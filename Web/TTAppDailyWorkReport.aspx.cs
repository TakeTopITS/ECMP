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

public partial class TTAppDailyWorkReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strProjectID, strProjectName;
        string strUserCode, strUserName;
        string strHQL;
        decimal deExpense = 0, deManHour = 0, deConfirmManHour = 0, deSalary = 0, deConfirmSalary = 0;
        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();

        strProjectID = Request.QueryString["ProjectID"];
        Project project = GetProject(strProjectID);
        strProjectName = project.ProjectName.Trim();

        //检查用户是否项目成员
        if (ShareClass.CheckUserIsProjectMember(strProjectID, strUserCode) == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }
      

        if (Page.IsPostBack == false)
        {
            LB_ProjectID.Text = strProjectID;
            LB_ProjectName.Text = strProjectName;

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

            LB_ConfirmManHour.Text = deConfirmManHour.ToString();
        }
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
