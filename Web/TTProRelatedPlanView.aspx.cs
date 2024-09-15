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


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTProRelatedPlanView : System.Web.UI.Page
{
    string strProjectID, strProjectName, strUserCode, strPlanVerID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strProjectID = Request.QueryString["ProjectID"];
        strProjectName = ShareClass.GetProjectName(strProjectID);

        strUserCode = Session["UserCode"].ToString();

        strPlanVerID = GetProjectPlanVersionVerID(strProjectID, "在用").ToString();

        LB_UserCode.Text = strUserCode;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            MonthPicker1.StartDate = DateTime.Now;
            LB_ProjectName.Text = Resources.lang.XiangMu + ": " + strProjectID + " " + strProjectName;
            LB_ReportName.Text = MonthPicker1.Year + "年" + MonthPicker1.Month + "月计划完成情况";
            string strCmdText = "select cast(Percent_Done as CHAR(10)) as XName,count(*) as YNumber from T_ImplePlan ";
            strCmdText += " where ProjectID = " + strProjectID;
            strCmdText += " and extract(month from End_Date) = extract(month from now()) and extract(year from End_Date) = extract(year from now())";
            strCmdText += " And VerID = " + strPlanVerID;

            if (CB_Scope.Checked == true)
            {
                strCmdText += " and (Percent_Done = 100 or Percent_Done = 0)";
            }
            strCmdText += " and ID not In(Select Parent_ID From T_ImplePlan)";
            strCmdText += " Group By Percent_Done";
            string strChartTitle = "ReportView";
            IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

            //ShareClass.CreateAnalystBarChart(strCmdText, Chart1, SeriesChartType.Column, strChartTitle, "XName", "YNumber", "Default");
            //Chart1.Visible = true;

            LB_ProjectID.Text = strProjectID;
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        LB_ReportName.Text = MonthPicker1.Year + "年" + MonthPicker1.Month + "月计划完成情况";

        string strCmdText = "select Percent_Done  as XName,count(*) as YNumber from T_ImplePlan ";
        strCmdText += " where ProjectID = " + strProjectID;
        strCmdText += " And VerID = " + strPlanVerID;
        strCmdText += " and extract(month from End_Date) = " + MonthPicker1.Month.ToString() + " and extract(year from End_Date) = " + MonthPicker1.Year.ToString();

        if (CB_Scope.Checked == true)
        {
            strCmdText += " and (Percent_Done = 100 or Percent_Done = 0)";
        }
        strCmdText += " and ID not In(Select Parent_ID From T_ImplePlan)";
        strCmdText += " Group By Percent_Done";
        string strChartTitle = "ReportView";
        IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Pie&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

        //ShareClass.CreateAnalystBarChart(strCmdText, Chart1, SeriesChartType.Column, strChartTitle, "XName", "YNumber", "Default");
        //Chart1.Visible = true;
    }

    //取得版本号ID
    public static int GetProjectPlanVersionVerID(string strProjectID, string strType)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectPlanVersion as projectPlanVersion where projectPlanVersion.ProjectID = " + strProjectID + " and projectPlanVersion.Type = " + "'" + strType + "'";

        ProjectPlanVersionBLL projectPlanVersionBLL = new ProjectPlanVersionBLL();
        lst = projectPlanVersionBLL.GetAllProjectPlanVersions(strHQL);

        if (lst.Count > 0)
        {
            ProjectPlanVersion projectPlanVersion = (ProjectPlanVersion)lst[0];
            return projectPlanVersion.VerID;
        }
        else
        {
            return 0;
        }
    }
}
