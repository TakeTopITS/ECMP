using ProjectMgt.BLL;
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWorkPlanListView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strProjectID = Request.QueryString["ProjectID"];
        string strUserCode = Session["UserCode"].ToString();

        string strProjectName = ShareClass.GetProjectName(strProjectID);

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LB_ProjectID.Text = strProjectID;

            LoadWorkPlan();

            HL_ProPlanGantt.NavigateUrl = "TTWorkPlanGanttForProject.aspx?pid=" + strProjectID;
            LB_UserCode.Text = strUserCode;
        }
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strEndTime, strStatus;
            DateTime dtNowTime;

            string strPlanID, strWorkID, strPlanName, strHQL;
            IList lst;

            strWorkID = e.Item.Cells[1].Text.Trim();
            strPlanName = e.Item.Cells[2].Text.Trim();

            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {
                strEndTime = DataGrid1.Items[i].Cells[3].Text.Trim();
                strStatus = DataGrid1.Items[i].Cells[9].Text.Trim();
                dtNowTime = DateTime.Now;

                if (DateTime.Parse(strEndTime) < dtNowTime)
                {
                    if (strStatus != "完成" & strStatus != "已完成")
                    {
                        DataGrid1.Items[i].ForeColor = Color.Red;
                    }
                }
            }

            e.Item.ForeColor = Color.Gold;

            PlanMemberBLL planMemberBLL = new PlanMemberBLL();

            strPlanID = e.Item.Cells[0].Text.Trim();
            strHQL = "from PlanMember as planMember where planMember.PlanID = " + strPlanID + " order by planMember.ID ASC";
            lst = planMemberBLL.GetAllPlanMembers(strHQL);
            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            LB_Plan.Visible = true;
            LB_Plan.Text = "我参与的计划：" + strWorkID + " " + strPlanName + " 的详细内容：";
        }
    }

    protected void LoadWorkPlan()
    {
        string strHQL;
        string strEndTime, strStatus;
        DateTime dtNowTime;

        string strProjectID = LB_ProjectID.Text.Trim();
        string strVerID;
        string strUserCode = Session["UserCode"].ToString();

        strVerID = ShareClass.GetProjectPlanVersion(strProjectID, "在用").ToString();

        strHQL = " select distinct PlanID,ProjectID,WorkID,PlanDetail,LeaderCode,Leader,BeginTime,EndTime,Resource,Budget,MakeDate,Status,ParentIDGantt,";
        strHQL += " PriorID,Type,VerID,DefaultSchedule,DefaultCost,COALESCE(FinishPercent,0) as FinishPercent  ";
        strHQL += " from V_WorkPlanView";
        strHQL += " where ProjectID = " + strProjectID + " and VerID = " + strVerID;
        strHQL += " Order by BeginTime ASC,EndTime DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        if (ds.Tables[0].Rows.Count > 0)
        {
            HL_ProPlanGantt.Enabled = true;
        }

        LB_Sql.Text = strHQL;

        PlanMemberBLL planMemberBLL = new PlanMemberBLL();

        for (int i = 0; i < DataGrid1.Items.Count; i++)
        {
            strEndTime = DataGrid1.Items[i].Cells[3].Text.Trim();
            strStatus = DataGrid1.Items[i].Cells[9].Text.Trim();
            dtNowTime = DateTime.Now;

            if (DateTime.Parse(strEndTime) < dtNowTime)
            {
                if (strStatus != "完成" & strStatus != "已完成")
                {
                    DataGrid1.Items[i].ForeColor = Color.Red;
                }
            }
            
        }
    }

}
