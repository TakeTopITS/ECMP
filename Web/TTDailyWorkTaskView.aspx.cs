using ProjectMgt.BLL;
using System;
using System.Collections;
using System.Web.UI;
using System.Data;

public partial class TTDailyWorkTaskView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strProjectID, strProjectName;
        string strUserCode, strUserName;
        string strWorkDate;
        string strHQL;

        IList lst;

        strProjectID = Request.QueryString["ProjectID"];
        strProjectName = ShareClass.GetProjectName(strProjectID);

        strUserCode = Request.QueryString["UserCode"];
        strUserName = ShareClass.GetUserName(strUserCode);

        strWorkDate = Request.QueryString["WorkDate"];
        strWorkDate = DateTime.Parse(strWorkDate).ToString("yyyyMMdd");

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;
            LB_ProjectID.Text = strProjectID;

            strHQL = "Select * from T_TaskAssignRecord ";
            strHQL += " where ((TaskID in (select TaskID from T_ProjectTask where ProjectID = " + strProjectID + ")) ";
            strHQL += " Or (TaskID in (select TaskID from T_ProjectTask where PlanID In (Select ID From T_ImplePlan Where ProjectID = " + strProjectID + "))) ";
            strHQL += " Or (TaskID in (select TaskID from T_ProjectTask where ReqID In (Select ReqID From T_RelatedReq Where ProjectID = " + strProjectID + "))) ";
            strHQL += " Or (TaskID in (select TaskID from T_ProjectTask where DefectID In (Select DefectID From T_RelatedDefect Where ProjectID = " + strProjectID + "))) ";
            strHQL += " Or (TaskID in (select TaskID from T_ProjectTask where RiskID In (Select ID From T_ProjectRisk Where ProjectID = " + strProjectID + ")))) ";
            strHQL += " and OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and to_char(MakeDate,'yyyymmdd') <= " + "'" + strWorkDate + "'" + " and  to_char(MakeDate,'yyyymmdd') >= " + "'" + strWorkDate + "'";
            strHQL += " Order by ID DESC";

            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");

            DataList1.DataSource = ds;
            DataList1.DataBind();
            LB_QueryScope.Text = Resources.lang.ZZXMCYSY;

            LB_Total.Text = ShareClass.getCurrentDateTaskTotalForMember(strProjectID, strUserCode, DateTime.Now.ToString("yyyyMMdd"));

            //strHQL = "Select COALESCE(Sum(Expense),0),COALESCE(Sum(ManHour),0),COALESCE(Avg(FinishPercent),0) From T_TaskAssignRecord Where ID In ";
            //strHQL += "(Select ID from T_TaskAssignRecord ";
            //strHQL += " where ((TaskID in (select TaskID from T_ProjectTask where ProjectID = " + strProjectID + ")) ";
            //strHQL += " Or (TaskID in (select TaskID from T_ProjectTask where PlanID In (Select ID From T_ImplePlan Where ProjectID = " + strProjectID + "))) ";
            //strHQL += " Or (TaskID in (select TaskID from T_ProjectTask where ReqID In (Select ReqID From T_RelatedReq Where ProjectID = " + strProjectID + "))) ";
            //strHQL += " Or (TaskID in (select TaskID from T_ProjectTask where DefectID In (Select DefectID From T_RelatedDefect Where ProjectID = " + strProjectID + "))) ";
            //strHQL += " Or (TaskID in (select TaskID from T_ProjectTask where RiskID In (Select ID From T_ProjectRisk Where ProjectID = " + strProjectID + ")))) ";
            //strHQL += " and OperatorCode = " + "'" + strUserCode + "'";
            //strHQL += " and to_char(MakeDate,'yyyymmdd') <= " + "'" + strWorkDate + "'" + " and  to_char(MakeDate,'yyyymmdd') >= " + "'" + strWorkDate + "')";
            //ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");

            //if (ds.Tables[0].Rows.Count > 0)
            //{
            //    LB_Total.Text = Resources.lang.FeiYong + ": " + ds.Tables[0].Rows[0][0].ToString() + ", " + Resources.lang.GongSi + ": " + ds.Tables[0].Rows[0][1].ToString() + ", " + Resources.lang.JingDu + ": " + ds.Tables[0].Rows[0][2].ToString() + "%";
            //}
            //else
            //{
            //    LB_Total.Text = Resources.lang.FeiYong + ": " + "0, " + Resources.lang.GongSi + ": " +  "0, " + Resources.lang.JingDu + ": " + "0%";
            //}


        }
    }

}