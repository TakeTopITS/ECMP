using System;
using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Collections;
using System.Data;
using System.Drawing;

public partial class TTWZPurchaseApplyDetailBrowse : System.Web.UI.Page
{
    string strUserCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (!IsPostBack)
        {
            if (Request.QueryString["PurchaseCode"] != null)
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
        #region 正式版

        string strWZPurchaseDetailHQL = string.Format(@"select o.*,s.UnitName,p.PlanCode from T_WZPurchaseOfferRecord o
                    left join T_WZSpan s on o.Unit = s.ID 
                    left join T_WZPickingPlanDetail p on o.PlanDetailID = p.ID
                    where o.SupplierCode = '{0}'
                    and o.PurchaseCode = '{1}'", strSupplierCode, strPurchaseCode);

        #endregion

        DataTable dtPurchaseDetail = ShareClass.GetDataSetFromSql(strWZPurchaseDetailHQL, "PurchaseDetail").Tables[0];

        DG_PurchaseDetail.DataSource = dtPurchaseDetail;
        DG_PurchaseDetail.DataBind();

        LB_Sql.Text = strWZPurchaseDetailHQL;
    }

    protected void DG_PurchaseDetail_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DG_PurchaseDetail.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text.Trim();
        DataTable dtPurchaseDetail = ShareClass.GetDataSetFromSql(strHQL, "PurchaseDetail").Tables[0];

        DG_PurchaseDetail.DataSource = dtPurchaseDetail;
        DG_PurchaseDetail.DataBind();
    }


}