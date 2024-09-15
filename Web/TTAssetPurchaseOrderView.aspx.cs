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

public partial class TTAssetPurchaseOrderView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = Session["UserCode"].ToString();
        string strPOID = Request.QueryString["POID"].Trim();

        //this.Title = "资产采购单";


        if (Page.IsPostBack != true)
        {
            strHQL = "from AssetPurchaseOrder as assetPurchaseOrder where assetPurchaseOrder.POID = " + strPOID;
            AssetPurchaseOrderBLL assetPurchaseOrderBLL = new AssetPurchaseOrderBLL();
            lst = assetPurchaseOrderBLL.GetAllAssetPurchaseOrders(strHQL);

            DataList1.DataSource = lst;
            DataList1.DataBind();

            strHQL = "from AssetPurRecord as assetPurRecord where assetPurRecord.POID = " + strPOID;
            AssetPurRecordBLL assetPurRecordBLL = new AssetPurRecordBLL();
            lst = assetPurRecordBLL.GetAllAssetPurRecords(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
        }
    }
}
