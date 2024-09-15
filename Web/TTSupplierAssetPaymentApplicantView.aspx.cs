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


public partial class TTSupplierAssetPaymentApplicantView : System.Web.UI.Page
{
    string strAOID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strAOID = Request.QueryString["AOID"];

        //this.Title = "物料入库单";


        if (Page.IsPostBack != true)
        {
            LoadSupplierAssetPaymentApplicant(strAOID);

            LoadSupplierAssetPaymentApplicantDetail(strAOID);
        }
    }

    protected void LoadSupplierAssetPaymentApplicant(string strAOID)
    {
        string strHQL;
        IList lst;

        strHQL = "from SupplierAssetPaymentApplicant as supplierAssetPaymentApplicant where supplierAssetPaymentApplicant.AOID= " + strAOID;

        SupplierAssetPaymentApplicantBLL supplierAssetPaymentApplicantBLL = new SupplierAssetPaymentApplicantBLL();
        lst = supplierAssetPaymentApplicantBLL.GetAllSupplierAssetPaymentApplicants(strHQL);

        DataList1.DataSource = lst;
        DataList1.DataBind();

        SupplierAssetPaymentApplicant supplierAssetPaymentApplicant = (SupplierAssetPaymentApplicant)lst[0];

        LB_CurrentTotalPaymentAmount.Text = supplierAssetPaymentApplicant.CurrentTotalPaymentAmount.ToString();

        LB_CurrentTotalPaymentAmountLarge.Text = ShareClass.RMBCapitalization.RMBAmount(double.Parse(supplierAssetPaymentApplicant.CurrentTotalPaymentAmount.ToString()));

    }

    protected void LoadSupplierAssetPaymentApplicantDetail(string strAOID)
    {
        string strHQL = "Select * from T_SupplierAssetPaymentApplicantDetail where AOID = " + strAOID + " Order by ID ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_SupplierAssetPaymentApplicantDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}


