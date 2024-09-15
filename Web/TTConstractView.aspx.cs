using System;
using System.Resources;
using System.Data;
using System.Drawing;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTConstractView : System.Web.UI.Page
{
    string strAuthority;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL = "";
        IList lst;

        string strConstractID, strConstractCode, strConstractName;

        string strUserCode = Session["UserCode"].ToString();
        string strUserName = Session["UserName"].ToString();
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ConstractBLL constractBLL = new ConstractBLL();
        Constract constract = new Constract();

        strConstractID = Request.QueryString["ID"];
        if (strConstractID != null)
        {
            strHQL = "from Constract as constract where constract.ConstractID = " + strConstractID;
        }

        strConstractCode = Request.QueryString["ConstractCode"];
        if (strConstractCode != null)
        {
            strHQL = "from Constract as constract where constract.ConstractCode = " + "'" + strConstractCode + "'";
        }

        lst = constractBLL.GetAllConstracts(strHQL);
        DataList1.DataSource = lst;
        DataList1.DataBind();

        constract = (Constract)lst[0];

        strConstractCode = constract.ConstractCode.Trim();
        strConstractName = constract.ConstractName.Trim();
        strConstractID = constract.ConstractID.ToString();

        HL_BusinessForm.NavigateUrl = "TTRelatedDIYBusinessForm.aspx?RelatedType=Constract&RelatedID=" + strConstractID + "&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(ShareClass.getBusinessFormTemName("Constract", strConstractID));
        //BusinessForm，如果不含业务表单，就隐藏“相关表单按钮”
        if (ShareClass.getRelatedBusinessFormTemName("Constract", strConstractID) == "")
        {
            HL_BusinessForm.Visible = false;
        }


        strAuthority = GetConstractRelatedUserAuthority(strConstractCode, strUserCode);

        //this.Title = "合同：" + strConstractCode + " " + strConstractName + " 详细内容";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadConstractReceivables(strConstractCode, strAuthority);
            LoadConstractPayable(strConstractCode, strAuthority);

            LoadConstractRelatedInvoice(strConstractCode);

            LoadConstractSales(strConstractCode);
            LoadRelatedCollaboration(strConstractCode);

            LoadConstractRelatedGoodsList(strConstractCode);

            LoadConstractGoodsReceiptPlanList(strConstractCode);
            LoadConstractGoodsDeliveryPlanList(strConstractCode);

            LoadConstractRelatedUser(strConstractCode);

            LoadConstractRelatedEntry(strConstractCode);
            LoadConstractRelatedEntryForInner(strConstractCode);

            CountReceivablesAmount(strConstractCode, strAuthority);
            CountPayableAmount(strConstractCode, strAuthority);
            CountInvoiceAmount(strConstractCode);


            LoadRelatedDocByDocType(strConstractCode, "补充协议", DataGrid19);
            LoadRelatedDocByDocType(strConstractCode, "合同依据", DataGrid20);
            LoadRelatedDocByDocType(strConstractCode, "项目其他信息", DataGrid21);

            LB_ConstractCode.Text = strConstractCode;

            HL_RelatedDoc.NavigateUrl = "TTConstractRelatedDocView.aspx?RelatedID=" + strConstractID;

            try
            {
                string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];
                if (strProductType != "ERP" & strProductType != "CRM" & strProductType != "SIMP" & strProductType != "EDPMP" & strProductType != "ECMP" & strProductType != "DEMO")
                {
                    TabPanel5.Visible = false;
                    TabPanel9.Visible = false;
                    TabPanel13.Visible = false;
                    TabPanel15.Visible = false;
                }

                if (strProductType != "CRM")
                {
                    TabPanel13.Visible = false;
                    TabPanel15.Visible = false;

                    TabPanel3.Visible = false;
                    TabPanel4.Visible = false;
                    TabPanel6.Visible = false;
                }
            }
            catch
            {

            }
        }
    }


    protected void CountReceivablesAmount(string strConstractCode, string strAuthority)
    {
        string strHQL;
        IList lst;

        decimal deReceivablesAmount = 0, deReceiverAmount = 0, deUnReceiveAmount = 0;

        if (strAuthority == "ALL")
        {
            strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.ConstractCode = " + "'" + strConstractCode + "'";
        }
        else
        {
            strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.ConstractCode = " + "'" + strConstractCode + "'";
            strHQL += " and constractReceivables.IsSecrecy = 'NO'";
        }
        ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
        lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);

        ConstractReceivables constractReceivables = new ConstractReceivables();

        for (int i = 0; i < lst.Count; i++)
        {
            constractReceivables = (ConstractReceivables)lst[i];

            deReceivablesAmount += constractReceivables.ReceivablesAccount;
            deReceiverAmount += constractReceivables.ReceiverAccount;
            deUnReceiveAmount += constractReceivables.UNReceiveAmount;
        }

        LB_ReceivablesAmount.Text = deReceivablesAmount.ToString();
        LB_ReceiverAmount.Text = deReceiverAmount.ToString();
        LB_UNReceiverAmount.Text = deUnReceiveAmount.ToString();
    }

    protected void CountPayableAmount(string strConstractCode, string strAuthority)
    {
        string strHQL;
        IList lst;

        decimal dePayableAmount = 0, dePayAmount = 0, deUnPayAmount = 0;

        if (strAuthority == "ALL")
        {
            strHQL = "from ConstractPayable as constractPayable where constractPayable.ConstractCode = " + "'" + strConstractCode + "'";
        }
        else
        {
            strHQL = "from ConstractPayable as constractPayable where constractPayable.ConstractCode = " + "'" + strConstractCode + "'";
            strHQL += " and constractPayable.IsSecrecy = 'NO'";
        }
        ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
        lst = constractPayableBLL.GetAllConstractPayables(strHQL);

        ConstractPayable constractPayable = new ConstractPayable();

        for (int i = 0; i < lst.Count; i++)
        {
            constractPayable = (ConstractPayable)lst[i];

            dePayableAmount += constractPayable.PayableAccount;
            dePayAmount += constractPayable.OutOfPocketAccount;
            deUnPayAmount += constractPayable.UNPayAmount;
        }

        LB_PayableAmount.Text = dePayableAmount.ToString();
        LB_PayAmount.Text = dePayAmount.ToString();
        LB_UNPayAmount.Text = deUnPayAmount.ToString();
    }

    protected void CountInvoiceAmount(string strConstractCode)
    {
        string strHQL;
        IList lst;

        decimal deInvoiceAmount = 0;

        strHQL = "from ConstractRelatedInvoice as constractRelatedInvoice where constractRelatedInvoice.ConstractCode = " + "'" + strConstractCode + "'";
        ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
        lst = constractRelatedInvoiceBLL.GetAllConstractRelatedInvoices(strHQL);

        ConstractRelatedInvoice constractRelatedInvoice = new ConstractRelatedInvoice();

        for (int i = 0; i < lst.Count; i++)
        {
            constractRelatedInvoice = (ConstractRelatedInvoice)lst[i];


            deInvoiceAmount += constractRelatedInvoice.Amount;
        }


        LB_TotalInvoiceAmount.Text = deInvoiceAmount.ToString();
    }


    protected void LoadConstractReceivables(string strConstractCode, string strAuthority)
    {
        string strHQL;
        IList lst;

        if (strAuthority == "ALL")
        {
            strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.ConstractCode = " + "'" + strConstractCode + "'";
        }
        else
        {
            strHQL = "from ConstractReceivables as constractReceivables where constractReceivables.ConstractCode = " + "'" + strConstractCode + "'";
            strHQL += " and constractReceivables.IsSecrecy='NO'";
        }
        strHQL += " Order By constractReceivables.ID DESC";

        ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
        lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void LoadConstractPayable(string strConstractCode, string strAuthority)
    {
        string strHQL;
        IList lst;

        if (strAuthority == "ALL")
        {
            strHQL = "from ConstractPayable as constractPayable where constractPayable.ConstractCode = " + "'" + strConstractCode + "'";
        }
        else
        {
            strHQL = "from ConstractPayable as constractPayable where constractPayable.ConstractCode = " + "'" + strConstractCode + "'";
            strHQL += " and constractPayable.IsSecrecy='NO'";
        }
        strHQL += " Order By constractPayable.ID DESC";
        ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
        lst = constractPayableBLL.GetAllConstractPayables(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void LoadRelatedCollaboration(string strConstractCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Collaboration as collaboration where ";
        strHQL += " collaboration.RelatedType = 'CONSTRACT'";
        strHQL += " and collaboration.RelatedCode = " + "'" + strConstractCode + "'";
        strHQL += " Order by collaboration.CoID DESC";
        CollaborationBLL collaborationBLL = new CollaborationBLL();
        lst = collaborationBLL.GetAllCollaborations(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void LoadConstractRelatedInvoice(string strConstractCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractRelatedInvoice as constractRelatedInvoice where constractRelatedInvoice.ConstractCode = " + "'" + strConstractCode + "'";
        ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
        lst = constractRelatedInvoiceBLL.GetAllConstractRelatedInvoices(strHQL);

        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
    }

    protected void LoadConstractSales(string strConstractCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From ConstractSales as constractSales Where constractSales.ConstractCode = " + "'" + strConstractCode + "'" + " Order By constractSales.ID ASC";
        ConstractSalesBLL constractSalesBLL = new ConstractSalesBLL();
        lst = constractSalesBLL.GetAllConstractSaless(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strUserName = projectMember.UserName;
        return strUserName.Trim();
    }

    protected void LoadConstractRelatedGoodsList(string strConstractCode)
    {
        string strHQL;
        IList lst;


        ConstractRelatedGoodsBLL constractRelatedGoodsBLL = new ConstractRelatedGoodsBLL();
        strHQL = "from ConstractRelatedGoods as constractRelatedGoods where constractRelatedGoods.ConstractCode = " + "'" + strConstractCode + "'";
        lst = constractRelatedGoodsBLL.GetAllConstractRelatedGoodss(strHQL);

        DataGrid11.DataSource = lst;
        DataGrid11.DataBind();
    }


    protected void LoadConstractGoodsReceiptPlanList(string strConstractCode)
    {
        string strHQL;
        IList lst;


        ConstractGoodsReceiptPlanBLL constractGoodsReceiptPlanBLL = new ConstractGoodsReceiptPlanBLL();
        strHQL = "from ConstractGoodsReceiptPlan as constractGoodsReceiptPlan where constractGoodsReceiptPlan.ConstractCode = " + "'" + strConstractCode + "'";
        lst = constractGoodsReceiptPlanBLL.GetAllConstractGoodsReceiptPlans(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void LoadConstractGoodsDeliveryPlanList(string strConstractCode)
    {
        string strHQL;
        IList lst;


        ConstractGoodsDeliveryPlanBLL constractGoodsDeliveryPlanBLL = new ConstractGoodsDeliveryPlanBLL();
        strHQL = "from ConstractGoodsDeliveryPlan as constractGoodsDeliveryPlan where constractGoodsDeliveryPlan.ConstractCode = " + "'" + strConstractCode + "'";
        lst = constractGoodsDeliveryPlanBLL.GetAllConstractGoodsDeliveryPlans(strHQL);

        DataGrid7.DataSource = lst;
        DataGrid7.DataBind();
    }

    protected void LoadConstractRelatedUser(string strConstractCode)
    {
        string strHQL;
        IList lst;


        strHQL = "from ConstractRelatedUser as constractRelatedUser where constractRelatedUser.ConstractCode = " + "'" + strConstractCode + "'";
        ConstractRelatedUserBLL constractRelatedUserBLL = new ConstractRelatedUserBLL();
        lst = constractRelatedUserBLL.GetAllConstractRelatedUsers(strHQL);

        DataGrid12.DataSource = lst;
        DataGrid12.DataBind();
    }

    protected void LoadConstractRelatedEntry(string strConstractCode)
    {
        string strHQL;

        strHQL = "From ConstractRelatedEntryOrder as constractRelatedEntryOrder Where constractRelatedEntryOrder.ConstractCode = " + "'" + strConstractCode + "'";
        ConstractRelatedEntryOrderBLL contractRelatedEntryOrderBLL = new ConstractRelatedEntryOrderBLL();
        IList lst = contractRelatedEntryOrderBLL.GetAllConstractRelatedEntryOrders(strHQL);

        DataGrid10.DataSource = lst;
        DataGrid10.DataBind();
    }

    protected void LoadConstractRelatedEntryForInner(string strConstractCode)
    {
        string strHQL;

        strHQL = "From ConstractRelatedEntryOrderForInner as constractRelatedEntryOrderForInner Where constractRelatedEntryOrderForInner.ConstractCode = " + "'" + strConstractCode + "'";
        ConstractRelatedEntryOrderForInnerBLL contractRelatedEntryOrderBLL = new ConstractRelatedEntryOrderForInnerBLL();
        IList lst = contractRelatedEntryOrderBLL.GetAllConstractRelatedEntryOrderForInners(strHQL);

        DataGrid15.DataSource = lst;
        DataGrid15.DataBind();
    }

    protected string GetConstractRelatedUserAuthority(string strConstractCode, string strUserCode)
    {
        string strHQL;
        IList lst;

        string strRecorderCode;

        strHQL = "From Constract as constract where constract.ConstractCode = " + "'" + strConstractCode + "'";
        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);
        Constract constract = (Constract)lst[0];

        strRecorderCode = constract.RecorderCode.Trim();

        if (strRecorderCode != strUserCode)
        {
            strHQL = "from ConstractRelatedUser as constractRelatedUser where constractRelatedUser.ConstractCode = " + "'" + strConstractCode + "'" + " and constractRelatedUser.UserCode = " + "'" + strUserCode + "'";
            ConstractRelatedUserBLL constractRelatedUserBLL = new ConstractRelatedUserBLL();
            lst = constractRelatedUserBLL.GetAllConstractRelatedUsers(strHQL);

            if (lst.Count > 0)
            {
                ConstractRelatedUser constractRelatedUser = (ConstractRelatedUser)lst[0];
                return constractRelatedUser.Authority.Trim();
            }
            else
            {
                return "NO";
            }
        }
        else
        {
            return "ALL";
        }
    }

    //按类型列出文档
    protected void LoadRelatedDocByDocType(string strConstractCode, string strDocType, DataGrid dataGrid)
    {
        string strHQL, strUserCode;
        IList lst;

        strUserCode = LB_UserCode.Text.Trim();

        strHQL = "from Document as document where ";
        strHQL += " (document.RelatedType = '合同' and document.RelatedID in (select constract.ConstractID from Constract as constract where constract.ConstractCode =" + "'" + strConstractCode + "'" + ")";
        strHQL += " or document.RelatedType = '工作流' and document.RelatedID in (Select workFlow.WLID From WorkFlow as workFlow Where workFlow.RelatedType = '合同' and workFlow.RelatedID in ( select constract.ConstractID from Constract as constract where constract.ConstractCode =" + "'" + strConstractCode + "'" + "))";
        strHQL += " or document.RelatedType = '协作' and document.RelatedID in (Select collaboration.CoID From Collaboration as collaboration Where collaboration.RelatedType = 'CONSTRACT' and collaboration.RelatedCode =" + "'" + strConstractCode + "'" + "))";
        strHQL += " and document.DocType = '" + strDocType + "'";

        strHQL += " and rtrim(ltrim(document.Status)) <> '删除' Order by document.DocID DESC";

        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);


        dataGrid.DataSource = lst;
        dataGrid.DataBind();
    }
}
