using ProjectMgt.BLL;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class TTWorkPlanRelatedResourcesView : System.Web.UI.Page
{
    string strUserCode, strUserName, strPlanID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strPlanID = Request.QueryString["PlanID"];

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

 
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadProjectPlanMember(strPlanID);

            LB_PlanID.Text = strPlanID;
        }
    }
    protected void LoadProjectPlanMember(string strPlanID)
    {
        string strHQL;

        strHQL = "Select * From T_PlanMember Where PlanID = " + strPlanID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_PlanMember");

        RP_Attendant.DataSource = ds;
        RP_Attendant.DataBind();
    }
}