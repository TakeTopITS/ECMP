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

using System.Security.Cryptography;
using System.Security.Permissions;
using System.Data.SqlClient;

using System.Globalization;
using System.Threading;
using DayPilot.Web.Ui;
using DayPilot.Web.Ui.Events;

using System.ComponentModel;
using System.Web.SessionState;
using System.Drawing.Imaging;



using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTMyMemTask : System.Web.UI.Page
{
    string strUserCode, strUserName;
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "直接成员的任务", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "ajustHeight", "AdjustDivHeight();", true);
        if (Page.IsPostBack == false)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthorityProjectLeader(Resources.lang.ZZJGT, TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            ShareClass.LoadMemberByUserCodeForDataGrid(strUserCode, "Project", DataGrid1);

            LoadProjectTaskAssignRecord(strUserCode,"");
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strHQL;
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            strHQL = "from ProjectMember as projectMember where projectMember.DepartCode = " + "'" + strDepartCode + "'";
            strHQL += " Order By projectMember.SortNumber DESC";
            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
            lst = projectMemberBLL.GetAllProjectMembers(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
            TreeView1.Width = 170;

            string strDepartString = TakeTopCore.CoreShareClass.InitialUnderDepartmentStringByDepartCode(strDepartCode);
            LB_DepartString.Text = strDepartString;

            LoadProjectTaskAssignRecord(strUserCode, "");
        }
    }

    protected void BT_AllTasks_Click(object sender, EventArgs e)
    {
        string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthorityProjectLeader(Resources.lang.ZZJGT, TreeView1, strUserCode);
        LB_DepartString.Text = strDepartString;

        LoadProjectTaskAssignRecord(strUserCode,"");
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strUnderlingCode = ((Button)e.Item.FindControl("BT_UnderlingCode")).Text;
        string strUnderLingName = ShareClass.GetUserName(strUnderlingCode);

        LoadProjectTaskAssignRecord(strUserCode,strUnderlingCode);
    }

    protected void LoadProjectTaskAssignRecord(string strUserCode,string strUnderCode)
    {
        string strHQL;
        DataSet ds;

        string strDepartString;
        strDepartString = LB_DepartString.Text;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();

        if (strUnderCode != "")
        {
            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUnderCode + "'";

            strHQL += " and taskAssignRecord.OperatorCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and taskAssignRecord.Status in ('计划','受理','待处理') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord) ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_ToBeHandled.DataSource = ds;
            DataList_ToBeHandled.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_ToBeHandled);

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUnderCode + "'";

            strHQL += " and taskAssignRecord.OperatorCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and taskAssignRecord.Status in ('处理中','处理中') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord) ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_Handling.DataSource = ds;
            DataList_Handling.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_Handling);

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUnderCode + "'";

            strHQL += " and taskAssignRecord.OperatorCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and taskAssignRecord.Status in ('拒绝','挂起','取消','完成','已完成','已分派') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord) ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask  where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_FinishedUnAssigned.DataSource = ds;
            DataList_FinishedUnAssigned.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_FinishedUnAssigned);

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strUnderCode + "'";

            strHQL += " and taskAssignRecord.OperatorCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and taskAssignRecord.ID in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord)";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_Assigned.DataSource = ds;
            DataList_Assigned.DataBind();
        }
        else
        {
            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where ";
            strHQL += "  taskAssignRecord.OperatorCode in ( select memberLevel.UnderCode from T_MemberLevel as memberLevel where memberLevel.ProjectVisible = 'YES' and memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
            strHQL += " and taskAssignRecord.OperatorCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and taskAssignRecord.Status in ('计划','受理','待处理') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord) ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_ToBeHandled.DataSource = ds;
            DataList_ToBeHandled.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_ToBeHandled);
        

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where ";
            strHQL += "  taskAssignRecord.OperatorCode in ( select memberLevel.UnderCode from T_MemberLevel as memberLevel where memberLevel.ProjectVisible = 'YES' and memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
            strHQL += " and taskAssignRecord.OperatorCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and taskAssignRecord.Status in ('处理中','处理中') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord) ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_Handling.DataSource = ds;
            DataList_Handling.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_Handling);

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where ";
            strHQL += "  taskAssignRecord.OperatorCode in ( select memberLevel.UnderCode from T_MemberLevel as memberLevel where memberLevel.ProjectVisible = 'YES' and memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
            strHQL += " and taskAssignRecord.OperatorCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and taskAssignRecord.Status in ('拒绝','挂起','取消','完成','已完成','已分派') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord) ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask  where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_FinishedUnAssigned.DataSource = ds;
            DataList_FinishedUnAssigned.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_FinishedUnAssigned);

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where ";
            strHQL += "  taskAssignRecord.OperatorCode in ( select memberLevel.UnderCode from T_MemberLevel as memberLevel where memberLevel.ProjectVisible = 'YES' and memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
            strHQL += " and taskAssignRecord.OperatorCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and taskAssignRecord.ID in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord)";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_Assigned.DataSource = ds;
            DataList_Assigned.DataBind();
        }
    }

    protected void SetTaskRecordColorForDataList(DataSet ds, DataList dataList)
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
        //        if (dtFinishedDate < dtNowDate)
        //        {
        //            dataList.Items[i].BackColor = Color.LightPink;
        //        }
        //    }
        //}
    }
}
