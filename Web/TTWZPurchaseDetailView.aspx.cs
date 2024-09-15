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


public partial class TTWZPurchaseDetailView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            if (Request.QueryString["PurchaseCode"] != null)
            {
                string strPurchaseCode = Request.QueryString["PurchaseCode"];

                HF_PurchaseCode.Value = strPurchaseCode;

                DataPurchaseDetailBinder(strPurchaseCode);
            }
        }
    }


    private void DataPurchaseDetailBinder(string strPurchaseCode)
    {
        string strWZPurchaseDetailHQL = string.Format(@"select d.*,p.PlanCode,o.ObjectName,o.Model,o.Criterion,o.Grade,s.UnitName from T_WZPurchaseDetail d
                                left join T_WZPickingPlanDetail p on d.PlanDetailID = p.ID
                                left join T_WZObject o on d.ObjectCode = o.ObjectCode
                                left join T_WZSpan s on o.Unit = s.ID
                                where d.PurchaseCode= '{0}'
                                order by o.DLCode,o.ObjectName,o.Model", strPurchaseCode);
        DataTable dtWZPurchaseDetail = ShareClass.GetDataSetFromSql(strWZPurchaseDetailHQL, "PurchaseDetail").Tables[0];

        DG_PurchaseDetail.DataSource = dtWZPurchaseDetail;
        DG_PurchaseDetail.DataBind();

        LB_Sql.Text = strWZPurchaseDetailHQL;
    }


    protected void DG_PurchaseDetail_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DG_PurchaseDetail.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql.Text.Trim();
        DataTable dtWZPurchaseDetail = ShareClass.GetDataSetFromSql(strHQL, "PurchaseDetail").Tables[0];

        DG_PurchaseDetail.DataSource = dtWZPurchaseDetail;
        DG_PurchaseDetail.DataBind();
    }

}
    

