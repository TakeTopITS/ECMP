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

public partial class TTGoodsReturnOrderDetailView : System.Web.UI.Page
{
    string strROID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strROID = Request.QueryString["ROID"];


        if (Page.IsPostBack != true)
        {
            try
            {
                LoadGoodsReturnOrderDetail(strROID);
            }
            catch
            {

            }
        }
    }
    protected void LoadGoodsReturnOrderDetail(string strROID)
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
            string strHQL = "Select * from T_GoodsReturnDetail where ROID = " + strROID + " Order by ID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsReturnDetail");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
        }
    }
}


