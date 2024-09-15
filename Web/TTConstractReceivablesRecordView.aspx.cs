using System;
using System.Resources;
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

public partial class TTConstractReceivablesRecordView : System.Web.UI.Page
{
    string strReceivablesID, strConstractCode, strReceivablesCurrency;
    decimal deReceivablesAmount = 0, deReceivablesExchangeRate = 1;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = Session["UserCode"].ToString();
        string strUserName = Session["UserName"].ToString();
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        strReceivablesID = Request.QueryString["ReceivablesID"];

        strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.ID = " + strReceivablesID;
        ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
        lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        ConstractReceivables constractReceivables = (ConstractReceivables)lst[0];

        strConstractCode = constractReceivables.ConstractCode.Trim();
        deReceivablesAmount = constractReceivables.ReceivablesAccount;
        strReceivablesCurrency = constractReceivables.CurrencyType.Trim();
        deReceivablesExchangeRate = ShareClass.GetExchangeRateByCurrencyType(strReceivablesCurrency);

        //this.Title = "收款计划：" + strReceivablesID + " 执行情况";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadConstractReceivablesRecord(strReceivablesID);

            CountAndUpdateReceivablesAmount(strReceivablesID);
        }
    }


    protected void CountAndUpdateReceivablesAmount(string strReceivablesID)
    {
        string strHQL;
        IList lst;

        decimal deReceiverAmount = 0, deInvoiceAccount = 0, deExchangeRate = 1;

        strHQL = "from ConstractReceivablesRecord as constractReceivablesRecord where constractReceivablesRecord.ReceivablesID = " + strReceivablesID;
        ConstractReceivablesRecordBLL constractReceivablesRecordBLL = new ConstractReceivablesRecordBLL();
        lst = constractReceivablesRecordBLL.GetAllConstractReceivablesRecords(strHQL);

        ConstractReceivablesRecord constractReceivablesRecord = new ConstractReceivablesRecord();

        for (int i = 0; i < lst.Count; i++)
        {
            constractReceivablesRecord = (ConstractReceivablesRecord)lst[i];

            deExchangeRate = constractReceivablesRecord.ExchangeRate;

            deReceiverAmount += constractReceivablesRecord.ReceiverAccount * deExchangeRate;
            deInvoiceAccount += constractReceivablesRecord.InvoiceAccount * deExchangeRate;
        }

        LB_ReceivablesAmount.Text = deReceivablesAmount.ToString("f2");
        LB_ReceiverAmount.Text = (deReceiverAmount / deReceivablesExchangeRate).ToString("f2");
        LB_UNReceiverAmount.Text = (deReceivablesAmount - deReceiverAmount / deReceivablesExchangeRate).ToString("f2");
    }



    protected void LoadConstractReceivablesRecord(string strReceivablesID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractReceivablesRecord as constractReceivablesRecord where constractReceivablesRecord.ReceivablesID = " + strReceivablesID;
        ConstractReceivablesRecordBLL constractReceivablesRecordBLL = new ConstractReceivablesRecordBLL();
        lst = constractReceivablesRecordBLL.GetAllConstractReceivablesRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

}
