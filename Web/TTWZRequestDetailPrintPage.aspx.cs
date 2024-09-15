using System; using System.Resources;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZRequestDetailPrintPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            if (Request.QueryString["requestCode"] != null)
            {
                string strRequestCodes = Request.QueryString["requestCode"];

                DataRequestBinder(strRequestCodes);

                LT_RequestCode.Text = strRequestCodes;
            }
        }
    }


    private void DataRequestBinder(string strRequestCode)
    {
        string strRequestHQL = string.Format(@"select r.*,s.SupplierName,s.OpeningBank,s.AccountNumber from T_WZRequest r
                    left join T_WZSupplier s on r.SupplierCode = s.SupplierCode
                    where r.RequestCode = '{0}'", strRequestCode);
        DataTable dtRequest = ShareClass.GetDataSetFromSql(strRequestHQL, "Request").Tables[0];
        if (dtRequest != null && dtRequest.Rows.Count > 0)
        {
            DataRow drRequest = dtRequest.Rows[0];

            LT_SupplierName.Text = ShareClass.ObjectToString(drRequest["SupplierName"]);
            LT_OpeningBank.Text = ShareClass.ObjectToString(drRequest["OpeningBank"]);
            LT_RequestTime.Text = ShareClass.ObjectToString(drRequest["RequestTime"]);
            LT_CompactCode.Text = ShareClass.ObjectToString(drRequest["CompactCode"]);
            LT_AccountNumber.Text = ShareClass.ObjectToString(drRequest["AccountNumber"]);
            LT_CurrentTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            LT_Progress.Text = ShareClass.ObjectToString(drRequest["Progress"]);
            LT_Borrower.Text = ShareClass.ObjectToString(drRequest["Borrower"]);
            LT_Approver.Text = ShareClass.ObjectToString(drRequest["Approver"]);
        }

        string strRequestCollectHQL = string.Format(@"select c.*,o.Model,o.ObjectName,dl.DLCode,dl.DLName,s.UnitName,pd.PlanCost from T_WZCollect c
                    left join T_WZObject o on c.ObjectCode = o.ObjectCode
                    left join T_WZMaterialDL dl on o.DLCode = dl.DLCode
                    left join T_WZSpan s on o.Unit = s.ID
                    left join T_WZPickingPlanDetail pd on c.PlanDetailID = pd.ID
                    where c.RequestCode = '{0}'", strRequestCode);
        DataTable dtRequestCollect = ShareClass.GetDataSetFromSql(strRequestCollectHQL, "RequestCollect").Tables[0];

        RT_Request.DataSource = dtRequestCollect;
        RT_Request.DataBind();

        decimal decimalTotalActualNumber = 0;
        decimal decimalTotalActualMoney = 0;
        decimal decimalTotalRatioMoney = 0;
        decimal decimalTotalFreight = 0;
        decimal decimalTotalOtherObject = 0;
        decimal decimalTotalPlanCost = 0;
        if (dtRequestCollect != null && dtRequestCollect.Rows.Count > 0)
        {
            foreach (DataRow drRequestCollect in dtRequestCollect.Rows)
            {
                decimal decimalActualNumber = 0;
                decimal.TryParse(ShareClass.ObjectToString(drRequestCollect["ActualNumber"]), out decimalActualNumber);
                decimalTotalActualNumber += decimalActualNumber;
                decimal decimalActualMoney = 0;
                decimal.TryParse(ShareClass.ObjectToString(drRequestCollect["ActualMoney"]), out decimalActualMoney);
                decimalTotalActualMoney += decimalActualMoney;
                decimal decimalRatioMoney = 0;
                decimal.TryParse(ShareClass.ObjectToString(drRequestCollect["RatioMoney"]), out decimalRatioMoney);
                decimalTotalRatioMoney += decimalRatioMoney;
                decimal decimalFreight = 0;
                decimal.TryParse(ShareClass.ObjectToString(drRequestCollect["Freight"]), out decimalFreight);
                decimalTotalFreight += decimalFreight;
                decimal decimalOtherObject = 0;
                decimal.TryParse(ShareClass.ObjectToString(drRequestCollect["OtherObject"]), out decimalOtherObject);
                decimalTotalOtherObject += decimalOtherObject;
                decimal decimalPlanCost = 0;
                decimal.TryParse(ShareClass.ObjectToString(drRequestCollect["PlanCost"]), out decimalPlanCost);
                decimalTotalPlanCost += decimalPlanCost;
            }
        }
        LT_TotalActualNumber.Text = decimalTotalActualNumber.ToString();
        LT_TotalActualMoney.Text = decimalTotalActualMoney.ToString();
        LT_TotalRatioMoney.Text = decimalTotalRatioMoney.ToString();
        LT_TotalFreight.Text = decimalTotalFreight.ToString();
        LT_TotalOtherObject.Text = decimalTotalOtherObject.ToString();
        LT_TotalPlanCost.Text = decimalTotalPlanCost.ToString();
    }
}