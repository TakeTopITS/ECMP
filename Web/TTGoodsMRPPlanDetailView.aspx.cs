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


using System.Data.SqlClient;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

using TakeTopCore;

public partial class TTGoodsMRPPlanDetailView : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strPlanMRPID, strPlanVerID, strPlanMRPVerID;

        strUserCode = Session["UserCode"].ToString();

        strPlanMRPID = Request.QueryString["PlanMRPID"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            strHQL = "select PlanVerID,PlanMRPVerID From T_ItemMainPlanMRPVersion Where ID = " + strPlanMRPID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanMRPVersion");

            if (ds.Tables[0].Rows.Count > 0)
            {
                strPlanVerID = ds.Tables[0].Rows[0][0].ToString();
                strPlanMRPVerID = ds.Tables[0].Rows[0][1].ToString();

                LoadItemMainPlanDetail(strPlanVerID);
                LoadItemMainPlanRelatedItemPurchasePlan(strPlanVerID, strPlanMRPVerID);
                LoadItemMainPlanRelatedItemProductPlan(strPlanVerID, strPlanMRPVerID);
                LoadItemMainPlanRelatedItemOutSourcingPlan(strPlanVerID, strPlanMRPVerID);
            }
        }
    }


    protected void LoadItemMainPlanRelatedItemPurchasePlan(string strPlanVerID, string strPlanMRPVerID)
    {
        string strHQL;

        strHQL = "Select * From T_ItemMainPlanRelatedItemPurchasePlan Where PlanVerID = " + strPlanVerID + " and PlanMRPVerID = " + strPlanMRPVerID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanRelatedItemPurchasePlan");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void LoadItemMainPlanRelatedItemProductPlan(string strPlanVerID, string strPlanMRPVerID)
    {
        string strHQL;

        strHQL = "Select * From T_ItemMainPlanRelatedItemProductPlan Where PlanVerID = " + strPlanVerID + " and PlanMRPVerID = " + strPlanMRPVerID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanRelatedItemProductPlan");

        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
    }

    protected void LoadItemMainPlanRelatedItemOutSourcingPlan(string strPlanVerID, string strPlanMRPVerID)
    {
        string strHQL;

        strHQL = "Select * From T_ItemMainPlanRelatedItemProductPlan Where PlanVerID = " + strPlanVerID + " and PlanMRPVerID = " + strPlanMRPVerID;
        strHQL += " and ItemCode in (Select ItemCode From T_Item Where Type = '委外件')";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanRelatedItemProductPlan");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();
    }



    protected void LoadItemMainPlanDetail(string strPlanVerID)
    {
        string strHQL;

        strHQL = "Select * From T_ItemMainPlanDetail Where PlanVerID = " + strPlanVerID;
        strHQL += " Order By ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }


}
