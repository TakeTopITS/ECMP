using System; using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System.Collections;
using System.Data;
using System.Drawing;

public partial class TTWZPlanBrowse : System.Web.UI.Page
{
    public string strUserCode
    {
        get;
        set;
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["planCode"]))
            {
                string strPlanCode = Request.QueryString["planCode"].ToString();
                
                BindDataer(strPlanCode);
            }

        }
    }


    private void BindDataer(string strPlanCode)
    {
        string strWZPickingPlanSql = string.Format(@"select pp.*,
                        pm.UserName as PlanMarkerName,
                        pf.UserName as FeeManageName,
                        pe.UserName as PurchaseEngineerName,
                        pj.SupervisorUnit,
                        pj.BuildUnit
                        from T_WZPickingPlan pp
                        left join T_ProjectMember pm on pp.PlanMarker = pm.UserCode
                        left join T_ProjectMember pf on pp.FeeManage = pf.UserCode
                        left join T_ProjectMember pe on pp.PurchaseEngineer = pe.UserCode
                        left join T_WZProject pj on pp.ProjectCode = pj.ProjectCode
                        where pp.PlanCode = '{0}'", strPlanCode);
        DataTable dtPlan = ShareClass.GetDataSetFromSql(strWZPickingPlanSql, "PickingPlan").Tables[0];
        if (dtPlan != null && dtPlan.Rows.Count > 0)
        {
            DataRow drPlan = dtPlan.Rows[0];

            LB_PlanCode.Text = strPlanCode;
            LB_ProjectCode.Text = ShareClass.ObjectToString(drPlan["ProjectCode"]);
            LB_ProjectName.Text = ShareClass.ObjectToString(drPlan["ProjectName"]);
            LB_CommitTime.Text = ShareClass.ObjectToString(drPlan["CommitTime"]);
            LB_SinceNumber.Text = ShareClass.ObjectToString(drPlan["SinceNumber"]);
            LB_PlanName.Text = ShareClass.ObjectToString(drPlan["PlanName"]);
            LB_PlanMarkerName.Text = ShareClass.ObjectToString(drPlan["PlanMarkerName"]);
            LB_SupplyMethod.Text = ShareClass.ObjectToString(drPlan["SupplyMethod"]);
            LB_StoreRoom.Text = ShareClass.ObjectToString(drPlan["StoreRoom"]);
            LB_SignTime.Text = ShareClass.ObjectToString(drPlan["SignTime"]);
            LB_PurchaseEngineerName.Text = ShareClass.ObjectToString(drPlan["PurchaseEngineerName"]);
            LB_PickingUnit.Text = ShareClass.ObjectToString(drPlan["PickingUnit"]);
            LB_ApproveTime.Text = ShareClass.ObjectToString(drPlan["ApproveTime"]);
            LB_FeeManageName.Text = ShareClass.ObjectToString(drPlan["FeeManageName"]);
            LB_SupervisorUnit.Text = ShareClass.ObjectToString(drPlan["SupervisorUnit"]);
            LB_BuildUnit.Text = ShareClass.ObjectToString(drPlan["BuildUnit"]);

            LB_Year.Text = DateTime.Now.ToString("yyyy");
            LB_Month.Text = DateTime.Now.ToString("MM");
            LB_Day.Text = DateTime.Now.ToString("dd");

            string strProgress = ShareClass.ObjectToString(drPlan["Progress"]);
            if (strProgress != "签收")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "notPrintFunction();", true);
            }
        }
    }

}