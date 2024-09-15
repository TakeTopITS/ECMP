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
using System.Data;
using System.Drawing;

public partial class TTWZPlanDetailBrowse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            string strPlanCode = string.Empty;
            if (!string.IsNullOrEmpty(Request.QueryString["planCode"]))
            {
                strPlanCode = Request.QueryString["planCode"].ToString();
            }
            else
            {
                strPlanCode = "";
            }

            BindPlanData(strPlanCode);

            DataPickingPlanDetailBinder(strPlanCode);
        }
    }


    private void BindPlanData(string strPlanCode)
    {
        string strWZPickingPlanSql = string.Format(@"select pp.*,
                        pm.UserName as PlanMarkerName,
                        pf.UserName as FeeManageName
                        from T_WZPickingPlan pp
                        left join T_ProjectMember pm on pp.PlanMarker = pm.UserCode
                        left join T_ProjectMember pf on pp.FeeManage = pf.UserCode
                        where pp.PlanCode = '{0}'", strPlanCode);
        DataTable dtPlan = ShareClass.GetDataSetFromSql(strWZPickingPlanSql, "PickingPlan").Tables[0];
        if (dtPlan != null && dtPlan.Rows.Count > 0)
        {
            DataRow drPlan = dtPlan.Rows[0];

            LB_PlanCode.Text = strPlanCode;
            LB_FeeManageName.Text = ShareClass.ObjectToString(drPlan["FeeManageName"]);
            LB_PlanMarkerName.Text = ShareClass.ObjectToString(drPlan["PlanMarkerName"]);

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

    private void DataPickingPlanDetailBinder(string strPlanCode)
    {
        DG_PickPlanDetailList.CurrentPageIndex = 0;

        string strWZPickingPlanDetailHQL = string.Format(@"select d.*,o.ObjectName,o.Criterion,o.Model,o.Grade,s.UnitName from T_WZPickingPlanDetail d
                                        left join T_WZObject o on d.ObjectCode = o.ObjectCode 
                                        left join T_WZSpan s on o.Unit = s.ID
                                        where d.PlanCode = '{0}'
                                        order by o.DLCode,o.ObjectName,o.Model", strPlanCode);
        DataTable dtWZPickingPlanDetail = ShareClass.GetDataSetFromSql(strWZPickingPlanDetailHQL, "PickingPlanDetail").Tables[0];

        DG_PickPlanDetailList.DataSource = dtWZPickingPlanDetail;
        DG_PickPlanDetailList.DataBind();

        LB_PickPlanDetailSql.Text = strWZPickingPlanDetailHQL;

        LB_TotalPage.Text = DG_PickPlanDetailList.PageCount.ToString();
        LB_CurrentPage.Text = (DG_PickPlanDetailList.CurrentPageIndex + 1).ToString();
    }


    protected void DG_PickPlanDetailList_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DG_PickPlanDetailList.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_PickPlanDetailSql.Text.Trim();
        DataTable dtWZPickingPlanDetail = ShareClass.GetDataSetFromSql(strHQL, "PickingPlanDetail").Tables[0];

        DG_PickPlanDetailList.DataSource = dtWZPickingPlanDetail;
        DG_PickPlanDetailList.DataBind();
    }
}