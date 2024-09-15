using System;
using System.Resources;
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
using System.IO;
using Npgsql;//using System.Data.SqlClient;
using System.Data.OleDb;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

using TakeTopSecurity;

public partial class WFDesigner_TTTakeTopMFDesignerJSWorker : System.Web.UI.Page
{
    public string licenseKey;
    protected void Page_Load(object sender, EventArgs e)
    {
        licenseKey = System.Configuration.ConfigurationManager.AppSettings["CopyRight"];
        Session["LicenseKey"] = licenseKey;

        if (licenseKey != "泰顶-拓鼎-钟礼月")
        {
            HttpContext.Current.Response.Redirect("TTDisplayErrors.aspx");
        }

        if (Page.IsPostBack == false)
        {
        }
    }

    public static string getUrl()
    {
        return "www.taketopits.com";
    }

}