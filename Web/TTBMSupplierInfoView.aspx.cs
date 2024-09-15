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

public partial class TTBMSupplierInfoView : System.Web.UI.Page
{
    string strSupplierID;
    protected void Page_Load(object sender, EventArgs e)
    {
        strSupplierID = Request.QueryString["SupplierID"];
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            GetBMSupplierInfo(strSupplierID);
        }
    }

    protected void GetBMSupplierInfo(string strSupplierId)
    {
        string strHQL = "from BMSupplierInfo as bMSupplierInfo where bMSupplierInfo.ID = '" + strSupplierId + "' ";
        BMSupplierInfoBLL bMSupplierInfoBLL = new BMSupplierInfoBLL();
        IList lst = bMSupplierInfoBLL.GetAllBMSupplierInfos(strHQL);
        BMSupplierInfo bMSupplierInfo = (BMSupplierInfo)lst[0];

        LB_SupplierInfoID.Text = bMSupplierInfo.ID.ToString();
        LB_ApplicantName.Text = ShareClass.GetUserName(bMSupplierInfo.EnterPer.Trim());
        lbl_CompanyType.Text = bMSupplierInfo.CompanyType.Trim();
        lbl_EnterDate.Text = bMSupplierInfo.EnterDate.ToString("yyyy-MM-dd");
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
        lbl_ReviewDate.Text = bMSupplierInfo.ReviewDate.ToString("yyyy-MM-dd");
        lbl_Reviewer.Text = string.IsNullOrEmpty(bMSupplierInfo.Reviewer) ? "" : bMSupplierInfo.Reviewer.Trim();
        lbl_Point.Text = bMSupplierInfo.Point.ToString();
        lbl_SubcontractProfessional.Text = bMSupplierInfo.SubcontractProfessional.Trim();

        lbl_BusinessLicense.Text = bMSupplierInfo.BusinessLicense.Trim();
        lbl_EmployeesNum.Text = bMSupplierInfo.EmployeesNum.ToString();
        lbl_IsLand.Text = bMSupplierInfo.IsLand.Trim();
        lbl_ITNumber.Text = bMSupplierInfo.ITNumber.ToString();
        lbl_LastFinalistsNumber.Text = bMSupplierInfo.LastFinalistsNumber.Trim();
        lbl_LegalRepresentative.Text = bMSupplierInfo.LegalRepresentative.Trim();
        lbl_LegalTel.Text = bMSupplierInfo.LegalTel.Trim();
        lbl_MNumber.Text = bMSupplierInfo.MNumber.ToString();
        lbl_PMNumber.Text = bMSupplierInfo.PMNumber.ToString();
        lbl_PTNumber.Text = bMSupplierInfo.PTNumber.ToString();
        lbl_QualificationCertificate.Text = bMSupplierInfo.QualificationCertificate.Trim();
        lbl_RecommendedUnits.Text = bMSupplierInfo.RecommendedUnits.Trim();
        lbl_RegisteredCapital.Text = bMSupplierInfo.RegisteredCapital.ToString();
        lbl_SetUpTime.Text = bMSupplierInfo.SetUpTime.ToString("yyyy-MM-dd");
        lbl_STNumber.Text = bMSupplierInfo.STNumber.ToString();
        lbl_TechnicalDirector.Text = bMSupplierInfo.TechnicalDirector.Trim();
        lbl_TechnicalTel.Text = bMSupplierInfo.TechnicalTel.Trim();
        lbl_TechnicalTitles.Text = bMSupplierInfo.TechnicalTitles.Trim();
        lbl_TechnicalTitles_T.Text = bMSupplierInfo.TechnicalTitles_T.Trim();

        LoadSupplierInfoAttach(strSupplierId);

        GetBMSupplierInfoLinkAndCer(bMSupplierInfo.Code.Trim());

        strHQL = "from BMSupplierBid as bMSupplierBid where bMSupplierBid.SupplierCode = '" + strSupplierId + "' ";
        BMSupplierBidBLL bMSupplierBidBLL = new BMSupplierBidBLL();
        lst = bMSupplierBidBLL.GetAllBMSupplierBids(strHQL);
        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();

        strHQL = "from BMSupplierBidRecord as bMSupplierBidRecord where bMSupplierBidRecord.SupplierCode = '" + strSupplierId + "' ";
        BMSupplierBidRecordBLL bMSupplierBidRecordBLL = new BMSupplierBidRecordBLL();
        lst = bMSupplierBidRecordBLL.GetAllBMSupplierBidRecords(strHQL);
        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        strHQL = "Select * From T_BMSupplierReply Where SupplierId = '" + bMSupplierInfo.ID.ToString().Trim() + "' Order By ID DESC ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierReply");
        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();
    }

    protected void LoadSupplierInfoAttach(string strId)
    {
        //绑定附件列表
        string strHQL = "from BMSupplierInfo as bMSupplierInfo where bMSupplierInfo.ID = '" + strId + "' ";
        BMSupplierInfoBLL bMSupplierInfoBLL = new BMSupplierInfoBLL();
        IList lst = bMSupplierInfoBLL.GetAllBMSupplierInfos(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMSupplierInfo bMSupplierInfo = (BMSupplierInfo)lst[0];
            if (!string.IsNullOrEmpty(bMSupplierInfo.AccessoriesPath) && bMSupplierInfo.AccessoriesPath.Trim() != "")
            {
                RP_AccessoriesPath.DataSource = lst;
                RP_AccessoriesPath.DataBind();
            }
            else
            {
                RP_AccessoriesPath.DataSource = null;
                RP_AccessoriesPath.DataBind();
            }
        }
    }

    protected void GetBMSupplierInfoLinkAndCer(string strSupplierCode)
    {
        string strHQL = "from BMSupplierLink as bMSupplierLink where bMSupplierLink.SupplierCode = '" + strSupplierCode + "' ";
        BMSupplierLinkBLL bMSupplierLinkBLL = new BMSupplierLinkBLL();
        IList lst = bMSupplierLinkBLL.GetAllBMSupplierLinks(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        strHQL = "from BMSupplierCertification as bMSupplierCertification where bMSupplierCertification.SupplierCode = '" + strSupplierCode + "' ";
        BMSupplierCertificationBLL bMSupplierCertificationBLL = new BMSupplierCertificationBLL();
        lst = bMSupplierCertificationBLL.GetAllBMSupplierCertifications(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        strHQL = "from BMContractDiscuss as bMContractDiscuss where bMContractDiscuss.SupplierCode = '" + strSupplierCode + "' ";
        BMContractDiscussBLL bMContractDiscussBLL = new BMContractDiscussBLL();
        lst = bMContractDiscussBLL.GetAllBMContractDiscusss(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        strHQL = "from BMSupplierAnaly as bMSupplierAnaly where bMSupplierAnaly.SupplierCode = '" + strSupplierCode + "' ";
        BMSupplierAnalyBLL bMSupplierAnalyBLL = new BMSupplierAnalyBLL();
        lst = bMSupplierAnalyBLL.GetAllBMSupplierAnalys(strHQL);
        DataGrid7.DataSource = lst;
        DataGrid7.DataBind();
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

    protected string GetBMSupBidByExpResult(string strID)
    {
        string strHQL;
        IList lst;
        string result = "";
        //绑定招标计划
        strHQL = "From BMSupBidByExp as bMSupBidByExp Where bMSupBidByExp.SupplierBidID='" + strID + "' Order By bMSupBidByExp.ID ";
        BMSupBidByExpBLL bMSupBidByExpBLL = new BMSupBidByExpBLL();
        lst = bMSupBidByExpBLL.GetAllBMSupBidByExps(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            for (int i = 0; i < lst.Count; i++)
            {
                BMSupBidByExp bMSupBidByExp = (BMSupBidByExp)lst[i];
                result += "专家 " + ShareClass.GetUserName(bMSupBidByExp.ExportCode.Trim()) + "：" + bMSupBidByExp.ExportResult.Trim() + "；";
            }
        }
        return result;
    }
}