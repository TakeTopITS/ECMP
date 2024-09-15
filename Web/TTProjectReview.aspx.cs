using System; using System.Resources;
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


public partial class TTProjectReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string strProjectID = Request.QueryString["ProjectID"];
        string strProjectName;


        string strHQL;
        IList lst;

       

         string strUserCode = Session["UserCode"].ToString();if (Page.IsPostBack != true)
        {

            //LB_ProjectID.Text = strProjectID;

            strProjectName = GetProjectName(strProjectID);

            //this.Title = Resources.lang.Project + strProjectID　+" " + strProjectName + " 实施计划！";

            strHQL = "from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID;

            WorkPlanBLL workPlanBLL = new WorkPlanBLL();

            lst = workPlanBLL.GetAllWorkPlans(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
        }

    }

    protected string GetProjectName(string strProjectID)
    {
        string strProjectName;
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;

        ProjectBLL projectBLL = new ProjectBLL();

        IList lst = projectBLL.GetAllProjects(strHQL);

        Project project = (Project)lst[0];

        strProjectName = project.ProjectName;

        return strProjectName;


    }
}
