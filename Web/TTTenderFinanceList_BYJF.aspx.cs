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
using System.IO;
using NPOI.SS.Formula.Functions;


public partial class TTTenderFinanceList_BYJF : System.Web.UI.Page
{
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "投标确认", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            TB_ReceiveMarginTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            TB_ExpenseDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            TB_InvoiceDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            string strWarningType = DL_WarningType.SelectedValue.Trim();
            LoadTenderInfo(strWarningType);
        }
    }

    protected void BT_Query_Click(object sender, EventArgs e)
    {
        string strWarningType = DL_WarningType.SelectedValue.Trim();
        LoadTenderInfo(strWarningType);
    }

    protected void LoadTenderInvoiceInfo(string strTenderID)
    {
        string strHQL;
        strHQL = "Select * From T_TenderInvoice_HYYQ Where TenderID =  " + strTenderID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TenderInvoice_HYYQ");

        DataGrid2.CurrentPageIndex = 0;
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        string strID;
        IList lst;

        if (e.CommandName != "Page")
        {
            strID = e.Item.Cells[2].Text.Trim();
            string strCommandArgument = e.CommandArgument.ToString().Trim();

            if (e.CommandName == "Update" || e.CommandName == "Assign")
            {
                for (int i = 0; i < DataGrid1.Items.Count; i++)
                {
                    DataGrid1.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "from Tender_HYYQ as tender_HYYQ where tender_HYYQ.id = " + strID;
                Tender_HYYQBLL tender_HYYQBLL = new Tender_HYYQBLL();
                lst = tender_HYYQBLL.GetAllTender_HYYQs(strHQL);
                Tender_HYYQ tender_HYYQ = (Tender_HYYQ)lst[0];

                HF_ID.Value = tender_HYYQ.id.ToString();
                TB_TenderCode.Text = tender_HYYQ.TenderCode.Trim();
                TB_ProjectName.Text = tender_HYYQ.ProjectName.Trim();

                TB_CompactCode.Text = tender_HYYQ.CompactCode;

                TB_BiddingAgent.Text = tender_HYYQ.BiddingAgent.Trim();
                TB_BiddingAgentPhone.Text = tender_HYYQ.BiddingAgentPhone.Trim();
                TB_UserCode.Text = tender_HYYQ.UserCode.Trim();
                TB_UserCodePhone.Text = tender_HYYQ.UserCodePhone.Trim();
                TB_SalesCode.Text = tender_HYYQ.SalesCode.Trim();
                TB_SalesCodePhone.Text = tender_HYYQ.SalesCodePhone.Trim();
                TB_TenderBuyTime.Text = tender_HYYQ.TenderBuyTime.Trim();
                TB_TenderBuyDay.Text = tender_HYYQ.TenderBuyDay.ToString();
                CKB_IsTender.Checked = tender_HYYQ.IsTender == 0 ? true : false;
                TB_Margin.Text = tender_HYYQ.Margin.ToString();
                TB_MarginTime.Text = tender_HYYQ.MarginTime.Trim();
                TB_MarginDay.Text = tender_HYYQ.MarginDay.ToString();
                CKB_IsMargin.Checked = tender_HYYQ.IsMargin == 0 ? true : false;

                TB_ReceiveMargin.Text = tender_HYYQ.ReceiveMargin.ToString();
                TB_ReceiveMarginTime.Text = tender_HYYQ.ReceiveMarginTime.Trim();
                TB_ReceiveMarginDay.Text = tender_HYYQ.ReceiveMarginDay.ToString();
                CKB_IsReceiveMargin.Checked = tender_HYYQ.IsReceiveMargin == 0 ? true : false;

                TB_BidOpeningDate.Text = tender_HYYQ.BidOpeningDate.Trim();
                TB_BidOpeningDay.Text = tender_HYYQ.BidOpeningDay.ToString();
                CKB_IsBidOpening.Checked = tender_HYYQ.IsBidOpening == 0 ? true : false;
                TB_WinningFeeDate.Text = tender_HYYQ.WinningFeeDate;
                TB_WinningFeeDay.Text = tender_HYYQ.WinningFeeDay.ToString();

                CKB_IsWinningFee.Checked = tender_HYYQ.IsWinningFee == 0 ? true : false;


                TB_Remarks.Text = tender_HYYQ.Remarks.ToString();

                TB_WorkCost.Text = tender_HYYQ.WorkCost.ToString("F2");
                TB_AgencyCost.Text = tender_HYYQ.AgencyCost.ToString("F2");
                DL_TenderStatus.SelectedValue = tender_HYYQ.TenderStatus.Trim();

                LB_PMCode.Text = tender_HYYQ.PMCode.Trim();
                LB_PMName.Text = tender_HYYQ.PMName.Trim();

                LB_PrincipalCode.Text = tender_HYYQ.PrincipalCode.Trim();
                LB_PrincipalName.Text = tender_HYYQ.PrincipalName.Trim();

                LB_TechnicalDirectorCode.Text = tender_HYYQ.TechnicalDirectorCode.Trim();
                LB_TechnicalDirectorName.Text = tender_HYYQ.TechnicalDirectorName.Trim();

                DL_InternalandExternal.SelectedValue = tender_HYYQ.InternalAndExternal;

                TB_BiddingPrice.Text = tender_HYYQ.BiddingPrice.ToString();
                TB_ControlPrice.Text = tender_HYYQ.ControlPrice.ToString();

                TB_TenderContent.Text = tender_HYYQ.TenderContent.Trim();

                BT_UpdateAA.Enabled = true;

                if (tender_HYYQ.Progress == "完成")
                {
                    BT_CreateExense.Visible = false;
                    BT_Createinvoice.Visible = false;

                    BT_NewTenderExpense.Visible = false;
                    BT_NewTenderInvoice.Visible = false;

                    DataGrid2.Enabled = false;
                    DataGrid3.Enabled = false;

                    BT_Complete.Enabled = false;
                    BT_UpdateAA.Enabled = false;
                }
                else
                {
                    BT_CreateExense.Visible = true;
                    BT_Createinvoice.Visible = true;

                    BT_NewTenderExpense.Visible = true;
                    BT_NewTenderInvoice.Visible = true;

                    DataGrid2.Enabled = true;
                    DataGrid3.Enabled = true;

                    BT_Complete.Enabled = true;
                }

                //加载发票列表
                LoadTenderInvoiceInfo(tender_HYYQ.id.ToString());

                //加载费用列表
                loadTenderExpense(tender_HYYQ.id.ToString());

                if (e.CommandName == "Update")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }

                if (e.CommandName == "Assign")
                {
                    LoadRelatedWL("投标管理", "投标", int.Parse(strID));

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);
                }
            }
        }
    }


    protected void BT_UpdateAA_Click(object sender, EventArgs e)
    {
        string strID = HF_ID.Value.Trim();
        if (string.IsNullOrEmpty(strID))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZYXGDTBLB + "')", true);
            return;
        }

        int intID = 0;
        int.TryParse(strID, out intID);

        string strTenderCode = TB_TenderCode.Text.Trim();
        if (string.IsNullOrEmpty(strTenderCode))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZBBHDBNWKJC + "')", true);
            return;
        }

        Tender_HYYQBLL tender_HYYQBLL = new Tender_HYYQBLL();
        string strHQL = "from Tender_HYYQ as tender_HYYQ where tender_HYYQ.id =" + intID;
        IList lst = tender_HYYQBLL.GetAllTender_HYYQs(strHQL);
        if (lst != null && lst.Count > 0)
        {
            Tender_HYYQ tender_HYYQ = (Tender_HYYQ)lst[0];

            tender_HYYQ.TenderCode = TB_TenderCode.Text;
            tender_HYYQ.ProjectName = TB_ProjectName.Text;

            tender_HYYQ.CompactCode = TB_CompactCode.Text;

            tender_HYYQ.BiddingAgent = TB_BiddingAgent.Text;
            tender_HYYQ.BiddingAgentPhone = TB_BiddingAgentPhone.Text.Trim();
            tender_HYYQ.UserCode = TB_UserCode.Text.Trim();
            tender_HYYQ.UserCodePhone = TB_UserCodePhone.Text.Trim();
            tender_HYYQ.SalesCode = TB_SalesCode.Text.Trim();
            tender_HYYQ.SalesCodePhone = TB_SalesCodePhone.Text.Trim();
            tender_HYYQ.TenderBuyTime = TB_TenderBuyTime.Text.Trim();

            int intTenderBuyDay = 0;
            int.TryParse(TB_TenderBuyDay.Text.Trim(), out intTenderBuyDay);
            tender_HYYQ.TenderBuyDay = intTenderBuyDay;
            if (CKB_IsTender.Checked)
            {
                tender_HYYQ.IsTender = 0;
            }
            else
            {
                tender_HYYQ.IsTender = 1;
            }

            try
            {
                tender_HYYQ.WorkCost = decimal.Parse(TB_WorkCost.Text.Trim());
                tender_HYYQ.AgencyCost = decimal.Parse(TB_AgencyCost.Text.Trim());
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('警告，工本费和代理费必须为数字类型，请检查！')", true);
                return;
            }
            tender_HYYQ.TenderStatus = DL_TenderStatus.SelectedValue.Trim();

            decimal decimalMargin = 0;
            decimal.TryParse(TB_Margin.Text.Trim(), out decimalMargin);
            tender_HYYQ.Margin = decimalMargin;
            tender_HYYQ.MarginTime = TB_MarginTime.Text.Trim();

            int intMarginDay = 0;
            int.TryParse(TB_MarginDay.Text.Trim(), out intMarginDay);

            tender_HYYQ.MarginDay = intMarginDay;

            if (CKB_IsMargin.Checked)
            {
                tender_HYYQ.IsMargin = 0;
            }
            else
            {
                tender_HYYQ.IsMargin = 1;
            }


            decimal decimalReceiveMargin = 0;
            decimal.TryParse(TB_ReceiveMargin.Text.Trim(), out decimalReceiveMargin);
            tender_HYYQ.ReceiveMargin = decimalReceiveMargin;
            tender_HYYQ.ReceiveMarginTime = TB_ReceiveMarginTime.Text.Trim();
            int intReceiveMarginDay = 0;
            int.TryParse(TB_ReceiveMarginDay.Text.Trim(), out intReceiveMarginDay);

            tender_HYYQ.ReceiveMarginDay = intReceiveMarginDay;

            if (CKB_IsReceiveMargin.Checked)
            {
                tender_HYYQ.IsReceiveMargin = 0;
            }
            else
            {
                tender_HYYQ.IsReceiveMargin = 1;
            }

            tender_HYYQ.BidOpeningDate = TB_BidOpeningDate.Text.Trim();

            int intBidOpeningDay = 0;
            int.TryParse(TB_BidOpeningDay.Text.Trim(), out intBidOpeningDay);

            tender_HYYQ.BidOpeningDay = intBidOpeningDay;

            if (CKB_IsBidOpening.Checked)
            {
                tender_HYYQ.IsBidOpening = 0;
            }
            else
            {
                tender_HYYQ.IsBidOpening = 1;
            }
            tender_HYYQ.WinningFeeDate = TB_WinningFeeDate.Text.Trim();

            int intWinningFeeDay = 0;
            int.TryParse(TB_WinningFeeDay.Text, out intWinningFeeDay);

            tender_HYYQ.WinningFeeDay = intWinningFeeDay;

            if (CKB_IsWinningFee.Checked)
            {
                tender_HYYQ.IsWinningFee = 0;
            }
            else
            {
                tender_HYYQ.IsWinningFee = 1;
            }

            tender_HYYQ.TenderContent = TB_TenderContent.Text.Trim();
            tender_HYYQ.Remarks = TB_Remarks.Text.Trim();

            tender_HYYQBLL.UpdateTender_HYYQ(tender_HYYQ, intID);

            //重新加载列表
            LoadTenderInfo("");

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZBJLBCZJC + "')", true);
            return;
        }
    }

    protected void BT_Complete_Click(object sender, EventArgs e)
    {
        string strID = HF_ID.Value.Trim();
        if (string.IsNullOrEmpty(strID))
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZYXGDTBLB + "')", true);
            return;
        }

        int intID = 0;
        int.TryParse(strID, out intID);


        Tender_HYYQBLL tender_HYYQBLL = new Tender_HYYQBLL();
        string strHQL = "from Tender_HYYQ as tender_HYYQ where tender_HYYQ.id =" + intID;
        IList lst = tender_HYYQBLL.GetAllTender_HYYQs(strHQL);
        if (lst != null && lst.Count > 0)
        {
            Tender_HYYQ tender_HYYQ = (Tender_HYYQ)lst[0];

            try
            {
                tender_HYYQ.WorkCost = decimal.Parse(TB_WorkCost.Text.Trim());
                tender_HYYQ.AgencyCost = decimal.Parse(TB_AgencyCost.Text.Trim());
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('警告，工本费和代理费必须为数字类型，请检查！')", true);
                return;
            }
            tender_HYYQ.TenderStatus = DL_TenderStatus.SelectedValue.Trim();

            tender_HYYQ.Progress = "完成";

            tender_HYYQBLL.UpdateTender_HYYQ(tender_HYYQ, tender_HYYQ.id);

            //重新加载列表
            LoadTenderInfo("");

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZRWCCG + "')", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZBJLBCZJC + "')", true);
            return;
        }
    }

    //取得投标状态
    protected string GetTenderStatus(string strTenderID)
    {
        Tender_HYYQBLL tender_HYYQBLL = new Tender_HYYQBLL();
        string strHQL = "from Tender_HYYQ as tender_HYYQ where tender_HYYQ.id =" + strTenderID;
        IList lst = tender_HYYQBLL.GetAllTender_HYYQs(strHQL);
        if (lst != null && lst.Count > 0)
        {
            Tender_HYYQ tender_HYYQ = (Tender_HYYQ)lst[0];

            return tender_HYYQ.Progress.Trim();
        }
        else
        {
            return "新建";
        }
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;

            string strExpenseID = e.Item.Cells[2].Text.Trim();
            string strCommandArgument = e.CommandArgument.ToString().Trim();

            LB_ExpenseID.Text = strExpenseID;

            if (e.CommandName == "Update")
            {
                for (int i = 0; i < DataGrid3.Items.Count; i++)
                {
                    DataGrid3.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "Select * from T_TenderExpense where expenseid = " + strExpenseID;
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TenderExpense");

                LB_ExpenseID.Text = ds.Tables[0].Rows[0]["ExpenseID"].ToString();
                TB_ExpenseName.Text = ds.Tables[0].Rows[0]["ExpenseName"].ToString();
                TB_ExpenseAmount.Text = ds.Tables[0].Rows[0]["ExpenseAmount"].ToString();
                TB_ExpenseRemarks.Text = ds.Tables[0].Rows[0]["Remarks"].ToString();
                TB_ExpenseDate.Text = ds.Tables[0].Rows[0]["ExpenseDate"].ToString();

                //BT_ExpenseAdd.Enabled = true;
                //BT_ExpenseUpdate.Enabled = true;
                //BT_ExpenseDelete.Enabled = true;

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popTenderExpenseWindow') ", true);
            }


            if (e.CommandName == "Delete")
            {
                strExpenseID = LB_ExpenseID.Text;

                if (GetTenderStatus(HF_ID.Value) == "完成")
                {
                    return;
                }

                strHQL = string.Format(@"Delete From T_TenderExpense Where ExpenseID = {0}", LB_ExpenseID.Text);
                ShareClass.RunSqlCommand(strHQL);

                loadTenderExpense(HF_ID.Value.Trim());

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void BT_CreateExpense_Click(object sender, EventArgs e)
    {
        LB_ExpenseID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popTenderExpenseWindow') ", true);
    }

    protected void BT_NewTenderExpense_Click(object sender, EventArgs e)
    {
        string strExpenseID;

        strExpenseID = LB_ExpenseID.Text.Trim();

        if (strExpenseID == "")
        {
            AddTenderExpense();
        }
        else
        {
            UpdateTenderExpense();
        }
    }

    protected void AddTenderExpense()
    {
        string strHQL;

        strHQL = string.Format(@"Insert Into T_TenderExpense(ExpenseName,ExpenseAmount,Remarks,ExpenseDate,TenderID) Values('{0}',{1},'{2}','{3}',{4})", TB_ExpenseName.Text.Trim(), TB_ExpenseAmount.Text.Trim(), TB_ExpenseRemarks.Text.Trim(), TB_ExpenseDate.Text.Trim(), HF_ID.Value.Trim());

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            loadTenderExpense(HF_ID.Value.Trim());

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSB + "')", true);
        }
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void UpdateTenderExpense()
    {
        string strHQL;

        strHQL = string.Format(@"Update T_TenderExpense Set ExpenseName ='{0}',ExpenseAmount={1},Remarks = '{2}',ExpenseDate='{3}' Where ExpenseID = {4}", TB_ExpenseName.Text.Trim(), TB_ExpenseAmount.Text.Trim(), TB_ExpenseRemarks.Text.Trim(), TB_ExpenseDate.Text.Trim(), LB_ExpenseID.Text.Trim());

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            loadTenderExpense(HF_ID.Value.Trim());

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    protected void loadTenderExpense(string strTenderID)
    {
        string strHQL;

        strHQL = "Select * From T_TenderExpense Where TenderID = " + strTenderID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TenderExpense");

        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
    }


    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strInvoiceID = e.Item.Cells[2].Text.Trim();
            LB_InvoiceID.Text = strInvoiceID;

            if (e.CommandName == "Update")
            {
                for (int i = 0; i < DataGrid2.Items.Count; i++)
                {
                    DataGrid2.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                string strHQL = " from TenderInvoice_HYYQ as tenderInvoice_HYYQ where tenderInvoice_HYYQ.id =" + strInvoiceID;

                TenderInvoice_HYYQBLL tenderInvoice_HYYQBLL = new TenderInvoice_HYYQBLL();
                IList lst = tenderInvoice_HYYQBLL.GetAllTenderInvoice_HYYQs(strHQL);
                TenderInvoice_HYYQ tenderInvoice_HYYQ = (TenderInvoice_HYYQ)lst[0];

                LB_InvoiceID.Text = tenderInvoice_HYYQ.id.ToString();
                TB_InvoiceNumber.Text = tenderInvoice_HYYQ.InvoiceNumber.Trim();
                TB_InvoiceMoney.Text = tenderInvoice_HYYQ.InvoiceMoney.ToString();
                TB_InvoiceRemarks.Text = tenderInvoice_HYYQ.Remarks.Trim();
                TB_InvoiceDate.Text = tenderInvoice_HYYQ.InvoiceDate.Trim();

                LB_InvoiceID.Text = strInvoiceID;

                //BT_New.Enabled = true;
                //BT_Update.Enabled = true;
                //BT_Delete.Enabled = true;

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popTenderInvoiceWindow') ", true);
            }


            if (e.CommandName == "Delete")
            {
                string strHQL;

                strInvoiceID = LB_InvoiceID.Text;

                if (GetTenderStatus(HF_ID.Value) == "完成")
                {
                    return;
                }

                int intTenderID = 0;
                int.TryParse(HF_ID.Value, out intTenderID);

                strHQL = "Delete From T_tenderInvoice_HYYQ Where ID = " + strInvoiceID;
                ShareClass.RunSqlCommand(strHQL);

                //加载发票列表
                LoadTenderInvoiceInfo(intTenderID.ToString());

                LB_InvoiceID.Text = "";

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
    }

    protected void BT_CreateInvoice_Click(object sender, EventArgs e)
    {
        LB_InvoiceID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popTenderInvoiceWindow') ", true);
    }
    protected void BT_NewTenderInvoice_Click(object sender, EventArgs e)
    {
        string strInvoiceID;

        strInvoiceID = LB_InvoiceID.Text.Trim();

        if (strInvoiceID == "")
        {
            AddTenderInvoice();
        }
        else
        {
            UpdateTenderInvoice();
        }
    }

    protected void AddTenderInvoice()
    {
        int intTenderID = 0;
        int.TryParse(HF_ID.Value, out intTenderID);

        if (intTenderID < 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZTBLB + "')", true);
            return;
        }


        TenderInvoice_HYYQBLL tenderInvoice_HYYQBLL = new TenderInvoice_HYYQBLL();
        TenderInvoice_HYYQ tenderInvoice_HYYQ = new TenderInvoice_HYYQ();

        tenderInvoice_HYYQ.TenderID = intTenderID;
        tenderInvoice_HYYQ.InvoiceNumber = TB_InvoiceNumber.Text.Trim();

        decimal decimalInvoiceMoney = 0;
        decimal.TryParse(TB_InvoiceMoney.Text.Trim(), out decimalInvoiceMoney);

        tenderInvoice_HYYQ.InvoiceMoney = decimalInvoiceMoney;
        tenderInvoice_HYYQ.Remarks = TB_InvoiceRemarks.Text.Trim();
        tenderInvoice_HYYQ.InvoiceDate = TB_InvoiceDate.Text.Trim();

        try
        {
            tenderInvoice_HYYQBLL.AddTenderInvoice_HYYQ(tenderInvoice_HYYQ);

            //加载发票列表
            LoadTenderInvoiceInfo(intTenderID.ToString());

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPXZCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPXZSB + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    protected void UpdateTenderInvoice()
    {
        int intTenderID = 0;
        int.TryParse(HF_ID.Value, out intTenderID);

        if (intTenderID < 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZTBLB + "')", true);
            return;
        }

        int intInvoiceID = 0;
        int.TryParse(LB_InvoiceID.Text, out intInvoiceID);

        if (intInvoiceID < 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZYXGDFPLB + "')", true);
            return;
        }

        string strHQL;
        IList lst;

        TenderInvoice_HYYQBLL tenderInvoice_HYYQBLL = new TenderInvoice_HYYQBLL();
        strHQL = "from TenderInvoice_HYYQ as tenderInvoice_HYYQ where tenderInvoice_HYYQ.id = " + intInvoiceID;
        lst = tenderInvoice_HYYQBLL.GetAllTenderInvoice_HYYQs(strHQL);
        if (lst != null && lst.Count > 0)
        {
            TenderInvoice_HYYQ tenderInvoice_HYYQ = (TenderInvoice_HYYQ)lst[0];

            tenderInvoice_HYYQ.TenderID = intTenderID;
            tenderInvoice_HYYQ.InvoiceNumber = TB_InvoiceNumber.Text.Trim();

            decimal decimalInvoiceMoney = 0;
            decimal.TryParse(TB_InvoiceMoney.Text.Trim(), out decimalInvoiceMoney);

            tenderInvoice_HYYQ.InvoiceMoney = decimalInvoiceMoney;
            tenderInvoice_HYYQ.Remarks = TB_InvoiceRemarks.Text.Trim();
            tenderInvoice_HYYQ.InvoiceDate = TB_InvoiceDate.Text.Trim();

            try
            {
                tenderInvoice_HYYQBLL.UpdateTenderInvoice_HYYQ(tenderInvoice_HYYQ, intInvoiceID);

                //加载发票列表
                LoadTenderInvoiceInfo(intTenderID.ToString());

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPXGCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPXGSB + "')", true);
            }
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierInfo");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void LoadTenderInfo(string strWarningType)
    {
        string strHQL;

        strHQL = "Select *  From T_Tender_HYYQ ";

        if (strWarningType == "")
        {
            strHQL = "Select *  From T_Tender_HYYQ  Where ";
            strHQL += " CreatorCode = " + "'" + strUserCode + "'";
            strHQL += " and TenderCode like '%" + TXT_TenderCode.Text.Trim() + "%' ";
            strHQL += " and ProjectName like '%" + TXT_ProjectName.Text.Trim() + "%' ";

        }
        else
        {
            if (strWarningType == "标书购买")
            {
                strHQL = "Select *  From T_Tender_HYYQ Where  IsTender <> 0 and to_char( cast(TenderBuyTime as date),'yyyymmdd') <= to_char(now()+TenderBuyDay*'1 day'::interval,'yyyymmdd') ";
                strHQL += " and CreatorCode = " + "'" + strUserCode + "'";
                strHQL += " and TenderCode like '%" + TXT_TenderCode.Text.Trim() + "%' ";
                strHQL += " and ProjectName like '%" + TXT_ProjectName.Text.Trim() + "%' ";

            }

            if (strWarningType == "交保证金")
            {
                strHQL = "Select *  From T_Tender_HYYQ Where  IsMargin <> 0 and to_char( cast( MarginTime as date),'yyyymmdd') <= to_char(now()+MarginDay*'1 day'::interval,'yyyymmdd') ";
                strHQL += " and CreatorCode = " + "'" + strUserCode + "'";
                strHQL += " and TenderCode like '%" + TXT_TenderCode.Text.Trim() + "%' ";
                strHQL += " and ProjectName like '%" + TXT_ProjectName.Text.Trim() + "%' ";

            }

            if (strWarningType == "退保证金")
            {
                strHQL = "Select *  From T_Tender_HYYQ Where  IsReceiveMargin <> 0 and to_char(cast( ReceiveMarginTime as date),'yyyymmdd') <= to_char(now()+ReceiveMarginDay*'1 day'::interval,'yyyymmdd') ";
                strHQL += " and CreatorCode = " + "'" + strUserCode + "'";
                strHQL += " and TenderCode like '%" + TXT_TenderCode.Text.Trim() + "%' ";
                strHQL += " and ProjectName like '%" + TXT_ProjectName.Text.Trim() + "%' ";

            }

            if (strWarningType == "开标")
            {
                strHQL = "Select *  From T_Tender_HYYQ Where  IsBidOpening <> 0 and to_char( cast(BidOpeningDate as date),'yyyymmdd') <= to_char(now()+BidOpeningDay*'1 day'::interval,'yyyymmdd') ";
                strHQL += " and CreatorCode = " + "'" + strUserCode + "'";
                strHQL += " and TenderCode like '%" + TXT_TenderCode.Text.Trim() + "%' ";
                strHQL += " and ProjectName like '%" + TXT_ProjectName.Text.Trim() + "%' ";

            }

            if (strWarningType == "交中标费")
            {
                strHQL = "Select *  From T_Tender_HYYQ Where  IsWinningFee <> 0 and to_char( cast(WinningFeeDate as date),'yyyymmdd') <= to_char(now()+WinningFeeDay*'1 day'::interval,'yyyymmdd') ";
                strHQL += " and CreatorCode = " + "'" + strUserCode + "'";
                strHQL += " and TenderCode like '%" + TXT_TenderCode.Text.Trim() + "%' ";
                strHQL += " and ProjectName like '%" + TXT_ProjectName.Text.Trim() + "%' ";

            }
        }

        strHQL += " Order By ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Tender_HYYQ");

        DataGrid1.CurrentPageIndex = 0;
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void LoadRelatedWL(string strWLType, string strRelatedType, int intRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and ((workFlow.RelatedType=" + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + intRelatedID.ToString() + ")";
        strHQL += " Or (workFlow.BusinessType = 'GoodsProduction' and workFlow.BusinessCode = '" + intRelatedID.ToString() + "'))";
        strHQL += " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
    }
}