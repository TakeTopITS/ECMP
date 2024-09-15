using ProjectMgt.BLL;
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class TTWorkPlanUpdateLogView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strPlanID = Request.QueryString["PlanID"];
        string strUserCode = Session["UserCode"].ToString().Trim();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadWorkPlan(strPlanID);
        }
    }

    protected void LoadWorkPlan(string strPlanID)
    {
        string strHQL;
        string strUserCode = Session["UserCode"].ToString();

        strHQL = "select * from T_ImplePlan_UpdateLog";
        strHQL += " where ID = " + strPlanID;
        strHQL += " Order by CreateLogTime DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan_UpdateLog");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }
}
