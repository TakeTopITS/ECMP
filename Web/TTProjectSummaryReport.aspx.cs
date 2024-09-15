using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class TTProjectSummaryReport : System.Web.UI.Page
{
    string strProjectID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode, strUserName;


        strProjectID = Request.QueryString["ProjectID"];

        if (strProjectID == null)
        {
            strProjectID = "0";
            LB_Project.Text = "";
        }
        else
        {
            LB_Project.Text = strProjectID + " " + ShareClass.GetProjectName(strProjectID);
        }

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        DataSet ds;

        if (Page.IsPostBack == false)
        {
            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;
            LB_ProjectID.Text = strProjectID;

            strHQL = "Select Title,SummaryNumber From V_ProjectBaseDataSummaryReport  Where ProjectID = " + strProjectID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "V_ProjectBaseDataSummaryReport");

            DataGrid1.DataSource = ds;
            DataGrid1.DataBind();


            try
            {
                strHQL = "Select ProjectID, PlanID,PlanDetail,BeginTime,EndTime,TaskID,ManHourBudget,ManHourTrue,(CAST (COALESCE(ManHourTrue,0)*100/(case COALESCE(ManHourBudget,1) when 0 then 1 end) AS CHAR(50))) +'%' AS HourPercent From V_ProjectPlanSummaryReport  Where ProjectID = " + strProjectID;
                strHQL += " Order by BeginTime ASC,EndTime DESC";
                ds = ShareClass.GetDataSetFromSql(strHQL, "V_ProjectPlanSummaryReport");

                DataGrid2.DataSource = ds;
                DataGrid2.DataBind();
            }
            catch
            {
            }

            strHQL = "Select ProjectID, UserCode,UserName,Actor,JoinDate,LeaveDate,UnitHourSalary,MemberManHour,(UnitHourSalary * MemberManHour) as TotalCost From V_ProjectMemberManHourSummaryReport  Where ProjectID = " + strProjectID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "V_ProjectMemberManHourSummaryReport");

            DataGrid3.DataSource = ds;
            DataGrid3.DataBind();


            string strChartTitle = "项目费用分布图";
            string strCmdText = "select Account,sum(ConfirmAmount) as AccountAmount from T_ProExpense ";
            strCmdText += " where ProjectID = " + strProjectID + " Group By Account";
            IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Column&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

            //ShareClass.CreateProjectWorkloadChart(strCmdText, strChartTitle, Chart1);
            //Chart1.Visible = true;
        }
    }

}
