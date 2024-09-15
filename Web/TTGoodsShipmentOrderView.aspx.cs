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

public partial class TTGoodsShipmentOrderView : System.Web.UI.Page
{
    string strShipmentNO;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strShipmentNO = Request.QueryString["ShipmentNO"];


        if (Page.IsPostBack != true)
        {
            LoadGoodsShipmentOrder(strShipmentNO);
        }
    }


    protected void LoadGoodsShipmentOrder(string strShipmentNO)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsShipmentOrder as goodsShipmentOrder where goodsShipmentOrder.ShipmentNO = " + strShipmentNO;
        GoodsShipmentOrderBLL goodsShipmentOrderBLL = new GoodsShipmentOrderBLL();
        lst = goodsShipmentOrderBLL.GetAllGoodsShipmentOrders(strHQL);
        GoodsShipmentOrder goodsShipmentOrder = (GoodsShipmentOrder)lst[0];

        DataList1.DataSource = lst;
        DataList1.DataBind();

        LoadGoodsShipmentDetail(strShipmentNO);

        Img_BarCode.ImageUrl = ShareClass.GenerateQrCodeImage(ShareClass.GetBarType(),goodsShipmentOrder.GSHOName.Trim(), 200, 200);

    }


    protected void LoadGoodsShipmentDetail(string strShipmentNO)
    {
        string strHQL = "Select * from T_GoodsShipmentDetail where ShipmentNO = " + strShipmentNO + " Order by ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}


