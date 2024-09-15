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

public partial class TTWZPurchasePlanListApplyTime : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] != null ? Session["UserCode"].ToString() : "";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (!IsPostBack)
        {

            if (!string.IsNullOrEmpty(Request.QueryString["PurchaseCode"]))
            {
                string strPurchaseCode = Request.QueryString["PurchaseCode"];
                HF_PurchaseCode.Value = strPurchaseCode;
                DataPurchaseBinder(strPurchaseCode);
            }

            TXT_PurchaseStartTime.BackColor = Color.CornflowerBlue;
            TXT_PurchaseEndTime.BackColor = Color.CornflowerBlue;
        }
    }

    private void DataPurchaseBinder(string strPurchaseCode)
    {
        string strPurchaseHQL = string.Format(@"select *
                        from T_WZPurchase
                        where PurchaseCode = '{0}'", strPurchaseCode);

        DataTable dtPurchase = ShareClass.GetDataSetFromSql(strPurchaseHQL, "Purchase").Tables[0];

        if (dtPurchase != null && dtPurchase.Rows.Count > 0)
        {
            DataRow drPurchase = dtPurchase.Rows[0];

            TXT_PurchaseStartTime.Text = ShareClass.ObjectToString(DateTime.Parse(drPurchase["PurchaseStartTime"].ToString()).ToString("yyyy/MM/dd")); 
            TXT_PurchaseEndTime.Text = ShareClass.ObjectToString(DateTime.Parse(drPurchase["PurchaseEndTime"].ToString()).ToString("yyyy/MM/dd"));

            //TXT_PurchaseStartTime.Text = ShareClass.ObjectToString(drPurchase["PurchaseStartTime"]);
            //TXT_PurchaseEndTime.Text = ShareClass.ObjectToString(drPurchase["PurchaseEndTime"]);
        }
    }





    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            string strPurchaseStartTime = TXT_PurchaseStartTime.Text.Trim();
            DateTime dtPurchaseStartTime = DateTime.Now;
            DateTime.TryParse(strPurchaseStartTime, out dtPurchaseStartTime);
            string strPurchaseEndTime = TXT_PurchaseEndTime.Text.Trim();
            DateTime dtPurchaseEndTime = DateTime.Now;
            DateTime.TryParse(strPurchaseEndTime, out dtPurchaseEndTime);

            WZPurchaseBLL wZPurchaseBLL = new WZPurchaseBLL();

            WZPurchase wZPurchase = new WZPurchase();

            if (!string.IsNullOrEmpty(HF_PurchaseCode.Value))
            {

                string strPurchaseHQL = "from WZPurchase as wZPurchase where PurchaseCode = '" + HF_PurchaseCode.Value + "'";
                IList listPurchase = wZPurchaseBLL.GetAllWZPurchases(strPurchaseHQL);
                if (listPurchase != null && listPurchase.Count > 0)
                {
                    wZPurchase = (WZPurchase)listPurchase[0];

                    wZPurchase.PurchaseStartTime = dtPurchaseStartTime.ToString();
                    wZPurchase.PurchaseEndTime = dtPurchaseEndTime.ToString();
                    

                    wZPurchaseBLL.UpdateWZPurchase(wZPurchase, HF_PurchaseCode.Value);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('保存成功！');", true);
                    return;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('采购文件不存在！');", true);
                return;
            }
        }
        catch (Exception ex)
        { }
    }

    

}