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
using System.Web.Mail;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTProjectTaskHandlePage : System.Web.UI.Page
{
    string strUserCode, strUserName;
    string strProjectID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        strProjectID = Request.QueryString["ProjectID"];

        if (strProjectID == null)
        {
            strProjectID = "0";
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "ajustHeight", "AdjustDivHeight();", true);
        if (Page.IsPostBack != true)
        {
            try
            {
                LoadProjectTaskAssignRecord(strUserCode, strProjectID);
                LoadProjectTask(strUserCode, strProjectID);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
        }
    }

    protected void BT_UpdateStatus_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strID, strStatus;

        strID = LB_SourceID.Value;
        strStatus = LB_TargetStatus.Value;

        strHQL = "Update T_TaskAssignRecord Set Status =  '" + strStatus + "',MoveTime = now() Where ID = " + strID;

        ShareClass.RunSqlCommand(strHQL);

        LoadProjectTaskAssignRecord(strUserCode, strProjectID);

        //Response.Redirect("TTProjectTaskHandlePage.aspx?ProjectID=" + strProjectID);
    }

    protected void LoadProjectTaskAssignRecord(string strUserCode, string strProjectID)
    {
        string strHQL;
        DataSet ds;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();

        if (strProjectID != "0")
        {
            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and taskAssignRecord.Status in ('计划','受理','待处理')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.ProjectID = " + strProjectID + " and project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_ToBeHandled.DataSource = ds;
            DataList_ToBeHandled.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_ToBeHandled, "待处理");

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and taskAssignRecord.Status in ('处理中','处理中') ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.ProjectID = " + strProjectID + " and project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_Handling.DataSource = ds;
            DataList_Handling.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_Handling, "处理中");

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and taskAssignRecord.Status in ('拒绝','挂起','取消','完成','已完成') ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask  where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.ProjectID = " + strProjectID + " and project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_FinishedUnAssigned.DataSource = ds;
            DataList_FinishedUnAssigned.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_FinishedUnAssigned, "已处理");


            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            //strHQL += " and (taskAssignRecord.ID in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord) and  taskAssignRecord.Status in ('拒绝','挂起','取消','计划','受理','待处理','处理中','处理中','完成','已完成','已分派'))";
            strHQL += " and  taskAssignRecord.Status = '已分派'";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.ProjectID = " + strProjectID + " and project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_Assigned.DataSource = ds;
            DataList_Assigned.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_Assigned, "已分派");
        }
        else
        {
            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and taskAssignRecord.Status in ('计划','受理','待处理') ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.ProjectID <> 1 and project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_ToBeHandled.DataSource = ds;
            DataList_ToBeHandled.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_ToBeHandled,"待处理");

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and taskAssignRecord.Status in ('处理中','处理中') ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.ProjectID <> 1 and project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_Handling.DataSource = ds;
            DataList_Handling.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_Handling,"已处理");

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and taskAssignRecord.Status in ('拒绝','挂起','取消','完成','已完成') ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask  where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.ProjectID <> 1 and project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_FinishedUnAssigned.DataSource = ds;
            DataList_FinishedUnAssigned.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_FinishedUnAssigned,"已完成");


            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            //strHQL += " and (taskAssignRecord.ID in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord) and  taskAssignRecord.Status in ('拒绝','挂起','取消','计划','受理','待处理','处理中','处理中','完成','已完成','已分派'))";
            strHQL += " and taskAssignRecord.Status = '已分派'";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.ProjectID <> 1 and project.Status not in ('新建','隐藏','删除','归档')))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_Assigned.DataSource = ds;
            DataList_Assigned.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_Assigned, "已分派");
        }
    }

    protected void RP_ToBeHandled_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
    }

    protected void RP_Handling_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
    }

    protected void RP_Finished_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
    }

    protected void RP_ToBeAssigned_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
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
        SetProTaskColorForDataGrid(DataGrid4);

        LoadProjectTaskAssignRecord(strUserCode, strProjectID);
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
        SetProTaskColorForDataGrid(DataGrid6);

        LoadProjectTaskAssignRecord(strUserCode, strProjectID);
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
            strHQL += " and projectTask.ProjectID not in (select project.ProjectID from Project as project where project.ProjectID = 1 or project.Status in ('新建','隐藏','删除','归档'))";
            strHQL += " Order by projectTask.TaskID DESC";
        }
        lst = projectTaskBLL.GetAllProjectTasks(strHQL);
        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
        SetProTaskColorForDataGrid(DataGrid4);
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
            strHQL += " and projectTask.ProjectID not in (select project.ProjectID from Project as project where project.ProjectID = 1 or project.Status in ('新建','隐藏','删除','归档'))";
            strHQL += " and projectTask.TaskID not in (Select taskAssignRecord.TaskID From TaskAssignRecord as taskAssignRecord)";
            strHQL += " Order by projectTask.TaskID DESC";
        }
        lst = projectTaskBLL.GetAllProjectTasks(strHQL);
        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
        SetProTaskColorForDataGrid(DataGrid6);
        LB_Sql6.Text = strHQL;
        LB_TotalNumber6.Text = "记录数：" + lst.Count.ToString();

        FinishPercentPicture4();
        FinishPercentPicture6();
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

            try
            {
                decFinishPercent = double.Parse((((System.Web.UI.WebControls.Label)DataGrid4.Items[i].FindControl("LB_FinishPercent")).Text));
                intWidth = int.Parse(decFinishPercent.ToString());
            }
            catch
            {
                intWidth = 0;
            }

            if (intWidth > 25)
            {
                ((System.Web.UI.WebControls.Label)DataGrid4.Items[i].FindControl("LB_FinishPercent")).Width = Unit.Pixel(intWidth);
            }
            ((System.Web.UI.WebControls.Label)DataGrid4.Items[i].FindControl("LB_FinishPercent")).BackColor = Color.YellowGreen;
            ((System.Web.UI.WebControls.Label)DataGrid4.Items[i].FindControl("LB_FinishPercent")).Text = intWidth.ToString() + "%";
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

            try
            {
                decFinishPercent = double.Parse((((System.Web.UI.WebControls.Label)DataGrid6.Items[i].FindControl("LB_FinishPercent")).Text));
                intWidth = int.Parse(decFinishPercent.ToString());
            }
            catch
            {
                intWidth = 0;
            }

            if (intWidth > 25)
            {
                ((System.Web.UI.WebControls.Label)DataGrid6.Items[i].FindControl("LB_FinishPercent")).Width = Unit.Pixel(intWidth);
            }
            ((System.Web.UI.WebControls.Label)DataGrid6.Items[i].FindControl("LB_FinishPercent")).BackColor = Color.YellowGreen;
            ((System.Web.UI.WebControls.Label)DataGrid6.Items[i].FindControl("LB_FinishPercent")).Text = intWidth.ToString() + "%";
        }
    }


    protected void SetTaskRecordColorForDataList(DataSet ds, DataList dataList, string strTaskStatus)
    {
        int i;
        DateTime dtNowDate, dtFinishedDate;
        string strStatus;

        //for (i = 0; i < ds.Tables[0].Rows.Count; i++)
        //{
        //    dtFinishedDate = DateTime.Parse(ds.Tables[0].Rows[i]["EndDate"].ToString());

        //    dtNowDate = DateTime.Now;

        //    strStatus = ds.Tables[0].Rows[i]["Status"].ToString().Trim();

        //    if (strStatus != "完成" & strStatus != "已完成")
        //    {
        //        if (strTaskStatus == "待处理")
        //        {
        //            ((Label)(dataList.Items[i].FindControl("LB_ID"))).ForeColor = Color.Gray;
        //            ((Label)(dataList.Items[i].FindControl("LB_Status"))).ForeColor = Color.Gray;


        //        }
        //        else if (strTaskStatus == "处理中")
        //        {
        //            ((Label)(dataList.Items[i].FindControl("LB_ID"))).ForeColor = Color.Red;
        //            ((Label)(dataList.Items[i].FindControl("LB_Status"))).ForeColor = Color.Red;
        //        }
        //        else
        //        {
        //            ((Label)(dataList.Items[i].FindControl("LB_ID"))).ForeColor = Color.Green;
        //            ((Label)(dataList.Items[i].FindControl("LB_Status"))).ForeColor = Color.Green;
        //        }
        //    }
        //    else
        //    {
        //        if (strTaskStatus == "已分派")
        //        {
        //            ((Label)(dataList.Items[i].FindControl("LB_ID"))).ForeColor = Color.Green;
        //            ((Label)(dataList.Items[i].FindControl("LB_Status"))).ForeColor = Color.Green;
        //        }
        //        else
        //        {
        //            ((Label)(dataList.Items[i].FindControl("LB_ID"))).ForeColor = Color.Blue;
        //            ((Label)(dataList.Items[i].FindControl("LB_Status"))).ForeColor = Color.Blue;
        //        }
        //    }
        //}
    }

    protected void SetProTaskColorForDataGrid(DataGrid dataGrid)
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

    protected string GetTaskPriority(string strTaskID)
    {
        string strHQL;

        strHQL = "Select Priority From T_ProjectTask Where TaskID = " + strTaskID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectTask");

        return ds.Tables[0].Rows[0][0].ToString().Trim();
    }
}
