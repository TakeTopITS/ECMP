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


using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProRelatedTaskView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strProjectID = Request.QueryString["ProjectID"];
        string strUserCode = Session["UserCode"].ToString();

        string strHQL;
        IList lst;

        string strProjectName = ShareClass.GetProjectName(strProjectID);
        //this.Title = Resources.lang.Project + strProjectID + " " + strProjectName + " 的任务分派！";
        LB_UserCode.Text = strUserCode;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LB_ReportName.Text = Resources.lang.XiangMu + ": " + strProjectID + " " + Resources.lang.RenWuBaoBiao;
            string strCmdText = "select Status as XName,count(*) as YNumber from T_ProjectTask ";
            strCmdText += " where ProjectID = " + strProjectID + " Group By Status";
            string strChartTitle = "ReportView";

            IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Bar&ChartName=" + strChartTitle + "&SqlCode=" + ShareClass.Escape(strCmdText);

            //ShareClass.CreateAnalystBarChart(strCmdText, Chart1, SeriesChartType.Bar, strChartTitle, "XName", "YNumber", "Default");
            //Chart1.Visible = true;


            strHQL = "from ProjectTask as projectTask where projectTask.ProjectID = " + strProjectID + " Order by projectTask.TaskID DESC";
            ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
            lst = projectTaskBLL.GetAllProjectTasks(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            SetProTaskColor();

            FinishPercentPicture1();

            LB_ProjectID.Text = strProjectID;

            LB_Sql.Text = strHQL;

        }
    }


    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        IList lst = projectTaskBLL.GetAllProjectTasks(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        FinishPercentPicture1();
        SetProTaskColor();
    }


    protected void SetProTaskColor()
    {
        int i;
        DateTime dtNowDate, dtFinishedDate;
        string strStatus;

        for (i = 0; i < DataGrid1.Items.Count; i++)
        {
            dtFinishedDate = DateTime.Parse(DataGrid1.Items[i].Cells[6].Text.Trim());
            dtNowDate = DateTime.Now;
            strStatus = DataGrid1.Items[i].Cells[4].Text.Trim();

            if (strStatus != "完成" | strStatus != "关闭")
            {
                if (dtFinishedDate < dtNowDate)
                {
                    DataGrid1.Items[i].ForeColor = Color.Red;
                }
            }
        }
    }



    protected void FinishPercentPicture1()
    {
        string strProjectID;
        double decFinishPercent;
        double deHeight;
        int intWidth;
        int i;


        for (i = 0; i < DataGrid1.Items.Count; i++)
        {
            strProjectID = DataGrid1.Items[i].Cells[0].Text.Trim();
            //decFinishPercent = double.Parse(DataGrid1.Items[i].Cells[4].Text.Trim());

            try
            {
                decFinishPercent = double.Parse((((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Text));
            }
            catch
            {
                decFinishPercent = 0;
            }
            try
            {
                intWidth = int.Parse(decFinishPercent.ToString());
            }
            catch
            {
                intWidth = 0;
            }

            if (intWidth > 25)
            {
                ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Width = Unit.Pixel(intWidth);
            }

            ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Text = intWidth.ToString() + "%";
        }
    }



    protected void LoadProjectTask()
    {
        string strProjectID = LB_ProjectID.Text.Trim();

        string strHQL = "from ProjectTask as projectTask where projectTask.ProjectID = " + strProjectID + " Order by projectTask.TaskID ASC";
        ProjectTask projectTask = new ProjectTask();
        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        IList lst = projectTaskBLL.GetAllProjectTasks(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        SetProTaskColor();

        LB_Sql.Text = strHQL;
    }


}
