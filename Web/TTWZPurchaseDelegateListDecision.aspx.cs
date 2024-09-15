using System; using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Collections;
using System.Drawing;
using System.Data;

public partial class TTWZPurchaseDelegateListDecision : System.Web.UI.Page
{
    string strUserCode;
    string strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();

        strUserName = Session["UserName"] == null ? "" : Session["UserName"].ToString();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PurchaseCode"]))
            {
                string strPurchaseCode = Request.QueryString["PurchaseCode"];
                HF_PurchaseCode.Value = strPurchaseCode;
                DataBinder(strPurchaseCode);
            }
        }
    }

    private void DataBinder(string strPurchaseCode)
    {
        //查询采购文件信息绑定
        
        WZSupplierApplyCommentBLL wZSupplierApplyCommentBLL = new WZSupplierApplyCommentBLL();
        string strWZSupplierApplyCommentHQL = "from WZSupplierApplyComment as wZSupplierApplyComment where PurchaseCode = '" + strPurchaseCode + "' and ExpertCode = '" + strUserCode + "'";
        IList lstWZSupplierApplyComment = wZSupplierApplyCommentBLL.GetAllWZSupplierApplyComments(strWZSupplierApplyCommentHQL);
        if (lstWZSupplierApplyComment != null && lstWZSupplierApplyComment.Count == 1)
        {
            //修改
            WZSupplierApplyComment wZSupplierApplyComment = (WZSupplierApplyComment)lstWZSupplierApplyComment[0];

            //TXT_PurchaseCode.Text = wZSupplierApplyComment.PurchaseCode;
            //TXT_SupplierCode1.Text = wZSupplierApplyComment.SupplierCode1;
            //TXT_SupplierCode2.Text = wZSupplierApplyComment.SupplierCode2;
            //TXT_SupplierCode3.Text = wZSupplierApplyComment.SupplierCode3;

            //TXT_PurchaseCode.BackColor = Color.CornflowerBlue;
            //TXT_SupplierCode1.BackColor = Color.CornflowerBlue;
            //TXT_SupplierCode2.BackColor = Color.CornflowerBlue;
            //TXT_SupplierCode3.BackColor = Color.CornflowerBlue;

            //TXT_ExpertCode.Text = strUserCode;

        }
    }

    

    private void ControlStatusChange(string strPurchaseEngineer, string strTenderCompetent, string strControlMoney, string strDisciplinarySupervision, string strExpertCode1, string strExpertCode2, string strExpertCode3, string strPurchaseManager)
    {

        if ((strPurchaseEngineer == null ? "" : strPurchaseEngineer.Trim()) == strUserCode ||
            (strTenderCompetent == null ? "" : strTenderCompetent.Trim()) == strUserCode ||
            (strControlMoney == null ? "" : strControlMoney.Trim()) == strUserCode ||
            (strDisciplinarySupervision == null ? "" : strDisciplinarySupervision.Trim()) == strUserCode ||
            (strExpertCode1 == null ? "" : strExpertCode1.Trim()) == strUserCode ||
            (strExpertCode2 == null ? "" : strExpertCode2.Trim()) == strUserCode ||
            (strExpertCode3 == null ? "" : strExpertCode3.Trim()) == strUserCode ||
            (strPurchaseManager == null ? "" : strPurchaseManager.Trim()) == strUserCode)
        {
            //BT_Assessment.Enabled = true;
        }
        else
        {
            //BT_Assessment.Enabled = false;
        }

    }



    private void ControlStatusCloseChange()
    {
        //BT_Assessment.Enabled = false;
    }



    protected void BT_Save_Click(object sender, EventArgs e)
    {
        string strSupplierCode1 = TXT_SupplierCode1.Text.Trim();
        string strSupplierCode2 = TXT_SupplierCode2.Text.Trim();
        string strSupplierCode3 = TXT_SupplierCode3.Text.Trim();

        string strSuggest = TXT_Suggest.Text.Trim();

        string strSupplierApplyCommentHQL = "from WZSupplierApplyComment as wZSupplierApplyComment where PurchaseCode = '" + HF_PurchaseCode.Value + "' and ExpertCode = '" + strUserCode + "'";
        WZSupplierApplyCommentBLL wZSupplierApplyCommentBLL = new WZSupplierApplyCommentBLL();
        IList lstSupplierApplyComment = wZSupplierApplyCommentBLL.GetAllWZSupplierApplyComments(strSupplierApplyCommentHQL);
        if (lstSupplierApplyComment != null && lstSupplierApplyComment.Count > 0)
        {
            WZSupplierApplyComment wZSupplierApplyComment = (WZSupplierApplyComment)lstSupplierApplyComment[0];

            wZSupplierApplyComment.Suggest = wZSupplierApplyComment.Suggest;
            wZSupplierApplyComment.SupplierCode1 = strSupplierCode1;
            wZSupplierApplyComment.SupplierCode2 = strSupplierCode2;
            wZSupplierApplyComment.SupplierCode3 = strSupplierCode3;

            wZSupplierApplyCommentBLL.UpdateWZSupplierApplyComment(wZSupplierApplyComment, wZSupplierApplyComment.ID);
        }
        else
        {
            WZSupplierApplyComment wZSupplierApplyComment = new WZSupplierApplyComment();

            wZSupplierApplyComment.PurchaseCode = HF_PurchaseCode.Value;
            wZSupplierApplyComment.ExpertCode = strUserCode;
            wZSupplierApplyComment.SignName = strUserCode;
            wZSupplierApplyComment.SignTime = DateTime.Now;
            wZSupplierApplyComment.Suggest = wZSupplierApplyComment.Suggest;
            wZSupplierApplyComment.SupplierCode1 = strSupplierCode1;
            wZSupplierApplyComment.SupplierCode2 = strSupplierCode2;
            wZSupplierApplyComment.SupplierCode3 = strSupplierCode3;

            wZSupplierApplyCommentBLL.AddWZSupplierApplyComment(wZSupplierApplyComment);
        }


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('保存成功！');", true);
    }

    protected void BT_Assessment_Click(object sender, EventArgs e)
    {
        //判断是否已经提交
        string strPurchaseHQL = "from WZPurchase as wZPurchase where PurchaseCode = '" + HF_PurchaseCode.Value + "'";
        WZPurchaseBLL wZPurchaseBLL = new WZPurchaseBLL();
        IList lstPurchase = wZPurchaseBLL.GetAllWZPurchases(strPurchaseHQL);
        if (lstPurchase != null && lstPurchase.Count > 0)
        {
            WZPurchase wZPurchase = (WZPurchase)lstPurchase[0];

            if (wZPurchase.Progress != "评标")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('采购文件进度不为评标，不允许修改！');", true);
                return;
            }

            string strApplyCommentSQL = string.Format(@"select * from T_WZSupplierApplyComment
                    where PurchaseCode = '{0}'
                    and ExpertCode = '{1}'", wZPurchase.PurchaseCode, strUserCode);
            DataTable dtApplyComment = ShareClass.GetDataSetFromSql(strApplyCommentSQL, "ApplyComment").Tables[0];
            if (dtApplyComment != null && dtApplyComment.Rows.Count > 0)
            {
                DataRow drApplyComment = dtApplyComment.Rows[0];

                //TXT_PurchaseCode.Text = ShareClass.ObjectToString(drApplyComment["PurchaseCode"]);
                TXT_Suggest.Text = ShareClass.ObjectToString(drApplyComment["Suggest"]);
                TXT_SupplierCode1.Text = ShareClass.ObjectToString(drApplyComment["SupplierCode1"]);
                TXT_SupplierCode2.Text = ShareClass.ObjectToString(drApplyComment["SupplierCode2"]);
                TXT_SupplierCode3.Text = ShareClass.ObjectToString(drApplyComment["SupplierCode3"]);

                TXT_ExpertCode.Text = strUserName;

                TXT_Suggest.BackColor = Color.CornflowerBlue;
                TXT_SupplierCode1.BackColor = Color.CornflowerBlue;
                TXT_SupplierCode2.BackColor = Color.CornflowerBlue;
                TXT_SupplierCode3.BackColor = Color.CornflowerBlue;
            }
        }
    }

}