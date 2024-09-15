using System; using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Collections;

public partial class TTWZPurchaseApplyFile : System.Web.UI.Page
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

                DataPurchaseDocumentBinder(strPurchaseCode);


                TXT_PurchaseCode.Text = strPurchaseCode;
            }
        }
    }

    

    

    protected void RPT_PurchaseDocument_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string strCommandName = e.CommandName;
        if (strCommandName.Equals("del"))
        {
            string strCommandArgument = e.CommandArgument.ToString();

            int intPurchaseDocumentID = 0;
            int.TryParse(strCommandArgument, out intPurchaseDocumentID);

            WZPurchaseDocumentBLL wZPurchaseDocumentBLL = new WZPurchaseDocumentBLL();
            string strPurchaseDocumentHQL = "from WZPurchaseDocument as wZPurchaseDocument where ID = " + intPurchaseDocumentID;
            IList lstPurchaseDocument = wZPurchaseDocumentBLL.GetAllWZPurchaseDocuments(strPurchaseDocumentHQL);
            if (lstPurchaseDocument != null && lstPurchaseDocument.Count > 0)
            {
                WZPurchaseDocument wZPurchaseDocument = (WZPurchaseDocument)lstPurchaseDocument[0];

                wZPurchaseDocumentBLL.DeleteWZPurchaseDocument(wZPurchaseDocument);

                DataPurchaseDocumentBinder(HF_PurchaseCode.Value);
            }
        }
    }


    private void DataPurchaseDocumentBinder(string strPurchaseCode)
    {
        WZPurchaseDocumentBLL wZPurchaseDocumentBLL = new WZPurchaseDocumentBLL();
        string strPurchaseDocumentHQL = "from WZPurchaseDocument as wZPurchaseDocument where PurchaseCode = '" + strPurchaseCode + "'";
        IList lstPurchaseDocument = wZPurchaseDocumentBLL.GetAllWZPurchaseDocuments(strPurchaseDocumentHQL);

        RPT_PurchaseDocument.DataSource = lstPurchaseDocument;
        RPT_PurchaseDocument.DataBind();
    }




    
}