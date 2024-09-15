using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZSupplierBrowse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                string id = Request.QueryString["id"].ToString();
                HF_ID.Value = id;
                int intID = 0;
                int.TryParse(id, out intID);

                BindSupplierData(intID);
            }
        }
    }



    private void BindSupplierData(int ID)
    {
        string strWZSupplierSql = string.Format(@"select s.*,m.UserName as AuditorName,p.UserName as QualityEngineerName,
                                                u.UserName as PushPersonName
                                                from T_WZSupplier s
                                                left join T_ProjectMember m on s.Auditor = m.UserCode 
                                                left join T_ProjectMember p on s.QualityEngineer = p.UserCode 
                                                left join T_ProjectMember u on s.PushPerson = u.UserCode where s.ID = {0}", ID);
        DataTable dtSupplier = ShareClass.GetDataSetFromSql(strWZSupplierSql, "Supplier").Tables[0];
        if (dtSupplier != null && dtSupplier.Rows.Count > 0)
        {
            DataRow drSupplier = dtSupplier.Rows[0];

            HF_SupplierCode.Value = ShareClass.ObjectToString(drSupplier["SupplierCode"]);
            TXT_SupplierNumber.Text = ShareClass.ObjectToString(drSupplier["SupplierNumber"]);
            TXT_SupplierName.Text = ShareClass.ObjectToString(drSupplier["SupplierName"]);
            TXT_OpeningBank.Text = ShareClass.ObjectToString(drSupplier["OpeningBank"]);
            TXT_AccountNumber.Text = ShareClass.ObjectToString(drSupplier["AccountNumber"]);
            TXT_RateNumber.Text = ShareClass.ObjectToString(drSupplier["RateNumber"]);
            TXT_UnitAddress.Text = ShareClass.ObjectToString(drSupplier["UnitAddress"]);
            TXT_ZipCode.Text = ShareClass.ObjectToString(drSupplier["ZipCode"]);
            TXT_UnitPhone.Text = ShareClass.ObjectToString(drSupplier["UnitPhone"]);
            TXT_PersonDelegate.Text = ShareClass.ObjectToString(drSupplier["PersonDelegate"]);
            TXT_DelegateAgent.Text = ShareClass.ObjectToString(drSupplier["DelegateAgent"]);
            TXT_ContactPhone.Text = ShareClass.ObjectToString(drSupplier["ContactPhone"]);
            TXT_Mobile.Text =ShareClass.ObjectToString(drSupplier["Mobile"]);
            TXT_QQ.Text = ShareClass.ObjectToString(drSupplier["QQ"]);
            TXT_Email.Text =ShareClass.ObjectToString(drSupplier["Email"]);
            TXT_MainSupplier.Text = ShareClass.ObjectToString(drSupplier["MainSupplier"]);

            TXT_PushUnit.Text = ShareClass.ObjectToString(drSupplier["PushUnit"]);
            TXT_PushPerson.Text = ShareClass.ObjectToString(drSupplier["PushPerson"]);

            //附件列表
            string strInDocument = ShareClass.ObjectToString(drSupplier["InDocument"]);
            string strInDocumentURL = ShareClass.ObjectToString(drSupplier["InDocumentURL"]);

            LT_InDocument.Text = "<a href=\"" + strInDocumentURL + "\" class=\"notTab\" target=\"_blank\">" + strInDocument + "</a>";
            HF_InDocument.Value = strInDocument;
            HF_InDocumentURL.Value = strInDocumentURL;

            TXT_InTime.Text = ShareClass.ObjectToString(drSupplier["InTime"]);


            TXT_SupplierNumber.ReadOnly = true;
            TXT_SupplierName.ReadOnly = true;
            TXT_OpeningBank.ReadOnly = true;
            TXT_AccountNumber.ReadOnly = true;
            TXT_RateNumber.ReadOnly = true;
            TXT_UnitAddress.ReadOnly = true;
            TXT_ZipCode.ReadOnly = true;
            TXT_UnitPhone.ReadOnly = true;
            TXT_PersonDelegate.ReadOnly = true;
            TXT_DelegateAgent.ReadOnly = true;
            TXT_ContactPhone.ReadOnly = true;
            TXT_Mobile.ReadOnly = true;
            TXT_QQ.ReadOnly = true;
            TXT_Email.ReadOnly = true;
            TXT_MainSupplier.ReadOnly = true;

            TXT_PushUnit.ReadOnly = true;
            TXT_PushPerson.ReadOnly = true;

        }
    }
}