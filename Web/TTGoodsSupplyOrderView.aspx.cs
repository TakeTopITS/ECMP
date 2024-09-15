using System;
using System.Resources;
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


public partial class TTGoodsSupplyOrderView : System.Web.UI.Page
{
    string strSUID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strSUID = Request.QueryString["SUID"];

        //this.Title = "供货单";


        if (Page.IsPostBack != true)
        {
            LoadGoodsSupplyOrder(strSUID);
        }
    }


    protected void LoadGoodsSupplyOrder(string strSUID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsSupplyOrder as goodsSupplyOrder where goodsSupplyOrder.SUID = " + strSUID;
        GoodsSupplyOrderBLL goodsSupplyOrderBLL = new GoodsSupplyOrderBLL();
        lst = goodsSupplyOrderBLL.GetAllGoodsSupplyOrders(strHQL);
        GoodsSupplyOrder goodsSupplyOrder = (GoodsSupplyOrder)lst[0];

        DataList1.DataSource = lst;
        DataList1.DataBind();

        LoadgoodsSupplyOrderDetail(strSUID);

        Img_BarCode.ImageUrl = ShareClass.GenerateQrCodeImage(ShareClass.GetBarType(), goodsSupplyOrder.SUName.Trim(), 200, 200);
    }

    protected void LoadgoodsSupplyOrderDetail(string strSUID)
    {
        string strHQL = "Select * from T_GoodsSupplyOrderDetail where SUID = " + strSUID + " Order by ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSupplyOrderDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}


