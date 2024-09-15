using System; using System.Resources;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZRequestPrintPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();if (!IsPostBack)
        {
            if (Request.QueryString["requestCode"] != null)
            {
                string strRequestCodes = Request.QueryString["requestCode"];

                if (!string.IsNullOrEmpty(strRequestCodes))
                {
                    string[] arrRequestCode = strRequestCodes.Split(',');
                    string strRequests = string.Empty;
                    for (int i = 0; i < arrRequestCode.Length; i++)
                    {
                        if (!string.IsNullOrEmpty(arrRequestCode[i]))
                        {
                            strRequests += "'" + arrRequestCode[i] + "',";
                        }
                    }
                    strRequests = strRequests.EndsWith(",") ? strRequests.TrimEnd(',') : strRequests;
                    DataRequestBinder(strRequests);
                }
            }
        }
    }


    private void DataRequestBinder(string strRequestCodes)
    {
        string strRequestHQL = string.Format(@"select r.*,s.SupplierName,s.OpeningBank,s.AccountNumber from T_WZRequest r
                    left join T_WZSupplier s on r.SupplierCode = s.SupplierCode
                    where r.RequestCode in ({0})", strRequestCodes);
        DataTable dtRequest = ShareClass.GetDataSetFromSql(strRequestHQL, "Request").Tables[0];

        RT_Request.DataSource = dtRequest;
        RT_Request.DataBind();
    }

}