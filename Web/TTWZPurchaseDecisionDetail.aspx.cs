using System; using System.Resources;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZPurchaseDecisionDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PurchaseCode"]) && !string.IsNullOrEmpty(Request.QueryString["SupplierCode"]))
            {
                string strPurchaseCode = Request.QueryString["PurchaseCode"];
                string strSupplierCode = Request.QueryString["SupplierCode"];

                HF_PurchaseCode.Value = strPurchaseCode;
                HF_SupplierCode.Value = strSupplierCode;


                DataPurchaseDetailBinder(strPurchaseCode, strSupplierCode);
            }
        }
    }


    private void DataPurchaseDetailBinder(string strPurchaseCode, string strSupplierCode)
    {
        //    string strWZPurchaseDetailHQL = string.Format(@"select d.*,COALESCE(a.ApplyMoney,0) as SupplierApplyMoney,a.SupplierCode as CurrrentSupplierCode,
        //                            s.SupplierName as CurrentSupplierName,o.ObjectName from T_WZPurchaseDetail d
        //                            left join T_WZSupplierApplyDetail a on d.ID = a.PurchaseDetailID
        //                            and a.SupplierCode = '{1}'
        //                            left join T_WZSupplier s on a.SupplierCode = s.SupplierCode
        //                            left join T_WZObject o on d.ObjectCode = o.ObjectCode
        //                            where d.PurchaseCode = '{0}'
        //                            ", strPurchaseCode, strSupplierCode);


        string strWZPurchaseDetailHQL = string.Format(@"select d.*,COALESCE(a.ApplyMoney,0) as SupplierApplyMoney,a.SupplierCode as CurrrentSupplierCode,
                                s.SupplierName as CurrentSupplierName,o.ObjectName from T_WZPurchaseDetail d
                                left join T_WZPurchaseOfferRecord a on d.ID = a.PurchaseDetailID
                                and a.SupplierCode = '{1}'
                                left join T_WZSupplier s on a.SupplierCode = s.SupplierCode
                                left join T_WZObject o on d.ObjectCode = o.ObjectCode
                                where d.PurchaseCode = '{0}'
                                ", strPurchaseCode, strSupplierCode);
    DataTable dtPurchaseDetail = ShareClass.GetDataSetFromSql(strWZPurchaseDetailHQL, "PurchaseDetail").Tables[0];

        DG_PurchaseDetail.DataSource = dtPurchaseDetail;
        DG_PurchaseDetail.DataBind();
    }


}