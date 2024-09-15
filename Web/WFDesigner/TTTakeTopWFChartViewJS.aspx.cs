using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WFDesigner_TTTakeTopWFChartViewJS : System.Web.UI.Page
{
    public string licenseKey;

    protected void Page_Load(object sender, EventArgs e)
    {
        licenseKey = System.Configuration.ConfigurationManager.AppSettings["CopyRight"];
        if (licenseKey != "泰顶-拓鼎-钟礼月")
        {
            HttpContext.Current.Response.Redirect("TTDisplayErrors.aspx");
        }
    }
}