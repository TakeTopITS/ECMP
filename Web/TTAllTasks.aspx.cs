using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTAllTasks : System.Web.UI.Page
{
    private string strUserCode, strUserName;
    private string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //泰顶拓鼎集团2006－2026

        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "所有成员的任务", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "ajustHeight", "AdjustDivHeight();", true);
        if (Page.IsPostBack == false)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT, TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            LoadProjectTaskAssignRecord("");
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strDepartName, strUserCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = ShareClass.GetDepartName(strDepartCode);
            strUserCode = LB_UserCode.Text.Trim();

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid1);

            string strDepartString = TakeTopCore.CoreShareClass.InitialUnderDepartmentStringByDepartCode(strDepartCode);
            LB_DepartString.Text = strDepartString;

            LoadProjectTaskAssignRecord("");
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strOperatorCode = ((Button)e.Item.FindControl("BT_UserCode")).Text;
        string strOperatorName = ShareClass.GetUserName(strOperatorCode);
        string strUserCode = LB_UserCode.Text.Trim();

        LoadProjectTaskAssignRecord(strOperatorCode);
    }

    protected void BT_AllTask_Click(object sender, EventArgs e)
    {
        string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
        LB_DepartString.Text = strDepartString;

        LoadProjectTaskAssignRecord("");
    }

    protected void LoadProjectTaskAssignRecord(string strOperatorCode)
    {
        string strHQL;
        DataSet ds;

        string strDepartString;

        strDepartString = LB_DepartString.Text;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();

        if (strOperatorCode != "")
        {
            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strOperatorCode + "'";
            strHQL += " and taskAssignRecord.OperatorCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and taskAssignRecord.Status in ('计划','受理','待处理') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord) ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_ToBeHandled.DataSource = ds;
            DataList_ToBeHandled.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_ToBeHandled);

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strOperatorCode + "'";
            strHQL += " and taskAssignRecord.OperatorCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and taskAssignRecord.Status in ('处理中','处理中') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord) ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_Handling.DataSource = ds;
            DataList_Handling.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_Handling);

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strOperatorCode + "'";
            strHQL += " and taskAssignRecord.OperatorCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and taskAssignRecord.Status in ('拒绝','挂起','取消','完成','已完成','已分派') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord) ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask  where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_FinishedUnAssigned.DataSource = ds;
            DataList_FinishedUnAssigned.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_FinishedUnAssigned);

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where taskAssignRecord.OperatorCode = " + "'" + strOperatorCode + "'";
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
            strHQL += "  taskAssignRecord.OperatorCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and taskAssignRecord.Status in ('计划','受理','待处理') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord) ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_ToBeHandled.DataSource = ds;
            DataList_ToBeHandled.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_ToBeHandled);

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where ";
            strHQL += "  taskAssignRecord.OperatorCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and taskAssignRecord.Status in ('处理中','处理中') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord) ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_Handling.DataSource = ds;
            DataList_Handling.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_Handling);

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where ";
            strHQL += "  taskAssignRecord.OperatorCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and taskAssignRecord.Status in ('拒绝','挂起','取消','完成','已完成','已分派') and taskAssignRecord.ID not in (select taskAssignRecord.PriorID from T_TaskAssignRecord as taskAssignRecord) ";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask  where projectTask.Status <> '关闭')";
            strHQL += " and taskAssignRecord.TaskID in (select projectTask.TaskID from T_ProjectTask as projectTask where (projectTask.ProjectID = 1) or (projectTask.ProjectID in (select project.ProjectID from T_Project as project where project.Status not in ('新建','隐藏','删除','归档'))))";
            strHQL += " Order by taskAssignRecord.MoveTime DESC limit 40";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_TaskAssignRecord");
            DataList_FinishedUnAssigned.DataSource = ds;
            DataList_FinishedUnAssigned.DataBind();
            SetTaskRecordColorForDataList(ds, DataList_FinishedUnAssigned);

            strHQL = "Select * from T_TaskAssignRecord as taskAssignRecord where ";
            strHQL += "  taskAssignRecord.OperatorCode in (Select projectMember.UserCode From T_ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
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