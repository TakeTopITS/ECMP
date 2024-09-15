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


using System.Data.SqlClient;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTGoodsDeliveryOrderView : System.Web.UI.Page
{
    string strDOID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strDOID = Request.QueryString["DOID"];

        if (Page.IsPostBack != true)
        {
            LoadGoodsDeliveryOrder(strDOID);
            LoadGoodsDeliveryOrderDetail(strDOID);
        }
    }

    protected void LoadGoodsDeliveryOrder(string strDOID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsDeliveryOrder as goodsDeliveryOrder where goodsDeliveryOrder.DOID = " + strDOID;
        GoodsDeliveryOrderBLL goodsDeliveryOrderBLL = new GoodsDeliveryOrderBLL();
        lst = goodsDeliveryOrderBLL.GetAllGoodsDeliveryOrders(strHQL);

        GoodsDeliveryOrder goodsDeliveryOrder = (GoodsDeliveryOrder)lst[0];

        DataList20.DataSource = lst;
        DataList20.DataBind();

        Img_BarCode.ImageUrl = ShareClass.GenerateQrCodeImage(ShareClass.GetBarType(),goodsDeliveryOrder.DOName.Trim(), 200, 200);

    }

    protected void LoadGoodsDeliveryOrderDetail(string strDOID)
    {
        string strHQL = "Select * from T_GoodsDeliveryOrderDetail where DOID = " + strDOID + " Order by ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsDeliveryOrder");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }



}