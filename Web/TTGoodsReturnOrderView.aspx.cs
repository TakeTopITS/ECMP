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

public partial class TTGoodsReturnOrderView : System.Web.UI.Page
{
    string strROID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strROID = Request.QueryString["ROID"];

        //this.Title = "物料退货单";

        if (Page.IsPostBack != true)
        {
            LoadGoodsReturnOrder(strROID);
        }
    }

    protected void LoadGoodsReturnOrder(string strROID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsReturnOrder as goodsReturnOrder where goodsReturnOrder.ROID = " + strROID;
        GoodsReturnOrderBLL goodsReturnOrderBLL = new GoodsReturnOrderBLL();
        lst = goodsReturnOrderBLL.GetAllGoodsReturnOrders(strHQL);
        GoodsReturnOrder goodsReturnOrder = (GoodsReturnOrder)lst[0];

        DataList18.DataSource = lst;
        DataList18.DataBind();

        LoadGoodsReturnOrderDetail(strROID);

        Img_BarCode.ImageUrl = ShareClass.GenerateQrCodeImage(ShareClass.GetBarType(), goodsReturnOrder.ReturnName.Trim(), 200, 200);
    }


    protected void LoadGoodsReturnOrderDetail(string strROID)
    {
        string strHQL = "Select * from T_GoodsReturnDetail where ROID = " + strROID + " Order by ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsReturnDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}


