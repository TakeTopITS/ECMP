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

using TakeTopCore;

public partial class TTReceivablesPayableHandleForPlan : System.Web.UI.Page
{
    string strRelatedType, strRelatedID, strRelatedPlanID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];
        strRelatedPlanID = Request.QueryString["RelatedPlanID"];

        string strUserCode = Session["UserCode"].ToString();
        string strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        //ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "库存管理", strUserCode);
        //if (blVisible == false)
        //{
        //    Response.Redirect("TTDisplayErrors.aspx");
        //    return;
        //}

        if (strRelatedID == null & strRelatedType == null)
        {
            strRelatedType = "Other";
            strRelatedID = "0";
        }

        if (strRelatedType != null & strRelatedPlanID !=  null & strRelatedID == null)
        {
            strRelatedID = ShareClass.getProjectIDByPlanID(strRelatedPlanID);
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_PayableTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_ReceivablesTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            if (strRelatedPlanID == null)
            {
                strRelatedPlanID = "0";
                LB_PayableRelatedPlanID.Text = strRelatedPlanID;
                LB_PayableRelatedPlanName.Text = "";

                LB_ReceivablesRelatedPlanID.Text = strRelatedPlanID;
                LB_ReceivablesRelatedPlanName.Text = "";
            }
            else
            {
                BT_PayableSelectPJPlan.Enabled = false;
                BT_ReceivablesSelectPJPlan.Enabled = false;

                strRelatedType = "Project";
                strRelatedID = ShareClass.getProjectIDByPlanID(strRelatedPlanID);

                try
                {
                    LB_PayableRelatedPlanID.Text = strRelatedPlanID;
                    LB_ReceivablesRelatedPlanID.Text = strRelatedPlanID;

                    LB_PayableRelatedPlanName.Text = ShareClass.GetProjectPlanDetail(strRelatedPlanID);
                    LB_ReceivablesRelatedPlanName.Text = ShareClass.GetProjectPlanDetail(strRelatedPlanID);
                }
                catch
                {
                    LB_PayableRelatedPlanName.Text = "";
                    LB_ReceivablesRelatedPlanName.Text = "";
                }
            }

            LoadConstractReceivables(strRelatedType, strRelatedID, strRelatedPlanID, strUserCode);
            LoadConstractPayable(strRelatedType, strRelatedID, strRelatedPlanID, strUserCode);

            LoadConstractReceivablesPayer(strUserCode);
            LoadConstractPayableReceiver(strUserCode);

            CountReceivablesAmount(strRelatedType, strRelatedID, strRelatedPlanID, strUserCode);
            CountPayableAmount(strRelatedType, strRelatedID, strRelatedPlanID, strUserCode);

            ShareClass.LoadAccountForDDL(DL_ReceiveAccount);
            ShareClass.LoadAccountForDDL(DL_PayAccount);

            TB_ReceivablesOperatorCode.Text = strUserCode;
            LB_ReceivablesOperatorName.Text = strUserName;
            TB_PayableOperatorCode.Text = strUserCode;
            LB_PayableOperatorName.Text = strUserName;

            ShareClass.LoadCurrencyType(DL_ReceiveCurrencyType);
            ShareClass.LoadCurrencyType(DL_PayableCurrencyType);
        }
    }

    protected void BT_CreateReceivables_Click(object sender, EventArgs e)
    {
        LB_ReceivablesID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popReceivablesWindow','false') ", true);
    }

    protected void BT_Receivables_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ReceivablesID.Text.Trim();

        if (strID == "")
        {
            AddReceivables();
        }
        else
        {
            UpdateReceivables();
        }
    }

    protected void AddReceivables()
    {
        string strReceivableID;
        string strOperatorCode, strOperatorName;
        string strConstractCode, strBillCode, strRecorderCode, strRecorderName, strReceiveAccount;
        DateTime dtReceivablesTime, dtReceiverTime;
        decimal deReceivablesAccount, deReceiverAccount, DeInvoiceAccount;
        decimal dePreDays;
        string strStatus, strPayer, strReceiveComment;

        strConstractCode = LB_ConstractCode.Text.Trim();
        strBillCode = TB_ReceivablesBillCode.Text.Trim();
        strRecorderCode = LB_UserCode.Text.Trim();
        strRecorderName = LB_UserName.Text.Trim();
        dtReceiverTime = DateTime.Now;

        strReceiveAccount = TB_ReceiveAccount.Text.Trim();
        dtReceivablesTime = DateTime.Parse(DLC_ReceivablesTime.Text);

        deReceivablesAccount = NB_ReceivablesAccount.Amount;
        deReceiverAccount = 0;
        DeInvoiceAccount = 0;

        strOperatorCode = TB_ReceivablesOperatorCode.Text.Trim();
        try
        {
            strOperatorName = ShareClass.GetUserName(strOperatorCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBDJRYDMCWCWCRJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popReceivablesWindow','true') ", true);

            return;
        }

        dePreDays = NB_ReceivablesPreDays.Amount;
        strStatus = DL_ReceivablesStatus.SelectedValue;
        strPayer = TB_Payer.Text.Trim();
        strReceiveComment = TB_ReceiveComment.Text.Trim();

        ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
        ConstractReceivables constractReceivables = new ConstractReceivables();

        constractReceivables.ConstractCode = strConstractCode;
        constractReceivables.BillCode = strBillCode;

        constractReceivables.ReceivablesAccount = deReceivablesAccount;
        constractReceivables.ReceivablesTime = dtReceivablesTime;
        constractReceivables.Account = strReceiveAccount;
        constractReceivables.ReceiverAccount = deReceiverAccount;
        constractReceivables.ReceiverTime = dtReceiverTime;
        constractReceivables.InvoiceAccount = DeInvoiceAccount;
        constractReceivables.UNReceiveAmount = deReceivablesAccount - deReceiverAccount;
        constractReceivables.CurrencyType = DL_ReceiveCurrencyType.SelectedValue;

        constractReceivables.Payer = strPayer;
        constractReceivables.OperatorCode = strOperatorCode;
        constractReceivables.OperatorName = strOperatorName;
        constractReceivables.OperateTime = DateTime.Now;
        constractReceivables.PreDays = int.Parse(dePreDays.ToString());
        constractReceivables.Status = strStatus;
        constractReceivables.Comment = strReceiveComment;

        constractReceivables.RelatedType = strRelatedType;
        constractReceivables.RelatedID = int.Parse(strRelatedID);

        if (LB_ReceivablesRelatedPlanID.Text.Trim() != "")
        {
            constractReceivables.RelatedPlanID = int.Parse(LB_ReceivablesRelatedPlanID.Text.Trim());
        }
        else
        {
            constractReceivables.RelatedPlanID = 0;
        }

        if (strRelatedType == "Project")
        {
            constractReceivables.RelatedProjectID = int.Parse(strRelatedID);
        }
        else
        {
            constractReceivables.RelatedProjectID = 1;
        }

        constractReceivables.AccountCode = string.IsNullOrEmpty(lbl_AccountCode.Text) ? "" : lbl_AccountCode.Text.Trim();
        constractReceivables.ExchangeRate = ShareClass.GetCurrencyTypeExchangeRate(constractReceivables.CurrencyType.Trim());

        try
        {
            constractReceivablesBLL.AddConstractReceivables(constractReceivables);
            strReceivableID = ShareClass.GetMyCreatedMaxConstractReceivablePlanID(strRelatedType, strRelatedID);
            LB_ReceivablesID.Text = strReceivableID;

            LoadConstractReceivables(strRelatedType, strRelatedID, strRelatedPlanID, strOperatorCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popReceivablesWindow','true') ", true);
        }
    }

    protected void UpdateReceivables()
    {
        string strHQL;
        IList lst;

        string strID, strOperatorCode, strOperatorName;
        string strConstractCode, strBillCode, strRecorderCode, strRecorderName, strReceiveAccount;
        DateTime dtReceivablesTime;
        decimal deReceivablesAccount;
        decimal dePreDays;
        string strStatus, strPayer, strReceiveComment;

        strID = LB_ReceivablesID.Text.Trim();
        strConstractCode = LB_ConstractCode.Text.Trim();
        strBillCode = TB_ReceivablesBillCode.Text.Trim();
        strRecorderCode = LB_UserCode.Text.Trim();
        strRecorderName = LB_UserName.Text.Trim();

        strReceiveAccount = TB_ReceiveAccount.Text.Trim();

        dtReceivablesTime = DateTime.Parse(DLC_ReceivablesTime.Text);

        deReceivablesAccount = NB_ReceivablesAccount.Amount;

        strOperatorCode = TB_ReceivablesOperatorCode.Text.Trim();
        try
        {
            strOperatorName = ShareClass.GetUserName(strOperatorCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXGSBDJRYDMCWCWCRJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popReceivablesWindow','true') ", true);

            return;
        }

        dePreDays = NB_ReceivablesPreDays.Amount;
        strStatus = DL_ReceivablesStatus.SelectedValue;
        strPayer = TB_Payer.Text.Trim();
        strReceiveComment = TB_ReceiveComment.Text.Trim();

        strHQL = "from  ConstractReceivables as constractReceivables where constractReceivables.ID= " + strID;
        ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
        lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);
        ConstractReceivables constractReceivables = (ConstractReceivables)lst[0];

        constractReceivables.ConstractCode = strConstractCode;
        constractReceivables.BillCode = strBillCode;

        constractReceivables.Account = strReceiveAccount;

        constractReceivables.ReceivablesAccount = deReceivablesAccount;
        constractReceivables.ReceivablesTime = dtReceivablesTime;

        constractReceivables.UNReceiveAmount = deReceivablesAccount - constractReceivables.ReceiverAccount;
        constractReceivables.CurrencyType = DL_ReceiveCurrencyType.SelectedValue;

        constractReceivables.Payer = strPayer;
        constractReceivables.OperatorCode = strOperatorCode;
        constractReceivables.OperatorName = strOperatorName;
        constractReceivables.PreDays = int.Parse(dePreDays.ToString());
        constractReceivables.Status = strStatus;
        constractReceivables.Comment = strReceiveComment;

        constractReceivables.RelatedType = strRelatedType;
        constractReceivables.RelatedID = int.Parse(strRelatedID);

        if (LB_ReceivablesRelatedPlanID.Text.Trim() != "")
        {
            Label1.Text = LB_ReceivablesRelatedPlanID.Text.Trim();
            constractReceivables.RelatedPlanID = int.Parse(LB_ReceivablesRelatedPlanID.Text.Trim());
        }
        else
        {
            constractReceivables.RelatedPlanID = 0;
        }

        if (strRelatedType == "Project")
        {
            constractReceivables.RelatedProjectID = int.Parse(strRelatedID);
        }
        else
        {
            constractReceivables.RelatedProjectID = 1;
        }

        constractReceivables.AccountCode = string.IsNullOrEmpty(lbl_AccountCode.Text) ? "" : lbl_AccountCode.Text.Trim();
        constractReceivables.ExchangeRate = ShareClass.GetCurrencyTypeExchangeRate(constractReceivables.CurrencyType.Trim());

        try
        {
            constractReceivablesBLL.UpdateConstractReceivables(constractReceivables, int.Parse(strID));
            LoadConstractReceivables(strRelatedType, strRelatedID, strRelatedPlanID, strOperatorCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popReceivablesWindow','true') ", true);
        }
    }


    protected void BT_CreatePayable_Click(object sender, EventArgs e)
    {
        LB_PayableID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popPayableWindow','true') ", true);
    }

    protected void BT_Payable_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_PayableID.Text.Trim();

        if (strID == "")
        {
            AddPayable();
        }
        else
        {
            UpdatePayable();
        }
    }

    protected void AddPayable()
    {
        string strPayableID;
        string strOperatorCode, strOperatorName;
        string strConstractCode, strBillCode, strRecorderCode, strRecorderName, strPayAccount;
        DateTime dtPayableTime, dtOutOfPocketTime;
        decimal dePayableAccount, deOutOfPocketAccount, DeInvoiceAccount;
        decimal dePreDays;
        string strStatus, strReceiver, strComment;


        strConstractCode = LB_ConstractCode.Text.Trim();
        strBillCode = TB_PayableBillCode.Text.Trim();
        strRecorderCode = LB_UserCode.Text.Trim();
        strRecorderName = LB_UserName.Text.Trim();
        dtOutOfPocketTime = DateTime.Now;

        strPayAccount = TB_PayAccount.Text.Trim();

        dtPayableTime = DateTime.Parse(DLC_PayableTime.Text);

        dePayableAccount = NB_PayableAccount.Amount;
        deOutOfPocketAccount = 0;
        DeInvoiceAccount = 0;

        strOperatorCode = TB_PayableOperatorCode.Text.Trim();
        try
        {
            strOperatorName = ShareClass.GetUserName(strOperatorCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWDJRYDMCWCWCRJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popPayableWindow','true') ", true);
            return;
        }

        dePreDays = NB_PayablePreDays.Amount;
        strStatus = DL_PayableStatus.SelectedValue;
        strReceiver = TB_Receiver.Text.Trim();
        strComment = TB_PayableComment.Text.Trim();

        ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
        ConstractPayable constractPayable = new ConstractPayable();

        constractPayable.ConstractCode = strConstractCode;
        constractPayable.BillCode = strBillCode;

        constractPayable.Account = strPayAccount;
        constractPayable.PayableAccount = dePayableAccount;
        constractPayable.PayableTime = dtPayableTime;
        constractPayable.OutOfPocketAccount = deOutOfPocketAccount;
        constractPayable.OutOfPocketTime = dtOutOfPocketTime;
        constractPayable.InvoiceAccount = DeInvoiceAccount;
        constractPayable.UNPayAmount = dePayableAccount - deOutOfPocketAccount;

        constractPayable.CurrencyType = DL_PayableCurrencyType.SelectedValue;

        constractPayable.OperatorCode = strOperatorCode;
        constractPayable.OperatorName = strOperatorName;
        constractPayable.OperateTime = DateTime.Now;
        constractPayable.PreDays = int.Parse(dePreDays.ToString());
        constractPayable.Status = strStatus;
        constractPayable.Receiver = strReceiver;
        constractPayable.Comment = strComment;
        constractPayable.RelatedType = strRelatedType;
        constractPayable.RelatedID = int.Parse(strRelatedID);

        if (LB_PayableRelatedPlanID.Text.Trim() != "")
        {
            constractPayable.RelatedPlanID = int.Parse(LB_PayableRelatedPlanID.Text.Trim());
        }
        else
        {
            constractPayable.RelatedPlanID = 0;
        }

        if (strRelatedType == "Project")
        {
            constractPayable.RelatedProjectID = int.Parse(strRelatedID);
        }
        else
        {
            constractPayable.RelatedProjectID = 1;
        }

        constractPayable.AccountCode = string.IsNullOrEmpty(lbl_AccountCode1.Text) ? "" : lbl_AccountCode1.Text.Trim();
        constractPayable.ExchangeRate = ShareClass.GetCurrencyTypeExchangeRate(constractPayable.CurrencyType.Trim());

        try
        {
            constractPayableBLL.AddConstractPayable(constractPayable);

            strPayableID = ShareClass.GetMyCreatedMaxConstractPayablePlanID(strRelatedType, strRelatedID);
            LB_PayableID.Text = strPayableID;


            LoadConstractPayable(strRelatedType, strRelatedID, strRelatedPlanID, strOperatorCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popPayableWindow','true') ", true);
        }
    }

    protected void UpdatePayable()
    {
        string strHQL;
        IList lst;

        string strID, strOperatorCode, strOperatorName;
        string strConstractCode, strBillCode, strRecorderCode, strRecorderName, strPayAccount;
        DateTime dtPayableTime;
        decimal dePayableAccount;
        decimal dePreDays;
        string strStatus, strReceiver, strComment;


        strID = LB_PayableID.Text.Trim();
        strConstractCode = LB_ConstractCode.Text.Trim();
        strBillCode = TB_PayableBillCode.Text.Trim();
        strRecorderCode = LB_UserCode.Text.Trim();
        strRecorderName = LB_UserName.Text.Trim();

        strPayAccount = TB_PayAccount.Text.Trim();

        dtPayableTime = DateTime.Parse(DLC_PayableTime.Text);

        dePayableAccount = NB_PayableAccount.Amount;

        strOperatorCode = TB_PayableOperatorCode.Text.Trim();
        try
        {
            strOperatorName = ShareClass.GetUserName(strOperatorCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWDJRYDMCWCWCRJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popPayableWindow','true') ", true);
            return;
        }
        dePreDays = NB_PayablePreDays.Amount;
        strStatus = DL_PayableStatus.SelectedValue;
        strReceiver = TB_Receiver.Text.Trim();
        strComment = TB_PayableComment.Text.Trim();

        strHQL = "from  ConstractPayable as constractPayable where constractPayable.ID= " + strID;
        ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
        lst = constractPayableBLL.GetAllConstractPayables(strHQL);
        ConstractPayable constractPayable = (ConstractPayable)lst[0];

        constractPayable.ConstractCode = strConstractCode;
        constractPayable.BillCode = strBillCode;

        constractPayable.Account = strPayAccount;

        constractPayable.PayableAccount = dePayableAccount;
        constractPayable.PayableTime = dtPayableTime;

        constractPayable.UNPayAmount = dePayableAccount - constractPayable.OutOfPocketAccount;

        constractPayable.CurrencyType = DL_PayableCurrencyType.SelectedValue;

        constractPayable.OperatorCode = strOperatorCode;
        constractPayable.OperatorName = strOperatorName;
        constractPayable.PreDays = int.Parse(dePreDays.ToString());
        constractPayable.Status = strStatus;
        constractPayable.Receiver = strReceiver;
        constractPayable.Comment = strComment;

        if (LB_PayableRelatedPlanID.Text.Trim() != "")
        {
            constractPayable.RelatedPlanID = int.Parse(LB_PayableRelatedPlanID.Text.Trim());
        }
        else
        {
            constractPayable.RelatedPlanID = 0;
        }

        constractPayable.RelatedType = strRelatedType;
        constractPayable.RelatedID = int.Parse(strRelatedID);

        constractPayable.AccountCode = string.IsNullOrEmpty(lbl_AccountCode1.Text) ? "" : lbl_AccountCode1.Text.Trim();
        constractPayable.ExchangeRate = ShareClass.GetCurrencyTypeExchangeRate(constractPayable.CurrencyType.Trim());

        try
        {
            constractPayableBLL.UpdateConstractPayable(constractPayable, int.Parse(strID));
            LoadConstractPayable(strRelatedType, strRelatedID, strRelatedPlanID, strOperatorCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popPayableWindow','true') ", true);
        }
    }


    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode, strHQL;

            string strID;

            strUserCode = LB_UserCode.Text.Trim();

            strID = e.Item.Cells[2].Text.Trim();

            if (e.CommandName == "Update")
            {
                strHQL = "from  ConstractReceivables as constractReceivables where constractReceivables.ID= " + strID;

                ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();

                IList lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);

                for (int i = 0; i < DataGrid1.Items.Count; i++)
                {
                    DataGrid1.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                ConstractReceivables constractReceivables = (ConstractReceivables)lst[0];

                LB_ReceivablesID.Text = constractReceivables.ID.ToString();

                TB_ReceivablesBillCode.Text = constractReceivables.BillCode.Trim();
                TB_ReceiveAccount.Text = constractReceivables.Account.Trim();
                NB_ReceivablesAccount.Amount = constractReceivables.ReceivablesAccount;

                DL_ReceiveCurrencyType.SelectedValue = constractReceivables.CurrencyType;

                DLC_ReceivablesTime.Text = constractReceivables.ReceivablesTime.ToString("yyyy-MM-dd");

                TB_ReceivablesOperatorCode.Text = constractReceivables.OperatorCode.Trim();
                LB_ReceivablesOperatorName.Text = constractReceivables.OperatorName.Trim();
                NB_ReceivablesPreDays.Amount = constractReceivables.PreDays;
                DL_ReceivablesStatus.SelectedValue = constractReceivables.Status.Trim();
                TB_Payer.Text = constractReceivables.Payer.Trim();
                TB_ReceiveComment.Text = constractReceivables.Comment.Trim();
                lbl_AccountCode.Text = constractReceivables.AccountCode.Trim();

                LB_ReceivablesRelatedPlanID.Text = constractReceivables.RelatedPlanID.ToString();
                LB_ReceivablesRelatedPlanName.Text = ShareClass.GetProjectPlanDetail(constractReceivables.RelatedPlanID.ToString());

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popReceivablesWindow','true') ", true);
            }

            if (e.CommandName == "Delete")
            {
                string strConstractCode, strOperatorCode;
                IList lst;

                strConstractCode = LB_ConstractCode.Text.Trim();
                strOperatorCode = LB_UserCode.Text.Trim();

                strHQL = "from  ConstractReceivables as constractReceivables where constractReceivables.ID= " + strID;
                ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
                lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);
                ConstractReceivables constractReceivables = (ConstractReceivables)lst[0];

                try
                {
                    constractReceivablesBLL.DeleteConstractReceivables(constractReceivables);
                    LoadConstractReceivables(strRelatedType, strRelatedID, strRelatedPlanID, strOperatorCode);

                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode, strHQL;

            string strID;

            strUserCode = LB_UserCode.Text.Trim();

            strID = e.Item.Cells[2].Text.Trim();

            if (e.CommandName == "Update")
            {
                strHQL = "from ConstractPayable as constractPayable where constractPayable.ID= " + strID;

                ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();

                IList lst = constractPayableBLL.GetAllConstractPayables(strHQL);

                for (int i = 0; i < DataGrid2.Items.Count; i++)
                {
                    DataGrid2.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                ConstractPayable constractPayable = (ConstractPayable)lst[0];

                LB_PayableID.Text = constractPayable.ID.ToString();

                TB_PayableBillCode.Text = constractPayable.BillCode.Trim();
                TB_PayAccount.Text = constractPayable.Account.Trim();
                NB_PayableAccount.Amount = constractPayable.PayableAccount;

                DLC_PayableTime.Text = constractPayable.PayableTime.ToString("yyyy-MM-dd");

                DL_PayableCurrencyType.SelectedValue = constractPayable.CurrencyType;

                TB_PayableOperatorCode.Text = constractPayable.OperatorCode.Trim();
                LB_PayableOperatorName.Text = constractPayable.OperatorName.Trim();

                DL_PayableStatus.SelectedValue = constractPayable.Status.Trim();
                NB_PayablePreDays.Amount = constractPayable.PreDays;

                TB_Receiver.Text = constractPayable.Receiver.Trim();
                TB_PayableComment.Text = constractPayable.Comment.Trim();
                lbl_AccountCode1.Text = constractPayable.AccountCode.Trim();

                LB_PayableRelatedPlanID.Text = constractPayable.RelatedPlanID.ToString();
                LB_PayableRelatedPlanName.Text = ShareClass.GetProjectPlanDetail(constractPayable.RelatedPlanID.ToString());

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popPayableWindow','true') ", true);
            }

            if (e.CommandName == "Delete")
            {
                string strConstractCode, strOperatorCode;
                IList lst;

                strConstractCode = LB_ConstractCode.Text.Trim();
                strOperatorCode = LB_UserCode.Text.Trim();

                strHQL = "from  ConstractPayable as constractPayable where constractPayable.ID= " + strID;
                ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
                lst = constractPayableBLL.GetAllConstractPayables(strHQL);
                ConstractPayable constractPayable = (ConstractPayable)lst[0];

                try
                {
                    constractPayableBLL.DeleteConstractPayable(constractPayable);
                    LoadConstractPayable(strRelatedType, strRelatedID, strRelatedPlanID, strOperatorCode);

                    strHQL = "Delete From T_ProExpense Where ConstractPayID = " + strID;
                    ShareClass.RunSqlCommand(strHQL);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
        }
    }


    protected void BT_ReceivablesSelectPJPlan_Click(object sender, EventArgs e)
    {

        try
        {
            if (strRelatedType == "Project")
            {
                string strPlanVerID = ShareClass.GetProjectPlanVerID(strRelatedID, "在用").ToString();

                TakeTopPlan.InitialProjectPlanTree(TreeView_ReceivablesPJPlantTree, strRelatedID, strPlanVerID);
            }
        }
        catch
        {
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popReceivablesWindow','true','popReceivablesSelectPJPlanWindow') ", true);
    }

    protected void BT_PayableSelectPJPlan_Click(object sender, EventArgs e)
    {
        try
        {
            if (strRelatedType == "Project")
            {
                string strPlanVerID = ShareClass.GetProjectPlanVerID(strRelatedID, "在用").ToString();

                TakeTopPlan.InitialProjectPlanTree(TreeView_PayablePJPlantTree, strRelatedID, strPlanVerID);
            }
        }
        catch
        {
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popPayableWindow','true','popPayableSelectPJPlanWindow') ", true);
    }


    protected void TreeView_ReceivablesPJPlantTree_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strPlanID;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView_ReceivablesPJPlantTree.SelectedNode;


        try
        {
            strPlanID = treeNode.Target.Trim();

            Label1.Text = strPlanID;
            LB_ReceivablesRelatedPlanID.Text = strPlanID;
            LB_ReceivablesRelatedPlanName.Text = ShareClass.GetProjectPlanDetail(strPlanID);
        }
        catch
        {
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popReceivablesWindow','false') ", true);
    }

    protected void TreeView_PayablePJPlantTree_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strPlanID;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView_PayablePJPlantTree.SelectedNode;


        try
        {
            strPlanID = treeNode.Target.Trim();
            LB_PayableRelatedPlanID.Text = strPlanID;

            LB_PayableRelatedPlanName.Text = ShareClass.GetProjectPlanDetail(strPlanID);
        }
        catch
        {
        }
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popPayableWindow','false') ", true);
    }

    protected void DL_ReceiveAccount_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strAccount = DL_ReceiveAccount.SelectedValue.Trim();
        lbl_AccountCode.Text = strAccount;
        TB_ReceiveAccount.Text = GetAccountName(strAccount);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popReceivablesWindow','true') ", true);
    }

    protected void DL_PayAccount_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strAccount = DL_PayAccount.SelectedValue.Trim();
        lbl_AccountCode1.Text = strAccount;
        TB_PayAccount.Text = GetAccountName(strAccount);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popPayableWindow','true') ", true);
    }

    protected void DL_Payer_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strPayer = DL_Payer.SelectedValue.Trim();

        TB_Payer.Text = strPayer;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popReceivablesWindow','true') ", true);
    }

    protected void DL_Receiver_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strReceiver = DL_Receiver.SelectedValue.Trim();

        TB_Receiver.Text = strReceiver;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popPayableWindow','true') ", true);
    }

    protected string GetAccountName(string strAccountCode)
    {
        string flag = "";
        string strHQL = "Select AccountName From T_Account where AccountCode='" + strAccountCode + "' ";
        DataTable dt = ShareClass.GetDataSetFromSql(strHQL, "T_Account").Tables[0];
        if (dt.Rows.Count > 0 && dt != null)
        {
            flag = dt.Rows[0]["AccountName"].ToString();
        }
        else
        {
            flag = "";
        }
        return flag;
    }

    protected void CountReceivablesAmount(string strRelatedType, string strRelatedID, string strRelatedPlanID, string strOperatorCode)
    {
        string strHQL;
        IList lst;

        decimal deReceivablesAmount = 0, deReceiverAmount = 0;

        strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.RelatedType = " + "'" + strRelatedType + "'" + " and constractReceivables.RelatedID = " + strRelatedID;
        if (strRelatedPlanID != null & strRelatedPlanID != "0")
        {
            strHQL += " And constractReceivables.RelatedPlanID =" + strRelatedPlanID;
        }
        strHQL += " and constractReceivables.OperatorCode = " + "'" + strOperatorCode + "'";
        ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
        lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);

        ConstractReceivables constractReceivables = new ConstractReceivables();

        for (int i = 0; i < lst.Count; i++)
        {
            constractReceivables = (ConstractReceivables)lst[i];

            deReceivablesAmount += constractReceivables.ReceivablesAccount;
            deReceiverAmount += constractReceivables.ReceiverAccount;
        }

        LB_ReceivablesAmount.Text = deReceivablesAmount.ToString();
        LB_ReceiverAmount.Text = deReceiverAmount.ToString();
        LB_UNReceiverAmount.Text = (deReceivablesAmount - deReceiverAmount).ToString();
    }

    protected void CountPayableAmount(string strRelatedType, string strRelatedID, string strRelatedPlanID, string strOperatorCode)
    {
        string strHQL;
        IList lst;

        decimal dePayableAmount = 0, dePayAmount = 0;

        strHQL = "from ConstractPayable as constractPayable where constractPayable.RelatedType = " + "'" + strRelatedType + "'" + " and constractPayable.RelatedID = " + strRelatedID;
        if (strRelatedPlanID != null & strRelatedPlanID != "0")
        {
            strHQL += " And  constractPayable.RelatedPlanID =" + strRelatedPlanID;
        }
        strHQL += "and constractPayable.OperatorCode = " + "'" + strOperatorCode + "'";
        ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
        lst = constractPayableBLL.GetAllConstractPayables(strHQL);

        ConstractPayable constractPayable = new ConstractPayable();

        for (int i = 0; i < lst.Count; i++)
        {
            constractPayable = (ConstractPayable)lst[i];

            dePayableAmount += constractPayable.PayableAccount;
            dePayAmount += constractPayable.OutOfPocketAccount;
        }

        LB_PayableAmount.Text = dePayableAmount.ToString();
        LB_PayAmount.Text = dePayAmount.ToString();
        LB_UNPayAmount.Text = (dePayableAmount - dePayAmount).ToString();
    }


    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL;
        IList lst;
        string strOperatorCode = LB_UserCode.Text.Trim();

        strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.RelatedType = " + "'" + strRelatedType + "'" + " and constractReceivables.RelatedID = " + strRelatedID;
        strHQL += " and constractReceivables.OperatorCode = " + "'" + strOperatorCode + "'";
        strHQL += " Order By constractReceivables.ID DESC";

        ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
        lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL;
        IList lst;
        string strOperatorCode = LB_UserCode.Text.Trim();

        strHQL = "from ConstractPayable as constractPayable where constractPayable.RelatedType = " + "'" + strRelatedType + "'" + " and constractPayable.RelatedID = " + strRelatedID;
        strHQL += "and constractPayable.OperatorCode = " + "'" + strOperatorCode + "'";
        strHQL += " Order By constractPayable.ID DESC";
        ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
        lst = constractPayableBLL.GetAllConstractPayables(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void LoadConstractReceivables(string strRelatedType, string strRelatedID, string strRelatedPlanID, string strOperatorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.RelatedType = " + "'" + strRelatedType + "'" + " and constractReceivables.RelatedID = " + strRelatedID;
        if (strRelatedPlanID != null & strRelatedPlanID != "0")
        {
            strHQL += " and constractReceivables.RelatedPlanID = " + strRelatedPlanID;
        }
        else
        {
            strHQL += " and constractReceivables.OperatorCode = " + "'" + strOperatorCode + "'";
        }
        strHQL += " Order By constractReceivables.ID DESC";

        ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
        lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        CountReceivablesAmount(strRelatedType, strRelatedID, strRelatedPlanID, strOperatorCode);
    }

    protected void LoadConstractReceivablesPayer(string strOperatorCode)
    {
        string strHQL;


        strHQL = "Select Distinct(Payer) from T_ConstractReceivables where ";
        strHQL += " OperatorCode = " + "'" + strOperatorCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractReceivables");

        DL_Payer.DataSource = ds;
        DL_Payer.DataBind();

        DL_Payer.Items.Insert(0, new ListItem("--Select--", ""));
    }

    protected void LoadConstractPayable(string strRelatedType, string strRelatedID, string strRelatedPlanID, string strOperatorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractPayable as constractPayable where constractPayable.RelatedType = " + "'" + strRelatedType + "'" + " and constractPayable.RelatedID = " + strRelatedID;
        if (strRelatedPlanID != null & strRelatedPlanID != "0")
        {
            strHQL += " and constractPayable.RelatedPlanID = " + strRelatedPlanID;
        }
        else
        {
            strHQL += "and constractPayable.OperatorCode = " + "'" + strOperatorCode + "'";
        }
        strHQL += " Order By constractPayable.ID DESC";
        ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
        lst = constractPayableBLL.GetAllConstractPayables(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        CountPayableAmount(strRelatedType, strRelatedID, strRelatedPlanID, strOperatorCode);
    }

    protected void LoadConstractPayableReceiver(string strOperatorCode)
    {
        string strHQL;

        strHQL = "Select Distinct(Receiver) from T_ConstractPayable where ";
        strHQL += " OperatorCode = " + "'" + strOperatorCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ConstractPayable");

        DL_Receiver.DataSource = ds;
        DL_Receiver.DataBind();

        DL_Receiver.Items.Insert(0, new ListItem("--Select--", ""));
    }

}
