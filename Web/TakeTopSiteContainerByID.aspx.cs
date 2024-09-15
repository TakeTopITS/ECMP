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


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TakeTopSiteContainerByID : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strID;
        string strLangCode;

        if (Session["LangCode"] != null)
        {
            strLangCode = Session["LangCode"].ToString();
        }
        else
        {
            strLangCode = System.Configuration.ConfigurationManager.AppSettings["DefaultLang"];
        }

        strID = Request.QueryString["ID"];
      

        if (ShareClass.IsMobileDeviceCheckAgent())
        {
            divLeftBar.Visible = true;
            IM_RightToLeft.Visible = true;
        }
        else
        {
            divLeftBar.Visible = false;
            IM_RightToLeft.Visible = false;
        }

        ClientScript.RegisterStartupScript(this.GetType(), "C1", "<script> if (window.parent.document.getElementById('TakeTopSiteMDI').cols == '181,*') { top.frames[2].document.all('IM_RightToLeft').style.display = 'none';}</script>");
        if (Page.IsPostBack != true)
        {
            if (strID != null)
            {
                SiteModuleContentBLL siteModuleContentBLL = new SiteModuleContentBLL();
                SiteModuleContent siteModuleContent = new SiteModuleContent();

                strHQL = "From SiteModuleContent as siteModuleContent Where siteModuleContent.ID = " + strID;
                lst = siteModuleContentBLL.GetAllSiteModuleContents(strHQL);

                DataList1.DataSource = lst;
                DataList1.DataBind();
            }

         
        }
    }
}
