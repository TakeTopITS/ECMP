
using System;
using System.Collections;
using System.Data;
using System.Web.UI;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTGoodsProductionOrderView : System.Web.UI.Page
{
    string strPDID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strPDID = Request.QueryString["PDID"];

        //this.Title = "物料生产单";


        if (Page.IsPostBack != true)
        {
            LoadGoodsSupplyOrder(strPDID);
        }
    }


    protected void LoadGoodsSupplyOrder(string strPDID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsProductionOrder as goodsProductionOrder where goodsProductionOrder.PDID = " + strPDID;
        GoodsProductionOrderBLL goodsProductionOrderBLL = new GoodsProductionOrderBLL();
        lst = goodsProductionOrderBLL.GetAllGoodsProductionOrders(strHQL);

        GoodsProductionOrder goodsProductionOrder = (GoodsProductionOrder)lst[0];

        DataList1.DataSource = lst;
        DataList1.DataBind();

        LoadgGoodsProductionOrderDetail(strPDID);

        Img_BarCode.ImageUrl = ShareClass.GenerateQrCodeImage(ShareClass.GetBarType(),goodsProductionOrder.PDName.Trim(), 200, 200);

    }


    protected void LoadgGoodsProductionOrderDetail(string strPDID)
    {
        string strHQL = "Select * from T_GoodsProductionOrderDetail where PDID = " + strPDID + " Order by ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsProductionOrderDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}


