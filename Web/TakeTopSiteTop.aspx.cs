using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TakeTopSiteTop : System.Web.UI.Page
{
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
       if (Page.IsPostBack != true)
        {
            try
            {
                LoadLanguageForDropListForWebSite(ddlLangSwitcher);
                InitializeCulture();

                strLangCode = Request.Cookies["LangCode"].Value;
                ddlLangSwitcher.SelectedValue = strLangCode;
            }
            catch
            {
                Response.Redirect("TTDisplayErrors.aspx");
            }

            BindHeadLineData();
            BindModuleData();

            //ClientScript.RegisterStartupScript(this.GetType(), "", "<script>popShowByURL('https://www.taketopits.com','ToWork','99%','99%',window.location);</script>");
        }
    }

    public void LoadLanguageForDropListForWebSite(DropDownList DL_Language)
    {
        string strHQL;

        strHQL = "Select * From T_SystemLanguage Where LangCode = 'zh-CN' Order By SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_SystemLanguage");
        DL_Language.DataSource = ds;
        DL_Language.DataBind();
    }

    protected void ddlLangSwitcher_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["LangCode"] = ddlLangSwitcher.SelectedValue.Trim();

        Response.SetCookie(new HttpCookie("LangCode", ddlLangSwitcher.SelectedValue));
        Response.Write("<script>window.open('DefaultSiteLeftRight.aspx','_parent')</script>");
    }

    protected override void InitializeCulture()
    {
        string strLangCode;


        if (Session["LangCode"] == null)
        {
            strLangCode = System.Configuration.ConfigurationManager.AppSettings["DefaultLang"];
            Session["LangCode"] = strLangCode;
        }
        else
        {
            strLangCode = Session["LangCode"].ToString();
        }

        try
        {
            Response.SetCookie(new HttpCookie("LangCode", strLangCode));
        }
        catch
        {
        }

        if (Request.Cookies["LangCode"] != null)
        {
            System.Threading.Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture(Request.Cookies["LangCode"].Value.ToString());
            System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(Request.Cookies["LangCode"].Value.ToString());

            Page.Culture = Request.Cookies["LangCode"].Value;
            Page.UICulture = Request.Cookies["LangCode"].Value;

            base.InitializeCulture();
        }
    }

    protected void BindModuleData()
    {
        string strHtml = string.Empty;
        string strHQL;

        strHQL = "Select Distinct * From T_ProModuleLevel A Where ParentModule = '' ";
        strHQL += " and A.Visible = 'YES' and A.IsDeleted = 'NO' and A.ModuleType = 'SITE' ";
        strHQL += " and A.LangCode = " + "'" + strLangCode + "'";
        strHQL += " Order By A.SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_ProModuleLevel");

        RP_ModuleList.DataSource = ds;
        RP_ModuleList.DataBind();
    }

    protected void BindHeadLineData()
    {
        string strHtml = string.Empty;
        string strHQL;

        strHQL = "Select * from T_HeadLine where LangCode = " + "'" + strLangCode + "'";
        strHQL += " and Type = '外部'and Status = '发布' and IsHead = 'YES'";
        strHQL += " Order by ID DESC";
        DataTable dtHeadLine = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "HeadLine").Tables[0];
        DataView dvHeadLine = new DataView(dtHeadLine);

        strHtml += "<ul class=\"content\">";
        foreach (DataRowView row in dvHeadLine)
        {
            string strID = ShareClass.ObjectToString(row["ID"]);
            string strHeadLineName = ShareClass.ObjectToString(row["Title"]);
            strHtml += "<li>  <a onmousedown='OnMouseDownEventForWholePage(this)' href =TakeTopSiteNewsView.aspx?ID=" + strID + " target=SiteRightContainerFrame > " + strHeadLineName + "</a></li>";            
        }
        strHtml += "</ul>";

        LT_Result.Text = strHtml;
    }
}