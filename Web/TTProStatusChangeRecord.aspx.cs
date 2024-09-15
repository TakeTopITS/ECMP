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

public partial class TTProStatusChangeRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst ;

        string strUserCode = Session["UserCode"].ToString();
        string strProjectID = Request.QueryString["ProjectID"];

        string strProjectName = GetProjectName(strProjectID);

        //this.Title = Resources.lang.Project + strProjectID + "  " + strProjectName + " 状态的变更记录！";
        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>aHandler();</script>");
        if (Page.IsPostBack == false)
        {
            strHQL = "from ProStatusChange as proStatusChange where ProjectID = " + strProjectID;
            ProStatusChangeBLL proStatusChangeBLL = new ProStatusChangeBLL();
            lst = proStatusChangeBLL.GetAllProStatusChanges(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
        }
    }

    protected string GetProjectName(string strProjectID)
    {
        string strHQL,strProjectName;
        IList lst;

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        strProjectName = project.ProjectName.Trim();

        return strProjectName;
    }
    protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
