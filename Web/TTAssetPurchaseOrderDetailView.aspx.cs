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
public partial class TTAssetPurchaseOrderDetailView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = Session["UserCode"].ToString();
        string strPOID = Request.QueryString["POID"].Trim();

        if (Page.IsPostBack != true)
        {
            string strXMLFileURL = Request.QueryString["DetailXMLFile"];
            if (strXMLFileURL != null & strXMLFileURL != "")
            {
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath(strXMLFileURL));

                DataGrid1.DataSource = ds;
                DataGrid1.DataBind();
            }
            else
            {
                strHQL = "from AssetPurRecord as assetPurRecord where assetPurRecord.POID = " + strPOID;
                AssetPurRecordBLL assetPurRecordBLL = new AssetPurRecordBLL();
                lst = assetPurRecordBLL.GetAllAssetPurRecords(strHQL);

                DataGrid1.DataSource = lst;
                DataGrid1.DataBind();
            }
        }
    }
}
