using System;
public partial class TTErrorPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["BackURL"] = Request.UrlReferrer.ToString();
        }
    }

    protected void BackBtn_Click(object sender, System.EventArgs e)
    {
        Response.Redirect(ViewState["BackURL"].ToString());
    }
}
