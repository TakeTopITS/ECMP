using System;
using System.Resources;
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

public partial class TTWZPurchaseDecisionListEdit : System.Web.UI.Page
{
    string strUserCode;
    string strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();

        strUserName = Session["UserName"] == null ? "" : Session["UserName"].ToString();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PurchaseCode"]))
            {
                string strPurchaseCode = Request.QueryString["PurchaseCode"];
                HF_PurchaseCode.Value = strPurchaseCode;
                DataBinder(strPurchaseCode);

                TXT_ExpertCode.Text = strUserName;
            }
        }
    }

    private void DataBinder(string strPurchaseCode)
    {
        //查询采购文件信息绑定
        string strPurchaseHQL = string.Format(@"select * from T_WZPurchase
                        where PurchaseCode = '{0}'", strPurchaseCode);
        DataTable dtPurchase = ShareClass.GetDataSetFromSql(strPurchaseHQL, "Purchase").Tables[0];

        if (dtPurchase != null && dtPurchase.Rows.Count > 0)
        {
            DataRow drPurchase = dtPurchase.Rows[0];

            string strPurchaseDocumentHTML = string.Empty;
            strPurchaseDocumentHTML = "<table>";
            strPurchaseDocumentHTML += "<tr>";
            strPurchaseDocumentHTML += "<td align=\"center\" >招标文件目录</td>";
            strPurchaseDocumentHTML += "</tr>";
            strPurchaseDocumentHTML += "<tr>";
            strPurchaseDocumentHTML += "<td>招标文件</td>";
            strPurchaseDocumentHTML += "</tr>";
            strPurchaseDocumentHTML += "<tr>";
            strPurchaseDocumentHTML += "<td align=\"center\" ><a href='" + ShareClass.ObjectToString(drPurchase["PurchaseDocumentURL"]) + "' class=\"notTab\" target=\"_blank\">" + ShareClass.ObjectToString(drPurchase["PurchaseDocument"]) + "</a></td>";
            strPurchaseDocumentHTML += "</tr>";
            strPurchaseDocumentHTML += "<tr>";
            strPurchaseDocumentHTML += "<td >&nbsp;</td>";
            strPurchaseDocumentHTML += "</tr>";
            strPurchaseDocumentHTML += "</table>";

            LT_PurchaseDocument.Text = strPurchaseDocumentHTML;


            string strAssessmentDocumentHTML = string.Empty;
            strAssessmentDocumentHTML = "<table >";
            strAssessmentDocumentHTML += "<tr>";
            strAssessmentDocumentHTML += "<td align=\"center\" >评标文件目录</td>";
            strAssessmentDocumentHTML += "</tr>";
            strAssessmentDocumentHTML += "<tr>";
            strAssessmentDocumentHTML += "<td >评标方法及标准</td>";
            strAssessmentDocumentHTML += "</tr>";
            strAssessmentDocumentHTML += "<tr>";
            strAssessmentDocumentHTML += "<td ><a href='" + ShareClass.ObjectToString(drPurchase["AssessmentDocumentURL"]) + "' class=\"notTab\" target=\"_blank\">" + ShareClass.ObjectToString(drPurchase["AssessmentDocument"]) + "</a></td>";
            strAssessmentDocumentHTML += "</tr>";
            strAssessmentDocumentHTML += "</table>";

            LT_AssessmentDocument.Text = strAssessmentDocumentHTML;
        }

        //加载供应商
        WZPurchaseSupplierBLL wZPurchaseSupplierBLL = new WZPurchaseSupplierBLL();
        string strPurchaseSupplierHQL = "from WZPurchaseSupplier as wZPurchaseSupplier where PurchaseCode = '" + strPurchaseCode + "'";
        IList lstPurchaseSupplier = wZPurchaseSupplierBLL.GetAllWZPurchaseSuppliers(strPurchaseSupplierHQL);

        LT_Supplier1.Text = "";
        LT_Supplier2.Text = "";
        LT_Supplier3.Text = "";
        LT_Supplier4.Text = "";
        LT_Supplier5.Text = "";
        LT_Supplier6.Text = "";

        if (lstPurchaseSupplier != null && lstPurchaseSupplier.Count > 0)
        {
            for (int i = 0; i < lstPurchaseSupplier.Count; i++)
            {
                WZPurchaseSupplier wZPurchaseSupplier = (WZPurchaseSupplier)lstPurchaseSupplier[i];

       
                string strSupplierCodeHTML = string.Empty;
                strSupplierCodeHTML = "<table>";
                strSupplierCodeHTML += "<tr>";
                strSupplierCodeHTML += "<td align=\"center\" >供方编号：" + wZPurchaseSupplier.SupplierCode + "</td>";

                strSupplierCodeHTML += "</tr>";
                strSupplierCodeHTML += "<tr>";
                strSupplierCodeHTML += "<td align=\"center\">供方<" + wZPurchaseSupplier.SupplierName + "></td>";
                strSupplierCodeHTML += "</tr>";
                strSupplierCodeHTML += "<tr>";
                strSupplierCodeHTML += "<td ><a href='" + wZPurchaseSupplier.DocumentURL + "' class=\"notTab\" target=\"_blank\">" + wZPurchaseSupplier.DocumentName + "</a></td>";
                strSupplierCodeHTML += "</tr>";
                strSupplierCodeHTML += "<tr>";
               
                strSupplierCodeHTML += "<td ><a href='TTWZPurchaseDecisionDetail.aspx?PurchaseCode=" + wZPurchaseSupplier.PurchaseCode + "&SupplierCode=" + wZPurchaseSupplier.SupplierCode + "' target =_blank>报价单</a></td>";

                strSupplierCodeHTML += "</tr>";
                strSupplierCodeHTML += "</table>";

                if (i == 0)
                {
                    LT_Supplier1.Text = strSupplierCodeHTML;
                }
                else if (i == 1)
                {
                    LT_Supplier2.Text = strSupplierCodeHTML;
                }
                else if (i == 2)
                {
                    LT_Supplier3.Text = strSupplierCodeHTML;
                }
                else if (i == 3)
                {
                    LT_Supplier4.Text = strSupplierCodeHTML;
                }
                else if (i == 4)
                {
                    LT_Supplier5.Text = strSupplierCodeHTML;
                }
                else if (i == 5)
                {
                    LT_Supplier6.Text = strSupplierCodeHTML;
                }
            }

        }

        if (string.IsNullOrEmpty(LT_Supplier1.Text))
        {
            LT_Supplier1.Text = " ";
        }
        if (string.IsNullOrEmpty(LT_Supplier2.Text))
        {
            LT_Supplier2.Text = " ";
        }
        if (string.IsNullOrEmpty(LT_Supplier3.Text))
        {
            LT_Supplier3.Text = " ";
        }
        if (string.IsNullOrEmpty(LT_Supplier4.Text))
        {
            LT_Supplier4.Text = " ";
        }
        if (string.IsNullOrEmpty(LT_Supplier5.Text))
        {
            LT_Supplier5.Text = " ";
        }
        if (string.IsNullOrEmpty(LT_Supplier6.Text))
        {
            LT_Supplier6.Text = " ";
        }

        //附加组卷的供应商
        DL_Supplier1.DataSource = lstPurchaseSupplier;
        DL_Supplier1.DataBind();

        DL_Supplier2.DataSource = lstPurchaseSupplier;
        DL_Supplier2.DataBind();
        DL_Supplier2.Items.Insert(0, new ListItem("--Select--", ""));

        DL_Supplier3.DataSource = lstPurchaseSupplier;
        DL_Supplier3.DataBind();
        DL_Supplier3.Items.Insert(0, new ListItem("--Select--", ""));


        string strWZSupplierApplyCommentHQL = string.Format(@"select a.*,
                        s1.SupplierName as SupplierCode1Name,
                        s2.SupplierName as SupplierCode2Name,
                        s3.SupplierName as SupplierCode3Name
                         from T_WZSupplierApplyComment a
                        left join T_WZSupplier s1 on a.SupplierCode1= s1.SupplierCode
                        left join T_WZSupplier s2 on a.SupplierCode2= s2.SupplierCode
                        left join T_WZSupplier s3 on a.SupplierCode3= s3.SupplierCode 
                        where PurchaseCode = '{0}' 
                        and ExpertCode = '{1}'", strPurchaseCode, strUserCode);
        DataTable dtWZSupplierApplyComment = ShareClass.GetDataSetFromSql(strWZSupplierApplyCommentHQL, "SupplierApplyComment").Tables[0];
        if (dtWZSupplierApplyComment != null && dtWZSupplierApplyComment.Rows.Count == 1)
        {
            //修改
            DataRow drSupplierApplyComment = dtWZSupplierApplyComment.Rows[0];

            //HF_Supplier1.Value = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode1"]);
            //TXT_Supplier1.Text = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode1Name"]);
            //HF_Supplier2.Value = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode2"]);
            //TXT_Supplier2.Text = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode2Name"]);
            //HF_Supplier3.Value = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode3"]);
            //TXT_Supplier3.Text = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode3Name"]);

            DL_Supplier1.SelectedValue = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode1"]);
            DL_Supplier2.SelectedValue = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode2"]);
            DL_Supplier3.SelectedValue = ShareClass.ObjectToString(drSupplierApplyComment["SupplierCode3"]);

            TXT_Suggest.Text = ShareClass.ObjectToString(drSupplierApplyComment["Suggest"]);
            TXT_Suggest.BackColor = Color.CornflowerBlue;

            //TXT_Supplier1.BackColor = Color.CornflowerBlue;
            //TXT_Supplier2.BackColor = Color.CornflowerBlue;
            //TXT_Supplier3.BackColor = Color.CornflowerBlue;

            //TXT_ExpertCode.Text = strUserCode;

        }


        TXT_PurchaseCode.Text = strPurchaseCode;
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
            BT_Assessment.Enabled = true;
        }
        else
        {
            BT_Assessment.Enabled = false;
        }

    }



    private void ControlStatusCloseChange()
    {
        BT_Assessment.Enabled = false;
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

            if (wZPurchase.Progress != "询价")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('采购文件进度不为询价，不允许修改！');", true);
                return;
            }

            string strApplyCommentSQL = string.Format(@"select a.*,
                        s1.SupplierName as SupplierCode1Name,
                        s2.SupplierName as SupplierCode2Name,
                        s3.SupplierName as SupplierCode3Name
                         from T_WZSupplierApplyComment a
                        left join T_WZSupplier s1 on a.SupplierCode1= s1.SupplierCode
                        left join T_WZSupplier s2 on a.SupplierCode2= s2.SupplierCode
                        left join T_WZSupplier s3 on a.SupplierCode3= s3.SupplierCode
                    where a.PurchaseCode = '{0}'
                    and a.ExpertCode = '{1}'", wZPurchase.PurchaseCode, strUserCode);
            DataTable dtApplyComment = ShareClass.GetDataSetFromSql(strApplyCommentSQL, "ApplyComment").Tables[0];
            if (dtApplyComment != null && dtApplyComment.Rows.Count > 0)
            {
                DataRow drApplyComment = dtApplyComment.Rows[0];

                TXT_PurchaseCode.Text = ShareClass.ObjectToString(drApplyComment["PurchaseCode"]);
                TXT_Suggest.Text = ShareClass.ObjectToString(drApplyComment["Suggest"]);

                //HF_Supplier1.Value = ShareClass.ObjectToString(drApplyComment["SupplierCode1"]);
                //TXT_Supplier1.Text = ShareClass.ObjectToString(drApplyComment["SupplierCode1Name"]);
                //HF_Supplier2.Value = ShareClass.ObjectToString(drApplyComment["SupplierCode2"]);
                //TXT_Supplier2.Text = ShareClass.ObjectToString(drApplyComment["SupplierCode2Name"]);
                //HF_Supplier3.Value = ShareClass.ObjectToString(drApplyComment["SupplierCode3"]);
                //TXT_Supplier3.Text = ShareClass.ObjectToString(drApplyComment["SupplierCode3Name"]);

                TXT_ExpertCode.Text = strUserName;

                TXT_Suggest.BackColor = Color.CornflowerBlue;

                //TXT_Supplier1.BackColor = Color.CornflowerBlue;
                //TXT_Supplier2.BackColor = Color.CornflowerBlue;
                //TXT_Supplier3.BackColor = Color.CornflowerBlue;

                SavePurchaseDEcisionResult();

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('评标成功！');", true);
            }
        }
    }

    protected void BT_Save_Click(object sender, EventArgs e)
    {
        //string strSupplierCode1 = HF_Supplier1.Value; //TXT_Supplier1.Text.Trim();
        //string strSupplierCode2 = HF_Supplier2.Value;// TXT_Supplier2.Text.Trim();
        //string strSupplierCode3 = HF_Supplier3.Value;// TXT_Supplier3.Text.Trim();

        string strSupplierCode1 = DL_Supplier1.SelectedValue.Trim(); //TXT_Supplier1.Text.Trim();
        string strSupplierCode2 = DL_Supplier2.SelectedValue.Trim();// TXT_Supplier2.Text.Trim();
        string strSupplierCode3 = DL_Supplier3.SelectedValue.Trim();// TXT_Supplier3.Text.Trim();

        string strSuggest = TXT_Suggest.Text.Trim();

        string strSupplierApplyCommentHQL = "from WZSupplierApplyComment as wZSupplierApplyComment where PurchaseCode = '" + HF_PurchaseCode.Value + "' and ExpertCode = '" + strUserCode + "'";
        WZSupplierApplyCommentBLL wZSupplierApplyCommentBLL = new WZSupplierApplyCommentBLL();
        IList lstSupplierApplyComment = wZSupplierApplyCommentBLL.GetAllWZSupplierApplyComments(strSupplierApplyCommentHQL);
        if (lstSupplierApplyComment != null && lstSupplierApplyComment.Count > 0)
        {
            WZSupplierApplyComment wZSupplierApplyComment = (WZSupplierApplyComment)lstSupplierApplyComment[0];

            wZSupplierApplyComment.Suggest = strSuggest;
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
            wZSupplierApplyComment.Suggest = strSuggest;
            wZSupplierApplyComment.SupplierCode1 = strSupplierCode1;
            wZSupplierApplyComment.SupplierCode2 = strSupplierCode2;
            wZSupplierApplyComment.SupplierCode3 = strSupplierCode3;

            wZSupplierApplyCommentBLL.AddWZSupplierApplyComment(wZSupplierApplyComment);
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "LoadParentLit();", true);
        //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('保存成功！');", true);
    }


    //保存评标结果
    protected void SavePurchaseDEcisionResult()
    {
        //string strSupplierCode1 = HF_Supplier1.Value; //TXT_Supplier1.Text.Trim();
        //string strSupplierCode2 = HF_Supplier2.Value;// TXT_Supplier2.Text.Trim();
        //string strSupplierCode3 = HF_Supplier3.Value;// TXT_Supplier3.Text.Trim();

        string strSupplierCode1 = DL_Supplier1.SelectedValue.Trim(); //TXT_Supplier1.Text.Trim();
        string strSupplierCode2 = DL_Supplier2.SelectedValue.Trim();// TXT_Supplier2.Text.Trim();
        string strSupplierCode3 = DL_Supplier3.SelectedValue.Trim();// TXT_Supplier3.Text.Trim();

        string strSuggest = TXT_Suggest.Text.Trim();

        string strSupplierApplyCommentHQL = "from WZSupplierApplyComment as wZSupplierApplyComment where PurchaseCode = '" + HF_PurchaseCode.Value + "' and ExpertCode = '" + strUserCode + "'";
        WZSupplierApplyCommentBLL wZSupplierApplyCommentBLL = new WZSupplierApplyCommentBLL();
        IList lstSupplierApplyComment = wZSupplierApplyCommentBLL.GetAllWZSupplierApplyComments(strSupplierApplyCommentHQL);
        if (lstSupplierApplyComment != null && lstSupplierApplyComment.Count > 0)
        {
            WZSupplierApplyComment wZSupplierApplyComment = (WZSupplierApplyComment)lstSupplierApplyComment[0];

            wZSupplierApplyComment.Suggest = strSuggest;
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
            wZSupplierApplyComment.Suggest = strSuggest;
            wZSupplierApplyComment.SupplierCode1 = strSupplierCode1;
            wZSupplierApplyComment.SupplierCode2 = strSupplierCode2;
            wZSupplierApplyComment.SupplierCode3 = strSupplierCode3;

            wZSupplierApplyCommentBLL.AddWZSupplierApplyComment(wZSupplierApplyComment);
        }
    }


    protected void BT_SelectSupplier1_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "SelectSupplier('HF_Supplier1','TXT_Supplier1');", true);
    }



    protected void BT_SelectSupplier2_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "SelectSupplier('HF_Supplier2','TXT_Supplier2');", true);
    }



    protected void BT_SelectSupplier3_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "SelectSupplier('HF_Supplier3','TXT_Supplier3');", true);
    }

}