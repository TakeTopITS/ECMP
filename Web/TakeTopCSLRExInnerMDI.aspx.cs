using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TakeTopCSLRExInnerMDI : System.Web.UI.Page
{
    public string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = System.Configuration.ConfigurationManager.AppSettings["SystemName"] + " " + ShareClass.SystemVersionID + "---" + System.Configuration.ConfigurationManager.AppSettings["Slogan"];  

        try
        {
            strUserCode = Session["UserCode"].ToString();
        }
        catch (Exception err)
        {
            //Response.Write(Resources.lang.ZZTSFWQFMQCXDL);
        }
    }

}