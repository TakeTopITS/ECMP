using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text;

using System.Security.Cryptography;
using System.Security.Permissions;
using Npgsql;//using System.Data.SqlClient;

using System.ComponentModel;
using System.Web.SessionState;
using System.Drawing.Imaging;
using System.Timers;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTPersonalSpaceTask : System.Web.UI.Page
{
    int intRunNumber;
	
    protected void Page_Load(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack == false)
        {
            //清空页面缓存，用于改变皮肤
            SetPageNoCache();

            intRunNumber = 0;

            AsyncWork();
        }
    }

    //清空页面缓存，用于改变皮肤
    public void SetPageNoCache()
    {
        if (Session["CssDirectoryChangeNumber"].ToString() == "1")
        {
            //清除全部缓存
            IDictionaryEnumerator allCaches = Page.Cache.GetEnumerator();
            while (allCaches.MoveNext())
            {
                Page.Cache.Remove(allCaches.Key.ToString());
            }

            Page.Response.Buffer = true;
            Page.Response.AddHeader("Pragma", "No-Cache");

            Page.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
            Page.Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Page.Response.Expires = 0;
            Page.Response.CacheControl = "no-cache";
            Page.Response.Cache.SetNoStore();
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        if (intRunNumber == 0)
        {
            AsyncWork();

            Timer1.Interval = 3600000;

            intRunNumber = 1;
        }
    }

    private void AsyncWork()
    {
        string strUserInfo, strUserName;

        string strUserCode;
        String strLangCode;
        strUserCode = Session["UserCode"].ToString();
        strLangCode = Session["LangCode"].ToString();

        strUserName = Session["UserName"].ToString();
        strUserInfo = Resources.lang.YongHu + ": " + strUserCode + "  " + strUserName;


        try
        {

            LoadProjectTaskList(strUserCode);

        }
        catch (Exception err)
        {
            LogClass.WriteLogFile(err.Message.ToString());
        }
    }

    protected void LoadProjectTaskList(string strUserCode)
    {
        string strHQL;
        IList lst;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and taskAssignRecord.Status in ('计划','受理','处理中','待处理','处理中') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord) ";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
        strHQL += " Order by taskAssignRecord.MoveTime DESC";
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and taskAssignRecord.Status in ('拒绝','挂起','取消','完成','已完成','已分派') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord) ";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask  where projectTask.Status <> '关闭')";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
        strHQL += " Order by taskAssignRecord.MoveTime DESC";
        taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }


    protected string GetTaskPriority(string strTaskID)
    {
        string strHQL;

        strHQL = "Select Priority From T_ProjectTask Where TaskID = " + strTaskID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectTask");

        return ds.Tables[0].Rows[0][0].ToString().Trim();
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL;

        string strUserCode;

        strUserCode = Session["UserCode"].ToString();

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and taskAssignRecord.Status in ('计划','受理','处理中') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord) ";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
        strHQL += " Order by taskAssignRecord.ID DESC";

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;

        string strHQL;

        string strUserCode;

        strUserCode = Session["UserCode"].ToString();

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and (taskAssignRecord.Status in ('拒绝','完成','挂起','取消') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord))";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
        strHQL += " Order by taskAssignRecord.ID DESC";

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }


}