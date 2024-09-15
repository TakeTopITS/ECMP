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

public partial class TTGoodsCheckOutNoticeOrderDetailView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strCOOID = Request.QueryString["COOID"];

        if (Page.IsPostBack != true)
        {
            LoadGoodsCheckOutNoticeOrderDetail(strCOOID);
        }
    }

    protected void LoadGoodsCheckOutNoticeOrderDetail(string strCOOID)
    {
        string strHQL = "Select * from T_GoodsCheckOutNoticeOrderDetail where COOID = " + strCOOID + " Order by ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsCheckOutNoticeOrderDetail");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}