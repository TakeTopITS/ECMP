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


public partial class TTGoodsApplicationOrderView : System.Web.UI.Page
{
    string strAAID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strAAID = Request.QueryString["AAID"];

        if (Page.IsPostBack != true)
        {
            LoadGoodsApplication(strAAID);
            LoadGoodsApplicationDetail(strAAID);
        }
    }

    protected void LoadGoodsApplication(string strAAID)
    {
        string strHQL;
        IList lst;


        strHQL = "from GoodsApplication as goodsApplication where goodsApplication.AAID = " + strAAID;
        GoodsApplicationBLL goodsApplicationBLL = new GoodsApplicationBLL();
        lst = goodsApplicationBLL.GetAllGoodsApplications(strHQL);
        GoodsApplication goodsApplication = (GoodsApplication)lst[0];

        DataList1.DataSource = lst;
        DataList1.DataBind();

        Img_BarCode.ImageUrl = ShareClass.GenerateQrCodeImage(ShareClass.GetBarType(),goodsApplication.GAAName.Trim(), 200, 200);
    }

    protected void LoadGoodsApplicationDetail(string strAAID)
    {
        string strHQL = "Select * from T_GoodsApplicationDetail where AAID = " + strAAID + " Order by ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsApplicationDetail");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }



}