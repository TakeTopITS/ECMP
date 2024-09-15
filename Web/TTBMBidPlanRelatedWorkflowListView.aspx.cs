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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTBMBidPlanRelatedWorkflowListView : System.Web.UI.Page
{
    string strLangCode;
    string strRelatedID, strCreatorCode, strBMBidPlanID;
    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //泰顶软件(TakeTop Software)       
        string strHQL;
        IList lst;

        strLangCode = Session["LangCode"].ToString();
        strRelatedID = Request.QueryString["RelatedID"];

        strBMBidPlanID = GetBMBidPlanID(strRelatedID);
        strCreatorCode = GetBMSupplierInfoCode(Request.QueryString["SupplierID"]);

        string strUserCode = Session["UserCode"].ToString();
        string strUserName = Session["UserName"].ToString();

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            strHQL = "from WorkFlow as workFlow ";
            strHQL += " Where workFlow.RelatedType = '招标计划' and workFlow.RelatedID = " + strBMBidPlanID;
            strHQL += " and workFlow.CreatorCode = '" + strCreatorCode + "'";
            strHQL += " and workFlow.Status <> '新建'";
            strHQL += " Order by workFlow.WLID DESC";
            WorkFlowBLL workFlowBLL = new WorkFlowBLL();
            lst = workFlowBLL.GetAllWorkFlows(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();

            LB_Sql.Text = strHQL;

            LB_QueryScope.Text = Resources.lang.ZZGZLSQZSY;
        }
    }

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;
        IList lst;

        string strHQL = LB_Sql.Text;

        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }

    protected string GetBMSupplierInfoCode(string strId)
    {
        string strHQL = "From BMSupplierInfo as bMSupplierInfo where bMSupplierInfo.ID = '" + strId.Trim() + "'";
        BMSupplierInfoBLL bMSupplierInfoBLL = new BMSupplierInfoBLL();
        IList lst = bMSupplierInfoBLL.GetAllBMSupplierInfos(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMSupplierInfo bMSupplierInfo = (BMSupplierInfo)lst[0];
            return bMSupplierInfo.Code.Trim();
        }
        else
        {
            return "";
        }
    }

    protected string GetBMBidPlanID(string strAnnInvitationID)
    {
        string strHQL = "Select BidPlanID From T_BMAnnInvitation Where ID=" + strAnnInvitationID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierBid");

        return ds.Tables[0].Rows[0][0].ToString();
    }
}
