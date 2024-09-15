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

public partial class TTAppInvolvedDailyWorkReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strProjectID;
        string strUserCode, strUserName;
        string strHQL;
        decimal deExpense = 0, deManHour = 0, deConfirmManHour = 0, deSalary = 0, deConfirmSalary = 0;
        IList lst;

        strProjectID = Request.QueryString["ProjectID"];

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();

        if (Page.IsPostBack == false)
        {
            strHQL = "from ProjectDailyWork as projectDailyWork where projectDailyWork.ProjectID = " + strProjectID;
            strHQL += " And (projectDailyWork.UserCode = " + "'" + strUserCode + "'" + " Or projectDailyWork.Authority = 'YES' )";
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
        }
    }

}
