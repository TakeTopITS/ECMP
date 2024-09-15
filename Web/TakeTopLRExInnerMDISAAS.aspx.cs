using System;
using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class TakeTopLRExInnerMDISAAS : System.Web.UI.Page
{
    public string strUserCode, strUserType;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = System.Configuration.ConfigurationManager.AppSettings["SystemName"] + " " + ShareClass.SystemVersionID + "---" + System.Configuration.ConfigurationManager.AppSettings["Slogan"];

        try
        {
            strUserCode = Session["UserCode"].ToString();
            strUserType = ShareClass.GetUserType(strUserCode);
            if (strUserType == "OUTER")
            {
                Response.Redirect("TTDisplayErrors.aspx");
                return;
            }
        }
        catch (Exception err)
        {
            //Response.Write(Resources.lang.ZZTSFWQFMQCXDL);
        }
    }

}