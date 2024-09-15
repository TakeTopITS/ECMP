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

public partial class TakeTopSiteContainer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strModuleName;
        string strLangCode;

        if (Session["LangCode"] != null)
        {
            strLangCode = Session["LangCode"].ToString();
        }
        else
        {
            strLangCode = System.Configuration.ConfigurationManager.AppSettings["DefaultLang"];
        }

        strModuleName = Request.QueryString["ModuleName"];

        if (ShareClass.IsMobileDeviceCheckAgent())
        {
            divLeftBar.Visible = true;
            IM_RightToLeft.Visible = true;
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>ChangeMenu(0);</script>");
        }
        else
        {
            divLeftBar.Visible = false;
            IM_RightToLeft.Visible = false;
        }

        ClientScript.RegisterStartupScript(this.GetType(), "C1", "<script> if (window.parent.document.getElementById('TakeTopSiteMDI').cols == '181,*') { top.frames[2].document.all('IM_RightToLeft').style.display = 'none';}</script>");
        if (Page.IsPostBack != true)
        {
            if (strModuleName != null)
            {
                SiteModuleContentBLL siteModuleContentBLL = new SiteModuleContentBLL();
                SiteModuleContent siteModuleContent = new SiteModuleContent();

                strHQL = "From SiteModuleContent as siteModuleContent Where siteModuleContent.ModuleName = " + "'" + strModuleName + "'" + " and siteModuleContent.LangCode = " + "'" + strLangCode + "'";
                strHQL += " Order By siteModuleContent.ID DESC";
                lst = siteModuleContentBLL.GetAllSiteModuleContents(strHQL);

                DataList1.DataSource = lst;
                DataList1.DataBind();


                strHQL = "Select Distinct * From T_ProModuleLevel A Where ParentModule = " + "'" + strModuleName + "'";
                strHQL += " and A.Visible = 'YES' and A.IsDeleted = 'NO' and A.ModuleType = 'SITE' ";
                strHQL += " and A.LangCode = " + "'" + strLangCode + "'";
                strHQL += " Order By A.SortNumber ASC";
                DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_ProModuleLevel");
                if (ds.Tables[0].Rows.Count > 0 & ShareClass.IsMobileDeviceCheckAgent())
                {
                    divLeftBar.Visible = true;
                    IM_RightToLeft.Visible = true;
                }
                else
                {
                    divLeftBar.Visible = false;
                    IM_RightToLeft.Visible = false;
                }

            }
        }
    }
}
