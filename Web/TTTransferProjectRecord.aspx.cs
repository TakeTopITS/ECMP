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

public partial class TTTransferProjectRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = Session["UserCode"].ToString();
        string strProjectID = Request.QueryString["ProjectID"];

        string strProjectName = GetProjectName(strProjectID);

        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>aHandler();</script>");
        if (Page.IsPostBack == false)
        {
            strHQL = "from TransferProject as transferProject where ProjectID = " + strProjectID;
            TransferProjectBLL transferProjectBLL = new TransferProjectBLL();
            lst = transferProjectBLL.GetAllTransferProjects(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
        }
    }

    protected string GetProjectName(string strProjectID)
    {
        string strHQL, strProjectName;
        IList lst;

        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];

        strProjectName = project.ProjectName.Trim();

        return strProjectName;
    }
  
}
