using System; using System.Resources;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTConstractPayableRecordView : System.Web.UI.Page
{
    string strPayableID, strConstractCode, strPayableCurrency;
    decimal dePayableAmount = 0, dePayableCurrencyExchangeRate = 1;
    string strRelatedType;
    int intRelatedID = 0;
    string strPayAccountCode, strPayAccount, strCurrencyType;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = Session["UserCode"].ToString();
        string strUserName = Session["UserName"].ToString();
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        strPayableID = Request.QueryString["PayableID"];

        strHQL = "from ConstractPayable as constractPayable where constractPayable.ID = " + strPayableID;
        ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
        lst = constractPayableBLL.GetAllConstractPayables(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        ConstractPayable constractPayable = (ConstractPayable)lst[0];

        strConstractCode = constractPayable.ConstractCode.Trim();
        dePayableAmount = constractPayable.PayableAccount;
        strRelatedType = constractPayable.RelatedType.Trim();
        intRelatedID = constractPayable.RelatedID;
        strPayAccountCode = constractPayable.AccountCode.Trim();
        strPayAccount = constractPayable.Account.Trim();
        strPayableCurrency = constractPayable.CurrencyType.Trim();
        dePayableCurrencyExchangeRate = ShareClass.GetExchangeRateByCurrencyType(strPayableCurrency);

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadConstractPayableRecord(strPayableID);

            CountAndUpdatePayableAmount(strPayableID);
        }
    }

    protected void CountAndUpdatePayableAmount(string strPayableID)
    {
        string strHQL;
        IList lst;

        decimal deHomeOutOfPocketAmount = 0, deInvoiceAccount = 0, deExchangeRate = 1;

        strHQL = "from ConstractPayableRecord as constractPayableRecord where constractPayableRecord.PayableID = " + strPayableID;
        ConstractPayableRecordBLL constractPayableRecordBLL = new ConstractPayableRecordBLL();
        lst = constractPayableRecordBLL.GetAllConstractPayableRecords(strHQL);

        ConstractPayableRecord constractPayableRecord = new ConstractPayableRecord();

        for (int i = 0; i < lst.Count; i++)
        {
            constractPayableRecord = (ConstractPayableRecord)lst[i];

            deExchangeRate = constractPayableRecord.ExchangeRate;
            deHomeOutOfPocketAmount += constractPayableRecord.HomeCurrencyAmount;
            deInvoiceAccount += constractPayableRecord.InvoiceAccount * deExchangeRate;
        }

        LB_PayableAmount.Text = dePayableAmount.ToString();
        LB_OutOfPocketAmount.Text = (deHomeOutOfPocketAmount / dePayableCurrencyExchangeRate).ToString();
        LB_UNOutOfPocketAmount.Text = (dePayableAmount - deHomeOutOfPocketAmount / dePayableCurrencyExchangeRate).ToString();
    }


    protected void LoadConstractPayableRecord(string strPayableID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractPayableRecord as constractPayableRecord where constractPayableRecord.PayableID = " + strPayableID;
        ConstractPayableRecordBLL constractPayableRecordBLL = new ConstractPayableRecordBLL();
        lst = constractPayableRecordBLL.GetAllConstractPayableRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

}
