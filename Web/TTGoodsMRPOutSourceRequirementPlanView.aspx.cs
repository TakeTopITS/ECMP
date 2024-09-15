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


public partial class TTGoodsMRPOutSourceRequirementPlanView : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strPlanVerID, strPlanMRPVerID;

        strUserCode = Session["UserCode"].ToString();

        strPlanVerID = Request.QueryString["PlanVerID"];
        strPlanMRPVerID = Request.QueryString["PlanMRPVerID"];


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            LoadItemMainPlan(strPlanVerID);

            LoadItemMainPlanDetail(strPlanVerID);

            LoadItemMainPlanRelatedItemOutSourcingPlan(strPlanVerID, strPlanMRPVerID);

            LB_PlanMRPVersion.Text = strPlanMRPVerID;

            strHQL = "Select OnOrder,OnProduction,OnLine From T_ItemMainPlanMRPVersion Where PlanVerID = " + strPlanVerID + " and  PlanMRPVerID = " + strPlanMRPVerID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanMRPVersion");
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0][0].ToString().Trim() == "YES")
                {
                    CB_OnOrder.Checked = true;
                }
                else
                {
                    CB_OnOrder.Checked = false;
                }
                if (ds.Tables[0].Rows[0][1].ToString().Trim() == "YES")
                {
                    CB_OnProduction.Checked = true;
                }
                else
                {
                    CB_OnProduction.Checked = false;
                }
                if (ds.Tables[0].Rows[0][2].ToString().Trim() == "YES")
                {
                    CB_OnLine.Checked = true;
                }
                else
                {
                    CB_OnLine.Checked = false;
                }
            }
        }
    }

    protected void LoadItemMainPlan(string strPlanVerID)
    {
        string strHQL;

        strHQL = "Select * From T_ItemMainPlan Where PlanVerID = " + strPlanVerID;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlan");

        DataList1 .DataSource = ds;
        DataList1.DataBind();
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

    protected void LoadItemMainPlanRelatedItemOutSourcingPlan(string strPlanVerID, string strPlanMRPVerID)
    {
        string strHQL;

        strHQL = "Select * From T_ItemMainPlanRelatedItemProductPlan Where PlanVerID = " + strPlanVerID + " and PlanMRPVerID = " + strPlanMRPVerID;
        strHQL += " and ItemCode in (Select ItemCode From T_Item Where Type = '外协件')";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanRelatedItemProductPlan");

        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
    }

}
