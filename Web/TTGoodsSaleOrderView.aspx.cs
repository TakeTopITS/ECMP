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

public partial class TTGoodsSaleOrderView : System.Web.UI.Page
{
    string strSOID;

    protected void Page_Load(object sender, EventArgs e)
    {

        string strUserCode = Session["UserCode"].ToString();


        //this.Title = "物料销售单";

        strSOID = Request.QueryString["SOID"];

        if (Page.IsPostBack != true)
        {
            LoadGoodsSaleOrder(strSOID);
            LoadGoodsSaleOrderDetail(strSOID);
        }
    }

    protected void LoadGoodsSaleOrder(string strSOID)
    {
        string strHQL;

        strHQL = "Select * From T_GoodsSaleOrder where SOID = " + strSOID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSalesOrder");

        DataList20.DataSource = ds;
        DataList20.DataBind();

        Img_BarCode.ImageUrl = ShareClass.GenerateQrCodeImage(ShareClass.GetBarType(), ds.Tables[0].Rows[0]["SOName"].ToString().Trim(), 200, 200);

    }

    protected void LoadGoodsSaleOrderDetail(string strSOID)
    {
        string strHQL = "Select * from T_GoodsSaleRecord where SOID = " + strSOID + " Order by ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSaleRecord");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}