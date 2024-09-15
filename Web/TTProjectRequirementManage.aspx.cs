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

public partial class TTProjectRequirementManage : System.Web.UI.Page
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

        Response.Redirect("TTProjectReqHandlePage.aspx?ProjectID=" + strProjectID);


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack != true)
        {
            LoadProjectReqAssignRecord(strUserCode, strProjectID);

            LoadRequirement(strUserCode);
        }
    }

    protected void LoadProjectReqAssignRecord(string strUserCode, string strProjectID)
    {
        string strHQL;
        IList lst;

        string strProjectName;

        if (strProjectID != "0")
        {
            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and reqAssignRecord.Status in ('计划','受理','处理中') and reqAssignRecord.ID not in (select reqAssignRecord.PriorID from ReqAssignRecord as reqAssignRecord) ";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('转任','关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = " + strProjectID + ")";
            strHQL += " Order by reqAssignRecord.ID DESC";
            ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);

            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();
            LB_Sql4.Text = strHQL;

            SetReqRecordColor(DataGrid4);

            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and (reqAssignRecord.Status in ('拒绝','完成','挂起','取消') and reqAssignRecord.ID not in (select reqAssignRecord.PriorID from ReqAssignRecord as reqAssignRecord))";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in ( select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = " + strProjectID + ")";
            strHQL += " Order by reqAssignRecord.ID DESC";
            reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
            LB_Sql1.Text = strHQL;

            SetReqRecordColor(DataGrid1);


            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and reqAssignRecord.ID in (select reqAssignRecord.PriorID from ReqAssignRecord as reqAssignRecord) ";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('转任','关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = " + strProjectID + ")";
            strHQL += " Order by reqAssignRecord.ID DESC";
            reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
            LB_Sql2.Text = strHQL;

            SetReqRecordColor(DataGrid2);

            strHQL = "from ReqAssignRecord as reqAssignRecord where ((reqAssignRecord.AssignManCode = " + "'" + strUserCode + "'" + " ) Or (reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'" + " and reqAssignRecord.Status = '转任'))";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in ( select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = " + strProjectID + ")";
            strHQL += " Order by reqAssignRecord.ID DESC";
            reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);

            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();
            LB_Sql3.Text = strHQL;

            SetReqRecordColor(DataGrid3);

            strProjectName = GetProjectName(strProjectID);

            LB_QueryScope.Text = Resources.lang.Project + strProjectName;
        }
        else
        {
            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and reqAssignRecord.Status in ('计划','受理','处理中') and reqAssignRecord.ID not in (select reqAssignRecord.PriorID from ReqAssignRecord as reqAssignRecord) ";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by reqAssignRecord.ID DESC";
            ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();
            LB_Sql4.Text = strHQL;

            SetReqRecordColor(DataGrid4);

            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and (reqAssignRecord.Status in ('拒绝','完成','挂起','取消') and reqAssignRecord.ID not in (select reqAssignRecord.PriorID from ReqAssignRecord as reqAssignRecord))";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in ( select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by reqAssignRecord.ID DESC";
            reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
            LB_Sql1.Text = strHQL;

            SetReqRecordColor(DataGrid1);

            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'";
            strHQL += " and reqAssignRecord.ID in (select reqAssignRecord.PriorID from ReqAssignRecord as reqAssignRecord) ";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by reqAssignRecord.ID DESC";
            reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
            LB_Sql2.Text = strHQL;

            SetReqRecordColor(DataGrid2);

            strHQL = "from ReqAssignRecord as reqAssignRecord where ((reqAssignRecord.AssignManCode = " + "'" + strUserCode + "'" + " ) Or (reqAssignRecord.OperatorCode = " + "'" + strUserCode + "'" + " and reqAssignRecord.Status = '转任'))";
            strHQL += " and reqAssignRecord.ReqID in (select requirement.ReqID from Requirement as requirement where requirement.Status not in ('关闭','隐藏','删除','归档'))";
            strHQL += " and reqAssignRecord.ReqID in ( select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID not in (select project.ProjectID from Project as project where project.Status in ('新建','评审','隐藏','删除','归档')))";
            strHQL += " Order by reqAssignRecord.ID DESC";
            reqAssignRecordBLL = new ReqAssignRecordBLL();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();
            LB_Sql3.Text = strHQL;

            SetReqRecordColor(DataGrid3);

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
        RequirementBLL requirementBLL = new RequirementBLL();
        lst = requirementBLL.GetAllRequirements(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void LoadRequirement(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Requirement as requirement where requirement.ApplicantCode = " + "'" + strUserCode + "'";
        strHQL += " and requirement.ReqID in (select relatedReq.ReqID from RelatedReq as relatedReq)";
        strHQL += " order by requirement.ReqID DESC";
        RequirementBLL requirementBLL = new RequirementBLL();
        lst = requirementBLL.GetAllRequirements(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }

    protected void SetReqRecordColor(DataGrid dataGrid)
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
