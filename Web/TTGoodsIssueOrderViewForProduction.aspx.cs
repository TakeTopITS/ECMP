using System; using System.Resources;
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

using TakeTopCore;

public partial class TTGoodsIssueOrderViewForProduction : System.Web.UI.Page
{
    string strPDID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strPDID = Request.QueryString["PDID"];

        if (Page.IsPostBack != true)
        {
            LoadGoodsSupplyOrder(strPDID);
        }
    }

    protected void BT_PDMRPExpend_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strRelatedType, strRelatedID;

        strRelatedType = "PD";
        strRelatedID = strPDID;


        strHQL = "Delete From T_ItemRelatedOrderBomToExpendDetailData Where RelatedType = " + "'" + strRelatedType + "'" + " and RelatedID = " + strRelatedID;
        ShareClass.RunSqlCommand(strHQL);

        TakeTopPlan.RelatedOrderItemMRPPExtendDetail(strRelatedType, strRelatedID);

        strHQL = "Select * From T_ItemRelatedOrderBomToExpendDetailData Where RelatedType = " + "'" + strRelatedType + "'" + " and RelatedID = " + strRelatedID;
        strHQL += " Order By Type DESC, OrderTime ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemRelatedOrderBomToExpendDetailData");

        DataGrid17.DataSource = ds;
        DataGrid17.DataBind();
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


