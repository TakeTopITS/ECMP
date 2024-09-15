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

public partial class TTSupplierAssetPaymentApplicantQueryCenter : System.Web.UI.Page
{
    string strProjectID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserName, strDepartString;

        string strUserCode = Session["UserCode"].ToString();

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
            LB_DepartString.Text = strDepartString;

            //LoadSupplierAssetPaymentApplicant(strUserCode);
        }
    }

    protected void BT_FindAOCode_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strAOName;
        string strUserCode;
        decimal deTotalAmount = 0;

        strUserCode = LB_UserCode.Text.Trim();
        strAOName = TB_AOCode.Text.Trim();
        strHQL = "from SupplierAssetPaymentApplicant as supplierAssetPaymentApplicant where (supplierAssetPaymentApplicant.UserCode = " + "'" + strUserCode + "'";
        strHQL += " or supplierAssetPaymentApplicant.UserCode in (select  memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")) ";
        strHQL += " and supplierAssetPaymentApplicant.AOName Like " + "'%" + strAOName + "%'";
        strHQL += " Order by supplierAssetPaymentApplicant.AOID DESC";
        SupplierAssetPaymentApplicantBLL supplierAssetPaymentApplicantBLL = new SupplierAssetPaymentApplicantBLL();
        lst = supplierAssetPaymentApplicantBLL.GetAllSupplierAssetPaymentApplicants(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        SupplierAssetPaymentApplicant supplierAssetPaymentApplicant;

        for (int i = 0; i < lst.Count; i++)
        {
            supplierAssetPaymentApplicant = (SupplierAssetPaymentApplicant)lst[i];

            deTotalAmount += supplierAssetPaymentApplicant.CurrentTotalPaymentAmount;
        }

        LB_TotalAmount.Text = deTotalAmount.ToString();

        LB_Sql5.Text = strHQL;
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strAOName, strApplicantName, strProjectName, strSupplierName, strStatus;
        string strStartTime, strEndTime;

        string strUserCode;
        decimal deTotalAmount = 0;

        strUserCode = LB_UserCode.Text.Trim();
        strAOName = TB_AOCode.Text.Trim();

        strApplicantName = TB_ApplicantName.Text.Trim();
        strProjectName = TB_ProjectName.Text.Trim();
        strSupplierName = TB_SupplierName.Text.Trim();

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strStatus = DL_Status.SelectedValue.Trim();

        strHQL = "from SupplierAssetPaymentApplicant as supplierAssetPaymentApplicant where (supplierAssetPaymentApplicant.UserCode = " + "'" + strUserCode + "'";
        strHQL += " or supplierAssetPaymentApplicant.UserCode in (select  memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")) ";
        strHQL += " and supplierAssetPaymentApplicant.AOName Like " + "'%" + strAOName + "%'";
        strHQL += " and supplierAssetPaymentApplicant.ProjectName Like " + "'%" + strProjectName + "%'";
        strHQL += " and supplierAssetPaymentApplicant.PartA Like " + "'%" + strSupplierName + "%'";
        strHQL += " And to_char(supplierAssetPaymentApplicant.CreateTime,'yyyymmdd') >= " + "'" + strStartTime + "'" + " and to_char(supplierAssetPaymentApplicant.CreateTime,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " and supplierAssetPaymentApplicant.Status Like " + "'%" + strStatus + "%'";
        strHQL += " Order by supplierAssetPaymentApplicant.AOID DESC";
        SupplierAssetPaymentApplicantBLL supplierAssetPaymentApplicantBLL = new SupplierAssetPaymentApplicantBLL();
        lst = supplierAssetPaymentApplicantBLL.GetAllSupplierAssetPaymentApplicants(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        SupplierAssetPaymentApplicant supplierAssetPaymentApplicant;

        for (int i = 0; i < lst.Count; i++)
        {
            supplierAssetPaymentApplicant = (SupplierAssetPaymentApplicant)lst[i];

            deTotalAmount += supplierAssetPaymentApplicant.CurrentTotalPaymentAmount;
        }

        LB_TotalAmount.Text = deTotalAmount.ToString();

        LB_Sql5.Text = strHQL;
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

