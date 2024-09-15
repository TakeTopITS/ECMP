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
using System.IO;


using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTPurchaseOrderDetailView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strPOID = Request.QueryString["POID"].Trim();

        string strUserCode = Session["UserCode"].ToString();if (Page.IsPostBack != true)
        {
            string strHQL = "Select * from T_AssetPurRecord where POID = " + strPOID + " Order by ID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_AssetPurRecord");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();
        }
        
    }
}
