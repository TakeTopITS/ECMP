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

using System.Data.SqlClient;



using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTTaskAssignRecordSummary : System.Web.UI.Page
{
    string strLangCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strProjectID, strProjectName;
        string strUserCode, strUserName;
        string strHQL;

        IList lst;

        strLangCode = Session["LangCode"].ToString();

        strProjectID = Request.QueryString["ProjectID"];
        strProjectName = GetProjectName(strProjectID);

        strUserCode = Session["UserCode"].ToString();
        strUserName = GetUserName(strUserCode);

        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>aHandler();</script>");
        if (Page.IsPostBack == false)
        {
            LB_UserCode.Text = strUserCode;
            LB_UserName.Text = strUserName;
            LB_ProjectID.Text = strProjectID;

            ShareClass.InitialProjectMemberTree(TreeView1, strProjectID);

            strHQL = "from ProjectTask as projectTask where projectTask.ProjectID = " + strProjectID + " Order by projectTask.TaskID DESC";
            ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
            lst = projectTaskBLL.GetAllProjectTasks(strHQL);

            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();

            LB_Sql.Text = strHQL;

            SetTaskAssignRecordColor();

            strHQL = "from TaskStatus as taskStatus Where taskStatus.LangCode = " + "'" + strLangCode + "'";
            strHQL += " Order by taskStatus.SortNumber ASC";
            TaskStatusBLL taskStatusBLL = new TaskStatusBLL();
            lst = taskStatusBLL.GetAllTaskStatuss(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            GetTotalExpenseAndManHour(strProjectID);

            FinishPercentPicture3();

            LB_QueryScope.Text = Resources.lang.ZZXMCYSY;

            LB_ReportName.Text = Resources.lang.XiangMu + ": " + strProjectID + " " + Resources.lang.RWFPJLBB;
            strHQL = "select Status as XName, Count(*) as YNumber from T_ProjectTask where ProjectID = " + strProjectID + " Group By Status ";

            IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Column&ChartName=" + LB_ReportName.Text + "&SqlCode=" + ShareClass.Escape(strHQL);

            //ShareClass.CreateAnalystColumnChart(strHQL, Chart1, SeriesChartType.Column, "", "Status", "StatusCount", "Default");
            //Chart1.Visible = true;
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strProjectID, strID;
        string strUserCode, strUserName;

        strProjectID = LB_ProjectID.Text.Trim();
        strID = TreeView1.SelectedNode.Target.Trim();

        try
        {
            strID = int.Parse(strID).ToString();

            strHQL = "from ProRelatedUser as proRelatedUser Where proRelatedUser.ID = " + strID;
            ProRelatedUserBLL proRelatedUserBLL = new ProRelatedUserBLL();
            lst = proRelatedUserBLL.GetAllProRelatedUsers(strHQL);

            if (lst.Count > 0)
            {
                ProRelatedUser proRelatedUser = (ProRelatedUser)lst[0];

                strUserCode = proRelatedUser.UserCode.Trim();
                strUserName = proRelatedUser.UserName.Trim();

                strHQL = "from ProjectTask as projectTask where projectTask.ProjectID =  " + strProjectID;
                strHQL += " and projectTask.TaskID in (select taskAssignRecord.TaskID from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'" + ")";
                strHQL += " Order by ProjectTask.TaskID DESC";
                ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
                lst = projectTaskBLL.GetAllProjectTasks(strHQL);

                DataGrid3.DataSource = lst;
                DataGrid3.DataBind();

                SetTaskAssignRecordColor();
                GetPersonalExpenseAndManHour(strProjectID, strUserCode);

                LB_Member1.Text = strUserCode + " " + strUserName;
                LB_Member2.Text = strUserCode + " " + strUserName;

                LB_QueryScope.Text = Resources.lang.ZZXMCY + strUserCode + strUserName;
                LB_Sql.Text = strHQL;
                LB_OperatorCode.Text = strUserCode;

                FinishPercentPicture3();

                strHQL = "select Status as XName, Count(*) as YNumber from T_ProjectTask where ProjectID = " + strProjectID;
                strHQL += " and TaskID in (Select TaskID From T_TaskAssignRecord Where OperatorCode = " + "'" + strUserCode + "'" + ")";
                strHQL += " Group By Status ";
                IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Column&ChartName=TaskSummary&SqlCode=" + ShareClass.Escape(strHQL);

                //ShareClass.CreateAnalystColumnChart(strHQL, Chart1, SeriesChartType.Column, "", "Status", "StatusCount", "Default");
                //Chart1.Visible = true;
            }
        }
        catch
        {
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strOperatorCode = LB_OperatorCode.Text;
        string strStatus = ((Button)e.Item.FindControl("BT_Status")).Text.Trim();
        string strProjectID = LB_ProjectID.Text.Trim();

        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();

        if (strOperatorCode == "All")
        {
            strHQL = "from ProjectTask as projectTask where projectTask.ProjectID = " + strProjectID;
            strHQL += " and projectTask.Status = " + "'" + strStatus + "'";
            strHQL += " Order by projectTask.TaskID DESC";

            LB_QueryScope.Text = Resources.lang.ZZCZZSY + Resources.lang.ZhuangTai + strStatus;
        }
        else
        {
            strHQL = "from ProjectTask as projectTask where projectTask.ProjectID = " + strProjectID;
            strHQL += " and projectTask.MakeManCode = " + "'" + strOperatorCode + "'";
            strHQL += " and projectTask.Status = " + "'" + strStatus + "'";
            strHQL += " Order by projectTask.TaskID DESC";

            LB_QueryScope.Text = Resources.lang.Operator + ":" + strOperatorCode + " " + GetUserName(strOperatorCode) + "," + Resources.lang.ZhuangTai + ":" + strStatus;
        }

        lst = projectTaskBLL.GetAllProjectTasks(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        SetTaskAssignRecordColor();

        for (int i = 0; i < DataGrid2.Items.Count; i++)
        {
            DataGrid2.Items[i].ForeColor = Color.Black;
        }

        e.Item.ForeColor = Color.Red;

        LB_Sql.Text = strHQL;

        FinishPercentPicture3();
    }

    protected void BT_AllMember_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strProjectID = LB_ProjectID.Text.Trim();

        strHQL = "from ProjectTask as projectTask where projectTask.ProjectID = " + strProjectID + " Order by projectTask.TaskID DESC";
        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        lst = projectTaskBLL.GetAllProjectTasks(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        SetTaskAssignRecordColor();


        GetTotalExpenseAndManHour(strProjectID);

        LB_QueryScope.Text = Resources.lang.ZZXMCYSY;
        LB_OperatorCode.Text = "All";

        FinishPercentPicture3();

        strHQL = "select Status as XName, Count(*) as YNumber from T_ProjectTask where ProjectID = " + strProjectID + " Group By Status ";
        IFrame_Chart1.Src = "TTTakeTopAnalystChartSet.aspx?FormType=Single&ChartType=Column&ChartName=TaskSummary&SqlCode=" + ShareClass.Escape(strHQL);

    }


    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        IList lst = projectTaskBLL.GetAllProjectTasks(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        FinishPercentPicture3();
        SetTaskAssignRecordColor();
    }

    protected void SetTaskAssignRecordColor()
    {
        int i;
        DateTime dtNowDate, dtFinishedDate;
        string strStatus;

        for (i = 0; i < DataGrid3.Items.Count; i++)
        {
            dtFinishedDate = DateTime.Parse(DataGrid3.Items[i].Cells[5].Text.Trim());
            dtNowDate = DateTime.Now;
            strStatus = DataGrid3.Items[i].Cells[11].Text.Trim();

            if (strStatus != "完成" & strStatus != "已完成")
            {
                if (dtFinishedDate < dtNowDate)
                {
                    DataGrid3.Items[i].ForeColor = Color.Red;
                }
            }
        }
    }

    protected void FinishPercentPicture3()
    {
        string strProjectID;
        double decFinishPercent;
        int intWidth;
        int i;


        for (i = 0; i < DataGrid3.Items.Count; i++)
        {
            strProjectID = DataGrid3.Items[i].Cells[0].Text.Trim();
            //decFinishPercent = double.Parse(DataGrid1.Items[i].Cells[4].Text.Trim());

            try
            {
                decFinishPercent = double.Parse((((System.Web.UI.WebControls.Label)DataGrid3.Items[i].FindControl("LB_FinishPercent")).Text));
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
                ((System.Web.UI.WebControls.Label)DataGrid3.Items[i].FindControl("LB_FinishPercent")).Width = Unit.Pixel(intWidth);
            }

            ((System.Web.UI.WebControls.Label)DataGrid3.Items[i].FindControl("LB_FinishPercent")).Text = intWidth.ToString() + "%";
        }
    }


    protected void GetTotalExpenseAndManHour(string strProjectID)
    {
        string strHQL;
        decimal deManHour = 0, deExpense = 0;
        IList lst;

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID = " + strProjectID + ")";
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        TaskAssignRecord taskAssignRecord = new TaskAssignRecord();

        for (int i = 0; i < lst.Count; i++)
        {
            taskAssignRecord = (TaskAssignRecord)lst[i];
            deExpense += taskAssignRecord.Expense;
            deManHour += taskAssignRecord.ManHour;
        }

        LB_Amount.Text = deExpense.ToString();
        LB_ManHour.Text = deManHour.ToString();

        LB_Member1.Text = Resources.lang.SuoYouChenYuan;
        LB_Member2.Text = Resources.lang.SuoYouChenYuan;


    }

    protected void GetPersonalExpenseAndManHour(string strProjectID, string strUserCode)
    {
        string strHQL;
        IList lst;
        decimal deExpense = 0, deManHour = 0;
        int i = 0;

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID = " + strProjectID + ")";
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        TaskAssignRecord taskAssignRecord = new TaskAssignRecord();

        for (i = 0; i < lst.Count; i++)
        {
            taskAssignRecord = (TaskAssignRecord)lst[i];
            deExpense += taskAssignRecord.Expense;
            deManHour += taskAssignRecord.ManHour;
        }

        LB_Amount.Text = deExpense.ToString();
        LB_ManHour.Text = deManHour.ToString();
    }

    protected string GetProjectName(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];
        string strProjectName = project.ProjectName.Trim();

        LB_ProExpenseBudget.Text = project.Budget.ToString();
        LB_ProManHourBudget.Text = project.ManHour.ToString();

        return strProjectName;
    }

    protected string GetUserName(string strUserCode)
    {
        string strUserName, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strUserName = projectMember.UserName;
        return strUserName.Trim();
    }


}
