using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTAddWebService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       string strUserCode = Session["UserCode"].ToString();
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle("TTWebServiceList.aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility("TTWebServiceList.aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "查看所有项目", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                HF_ID.Value = Request.QueryString["id"];
                int id = 0;
                int.TryParse(Request.QueryString["id"], out id);
                BindWebServicesData(id);
            }
        }
    }

    private void BindWebServicesData(int id)
    {
        WebServiceBLL webServiceBLL = new WebServiceBLL();
        string strWebServiceSql = "from WebService as webService where id = " + id;
        IList webServiceList = webServiceBLL.GetAllWebServices(strWebServiceSql);
        if (webServiceList != null && webServiceList.Count > 0)
        {
            WebService webService = (WebService)webServiceList[0];
            TXT_WebServiceName.Text = webService.WebServiceName;
            TXT_WebServiceURL.Text = webService.WebServiceURI;
            TXT_MethodName.Text = webService.MethodName;
            TXT_ArgArray.Text = webService.ArgArray;
            TXT_Comment.Value = webService.Comment;
        }
    }

}