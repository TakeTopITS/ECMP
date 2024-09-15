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


public partial class TTProjectTaskManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strProjectID;

        string strUserCode = Session["UserCode"].ToString();
        string strUserName = GetUserName(strUserCode);

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        strProjectID = Request.QueryString["ProjectID"];

        if (strProjectID == null)
        {
            strProjectID = "0";
        }

        Response.Redirect("TTProjectTaskHandlePage.aspx?ProjectID=" + strProjectID);

        //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack != true)
        {
            LoadProjectReqAssignRecord(strUserCode, strProjectID);
            LoadProjectTask(strUserCode, strProjectID);

            FinishPercentPicture1();
            FinishPercentPicture2();
            FinishPercentPicture3();
            FinishPercentPicture5();

            FinishPercentPicture4();
            FinishPercentPicture6();
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = Session["UserCode"].ToString();
        string strUserName = GetUserName(strUserCode);

        string strProjectID = Request.QueryString["ProjectID"];
        string strEndDays = NB_EndDays.Amount.ToString();

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and taskAssignRecord.Status in ('计划','受理','处理中','待处理') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord) ";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from Project as project where project.ProjectID = " + strProjectID + " and project.Status not in ('新建','隐藏','删除','归档')))";
        strHQL += " and taskAssignRecord.EndDate::date-now()::date <= " + strEndDays;
        strHQL += " Order by taskAssignRecord.EndDate::date-now()::date ASC";
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;
        LB_TotalNumber1.Text = "记录数：" + lst.Count.ToString();
        SetTaskRecordColor(DataGrid1);
    }

    protected void LoadProjectReqAssignRecord(string strUserCode, string strProjectID)
    {
        string strHQL;
        IList lst;

        string strProjectName;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();

        if (strProjectID != "0")
        {
            strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and taskAssignRecord.Status in ('计划','受理','处理中','待处理') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord) ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from Project as project where project.ProjectID = " + strProjectID + " and project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.ID DESC";
            lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
            LB_Sql1.Text = strHQL;
            LB_TotalNumber1.Text = "记录数：" + lst.Count.ToString();
            SetTaskRecordColor(DataGrid1);

            strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and (taskAssignRecord.Status in ('拒绝','完成','挂起','取消','处理中') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord))";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from Project as project where project.ProjectID = " + strProjectID + " and project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.ID DESC";
            taskAssignRecordBLL = new TaskAssignRecordBLL();
            lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
            LB_Sql2.Text = strHQL;
            LB_TotalNumber2.Text = "记录数：" + lst.Count.ToString();
            SetTaskRecordColor(DataGrid2);

            strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.AssignManCode = " + "'" + strUserCode + "'";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from Project as project where project.ProjectID = " + strProjectID + " and project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.ID DESC";
            taskAssignRecordBLL = new TaskAssignRecordBLL();
            lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();
            LB_Sql3.Text = strHQL;
            LB_TotalNumber3.Text = "记录数：" + lst.Count.ToString();
            SetTaskRecordColor(DataGrid3);

            strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and taskAssignRecord.ID in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord)";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from Project as project where project.ProjectID = " + strProjectID + " and project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.ID DESC";
            lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
            DataGrid5.DataSource = lst;
            DataGrid5.DataBind();
            LB_Sql5.Text = strHQL;
            LB_TotalNumber5.Text = "记录数：" + lst.Count.ToString();
            SetTaskRecordColor(DataGrid5);

            strProjectName = GetProjectName(strProjectID);
            LB_QueryScope.Text = Resources.lang.Project + strProjectID + " " + strProjectName;
        }
        else
        {
            strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and taskAssignRecord.Status in ('计划','受理','处理中','待处理') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord) ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.ID DESC";
            lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
            LB_Sql1.Text = strHQL;
            LB_TotalNumber1.Text = "记录数：" + lst.Count.ToString();
            SetTaskRecordColor(DataGrid1);

            strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and (taskAssignRecord.Status in ('拒绝','完成','挂起','取消','处理中') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord))";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.ID DESC";
            taskAssignRecordBLL = new TaskAssignRecordBLL();
            lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
            LB_Sql2.Text = strHQL;
            LB_TotalNumber2.Text = "记录数：" + lst.Count.ToString();
            SetTaskRecordColor(DataGrid2);

            strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.AssignManCode = " + "'" + strUserCode + "'";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.ID DESC";
            taskAssignRecordBLL = new TaskAssignRecordBLL();
            lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();
            LB_Sql3.Text = strHQL;
            LB_TotalNumber3.Text = "记录数：" + lst.Count.ToString();
            SetTaskRecordColor(DataGrid3);

            strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and taskAssignRecord.ID in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord)";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.ID DESC";
            lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
            DataGrid5.DataSource = lst;
            DataGrid5.DataBind();
            LB_Sql5.Text = strHQL;
            LB_TotalNumber5.Text = "记录数：" + lst.Count.ToString();
            SetTaskRecordColor(DataGrid5);

            LB_QueryScope.Text = Resources.lang.ZZCXHWSY;
        }
    }

    protected string GetTaskPriority(string strTaskID)
    {
        string strHQL;

        strHQL = "Select Priority From T_ProjectTask Where TaskID = " + strTaskID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectTask");

        return ds.Tables[0].Rows[0][0].ToString().Trim();
    }


    protected void FinishPercentPicture1()
    {
        string strProjectID;
        int intWidth;
        int i;

        for (i = 0; i < DataGrid1.Items.Count; i++)
        {
            strProjectID = DataGrid1.Items[i].Cells[0].Text.Trim();
            //decFinishPercent = double.Parse(DataGrid1.Items[i].Cells[4].Text.Trim());

            intWidth = int.Parse((((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Text));

            if (intWidth > 25)
            {
                ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Width = Unit.Pixel(intWidth);
            }

            ((System.Web.UI.WebControls.Label)DataGrid1.Items[i].FindControl("LB_FinishPercent")).Text = intWidth.ToString() + "%";
        }
    }

    protected void FinishPercentPicture2()
    {
        string strProjectID;
        int intWidth;
        int i;


        for (i = 0; i < DataGrid2.Items.Count; i++)
        {
            strProjectID = DataGrid2.Items[i].Cells[0].Text.Trim();
            //decFinishPercent = double.Parse(DataGrid1.Items[i].Cells[4].Text.Trim());

            intWidth = int.Parse((((System.Web.UI.WebControls.Label)DataGrid2.Items[i].FindControl("LB_FinishPercent")).Text));

            if (intWidth > 25)
            {
                ((System.Web.UI.WebControls.Label)DataGrid2.Items[i].FindControl("LB_FinishPercent")).Width = Unit.Pixel(intWidth);
            }

            ((System.Web.UI.WebControls.Label)DataGrid2.Items[i].FindControl("LB_FinishPercent")).Text = intWidth.ToString() + "%";

        }

    }

    protected void FinishPercentPicture3()
    {
        string strProjectID;
        int intWidth;
        int i;

        for (i = 0; i < DataGrid3.Items.Count; i++)
        {
            strProjectID = DataGrid3.Items[i].Cells[0].Text.Trim();
            //decFinishPercent = double.Parse(DataGrid1.Items[i].Cells[4].Text.Trim());

            intWidth = int.Parse((((System.Web.UI.WebControls.Label)DataGrid3.Items[i].FindControl("LB_FinishPercent")).Text));
            if (intWidth > 25)
            {
                ((System.Web.UI.WebControls.Label)DataGrid3.Items[i].FindControl("LB_FinishPercent")).Width = Unit.Pixel(intWidth);
            }

            ((System.Web.UI.WebControls.Label)DataGrid3.Items[i].FindControl("LB_FinishPercent")).Text = intWidth.ToString() + "%";
        }
    }

    protected void FinishPercentPicture4()
    {
        string strProjectID;
        double decFinishPercent;
        int intWidth;
        int i;

        for (i = 0; i < DataGrid4.Items.Count; i++)
        {
            strProjectID = DataGrid4.Items[i].Cells[0].Text.Trim();

            string strWidth = ((System.Web.UI.WebControls.Label)DataGrid4.Items[i].FindControl("LB_FinishPercent")).Text;

            decFinishPercent = double.Parse((((System.Web.UI.WebControls.Label)DataGrid4.Items[i].FindControl("LB_FinishPercent")).Text));
            intWidth = int.Parse(decFinishPercent.ToString());

            if (intWidth > 25)
            {
                ((System.Web.UI.WebControls.Label)DataGrid4.Items[i].FindControl("LB_FinishPercent")).Width = Unit.Pixel(intWidth);
            }
            ((System.Web.UI.WebControls.Label)DataGrid4.Items[i].FindControl("LB_FinishPercent")).BackColor = Color.YellowGreen;
            ((System.Web.UI.WebControls.Label)DataGrid4.Items[i].FindControl("LB_FinishPercent")).Text = intWidth.ToString() + "%";
        }
    }

    protected void FinishPercentPicture5()
    {
        string strProjectID;
        int intWidth;
        int i;

        for (i = 0; i < DataGrid5.Items.Count; i++)
        {
            strProjectID = DataGrid5.Items[i].Cells[0].Text.Trim();
            //decFinishPercent = double.Parse(DataGrid1.Items[i].Cells[4].Text.Trim());

            intWidth = int.Parse((((System.Web.UI.WebControls.Label)DataGrid5.Items[i].FindControl("LB_FinishPercent")).Text));

            if (intWidth > 25)
            {
                ((System.Web.UI.WebControls.Label)DataGrid5.Items[i].FindControl("LB_FinishPercent")).Width = Unit.Pixel(intWidth);
            }

            ((System.Web.UI.WebControls.Label)DataGrid5.Items[i].FindControl("LB_FinishPercent")).Text = intWidth.ToString() + "%";
        }
    }

    protected void FinishPercentPicture6()
    {
        string strProjectID;
        double decFinishPercent;
        int intWidth;
        int i;


        for (i = 0; i < DataGrid6.Items.Count; i++)
        {
            strProjectID = DataGrid6.Items[i].Cells[0].Text.Trim();
            //decFinishPercent = double.Parse(DataGrid1.Items[i].Cells[4].Text.Trim());

            decFinishPercent = double.Parse((((System.Web.UI.WebControls.Label)DataGrid6.Items[i].FindControl("LB_FinishPercent")).Text));
            intWidth = int.Parse(decFinishPercent.ToString());
            if (intWidth > 25)
            {
                ((System.Web.UI.WebControls.Label)DataGrid6.Items[i].FindControl("LB_FinishPercent")).Width = Unit.Pixel(intWidth);
            }
            ((System.Web.UI.WebControls.Label)DataGrid6.Items[i].FindControl("LB_FinishPercent")).BackColor = Color.YellowGreen;
            ((System.Web.UI.WebControls.Label)DataGrid6.Items[i].FindControl("LB_FinishPercent")).Text = intWidth.ToString() + "%";
        }
    }

    protected void LoadProjectTask(string strUserCode, string strProjectID)
    {
        string strHQL;
        IList lst;

        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();

        if (strProjectID != "0")
        {
            strHQL = "from ProjectTask as projectTask where projectTask.MakeManCode = " + "'" + strUserCode + "'";
            strHQL += " and projectTask.ProjectID = " + strProjectID;
            strHQL += " and projectTask.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','隐藏','删除','归档'))";
            strHQL += " Order by projectTask.TaskID DESC";
        }
        else
        {
            strHQL = "from ProjectTask as projectTask where projectTask.MakeManCode = " + "'" + strUserCode + "'";
            strHQL += " and projectTask.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','隐藏','删除','归档'))";
            strHQL += " Order by projectTask.TaskID DESC";
        }
        lst = projectTaskBLL.GetAllProjectTasks(strHQL);
        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
        SetProTaskColor(DataGrid4);
        LB_Sql4.Text = strHQL;
        LB_TotalNumber4.Text = "记录数：" + lst.Count.ToString();

        if (strProjectID != "0")
        {
            strHQL = "from ProjectTask as projectTask where projectTask.MakeManCode = " + "'" + strUserCode + "'";
            strHQL += " and projectTask.ProjectID = " + strProjectID;
            strHQL += " and projectTask.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','隐藏','删除','归档'))";
            strHQL += " and projectTask.TaskID not in (Select taskAssignRecord.TaskID From TaskAssignRecord as taskAssignRecord)";
            strHQL += " Order by projectTask.TaskID DESC";
        }
        else
        {
            strHQL = "from ProjectTask as projectTask where projectTask.MakeManCode = " + "'" + strUserCode + "'";
            strHQL += " and projectTask.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','隐藏','删除','归档'))";
            strHQL += " and projectTask.TaskID not in (Select taskAssignRecord.TaskID From TaskAssignRecord as taskAssignRecord)";
            strHQL += " Order by projectTask.TaskID DESC";
        }
        lst = projectTaskBLL.GetAllProjectTasks(strHQL);
        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
        SetProTaskColor(DataGrid6);
        LB_Sql6.Text = strHQL;
        LB_TotalNumber6.Text = "记录数：" + lst.Count.ToString();
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql1.Text;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        FinishPercentPicture1();

        SetTaskRecordColor(DataGrid1);
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql2.Text;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);


        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        FinishPercentPicture2();
        SetTaskRecordColor(DataGrid2);
    }

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql3.Text;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);


        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

        FinishPercentPicture3();
        SetTaskRecordColor(DataGrid3);
    }

    protected void DataGrid4_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid4.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql4.Text;

        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        IList lst = projectTaskBLL.GetAllProjectTasks(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();

        FinishPercentPicture4();
        SetProTaskColor(DataGrid4);
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql5.Text;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        FinishPercentPicture5();

        SetTaskRecordColor(DataGrid5);
    }

    protected void DataGrid6_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid6.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql6.Text;

        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        IList lst = projectTaskBLL.GetAllProjectTasks(strHQL);

        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();

        FinishPercentPicture6();
        SetProTaskColor(DataGrid6);
    }

    protected void BT_AllTask_Click(object sender, EventArgs e)
    {
        string strUserCode, strHQL;
        IList lst;

        LB_QueryScope.Text = Resources.lang.ZZApplicantAll;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();

        strUserCode = LB_UserCode.Text.Trim();

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and taskAssignRecord.Status in ('计划','受理','处理中') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord) ";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档')))";
        strHQL += " Order by taskAssignRecord.ID DESC";
        taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;

        SetTaskRecordColor(DataGrid1);

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and (taskAssignRecord.Status in ('拒绝','完成','挂起','取消') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord))";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档')))";
        strHQL += " Order by taskAssignRecord.ID DESC";
        taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
        LB_Sql2.Text = strHQL;

        SetTaskRecordColor(DataGrid2);

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.AssignManCode = " + "'" + strUserCode + "'";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档')))";
        strHQL += " Order by taskAssignRecord.ID DESC";
        taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
        LB_Sql3.Text = strHQL;

        SetTaskRecordColor(DataGrid3);

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and taskAssignRecord.ID in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord)";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档')))";
        strHQL += " Order by taskAssignRecord.ID DESC";
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
        LB_Sql5.Text = strHQL;
        SetTaskRecordColor(DataGrid5);

        FinishPercentPicture1();
        FinishPercentPicture2();

        FinishPercentPicture3();

        FinishPercentPicture5();
    }

    protected void SetProTaskColor(DataGrid dataGrid)
    {
        int i;
        DateTime dtNowDate, dtFinishedDate;
        string strStatus;

        for (i = 0; i < dataGrid.Items.Count; i++)
        {
            dtFinishedDate = DateTime.Parse(dataGrid.Items[i].Cells[5].Text.Trim());
            dtNowDate = DateTime.Now;
            strStatus = dataGrid.Items[i].Cells[11].Text.Trim();

            if (strStatus != "完成" | strStatus != "关闭")
            {
                if (dtFinishedDate < dtNowDate)
                {
                    dataGrid.Items[i].ForeColor = Color.Red;
                }
            }
        }
    }

    protected void SetTaskRecordColor(DataGrid dataGrid)
    {
        int i;
        DateTime dtNowDate, dtFinishedDate;
        string strStatus;

        for (i = 0; i < dataGrid.Items.Count; i++)
        {
            dtFinishedDate = DateTime.Parse(dataGrid.Items[i].Cells[5].Text.Trim());
            dtNowDate = DateTime.Now;
            strStatus = dataGrid.Items[i].Cells[6].Text.Trim();

            if (strStatus != "完成" & strStatus != "已完成")
            {
                if (dtFinishedDate < dtNowDate)
                {
                    dataGrid.Items[i].ForeColor = Color.Red;
                }
            }
        }
    }

    protected string GetProjectName(string strProjectID)
    {
        string strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);
        Project project = (Project)lst[0];
        string strProjectName = project.ProjectName.Trim();
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
