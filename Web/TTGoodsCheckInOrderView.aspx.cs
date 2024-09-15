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

public partial class TTGoodsCheckInOrderView : System.Web.UI.Page
{
    string strCheckInID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strCheckInID = Request.QueryString["CheckInID"];


        if (Page.IsPostBack != true)
        {
            LoadGoodsCheckInOrder(strCheckInID);
        }
    }


    protected void LoadGoodsCheckInOrder(string strCheckInID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsCheckInOrder as goodsCheckInOrder where goodsCheckInOrder.CheckInID = " + strCheckInID;
        GoodsCheckInOrderBLL goodsCheckInOrderBLL = new GoodsCheckInOrderBLL();
        lst = goodsCheckInOrderBLL.GetAllGoodsCheckInOrders(strHQL);
        GoodsCheckInOrder goodsCheckInOrder = (GoodsCheckInOrder)lst[0];

        DataList18.DataSource = lst;
        DataList18.DataBind();

        LoadGoodsCheckInOrderDetail(strCheckInID);

        Img_BarCode.ImageUrl = ShareClass.GenerateQrCodeImage(ShareClass.GetBarType(),goodsCheckInOrder.GCIOName.Trim(), 200, 200);
    }


    protected void LoadGoodsCheckInOrderDetail(string strCheckInID)
    {
        string strHQL = "Select * from T_GoodsCheckInOrderDetail where CheckInID = " + strCheckInID + " Order by ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsCheckInOrderDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}


