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

public partial class TTGoodsSaleQuotationOrderDetailView : System.Web.UI.Page
{
    string strQOID;

    protected void Page_Load(object sender, EventArgs e)
    {

        strQOID = Request.QueryString["QOID"];

        string strUserCode = Session["UserCode"].ToString(); if (Page.IsPostBack != true)
        {

            LoadGoodsSaleQuotationOrderDetail(strQOID);
        }
    }


    protected void LoadGoodsSaleQuotationOrderDetail(string strQOID)
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
            string strHQL = "Select * from T_GoodsSaleQuotationOrderDetail where QOID = " + strQOID + " Order by ID DESC";

            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSaleQuotationOrder");
            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
        }
    }
}