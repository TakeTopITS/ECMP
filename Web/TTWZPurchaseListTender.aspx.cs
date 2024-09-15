using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZPurchaseListTender : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] != null ? Session["UserCode"].ToString() : "";


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PurchaseCode"]))
            {
                string strPurchaseCode = Request.QueryString["PurchaseCode"];
                HF_PurchaseCode.Value = strPurchaseCode;
                DataPurchaseBinder(strPurchaseCode);
            }


            TXT_TenderCompetent.BackColor = Color.CornflowerBlue;
            
        }
    }

    private void DataPurchaseBinder(string strPurchaseCode)
    {
        string strPurchaseHQL = string.Format(@"select p.*,
                        e.UserName as TenderCompetentName
                        from T_WZPurchase p
                        left join T_ProjectMember e on p.TenderCompetent = e.UserCode
                        where p.PurchaseCode = '{0}'", strPurchaseCode);

        DataTable dtPurchase = ShareClass.GetDataSetFromSql(strPurchaseHQL, "Purchase").Tables[0];

        if (dtPurchase != null && dtPurchase.Rows.Count > 0)
        {
            DataRow drPurchase = dtPurchase.Rows[0];

            TXT_TenderCompetent.Text = ShareClass.ObjectToString(drPurchase["TenderCompetentName"]);
            HF_TenderCompetent.Value = ShareClass.ObjectToString(drPurchase["TenderCompetent"]);
            
        }
    }





    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            string strTenderCompetentName = TXT_TenderCompetent.Text.Trim();
            string strTenderCompetent = HF_TenderCompetent.Value;

            if (string.IsNullOrEmpty(strTenderCompetentName))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('招标主管不能为空，请补充！');", true);
                return;
            }

            string strValue = strTenderCompetent + "|" + strTenderCompetentName;
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "clickMember('" + strValue + "');", true);
        }
        catch (Exception ex)
        { }
    }


}