using System; using System.Resources;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTCarAssignFormPrint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = Session["UserCode"].ToString();

        string strAssignFormID = Request.QueryString["ID"];

        strHQL = "From CarAssignForm as carAssignForm Where carAssignForm.ID = " + strAssignFormID + " Order By carAssignForm.ID DESC";
        CarAssignFormBLL carAssignFormBLL = new CarAssignFormBLL();
        lst = carAssignFormBLL.GetAllCarAssignForms(strHQL);

        DataList1.DataSource = lst;
        DataList1.DataBind();
    }
}
   