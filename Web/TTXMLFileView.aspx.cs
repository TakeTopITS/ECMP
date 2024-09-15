using System; using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTXMLFileView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strXMLFileName = Request.QueryString["XMLFileName"].Trim();

        Response.Redirect(strXMLFileName);

        //this.Title = "XML文件：" + strXMLFileName + " 内容显示！";
    }
}
