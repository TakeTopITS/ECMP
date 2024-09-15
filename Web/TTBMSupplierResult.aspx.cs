using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTBMSupplierResult : System.Web.UI.Page
{
    string strUserCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            GetBMSupplierInfo(strUserCode.Trim());
        }
    }

    protected void GetBMSupplierInfo(string strSupplierCode)
    {
        lbl_CodePerson.Text = "个人帐号：" + strSupplierCode.Trim();
        if (strSupplierCode.Trim().Contains("-"))
        {
            strSupplierCode = strSupplierCode.Trim().Substring(0, strSupplierCode.Trim().IndexOf("-"));
        }
        string strHQL = "from BMSupplierInfo as bMSupplierInfo where bMSupplierInfo.Code = '" + strSupplierCode + "' ";
        BMSupplierInfoBLL bMSupplierInfoBLL = new BMSupplierInfoBLL();
        IList lst = bMSupplierInfoBLL.GetAllBMSupplierInfos(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMSupplierInfo bMSupplierInfo = (BMSupplierInfo)lst[0];

            LB_SupplierInfoID.Text = bMSupplierInfo.ID.ToString();
            lbl_CompanyType.Text = bMSupplierInfo.CompanyType.Trim();
            lbl_Status.Text = bMSupplierInfo.Status.Trim();
            lbl_Address.Text = bMSupplierInfo.Address.Trim();
            lbl_Bank.Text = bMSupplierInfo.Bank.Trim();
            lbl_BankNo.Text = bMSupplierInfo.BankNo.Trim();
            lbl_Code.Text = bMSupplierInfo.Code.Trim();
            lbl_CompanyFor.Text = bMSupplierInfo.CompanyFor.Trim();
            lbl_EinNo.Text = bMSupplierInfo.EinNo.Trim();
            lbl_Email.Text = bMSupplierInfo.Email.Trim();
            lbl_Fax.Text = bMSupplierInfo.Fax.Trim();
            lbl_Name.Text = bMSupplierInfo.Name.Trim();
            lbl_PhoneNum.Text = bMSupplierInfo.PhoneNum.Trim();
            lbl_Qualification.Text = bMSupplierInfo.Qualification.Trim();
            lbl_SupplyScope.Text = bMSupplierInfo.SupplyScope.Trim();
            lbl_WebUrl.Text = bMSupplierInfo.WebUrl.Trim();
            lbl_ZipCode.Text = bMSupplierInfo.ZipCode.Trim();
            lbl_Remark.Text = bMSupplierInfo.Remark.Trim();

            GetBMSupplierInfoLinkAndCer(bMSupplierInfo.Code.Trim());

            string strBeforeId = bMSupplierInfo.ID.ToString() + ",";
            string strBackId = "," + bMSupplierInfo.ID.ToString();
            string strMidId = "," + bMSupplierInfo.ID.ToString() + ",";
            int i = bMSupplierInfo.ID.ToString().Length + 1;
            strHQL = "Select * From T_BMAnnInvitation Where LEFT(BidObjects," + i + ") = '" + strBeforeId + "' or RIGHT(BidObjects," + i + ") = '" + strBackId + "' or BidObjects = '" + bMSupplierInfo.ID.ToString() + "' or BidObjects like '%" + strMidId + "%' Order By ID DESC ";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMAnnInvitation");
            DataGrid3.DataSource = ds;
            DataGrid3.DataBind();

            strHQL = "Select A.*,B.FileName,B.FilePath From T_BMAnnInvitation as A left join T_BMBidFile as B on A.BidPlanID=B.BidPlanID Where LEFT(A.BidObjects," + i + ") = '" + strBeforeId + "' or RIGHT(A.BidObjects," + i + ") =  '" + strBackId + "' or A.BidObjects = '" + bMSupplierInfo.ID.ToString() + "' or A.BidObjects like '%" + strMidId + "%' Order By A.ID DESC ";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMAnnInvitationAndBMBidFile");
            DataGrid7.DataSource = ds;
            DataGrid7.DataBind();

            strHQL = "Select * From T_BMBidAddendum Where BidPlanID in (select BidPlanID from T_BMAnnInvitation Where LEFT(BidObjects," + i + ") = '" + strBeforeId + "' or RIGHT(BidObjects," + i + ") = '" + strBackId + "' or BidObjects = '" + bMSupplierInfo.ID.ToString() + "' or BidObjects like '%" + strMidId + "%') Order By ID DESC ";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMBidAddendum");
            DataGrid2.DataSource = ds;
            DataGrid2.DataBind();

            strHQL = "Select * From T_BMSupplierReply Where SupplierId = '" + bMSupplierInfo.ID.ToString().Trim() + "' Order By ID DESC ";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierReply");
            DataGrid6.DataSource = ds;
            DataGrid6.DataBind();

            strHQL = "from BMSupplierBid as bMSupplierBid where bMSupplierBid.SupplierCode = '" + bMSupplierInfo.ID.ToString().Trim() + "' ";
            BMSupplierBidBLL bMSupplierBidBLL = new BMSupplierBidBLL();
            lst = bMSupplierBidBLL.GetAllBMSupplierBids(strHQL);
            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();

            strHQL = "from BMSupplierBidRecord as bMSupplierBidRecord where bMSupplierBidRecord.SupplierCode = '" + bMSupplierInfo.ID.ToString().Trim() + "' ";
            BMSupplierBidRecordBLL bMSupplierBidRecordBLL = new BMSupplierBidRecordBLL();
            lst = bMSupplierBidRecordBLL.GetAllBMSupplierBidRecords(strHQL);
            DataGrid5.DataSource = lst;
            DataGrid5.DataBind();
        }
        else
        {
            DataGrid1.DataSource = null;
            DataGrid1.DataBind();

            DataGrid2.DataSource = null;
            DataGrid2.DataBind();

            DataGrid3.DataSource = null;
            DataGrid3.DataBind();

            DataGrid4.DataSource = null;
            DataGrid4.DataBind();

            DataGrid5.DataSource = null;
            DataGrid5.DataBind();

            DataGrid6.DataSource = null;
            DataGrid6.DataBind();

            DataGrid7.DataSource = null;
            DataGrid7.DataBind();
        }
    }

    protected void GetBMSupplierInfoLinkAndCer(string strSupplierCode)
    {
        string strHQL = "from BMContractDiscuss as bMContractDiscuss where bMContractDiscuss.SupplierCode = '" + strSupplierCode + "' ";
        BMContractDiscussBLL bMContractDiscussBLL = new BMContractDiscussBLL();
        IList lst = bMContractDiscussBLL.GetAllBMContractDiscusss(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected string GetBMSupplierBidStatus(string strBidStatus)
    {
        if (strBidStatus.Trim().Equals("Y"))
        {
            return "中标";
        }
        else if (strBidStatus.Trim().Equals("N"))
        {
            return "未中标";
        }
        else
        {
            return "未开标";
        }
    }

    protected string GetBMAnnInvitationName(string strAnnInvitationID)
    {
        string strHQL = "from BMAnnInvitation as bMAnnInvitation where bMAnnInvitation.ID = '" + strAnnInvitationID.Trim() + "' ";
        BMAnnInvitationBLL bMAnnInvitationBLL = new BMAnnInvitationBLL();
        IList lst = bMAnnInvitationBLL.GetAllBMAnnInvitations(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMAnnInvitation bMAnnInvitation = (BMAnnInvitation)lst[0];
            return bMAnnInvitation.Name.Trim();
        }
        else
            return "";
    }

    protected string GetBMContractStatus(string strId, string strStatus)
    {
        string strHQL = "from BMContractPreparation as bMContractPreparation where bMContractPreparation.ContractDiscussID = '" + strId.Trim() + "' ";
        BMContractPreparationBLL bMContractPreparationBLL = new BMContractPreparationBLL();
        IList lst = bMContractPreparationBLL.GetAllBMContractPreparations(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            return "合同已签订";
        }
        else
        {
            if (strStatus.Trim().Equals("新建"))
            {
                return "合同洽谈新建";
            }
            else if (strStatus.Trim().Equals("不合格"))
            {
                return "合同洽谈审核不合格";
            }
            else
                return "合同洽谈中";
        }
    }

    protected string GetBMAnnInvitationByPlanName(string strBidPlanID)
    {
        string strHQL = "from BMAnnInvitation as bMAnnInvitation where bMAnnInvitation.BidPlanID = '" + strBidPlanID.Trim() + "' ";
        BMAnnInvitationBLL bMAnnInvitationBLL = new BMAnnInvitationBLL();
        IList lst = bMAnnInvitationBLL.GetAllBMAnnInvitations(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMAnnInvitation bMAnnInvitation = (BMAnnInvitation)lst[0];
            return bMAnnInvitation.Name.Trim();
        }
        else
            return "";
    }

    protected string GetBMAnnInvitationByAnnClaFileName(string strAnnClaFileID)
    {
        //T_BMAnnClaFile
        string strHQL = "from BMAnnClaFile as bMAnnClaFile where bMAnnClaFile.ID = '" + strAnnClaFileID.Trim() + "' ";
        BMAnnClaFileBLL bMAnnClaFileBLL = new BMAnnClaFileBLL();
        IList lst = bMAnnClaFileBLL.GetAllBMAnnClaFiles(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMAnnClaFile bMAnnClaFile = (BMAnnClaFile)lst[0];

            strHQL = "from BMAnnInvitation as bMAnnInvitation where bMAnnInvitation.BidPlanID = '" + bMAnnClaFile.BidPlanID.ToString().Trim() + "' ";
            BMAnnInvitationBLL bMAnnInvitationBLL = new BMAnnInvitationBLL();
            lst = bMAnnInvitationBLL.GetAllBMAnnInvitations(strHQL);
            if (lst.Count > 0 && lst != null)
            {
                BMAnnInvitation bMAnnInvitation = (BMAnnInvitation)lst[0];
                return bMAnnInvitation.Name.Trim();
            }
            else
                return "";
        }
        else
            return "";
    }

    protected string GetBMAnnClaFileSendContent(string strAnnClaFileID)
    {
        //T_BMAnnClaFile
        string strHQL = "from BMAnnClaFile as bMAnnClaFile where bMAnnClaFile.ID = '" + strAnnClaFileID.Trim() + "' ";
        BMAnnClaFileBLL bMAnnClaFileBLL = new BMAnnClaFileBLL();
        IList lst = bMAnnClaFileBLL.GetAllBMAnnClaFiles(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMAnnClaFile bMAnnClaFile = (BMAnnClaFile)lst[0];
            return bMAnnClaFile.SendContent.Trim();
        }
        else
            return "";
    }

    protected string GetBMAnnClaFileSentDate(string strAnnClaFileID)
    {
        //T_BMAnnClaFile
        string strHQL = "from BMAnnClaFile as bMAnnClaFile where bMAnnClaFile.ID = '" + strAnnClaFileID.Trim() + "' ";
        BMAnnClaFileBLL bMAnnClaFileBLL = new BMAnnClaFileBLL();
        IList lst = bMAnnClaFileBLL.GetAllBMAnnClaFiles(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMAnnClaFile bMAnnClaFile = (BMAnnClaFile)lst[0];
            if (string.IsNullOrEmpty(bMAnnClaFile.SentDate.ToString()))
                return "";
            else
                return bMAnnClaFile.SentDate.ToString("yyyy-MM-dd");
        }
        else
            return "";
    }
}