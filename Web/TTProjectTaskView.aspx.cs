using System; using System.Resources;
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

public partial class TTProjectTaskView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        string strTaskID;
        IList lst;
 
        strTaskID = Request.QueryString ["TaskID"];

        string strUserCode = Session["UserCode"].ToString();

        if (Page.IsPostBack == false)
        {
            strHQL = "from ProjectTask as projectTask where projectTask.TaskID = " + strTaskID ;
            ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL ();
            lst = projectTaskBLL.GetAllProjectTasks(strHQL);

            DataList1.DataSource = lst;
            DataList1.DataBind();

            if (lst.Count > 0)
            {
                ProjectTask projectTask = (ProjectTask)lst[0];
              
                //this.Title = " 任务: " + strTaskID + " " + projectTask.Task.Trim() + " 详细信息";
            }
            else
            {
                Response.Write("此项目任务不存在，可能已被删除，请检查！");
            }
        }
    }  
}
