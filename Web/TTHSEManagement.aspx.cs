using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTHSEManagement : System.Web.UI.Page
{
    string strUserCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","安环健管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            GetHSEManagementList();
        }
    }

    protected void GetHSEManagementList()
    {
        string strHQL = "from HSEProductionSummary as hSEProductionSummary Order By hSEProductionSummary.Code Desc ";
        HSEProductionSummaryBLL hSEProductionSummaryBLL = new HSEProductionSummaryBLL();
        IList lst = hSEProductionSummaryBLL.GetAllHSEProductionSummarys(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        strHQL = "from HSETrainingPlan as hSETrainingPlan Order By hSETrainingPlan.Code Desc ";
        HSETrainingPlanBLL hSETrainingPlanBLL = new HSETrainingPlanBLL();
        lst = hSETrainingPlanBLL.GetAllHSETrainingPlans(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        strHQL = "select *,extract(year from TrainingStart)||'-'||EXTRACT(MONTH FROM TrainingStart)||'-'||EXTRACT(DAY FROM TrainingStart)||' '||EXTRACT(HOUR FROM TrainingStart)" +
            "||':'||EXTRACT(MINUTE FROM TrainingStart)||':'||EXTRACT(SECOND FROM TrainingStart)||'至'||extract(year from TrainingEnd)||'-'||EXTRACT(MONTH FROM TrainingEnd)" +
            "||'-'||EXTRACT(DAY FROM TrainingEnd)||' '||EXTRACT(HOUR FROM TrainingEnd)||':'||EXTRACT(MINUTE FROM TrainingEnd)||':'||EXTRACT(SECOND FROM TrainingEnd) TrainingStartEnd from " +
            "T_HSETraining Order By Code Desc ";
        DataTable dt = ShareClass.GetDataSetFromSql(strHQL, "T_HSETraining").Tables[0];
        DataGrid3.DataSource = dt;
        DataGrid3.DataBind();

        strHQL = "select *,extract(year from StartTime)||'-'||EXTRACT(MONTH FROM StartTime)||'-'||EXTRACT(DAY FROM StartTime)||' '||EXTRACT(HOUR FROM StartTime)||':'||EXTRACT(MINUTE FROM StartTime)" +
            "||':'||EXTRACT(SECOND FROM StartTime)||'至'||extract(year from EndTime)||'-'||EXTRACT(MONTH FROM EndTime)||'-'||EXTRACT(DAY FROM EndTime)||' '||EXTRACT(HOUR FROM EndTime)" +
            "||':'||EXTRACT(MINUTE FROM EndTime)||':'||EXTRACT(SECOND FROM EndTime) StartEndTime from T_HSEMeeting Order By Code Desc ";
        dt = ShareClass.GetDataSetFromSql(strHQL, "T_HSEMeeting").Tables[0];
        DataGrid4.DataSource = dt;
        DataGrid4.DataBind();
    }
}