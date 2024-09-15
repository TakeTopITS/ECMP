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


public partial class TTSupplierAssetPaymentApplicantKeepAccount : System.Web.UI.Page
{
    string strProjectID, strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserName, strDepartString;

        strProjectID = "1";

        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "资产采购付款记账", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
            LB_DepartString.Text = strDepartString;

            LoadSupplierAssetPaymentApplicant(strUserCode);
        }
    }

    protected void DataGrid5_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strAOID, strAccountCode, strAccountName;
            int intReAndPayalbeID;
            string strHQL;
            IList lst;

            strAOID = e.Item.Cells[2].Text.Trim();

            if (e.CommandName == "Update")
            {
                for (int i = 0; i < DataGrid5.Items.Count; i++)
                {
                    DataGrid5.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                SupplierAssetPaymentApplicant supplierAssetPaymentApplicant = GetSupplierAssetPaymentApplicant(strAOID);

                //插入应收应付数据到应收应付表
                //decimal deAmount = supplierAssetPaymentApplicant.CurrentTotalPaymentAmount;
                string strCurrencyType = supplierAssetPaymentApplicant.CurrencyType.Trim();
                string strReAndPayer = supplierAssetPaymentApplicant.PartA.Trim();
                string strStatus = supplierAssetPaymentApplicant.Status.Trim();
                int intProjectID = supplierAssetPaymentApplicant.ProjectID;
                string strApplicantCode = supplierAssetPaymentApplicant.UserCode.Trim();
                string strApplicantName = supplierAssetPaymentApplicant.UserName.Trim();
                string strPayMethod = supplierAssetPaymentApplicant.PaymentMethod.Trim();

                decimal deDetailAmount;

                if (strStatus != "已记账")
                {
                    strHQL = "From SupplierAssetPaymentApplicantDetail as supplierAssetPaymentApplicantDetail Where supplierAssetPaymentApplicantDetail.AOID = " + strAOID;
                    SupplierAssetPaymentApplicantDetailBLL supplierAssetPaymentApplicantDetailBLL = new SupplierAssetPaymentApplicantDetailBLL();
                    lst = supplierAssetPaymentApplicantDetailBLL.GetAllSupplierAssetPaymentApplicantDetails(strHQL);
                    SupplierAssetPaymentApplicantDetail supplierAssetPaymentApplicantDetail = new SupplierAssetPaymentApplicantDetail();

                    for (int i = 0; i < lst.Count; i++)
                    {
                        supplierAssetPaymentApplicantDetail = (SupplierAssetPaymentApplicantDetail)lst[i];
                        strAccountName = supplierAssetPaymentApplicantDetail.AccountName;
                        strAccountCode = supplierAssetPaymentApplicantDetail.AccountCode;
                        deDetailAmount = supplierAssetPaymentApplicantDetail.Amount;

                        intReAndPayalbeID = ShareClass.InsertReceivablesOrPayableByAccount("Payables", "AssetPUPO", "AssetPUPO", strAOID, strAOID, strAccountCode, strAccountName, deDetailAmount, strCurrencyType, strReAndPayer, strApplicantCode, intProjectID);
                        ShareClass.InsertReceivablesOrPayableRecord("Payables", intReAndPayalbeID, deDetailAmount, strCurrencyType, strPayMethod, strReAndPayer, strApplicantCode, intProjectID);

                        strHQL = "Update T_ConstractPayable Set OutOfPocketAccount = " + deDetailAmount.ToString() + ",UNPayAmount = 0 Where ID = " + intReAndPayalbeID.ToString();
                        ShareClass.RunSqlCommand(strHQL);

                        //把申报费用列入项目费用
                        if (intProjectID > 1)
                        {
                            ShareClass.AddConstractPayAmountToProExpense(intProjectID.ToString(), intReAndPayalbeID.ToString(), strAccountCode, strAccountName, "资产采购费用", deDetailAmount, strCurrencyType, strApplicantCode, strApplicantName);
                        }
                    }

                    strHQL = "Update T_SupplierAssetPaymentApplicant Set Status = '已记账' Where AOID = " + strAOID;
                    ShareClass.RunSqlCommand(strHQL);


                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJZCG + "')", true);


                    LoadSupplierAssetPaymentApplicant(strUserCode);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBCSQDYJJZBNCFJC + "')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBBNZFJZ + "')", true);
            }
        }
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql5.Text;

        SupplierAssetPaymentApplicantBLL puchaseOrderBLL = new SupplierAssetPaymentApplicantBLL();
        IList lst = puchaseOrderBLL.GetAllSupplierAssetPaymentApplicants(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected SupplierAssetPaymentApplicant GetSupplierAssetPaymentApplicant(string strAOID)
    {
        string strHQL;
        IList lst;

        strHQL = "From SupplierAssetPaymentApplicant as supplierAssetPaymentApplicant Where supplierAssetPaymentApplicant.AOID = " + strAOID;
        SupplierAssetPaymentApplicantBLL supplierAssetPaymentApplicantBLL = new SupplierAssetPaymentApplicantBLL();
        lst = supplierAssetPaymentApplicantBLL.GetAllSupplierAssetPaymentApplicants(strHQL);
        SupplierAssetPaymentApplicant supplierAssetPaymentApplicant = (SupplierAssetPaymentApplicant)lst[0];

        return supplierAssetPaymentApplicant;
    }

    protected void LoadSupplierAssetPaymentApplicant(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from SupplierAssetPaymentApplicant as supplierAssetPaymentApplicant where (supplierAssetPaymentApplicant.UserCode = " + "'" + strUserCode + "'";
        strHQL += " or supplierAssetPaymentApplicant.UserCode in (select  memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")) ";
        //strHQL += " and supplierAssetPaymentApplicant.ProjectID = 1 ";
        strHQL += " Order by supplierAssetPaymentApplicant.AOID DESC";
        SupplierAssetPaymentApplicantBLL supplierAssetPaymentApplicantBLL = new SupplierAssetPaymentApplicantBLL();
        lst = supplierAssetPaymentApplicantBLL.GetAllSupplierAssetPaymentApplicants(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }
}

