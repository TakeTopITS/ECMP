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


public partial class TTAppTask : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strProjectID;

        string strUserCode;
        string strUserName;
        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        strProjectID = Request.QueryString["ProjectID"];

        if (strProjectID == null)
        {
            strProjectID = "0";
        }

        string strSystemVersionType = Session["SystemVersionType"].ToString();
        string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];
        if (strSystemVersionType == "SAAS" || strProductType.IndexOf("SAAS") > -1)
        {
            BT_CreateTask.Visible = false;
        }

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "项目", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "SetDataGridTrClickLink();", true);
        if (Page.IsPostBack != true)
        {
            LoadProjectTaskAssignRecord(strUserCode, strProjectID);

            LoadProjectTask(strUserCode, strProjectID);

        }
    }

    protected void BT_CreateTask_Click(object sender, EventArgs e)
    {
        Response.Redirect("TTAppCreateOtherTask.aspx");
    }

    protected void LoadProjectTaskAssignRecord(string strUserCode, string strProjectID)
    {
        string strHQL;
        IList lst;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();

        strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and taskAssignRecord.Status in ('计划','受理','待处理','处理中') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord) ";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
        strHQL += " Order by taskAssignRecord.ID DESC";

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and taskAssignRecord.Status in ('计划','受理','待处理','处理中') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord) ";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
        strHQL += " Order by taskAssignRecord.ID DESC";
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and (taskAssignRecord.Status in ('拒绝','完成','挂起','取消') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord))";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
        strHQL += " Order by taskAssignRecord.ID DESC";
        taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
        LB_Sql2.Text = strHQL;

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.AssignManCode = " + "'" + strUserCode + "'";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
        strHQL += " Order by taskAssignRecord.ID DESC";
        taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
        LB_Sql3.Text = strHQL;
       

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " and taskAssignRecord.ID in (select taskAssignRecord.PriorID from TaskAssignRecord as taskAssignRecord)";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.Status <> '关闭')";
        strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
        strHQL += " Order by taskAssignRecord.ID DESC";
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
        LB_Sql5.Text = strHQL;
    }

  

    protected void LoadProjectTask(string strUserCode, string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectTask as projectTask where projectTask.MakeManCode = " + "'" + strUserCode + "'";
        strHQL += " and ( (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
        strHQL += " Order by projectTask.TaskID DESC";

        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        lst = projectTaskBLL.GetAllProjectTasks(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();

       

        LB_Sql4.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql1.Text;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql2.Text;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);


        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

      
    }

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql3.Text;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);


        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();

    }

    protected void DataGrid4_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid4.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql4.Text;

        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        IList lst = projectTaskBLL.GetAllProjectTasks(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();

    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql5.Text;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        IList lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

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
