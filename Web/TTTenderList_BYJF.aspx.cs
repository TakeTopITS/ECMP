using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.IO;

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

public partial class TTTenderList_BYJF : System.Web.UI.Page
{
    string strUserCode, strUserName;
    string strLangCode;

    string strRelatedType, strRelatedID;
    string strToDoWLID, strToDoWLDetailID, strWLBusinessID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strRelatedType = Request.QueryString["RelatedType"];
        strRelatedID = Request.QueryString["RelatedID"];

        strLangCode = Session["LangCode"].ToString();

        //从流程中打开的业务单
        strToDoWLID = Request.QueryString["WLID"];
        strToDoWLDetailID = Request.QueryString["WLStepDetailID"];
        strWLBusinessID = Request.QueryString["BusinessID"];

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "投标登记", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            TB_ReceiveMarginTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            string strWarningType = DL_WarningType.SelectedValue.Trim();
            LoadTenderInfo(strWarningType);

            //加载项目所属专业
            LoadTenderContent();

            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView1, strUserCode);
            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView2, strUserCode);
            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView3, strUserCode);
            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView4, strUserCode);
        }
    }

    protected void BT_Query_Click(object sender, EventArgs e)
    {
        string strWarningType = DL_WarningType.SelectedValue.Trim();
        LoadTenderInfo(strWarningType);
    }

    protected void BT_CreateMain_Click(object sender, EventArgs e)
    {
        HF_ID.Value = "";

        BT_NewMain.Visible = true;

        string strWarningType = DL_WarningType.SelectedValue.Trim();
        LoadTenderInfo(strWarningType);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }


    protected void BT_NewMain_Click(object sender, EventArgs e)
    {
        string strTenderID;

        strTenderID = HF_ID.Value.Trim();

        if (strTenderID == "")
        {
            AddMain();
        }
        else
        {
            UpdateMain();
        }
    }

    protected void AddMain()
    {
        try
        {
            string strTenderCode = TB_TenderCode.Text.Trim();
            if (string.IsNullOrEmpty(strTenderCode))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZBBHDBNWKJC + "')", true);
                return;
            }


            Tender_HYYQBLL tender_HYYQBLL = new Tender_HYYQBLL();
            string strHQL = "from Tender_HYYQ as tender_HYYQ where tender_HYYQ.TenderCode = '" + strTenderCode + "' ";
            IList lst = tender_HYYQBLL.GetAllTender_HYYQs(strHQL);
            if (lst != null && lst.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZBBHYJCZBNZF + "')", true);
                return;
            }

            Tender_HYYQ tender_HYYQ = new Tender_HYYQ();

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

            tender_HYYQ.WorkCost = 0;
            tender_HYYQ.AgencyCost = 0;
            tender_HYYQ.TenderStatus = "新建";

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

            tender_HYYQ.PMCode = LB_PMCode.Text;
            tender_HYYQ.PMName = TB_PMName.Text;

            tender_HYYQ.TechnicalDirectorCode = LB_TechnicalDirectorCode.Text;
            tender_HYYQ.TechnicalDirectorName = TB_TechnicalDirectorName.Text;

            tender_HYYQ.PrincipalCode = LB_PrincipalCode.Text;
            tender_HYYQ.PrincipalName = TB_PrincipalName.Text;

            tender_HYYQ.InternalAndExternal = DL_InternalandExternal.SelectedValue;

            try
            {
                tender_HYYQ.BiddingPrice = decimal.Parse(TB_BiddingPrice.Text);
                tender_HYYQ.ControlPrice = decimal.Parse(TB_ControlPrice.Text);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('错误，投标报价和控制价要为数字，请检查！')", true);
                return;
            }

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

            tender_HYYQ.TenderContent = DL_TenderContent.SelectedValue;
            tender_HYYQ.Remarks = TB_Remarks.Text.Trim();
            tender_HYYQ.CreatorCode = strUserCode;
            tender_HYYQ.CreatorName = strUserName;

            tender_HYYQBLL.AddTender_HYYQ(tender_HYYQ);

            HF_ID.Value = GetMyCreatedMaxTenderID();

            //重新加载列表
            LoadTenderInfo("");

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch (Exception ex)
        {
        }
    }

    //取得投标管理最大ID号
    public string GetMyCreatedMaxTenderID()
    {
        string strHQL;

        strHQL = "Select MAX(ID) From T_Tender_HYYQ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Tender_HYYQ");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "0";
        }
    }

    protected void UpdateMain()
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

            tender_HYYQ.PMCode = LB_PMCode.Text;
            tender_HYYQ.PMName = TB_PMName.Text;

            tender_HYYQ.TechnicalDirectorCode = LB_TechnicalDirectorCode.Text;
            tender_HYYQ.TechnicalDirectorName = TB_TechnicalDirectorName.Text;

            tender_HYYQ.PrincipalCode = LB_PrincipalCode.Text;
            tender_HYYQ.PrincipalName = TB_PrincipalName.Text;

            tender_HYYQ.InternalAndExternal = DL_InternalandExternal.SelectedValue;

            tender_HYYQ.BiddingPrice = decimal.Parse(TB_BiddingPrice.Text);
            tender_HYYQ.ControlPrice = decimal.Parse(TB_ControlPrice.Text);

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

            tender_HYYQ.WorkCost = 0;
            tender_HYYQ.AgencyCost = 0;
            tender_HYYQ.TenderStatus = "新建";

            tender_HYYQ.PMCode = LB_PMCode.Text;
            tender_HYYQ.PMName = TB_PMName.Text;

            tender_HYYQ.TechnicalDirectorCode = LB_TechnicalDirectorCode.Text;
            tender_HYYQ.TechnicalDirectorName = TB_TechnicalDirectorName.Text;

            tender_HYYQ.PrincipalCode = LB_PrincipalCode.Text;
            tender_HYYQ.PrincipalName = TB_PrincipalName.Text;

            tender_HYYQ.InternalAndExternal = DL_InternalandExternal.SelectedValue;

            try
            {
                tender_HYYQ.BiddingPrice = decimal.Parse(TB_BiddingPrice.Text);
                tender_HYYQ.ControlPrice = decimal.Parse(TB_ControlPrice.Text);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('错误，投标报价和控制价要为数字，请检查！')", true);
                return;
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

            tender_HYYQ.TenderContent = DL_TenderContent.SelectedValue;
            tender_HYYQ.Remarks = TB_Remarks.Text.Trim();

            tender_HYYQ.CreatorCode = strUserCode;
            tender_HYYQ.CreatorName = strUserName;

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

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        string strID;
        IList lst;

        if (e.CommandName != "Page")
        {
            strID = e.Item.Cells[4].Text.Trim();
            string strCommandArgument = e.CommandArgument.ToString().Trim();

            int intWLNumber = GetRelatedWorkFlowNumber("投标管理", "投标", strID);
            if (intWLNumber > 0)
            {
                BT_SubmitApply.Enabled = false;
            }
            else
            {
                BT_SubmitApply.Enabled = true;
            }

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

                try
                {
                    DL_TenderContent.SelectedValue = tender_HYYQ.TenderContent;
                }
                catch
                {
                }
                TB_Remarks.Text = tender_HYYQ.Remarks.ToString();

                LB_PMCode.Text = tender_HYYQ.PMCode.Trim();
                TB_PMName.Text = tender_HYYQ.PMName.Trim();

                LB_PrincipalCode.Text = tender_HYYQ.PrincipalCode.Trim();
                TB_PrincipalName.Text = tender_HYYQ.PrincipalName.Trim();

                LB_TechnicalDirectorCode.Text = tender_HYYQ.TechnicalDirectorCode.Trim();
                TB_TechnicalDirectorName.Text = tender_HYYQ.TechnicalDirectorName.Trim();

                DL_InternalandExternal.SelectedValue = tender_HYYQ.InternalAndExternal;

                TB_BiddingPrice.Text = tender_HYYQ.BiddingPrice.ToString();
                TB_ControlPrice.Text = tender_HYYQ.ControlPrice.ToString();


                //BT_NewAA.Enabled = true;
                //BT_UpdateAA.Enabled = true;
                //BT_DelAA.Enabled = true;

                LoadTenderRelatedUser(strID);

                if (tender_HYYQ.Progress == "完成")
                {
                    BT_NewMain.Visible = false;

                }
                else
                {
                    BT_NewMain.Visible = true;
                }


                if (e.CommandName == "Update")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }

                if (e.CommandName == "Assign")
                {
                    intWLNumber = GetRelatedWorkFlowNumber("投标管理", "投标", strID);
                    if (intWLNumber != 0)
                    {
                        BT_SubmitApply.Enabled = false;
                    }
                    else
                    {
                        BT_SubmitApply.Enabled = true;
                    }
                    LoadRelatedWL("投标管理", "投标", int.Parse(strID));

                    TB_WLName.Text = tender_HYYQ.ProjectName.Trim() + "投标" + Resources.lang.ShenQing;

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);
                }
            }

            if (e.CommandName == "Delete")
            {
                if (string.IsNullOrEmpty(strID))
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZYXGDTBLB + "')", true);
                    return;
                }

                int intID = 0;
                int.TryParse(strID, out intID);

                Tender_HYYQBLL tender_HYYQBLL = new Tender_HYYQBLL();
                strHQL = "from Tender_HYYQ as tender_HYYQ where tender_HYYQ.id =" + intID;
                lst = tender_HYYQBLL.GetAllTender_HYYQs(strHQL);
                if (lst != null && lst.Count > 0)
                {
                    Tender_HYYQ tender_HYYQ = (Tender_HYYQ)lst[0];

                    if (tender_HYYQ.Progress != "完成")
                    {
                        tender_HYYQBLL.DeleteTender_HYYQ(tender_HYYQ);

                        //重新加载列表
                        LoadTenderInfo("");

                        HF_ID.Value = "";

                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('失败，此投标已完成，不能删除，请检查')", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZBJLBCZJC + "')", true);
                    return;
                }
            }
        }
    }

    protected void BT_SelectPM_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popSelectPMWindow') ", true);
    }

    protected void BT_SelectTechnicalDirector_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popSelectTechnicalDirectorWindow') ", true);
    }

    protected void BT_SelectPrincipalr_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popSelectPrincipalrWindow') ", true);
    }

    protected void BT_Select_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popSelectMemberwindow') ", true);
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popSelectMemberwindow') ", true);
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strID, strOperatorCode;

        strID = HF_ID.Value;

        if (strID != "")
        {
            strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();

            TenderRelatedUserBLL tenderRelatedUserBLL = new TenderRelatedUserBLL();
            TenderRelatedUser tenderRelatedUser = new TenderRelatedUser();

            tenderRelatedUser.TenderID = int.Parse(strID);
            tenderRelatedUser.UserCode = strOperatorCode;
            tenderRelatedUser.UserName = ShareClass.GetUserName(strOperatorCode);

            try
            {
                tenderRelatedUserBLL.AddTenderRelatedUser(tenderRelatedUser);

                LoadTenderRelatedUser(strID);
            }
            catch
            {
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZTBCNZJCY + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    protected void RP_TenderMember_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserName = ((Button)e.Item.FindControl("BT_UserName")).Text;

            string strHQL;
            IList lst;

            string strID = HF_ID.Value;
            strHQL = "from TenderRelatedUser as tenderRelatedUser where tenderRelatedUser.TenderID = " + strID + " and tenderRelatedUser.UserName = " + "'" + strUserName + "'";
            TenderRelatedUserBLL tenderRelatedUserBLL = new TenderRelatedUserBLL();
            lst = tenderRelatedUserBLL.GetAllTenderRelatedUsers(strHQL);

            TenderRelatedUser tenderRelatedUser = (TenderRelatedUser)lst[0];

            tenderRelatedUserBLL.DeleteTenderRelatedUser(tenderRelatedUser);

            LoadTenderRelatedUser(strID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void BT_FindGroup_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strGroupName = TB_ActorGroupName.Text.Trim();
        strGroupName = "%" + strGroupName + "%";

        strHQL = "from ActorGroup as actorGroup where actorGroup.GroupName not in ('个人','部门','公司','集团','所有')";
        strHQL += " and actorGroup.GroupName Like " + "'" + strGroupName + "'";
        strHQL += " and actorGroup.LangCode = '" + strLangCode + "'";
        ActorGroupBLL actorGroupBLL = new ActorGroupBLL();
        lst = actorGroupBLL.GetAllActorGroups(strHQL);
        Repeater1.DataSource = lst;
        Repeater1.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popSelectMemberwindow') ", true);
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            int i = 0;
            string strTenderCode, strGroupName;
            string strTenderUserCode;

            string strID = HF_ID.Value;

            strGroupName = ((Button)e.Item.FindControl("BT_GroupName")).Text.Trim();

            TB_ActorGroupName.Text = strGroupName;

            strTenderCode = TB_TenderCode.Text.Trim();

            TenderRelatedUserBLL tenderRelatedUserBLL = new TenderRelatedUserBLL();
            TenderRelatedUser tenderRelatedUser = new TenderRelatedUser();

            ActorGroupDetailBLL actorGroupDetailBLL = new ActorGroupDetailBLL();
            ActorGroupDetail actorGroupDetail = new ActorGroupDetail();

            if (strTenderCode != "")
            {
                strHQL = "from ActorGroupDetail as actorGroupDetail where actorGroupDetail.GroupName = " + "'" + strGroupName + "'";
                lst = actorGroupDetailBLL.GetAllActorGroupDetails(strHQL);
                for (i = 0; i < lst.Count; i++)
                {
                    actorGroupDetail = (ActorGroupDetail)lst[i];
                    strTenderUserCode = actorGroupDetail.UserCode.Trim();

                    tenderRelatedUser.TenderID = int.Parse(strID);
                    tenderRelatedUser.UserCode = strUserCode;
                    tenderRelatedUser.UserName = ShareClass.GetUserName(strTenderUserCode);

                    try
                    {
                        tenderRelatedUserBLL.AddTenderRelatedUser(tenderRelatedUser);
                    }
                    catch
                    {
                    }
                }

                LoadTenderRelatedUser(strID);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZKHCNZJCY + "')", true);
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierInfo");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid2);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popSelectPMWindow') ", true);
    }


    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strOperatorCode, strOperatorName;

        strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        strOperatorName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();

        LB_PMCode.Text = strOperatorCode;
        TB_PMName.Text = strOperatorName;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView3.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid4);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popSelectTechnicalDirectorWindow') ", true);
    }


    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strOperatorCode, strOperatorName;

        strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        strOperatorName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();

        LB_TechnicalDirectorCode.Text = strOperatorCode;
        TB_TechnicalDirectorName.Text = strOperatorName;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void TreeView4_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView4.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid5);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popSelectPrincipalrWindow') ", true);
    }

    protected void DataGrid5_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strOperatorCode, strOperatorName;

        strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        strOperatorName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();

        LB_PrincipalCode.Text = strOperatorCode;
        TB_PrincipalName.Text = strOperatorName;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    protected string SubmitApply()
    {
        string strWLName, strWLType, strTemName, strXMLFileName, strXMLFile2;
        string strDescription, strCreatorCode, strCreatorName;
        string strCmdText, strTrenderID;

        string strWLID;

        strTrenderID = HF_ID.Value;

        if (strRelatedType == null)
        {
            strRelatedType = "投标";
            strRelatedID = strTrenderID;

        }

        strWLID = "0";

        XMLProcess xmlProcess = new XMLProcess();

        strWLName = TB_WLName.Text.Trim();
        strWLType = DL_WFType.SelectedValue.Trim();
        strTemName = DL_TemName.SelectedValue.Trim();
        strDescription = TB_Description.Text.Trim();
        strCreatorCode = strUserCode;
        strCreatorName = ShareClass.GetUserName(strCreatorCode);

        if (strTemName == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSSCSBLCMBBNWKJC + "');</script>");

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

            return "0";
        }

        strXMLFileName = strWLType + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".xml";
        strXMLFile2 = "Doc\\" + "XML" + "\\" + strXMLFileName;

        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        WorkFlow workFlow = new WorkFlow();

        workFlow.WLName = strWLName;
        workFlow.WLType = strWLType;
        workFlow.XMLFile = strXMLFile2;
        workFlow.TemName = strTemName;
        workFlow.Description = strDescription;
        workFlow.CreatorCode = strCreatorCode;
        workFlow.CreatorName = strCreatorName;
        workFlow.CreateTime = DateTime.Now;

        workFlow.RelatedType = strRelatedType;
        workFlow.RelatedID = int.Parse(strRelatedID);

        workFlow.BusinessType = "Trender";
        workFlow.BusinessCode = strTrenderID;

        workFlow.Status = "新建";
        workFlow.DIYNextStep = "Yes";
        workFlow.IsPlanMainWorkflow = "NO";

        if (CB_SMS.Checked == true)
        {
            workFlow.ReceiveSMS = "Yes";
        }
        else
        {
            workFlow.ReceiveSMS = "No";
        }

        if (CB_Mail.Checked == true)
        {
            workFlow.ReceiveEMail = "Yes";
        }
        else
        {
            workFlow.ReceiveEMail = "No";
        }

        try
        {
            workFlowBLL.AddWorkFlow(workFlow);

            strWLID = ShareClass.GetMyCreatedWorkFlowID(strUserCode);

            LoadRelatedWL(strWLType, "投标", int.Parse(strTrenderID));

            //UpdateGoodsPurchaseStatus(strPDID, "处理中");
            //DL_PDStatus.SelectedValue = "处理中";



            strCmdText = "select  * from T_Tender_HYYQ where ID = " + strTrenderID;
            strXMLFile2 = Server.MapPath(strXMLFile2);
            xmlProcess.DbToXML(strCmdText, "T_Tender_HYYQ", strXMLFile2);

            //Workflow,添加模组关联流程记录
            ShareClass.AddModuleToRelatedWorkflow(strWLID, "0", "0", "投标管理", strTrenderID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('投标申请生成成功')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('警告，投标申请生成失败，请检查！')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

            return "0";
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

        return strWLID;
    }

    protected void BT_ActiveYes_Click(object sender, EventArgs e)
    {
        string strWLID = SubmitApply();

        if (strWLID != "0")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop11", "popShowByURL('TTMyWorkDetailMain.aspx?RelatedType=Other&WLID=" + strWLID + "','workflow','99%','99%',window.location);", true);
        }
    }

    protected void BT_ActiveNo_Click(object sender, EventArgs e)
    {
        SubmitApply();
    }

    protected void BT_Reflash_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '投标管理'";
        strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC";
        WorkFlowTemplateBLL workFlowTemplateBLL = new WorkFlowTemplateBLL();
        lst = workFlowTemplateBLL.GetAllWorkFlowTemplates(strHQL);

        DL_TemName.DataSource = lst;
        DL_TemName.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);
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

    protected void LoadTenderRelatedUser(string strID)
    {
        string strHQL;
        IList lst;

        strHQL = "from TenderRelatedUser as tenderRelatedUser where tenderRelatedUser.TenderID = " + strID;
        TenderRelatedUserBLL tenderRelatedUserBLL = new TenderRelatedUserBLL();
        lst = tenderRelatedUserBLL.GetAllTenderRelatedUsers(strHQL);

        RP_TenderMember.DataSource = lst;
        RP_TenderMember.DataBind();
    }

    protected void LoadTenderContent()
    {
        string strHQL;

        strHQL = "Select TenderContent from t_tender_content";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Tender_Content");

        DL_TenderContent.DataSource = ds;
        DL_TenderContent.DataBind();

        DL_TenderContent.Items.Insert(0, new ListItem("--Select--", ""));
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

    protected int GetRelatedWorkFlowNumber(string strWLType, string strRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where (workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType = " + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + strRelatedID + ")";
        strHQL += " Or (workFlow.BusinessType = 'GoodsProduction' and workFlow.BusinessCode = '" + strRelatedID + "')";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        return lst.Count;
    }
}