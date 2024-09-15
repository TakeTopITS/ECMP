using System;
using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTPnPCameraShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["strSrc"]))
            {
                string strSrc = Request.QueryString["strSrc"];
                rightCamera.Attributes.Add("src", strSrc);
            }
        }
    }
}