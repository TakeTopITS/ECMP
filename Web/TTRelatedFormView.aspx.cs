using System; using System.Resources;
using System.Data;
using System.Configuration;

using System.Drawing;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;


using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTRelatedFormView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL, strType, strID;
        string strRelatedType = "";
        string strRelatedID = "";
        IList lst;

        string strUserCode = Session["UserCode"].ToString();

        strType = Request.QueryString["Type"].Trim();
        strID = Request.QueryString["ID"].Trim();

        if (strType == "Doc")
        {
            strHQL = "from Document as document where document.DocID = " + strID;
            DocumentBLL documentBLL = new DocumentBLL();
            lst = documentBLL.GetAllDocuments(strHQL);
            Document document = (Document)lst[0];

            strRelatedType = document.RelatedType.Trim();
            strRelatedID = document.RelatedID.ToString();
        }

        if (strType == "ExpenseApply")
        {
            strHQL = "from ExpenseApplyWL as expenseApplyWL where expenseApplyWL.ID = " + strID;
            ExpenseApplyWLBLL expenseApplyWLBLL = new ExpenseApplyWLBLL();
            lst = expenseApplyWLBLL.GetAllExpenseApplyWLs(strHQL);
            ExpenseApplyWL expenseApplyWL = (ExpenseApplyWL)lst[0];

            strRelatedType = expenseApplyWL.RelatedType.Trim();
            strRelatedID = expenseApplyWL.RelatedID.ToString();
        }

        if (strType == "ConstractReceivables")
        {
            strHQL = "From  ConstractReceivables as ConstractReceivables Where RelatedID = " + strID;
            ConstractReceivablesBLL constractReceivablesBLL = new ConstractReceivablesBLL();
            lst = constractReceivablesBLL.GetAllConstractReceivabless(strHQL);

            ConstractReceivables constractReceivables = (ConstractReceivables)lst[0];

            strRelatedType = constractReceivables.RelatedType.Trim();
            strRelatedID = constractReceivables.RelatedID.ToString();
        }

        if (strType == "ConstractPayable")
        {
            strHQL = "From  ConstractPayable as ConstractPayable Where RelatedID = " + strID;
            ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
            lst = constractPayableBLL.GetAllConstractPayables(strHQL);

            ConstractPayable constractPayable = (ConstractPayable)lst[0];

            strRelatedType = constractPayable.RelatedType.Trim();
            strRelatedID = constractPayable.RelatedID.ToString();
        }

        if(strRelatedType == "GoodsSO")
        {
            Response.Redirect("TTGoodsSaleOrderView.aspx?SOID=" + strRelatedID);
        }

        if (strRelatedType == "GoodsRO")
        {
            Response.Redirect("TTGoodsReturnOrderView.aspx?ROID=" + strRelatedID);
        }

        if (strRelatedType == "GoodsQO")
        {
            Response.Redirect("TTGoodsSaleQuotationOrderView.aspx?QOID=" + strRelatedID);
        }

        if (strRelatedType == "GoodsPO")
        {
            Response.Redirect("TTGoodsPurchaseOrderView.aspx?POID=" + strRelatedID);
        }

        if (strRelatedType == "AssetPO")
        {
            Response.Redirect("TTAssetPurchaseOrderView.aspx?POID=" + strRelatedID);
        }
        
        if ((strRelatedType == "项目") | (strRelatedType == "Project"))
        {
            Response.Redirect("TTProjectDetailView.aspx?ProjectID=" + strRelatedID);
        }

        if ((strRelatedType == "需求") | (strRelatedType == "Requirement"))
        {
            Response.Redirect("TTReqView.aspx?ReqID=" + strRelatedID);
        }

        if (strRelatedType == "工作流")
        {
            Response.Redirect("TTWorkFlowView.aspx?WLID=" + strRelatedID);
        }

        if (strRelatedType == "风险")
        {
            Response.Redirect("TTProjectRiskView.aspx?RiskID=" + strRelatedID);
        }

        if (strRelatedType == "会议")
        {
            Response.Redirect("TTMeetingView.aspx?ID=" + strRelatedID);
        }

        if (strRelatedType == "任务")
        {
            Response.Redirect("TTProjectTaskView.aspx?TaskID=" + strRelatedID);
        }

        if (strRelatedType == "费用报销")
        {
            Response.Redirect("TTExpenseClaimListView.aspx?ECID=" + strRelatedID);
        }

        if (strRelatedType == "协作")
        {
            Response.Redirect("TTCollaborationView.aspx?CoID=" + strRelatedID);
        }

        if (strRelatedType == "合同")
        {
            Response.Redirect("TTConstractView.aspx?ID=" + strRelatedID);
        }

        if (strRelatedType == "计划")
        {
            Response.Redirect("TTProjectPlanView.aspx?PlanID=" + strRelatedID);
        }

        if (strRelatedType == "客服")
        {
            Response.Redirect("TTCustomerQuestionView.aspx?ID=" + strRelatedID);
        }

        if (strRelatedType == "大计划")
        {
            Response.Redirect("TTPlanView.aspx?PlanID=" + strRelatedID);
        }

        if (strRelatedType == "其它")
        {
            Response.Write("--此业务无关联表单！");

            //this.Title = "--此业务无关联表单！";
        }
    }
}
