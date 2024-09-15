using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTBMWinResultView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strID = Request.QueryString["AnnID"];

        string strUserCode = Session["UserCode"].ToString();

        if (Page.IsPostBack != true)
        {
            if (!string.IsNullOrEmpty(strID) && strID.Trim() != "")
            {
                GetBMAnnInvitation(strID.Trim());
            }
        }
    }

    protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        string strHQL = lbl_sql1.Text.Trim();
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierBid");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void GetBMAnnInvitation(string strID)
    {
        string strHQL = "From BMAnnInvitation as bMAnnInvitation where bMAnnInvitation.ID = '" + strID + "'";
        BMAnnInvitationBLL bMAnnInvitationBLL = new BMAnnInvitationBLL();
        IList lst = bMAnnInvitationBLL.GetAllBMAnnInvitations(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMAnnInvitation bMAnnInvitation = (BMAnnInvitation)lst[0];
            lbl_EnterCode.Text = bMAnnInvitation.EnterCode.Trim();
            lbl_BidRemark.Text = GetBMBidPlanRemark(bMAnnInvitation.BidPlanID.ToString());
            lbl_BidObjects.Text = bMAnnInvitation.BidObjects.Trim();

            LoadBMSupplierBidList(bMAnnInvitation.ID.ToString());
        }
    }


    protected void LoadBMSupplierBidList(string strAnnInvitationID)
    {
        string strHQL = "Select * From T_BMSupplierBid Where AnnInvitationID='" + strAnnInvitationID + "' order by ID Desc";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierBid");

        DataGrid1.CurrentPageIndex = 0;
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        lbl_sql1.Text = strHQL;
    }

    protected string GetBMSupplierInfoName(string strId)
    {
        string strHQL = "From BMSupplierInfo as bMSupplierInfo where bMSupplierInfo.ID = '" + strId.Trim() + "'";
        BMSupplierInfoBLL bMSupplierInfoBLL = new BMSupplierInfoBLL();
        IList lst = bMSupplierInfoBLL.GetAllBMSupplierInfos(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMSupplierInfo bMSupplierInfo = (BMSupplierInfo)lst[0];
            return bMSupplierInfo.Name.Trim();
        }
        else
        {
            return "";
        }
    }

    protected string GetBMSupplierBidStatus(string strBidStatus)
    {
        if (strBidStatus.Trim().Equals("Y"))
        {
            return "中标";
        }
        else if (strBidStatus.Trim().Equals("N"))
        {
            return "未中标";
        }
        else
        {
            return "未开标";
        }
    }

    protected string GetBMBidPlanRemark(string strID)
    {
        string strHQL;
        IList lst;
        //绑定招标计划
        strHQL = "From BMBidPlan as bMBidPlan Where bMBidPlan.ID='" + strID + "' ";
        BMBidPlanBLL bMBidPlanBLL = new BMBidPlanBLL();
        lst = bMBidPlanBLL.GetAllBMBidPlans(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            BMBidPlan bMBidPlan = (BMBidPlan)lst[0];
            return bMBidPlan.BidRemark.Trim();
        }
        else
            return "";
    }

    protected string GetBMSupBidByExpResult(string strID)
    {
        string strHQL;
        IList lst;
        string result = "";
        //绑定招标计划
        strHQL = "From BMSupBidByExp as bMSupBidByExp Where bMSupBidByExp.SupplierBidID='" + strID + "' Order By bMSupBidByExp.ID ";
        BMSupBidByExpBLL bMSupBidByExpBLL = new BMSupBidByExpBLL();
        lst = bMSupBidByExpBLL.GetAllBMSupBidByExps(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            for (int i = 0; i < lst.Count; i++)
            {
                BMSupBidByExp bMSupBidByExp = (BMSupBidByExp)lst[i];
                result += "专家 " + ShareClass.GetUserName(bMSupBidByExp.ExportCode.Trim()) + "：" + bMSupBidByExp.ExportResult.Trim() + "；";
            }
        }
        return result;
    }
}