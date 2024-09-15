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
using System.IO;


using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTGoodsPurchaseOrderDetailView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strPOID = Request.QueryString["POID"].Trim();

        string strUserCode = Session["UserCode"].ToString();

        if (Page.IsPostBack != true)
        {
            string strXMLFileURL = Request.QueryString["DetailXMLFile"];
            if (strXMLFileURL != null & strXMLFileURL != "")
            {
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath(strXMLFileURL));

                DataGrid1.DataSource = ds;
                DataGrid1.DataBind();
            }
            else
            {
                string strHQL = "Select * from T_GoodsPurRecord where POID = " + strPOID + " Order by ID DESC";
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurRecord");

                DataGrid1.DataSource = ds;
                DataGrid1.DataBind();
            }
        }

    }

    protected decimal GetGoodsStockTotalNumber(string strGoodsCode, string strBrand, string strModelNumber, string strSpec)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(Number),0) From T_Goods Where GoodsCode = '" + strGoodsCode + "' and Manufacturer = '" + strBrand + "' and ModelNumber = '" + strModelNumber + "' and Spec = '" + strSpec + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");

        try
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        catch
        {
            return 0;
        }
    }
}
