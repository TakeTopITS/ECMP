using ProjectMgt.BLL;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZSelectorSupplierDecision : System.Web.UI.Page
{
    string strUserCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();

        if (!IsPostBack)
        {
            if (Request.QueryString["PurchaseCode"] != null)
            {
                string strPurchaseCode = Request.QueryString["PurchaseCode"];

                HF_PurchaseCode.Value = strPurchaseCode;

                DataBinder(strPurchaseCode);
            }
        }
    }

    private void DataBinder(string strPurchaseCode)
    {


//        string strPurchaseHQL = string.Format(@"select p.*,a.SupplierCode,a.SumApplyMoney,COALESCE(c.ExpertCode, '没有') as IsSelect,c.Suggest from
//                                                (
//                                                select t.SupplierCode,t.PurchaseCode,Sum(t.ApplyMoney) as SumApplyMoney from
//                            (
//                            select ld.SupplierCode,ld.PurchaseCode,COALESCE(ld.ApplyMoney,0)*lp.PurchaseNumber  as ApplyMoney  from T_WZSupplierApplyDetail ld
//                            left join T_WZPurchaseDetail lp on ld.PurchaseDetailID = lp.ID
//                            ) t
//                            where t.PurchaseCode = '{0}'
//                            group by t.PurchaseCode,t.SupplierCode
//                                                ) a 
//                                                left join T_WZPurchase p on a.PurchaseCode = p.PurchaseCode
//                                                left join T_WZSupplierApplyComment c on c.PurchaseCode = a.PurchaseCode
//                                                and c.ExpertCode = a.SupplierCode
//                                                where p.PurchaseCode = '{0}'", strPurchaseCode);


//        string strPurchaseHQL = string.Format(@"select p.*,c.ExpertCode,c.SupplierCode as SelectSupplierCode,c.Suggest,a.SumApplyMoney from T_WZSupplierApplyComment c
//                            left join 
//                            (
//                            select t.SupplierCode,t.PurchaseCode,Sum(t.ApplyMoney) as SumApplyMoney from
//                            (
//                            select ld.SupplierCode,ld.PurchaseCode,COALESCE(ld.ApplyMoney,0)*lp.PurchaseNumber  as ApplyMoney  from T_WZSupplierApplyDetail ld
//                            left join T_WZPurchaseDetail lp on ld.PurchaseDetailID = lp.ID
//                            ) t
//                            where t.PurchaseCode = '{0}'
//                            group by t.PurchaseCode,t.SupplierCode
//                            ) a
//                            on c.PurchaseCode = a.PurchaseCode
//                            and c.ExpertCode = a.SupplierCode
//                            left join T_WZPurchase p
//                            on p.PurchaseCode = c.PurchaseCode
//                            where c.PurchaseCode ='{0}'", strPurchaseCode);


//        string strPurchaseHQL = string.Format(@"select p.*,a.SupplierCode,a.SumApplyMoney,COALESCE(c.ExpertCode, '没有') as IsSelect,c.Suggest from
//                            (
//                            select t.SupplierCode,t.PurchaseCode,Sum(t.ApplyMoney) as SumApplyMoney from
//                            (
//                            select ld.SupplierCode,ld.PurchaseCode,COALESCE(ld.ApplyMoney,0)*lp.PurchaseNumber  as ApplyMoney  from T_WZSupplierApplyDetail ld
//                            left join T_WZPurchaseDetail lp on ld.PurchaseDetailID = lp.ID
//                            left join T_WZPurchaseSupplier ps on ps.PurchaseCode = ld.PurchaseCode
//                            and ps.SupplierCode = ld.SupplierCode
//                            where ps.IsConfirm = '1'
//                            ) t
//                            where t.PurchaseCode = '{0}'
//                            group by t.PurchaseCode,t.SupplierCode
//                            ) a 
//                            left join T_WZPurchase p on a.PurchaseCode = p.PurchaseCode
//                            left join T_WZSupplierApplyComment c on c.PurchaseCode = a.PurchaseCode
//                            and c.ExpertCode = a.SupplierCode
//                            where p.PurchaseCode = '{0}'", strPurchaseCode);

        string strPurchaseHQL = string.Format(@"select ps.*,COALESCE(t.SelectCount,0) as SelectCount from T_WZPurchaseSupplier ps
                                left join 
                                (
                                select PurchaseCode,SupplierCode,count(1) as SelectCount from T_WZSupplierApplyComment
                                group by PurchaseCode,SupplierCode
                                ) t
                                on ps.PurchaseCode = t.PurchaseCode
                                and ps.SupplierCode = t.SupplierCode
                                where ps.PurchaseCode = '{0}'
                                and ps.IsConfirm = '1'", strPurchaseCode);

        DataTable dtPurchase = ShareClass.GetDataSetFromSql(strPurchaseHQL, "Purchase").Tables[0];

        DG_List.DataSource = dtPurchase;
        DG_List.DataBind();
    }
}