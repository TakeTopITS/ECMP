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


using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;
public partial class TTAssetApplicationDetailView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strAAID = Request.QueryString["AAID"].Trim();
        string strUserCode = Session["UserCode"].ToString(); 

        if (Page.IsPostBack != true)
        {
            LoadAssetApplicationDetail(strAAID);
        }
    }

    protected void LoadAssetApplicationDetail(string strAAID)
    {
        string strHQL;
        IList lst;

        string strXMLFileURL = Request.QueryString["DetailXMLFile"];
        if (strXMLFileURL != null & strXMLFileURL != "")
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath(strXMLFileURL));

            DataGrid2.DataSource = ds;
            DataGrid2.DataBind();
        }
        else
        {
            strHQL = "from AssetApplicationDetail as assetApplicationDetail where assetApplicationDetail.AAID = " + strAAID;
            AssetApplicationDetailBLL assetApplicationDetailBLL = new AssetApplicationDetailBLL();
            lst = assetApplicationDetailBLL.GetAllAssetApplicationDetails(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
        }
    }
}

