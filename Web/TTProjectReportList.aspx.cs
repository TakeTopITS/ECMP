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


using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProjectReportList : System.Web.UI.Page
{
    string strProjectID;
    string strLangCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        strProjectID = Request.QueryString["ProjectID"];
        strLangCode = Session["LangCode"].ToString();

        string strUserCode = Session["UserCode"].ToString();
        if (Page.IsPostBack == false)
        {
            string strHQL;

            strHQL = "Select HomeModuleName, PageName || " + "'" + strProjectID + "' as ModulePage  From T_ProModuleLevelForPage Where ParentModule = '项目报表列表' and LangCode = '" + strLangCode + "' and Visible ='YES' Order By SortNumber ASC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");
            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
        }
    }
}