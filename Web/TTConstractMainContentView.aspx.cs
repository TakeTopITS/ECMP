using System;
using System.Resources;
using System.Data;
using System.Drawing;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTConstractMainContentView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        string strConstractID;

        strConstractID = Request.QueryString["ConstractID"];
        ConstractBLL constractBLL = new ConstractBLL();
        Constract constract = new Constract();

        strHQL = "from Constract as constract where constract.ConstractID = " + strConstractID;

        IList lst = constractBLL.GetAllConstracts(strHQL);
        DataList1.DataSource = lst;
        DataList1.DataBind();
    }
}