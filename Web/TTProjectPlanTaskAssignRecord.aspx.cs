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

public partial class TTProjectPlanTaskAssignRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strPlanID = Request.QueryString["PlanID"];

        string strHQL;

        string strPlan;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strHQL = "Select * From T_TaskAssignRecord Where TaskID in (Select TaskID From T_ProjectTask Where PlanID = " + strPlanID + ") Order By ID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList2.DataSource = ds;
            DataList2.DataBind();

            strPlan = ShareClass.GetProjectPlanDetail(strPlanID);
            LB_Title.Text = "计划：" + strPlanID + strPlan + " 任务的所有分派记录！";
        }
    }

}
