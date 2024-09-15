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

public partial class TTGoodsBorrowOrderView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strBorrowNO = Request.QueryString["BorrowNO"].Trim();

        string strUserCode = Session["UserCode"].ToString(); if (Page.IsPostBack != true)
        {
            LoadGoodsBorrowOrder(strBorrowNO);
        }
    }

    protected void LoadGoodsBorrowOrder(string strBorrowNO)
    {
        string strHQL;
        IList lst;

        strHQL = "From GoodsBorrowOrder as goodsBorrowOrder Where goodsBorrowOrder.BorrowNO = " + strBorrowNO;
        GoodsBorrowOrderBLL goodsBorrowOrderBLL = new GoodsBorrowOrderBLL();
        lst = goodsBorrowOrderBLL.GetAllGoodsBorrowOrders(strHQL);
        GoodsBorrowOrder goodsBorrowOrder = (GoodsBorrowOrder)lst[0];

        DataList1.DataSource = lst;
        DataList1.DataBind();

        LoadGoodsBorrowOrderDetail(strBorrowNO);

        Img_BarCode.ImageUrl = ShareClass.GenerateQrCodeImage(ShareClass.GetBarType(),goodsBorrowOrder.BOName.Trim(), 200, 200);

    }

    protected void LoadGoodsBorrowOrderDetail(string strBorrowNO)
    {
        string strHQL;
        IList lst;

        strHQL = "From GoodsBorrowOrderDetail as goodsBorrowOrderDetail Where goodsBorrowOrderDetail.BorrowNO = " + strBorrowNO + " Order By goodsBorrowOrderDetail.ID ASC";
        GoodsBorrowOrderDetailBLL goodsBorrowOrderDetailBLL = new GoodsBorrowOrderDetailBLL();
        lst = goodsBorrowOrderDetailBLL.GetAllGoodsBorrowOrderDetails(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }
}

