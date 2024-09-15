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

public partial class TTProjectDefectmentManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strProjectID;

        string strUserCode = Session["UserCode"].ToString();
        string strUserName = GetUserName(strUserCode);

        strProjectID = Request.QueryString["ProjectID"];

        if (strProjectID == null)
        {
            strProjectID = "0";
        }

        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        Response.Redirect("TTProjectDefectmentHandlePage.aspx?ProjectID=" + strProjectID);


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack != true)
        {
            LoadProjectDefectAssignRecord(strUserCode, strProjectID);

            LoadDefectment(strUserCode);
        }
    }

    protected void LoadProjectDefectAssignRecord(string strUserCode, string strProjectID)
    {
        string strHQL;
        IList lst;

        string strProjectName;

        if (strProjectID != "0")
        {
            strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and defectAssignRecord.Status in ('计划','受理','处理中') and defectAssignRecord.ID not in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord) ";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('转任','关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in (select relatedDefect.DefectID from RelatedDefect as relatedDefect where relatedDefect.ProjectID = " + strProjectID + ")";
            strHQL += " Order by defectAssignRecord.ID DESC";
            DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
            lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);

            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();
            LB_Sql4.Text = strHQL;

            SetDefectRecordColor(DataGrid4);

            strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and (defectAssignRecord.Status in ('拒绝','完成','挂起','取消') and defectAssignRecord.ID not in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord))";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in ( select relatedDefect.DefectID from RelatedDefect as relatedDefect where relatedDefect.ProjectID = " + strProjectID + ")";
            strHQL += " Order by defectAssignRecord.ID DESC";
            defectAssignRecordBLL = new DefectAssignRecordBLL();
            lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
            LB_Sql1.Text = strHQL;

            SetDefectRecordColor(DataGrid1);


            strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and defectAssignRecord.ID in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord) ";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('转任','关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in (select relatedDefect.DefectID from RelatedDefect as relatedDefect where relatedDefect.ProjectID = " + strProjectID + ")";
            strHQL += " Order by defectAssignRecord.ID DESC";
            defectAssignRecordBLL = new DefectAssignRecordBLL();
            lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
            LB_Sql2.Text = strHQL;

            SetDefectRecordColor(DataGrid2);

            strHQL = "from DefectAssignRecord as defectAssignRecord where ((defectAssignRecord.AssignManCode = " + "'" + strUserCode + "'" + " ) Or (defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'" + " and defectAssignRecord.Status = '转任'))";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in ( select relatedDefect.DefectID from RelatedDefect as relatedDefect where relatedDefect.ProjectID = " + strProjectID + ")";
            strHQL += " Order by defectAssignRecord.ID DESC";
            defectAssignRecordBLL = new DefectAssignRecordBLL();
            lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);

            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();
            LB_Sql3.Text = strHQL;

            SetDefectRecordColor(DataGrid3);

            strProjectName = GetProjectName(strProjectID);

            LB_QueryScope.Text = Resources.lang.Project + strProjectName;
        }
        else
        {
            strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and defectAssignRecord.Status in ('计划','受理','处理中') and defectAssignRecord.ID not in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord) ";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in (select relatedDefect.DefectID from RelatedDefect as relatedDefect where relatedDefect.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by defectAssignRecord.ID DESC";
            DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
            lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();
            LB_Sql4.Text = strHQL;

            SetDefectRecordColor(DataGrid4);

            strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and (defectAssignRecord.Status in ('拒绝','完成','挂起','取消') and defectAssignRecord.ID not in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord))";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in ( select relatedDefect.DefectID from RelatedDefect as relatedDefect where relatedDefect.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by defectAssignRecord.ID DESC";
            defectAssignRecordBLL = new DefectAssignRecordBLL();
            lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
            LB_Sql1.Text = strHQL;

            SetDefectRecordColor(DataGrid1);

            strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and defectAssignRecord.ID in (select defectAssignRecord.PriorID from DefectAssignRecord as defectAssignRecord) ";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in (select relatedDefect.DefectID from RelatedDefect as relatedDefect where relatedDefect.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by defectAssignRecord.ID DESC";
            defectAssignRecordBLL = new DefectAssignRecordBLL();
            lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
            LB_Sql2.Text = strHQL;

            SetDefectRecordColor(DataGrid2);

            strHQL = "from DefectAssignRecord as defectAssignRecord where ((defectAssignRecord.AssignManCode = " + "'" + strUserCode + "'" + " ) Or (defectAssignRecord.OperatorCode = " + "'" + strUserCode + "'" + " and defectAssignRecord.Status = '转任'))";
            strHQL += " and defectAssignRecord.DefectID in (select defectment.DefectID from Defectment as defectment where defectment.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and defectAssignRecord.DefectID in ( select relatedDefect.DefectID from RelatedDefect as relatedDefect where relatedDefect.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by defectAssignRecord.ID DESC";
            defectAssignRecordBLL = new DefectAssignRecordBLL();
            lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();
            LB_Sql3.Text = strHQL;

            SetDefectRecordColor(DataGrid3);

            LB_QueryScope.Text = Resources.lang.StatusAll;
        }
    }

    protected void DataGrid4_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid4.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql4.Text;
        IList lst;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        IList lst;

        string strHQL = LB_Sql1.Text;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql2.Text;
        IList lst;

        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;
        IList lst;

        string strHQL = LB_Sql3.Text;
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }


    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;
        IList lst;

        string strHQL = LB_Sql5.Text;
        DefectmentBLL defectmentBLL = new DefectmentBLL();
        lst = defectmentBLL.GetAllDefectments(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void LoadDefectment(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Defectment as defectment where defectment.ApplicantCode = " + "'" + strUserCode + "'";
        strHQL += " and defectment.DefectID in (select relatedDefect.DefectID from RelatedDefect as relatedDefect)";
        strHQL += " order by defectment.DefectID DESC";
        DefectmentBLL defectmentBLL = new DefectmentBLL();
        lst = defectmentBLL.GetAllDefectments(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }

    protected void SetDefectRecordColor(DataGrid dataGrid)
    {
        int i;
        DateTime dtNowDate, dtFinishedDate;
        string strStatus;

        for (i = 0; i < dataGrid.Items.Count; i++)
        {
            dtFinishedDate = DateTime.Parse(dataGrid.Items[i].Cells[6].Text.Trim());
            dtNowDate = DateTime.Now;
            strStatus = dataGrid.Items[i].Cells[7].Text.Trim();

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
        string strUserName;

        string strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];

        strUserName = projectMember.UserName;
        return strUserName.Trim();
    }
}
