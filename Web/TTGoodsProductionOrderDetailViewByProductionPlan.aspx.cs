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

public partial class TTGoodsProductionOrderDetailViewByProductionPlan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strSourceType = Request.QueryString["SourceType"].Trim();
        string strSourceID = Request.QueryString["SourceID"].Trim();

         string strUserCode = Session["UserCode"].ToString();if (Page.IsPostBack != true)
        {
            string strHQL = "Select A.*,B.PDName from T_GoodsProductionOrderDetail A,T_GoodsProductionOrder B where A.PDID = B.PDID and A.SourceType = " + "'" + strSourceType + "'" + " and A.SourceID = " + strSourceID + " Order by A.ID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsProductionOrderDetail");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
        }
    }
}
