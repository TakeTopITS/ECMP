using System; using System.Resources;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZPlanPurchaseListUnit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            string strPlanCode = string.Empty;
            if (!string.IsNullOrEmpty(Request.QueryString["planCode"]))
            {
                strPlanCode = Request.QueryString["planCode"].ToString();
            }
            else
            {
                strPlanCode = "";
            }

            HF_PlanCode.Value = strPlanCode;

            TXT_PickingUnit.BackColor = Color.CornflowerBlue;
        }
    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(HF_PlanCode.Value))
            {

            }
        }
        catch (Exception ex) { }
    }

}