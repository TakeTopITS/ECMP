using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTDisplayPOPMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strURL, strMsg, strURLType;

        strURL = Request.QueryString["URL"];
        strURLType = Request.QueryString["URLType"];
        strMsg = Request.QueryString["Msg"];

        if (ShareClass.isIOSDevice())
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandlerForPersonalSpaceIOSAddTab();", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForSpecialPopWindow();", true);
        }
        if (Page.IsPostBack != true)
        {
            HL_Message.NavigateUrl = strURL + "?URLType=" + strURLType;
            HL_Message.Text = strMsg;
        }

    }
}