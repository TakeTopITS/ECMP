using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZNeedObjectBrowse : System.Web.UI.Page
{
    public string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] != null ? Session["UserCode"].ToString().Trim() : "";
        strUserName = Session["UserName"] != null ? Session["UserName"].ToString().Trim() : "";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                string id = Request.QueryString["id"].ToString();
                HF_ID.Value = id;
                int intID = 0;
                int.TryParse(id, out intID);

                BindDivideData(intID);
            }

            SetControlState();
        }
    }



    public void SetControlState()
    {
        TXT_Vendee.ReadOnly = true;
        TXT_PersonDelegate.ReadOnly = true;
        TXT_UnitAddress.ReadOnly = true;
        TXT_ZipCode.ReadOnly = true;
        TXT_OpeningBank.ReadOnly = true;
        TXT_AccountNumber.ReadOnly = true;
        TXT_AccountPhone.ReadOnly = true;
        TXT_RateNumber.ReadOnly = true;
        TXT_InternetUrl.ReadOnly = true;
        TXT_Fax.ReadOnly = true;
        TXT_ContactPhone.ReadOnly = true;
        TXT_Mobile.ReadOnly = true;
        TXT_QQ.ReadOnly = true;
        TXT_Email.ReadOnly = true;
    }


    private void BindDivideData(int ID)
    {
        string strWZNeedObjectSql = string.Format(@"select o.*,p.UserName as PurchaseEngineerName from T_WZNeedObject o
                        left join T_ProjectMember p on o.PurchaseEngineer = p.UserCode 
                        where o.ID = {0}", ID);
        DataTable dtNeedObject = ShareClass.GetDataSetFromSql(strWZNeedObjectSql, "NeedObject").Tables[0];
        if (dtNeedObject != null && dtNeedObject.Rows.Count > 0)
        {
            DataRow drNeedObject = dtNeedObject.Rows[0];

            TXT_NeedCode.Text = ShareClass.ObjectToString(drNeedObject["NeedCode"]);
            TXT_Vendee.Text = ShareClass.ObjectToString(drNeedObject["Vendee"]);
            TXT_PersonDelegate.Text = ShareClass.ObjectToString(drNeedObject["PersonDelegate"]);
            TXT_OpeningBank.Text = ShareClass.ObjectToString(drNeedObject["OpeningBank"]);
            TXT_AccountNumber.Text = ShareClass.ObjectToString(drNeedObject["AccountNumber"]);
            TXT_RateNumber.Text = ShareClass.ObjectToString(drNeedObject["RateNumber"]);
            TXT_UnitAddress.Text = ShareClass.ObjectToString(drNeedObject["UnitAddress"]);
            TXT_ZipCode.Text = ShareClass.ObjectToString(drNeedObject["ZipCode"]);
            TXT_AccountPhone.Text = ShareClass.ObjectToString(drNeedObject["AccountPhone"]);
            TXT_InternetUrl.Text = ShareClass.ObjectToString(drNeedObject["InternetUrl"]);
            TXT_PurchaseEngineer.Text = ShareClass.ObjectToString(drNeedObject["PurchaseEngineerName"]);
            HF_PurchaseEngineer.Value = ShareClass.ObjectToString(drNeedObject["PurchaseEngineer"]);
            TXT_Fax.Text = ShareClass.ObjectToString(drNeedObject["Fax"]);
            TXT_ContactPhone.Text = ShareClass.ObjectToString(drNeedObject["ContactPhone"]);
            TXT_Mobile.Text = ShareClass.ObjectToString(drNeedObject["Mobile"]);
            TXT_Email.Text = ShareClass.ObjectToString(drNeedObject["Email"]);
            TXT_QQ.Text = ShareClass.ObjectToString(drNeedObject["QQ"]);
        }
    }
}