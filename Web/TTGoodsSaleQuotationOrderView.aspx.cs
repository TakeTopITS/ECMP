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

public partial class TTGoodsSaleQuotationOrderView : System.Web.UI.Page
{
    string strQOID;

    protected void Page_Load(object sender, EventArgs e)
    {

        string strUserCode = Session["UserCode"].ToString();

        strQOID = Request.QueryString["QOID"];

       if (Page.IsPostBack != true)
        {
            LoadGoodsSaleQuotationOrder(strQOID);
            LoadGoodsSaleQuotationOrderDetail(strQOID);
        }
    }

    protected void LoadGoodsSaleQuotationOrder(string strQOID)
    {
        string strHQL;
        IList lst;


        strHQL = "from GoodsSaleQuotationOrder as goodsSaleQuotationOrder where goodsSaleQuotationOrder.QOID = " + strQOID;
        GoodsSaleQuotationOrderBLL goodsSaleQuotationOrderBLL = new GoodsSaleQuotationOrderBLL();
        lst = goodsSaleQuotationOrderBLL.GetAllGoodsSaleQuotationOrders(strHQL);
        GoodsSaleQuotationOrder goodsSaleQuotationOrder = (GoodsSaleQuotationOrder)lst[0];

        DataList20.DataSource = lst;
        DataList20.DataBind();

        Img_BarCode.ImageUrl = ShareClass.GenerateQrCodeImage(ShareClass.GetBarType(), goodsSaleQuotationOrder.QOName.Trim(), 200, 200);
    }

    protected void LoadGoodsSaleQuotationOrderDetail(string strQOID)
    {
        string strHQL = "Select * from T_GoodsSaleQuotationOrderDetail where QOID = " + strQOID + " Order by ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSaleQuotationOrder");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}