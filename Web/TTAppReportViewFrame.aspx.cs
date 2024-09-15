using System; using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTAppReportViewFrame : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        string strLinkAddress = Request.QueryString["LinkAddress"];

        Response.Redirect(strLinkAddress);
    }
}