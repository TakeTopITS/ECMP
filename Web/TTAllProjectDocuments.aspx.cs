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


public partial class TTAllProjectDocuments : System.Web.UI.Page
{
    string strRelatedName, strProjectID;

    string strProductLineRelated;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        LB_UserCode.Text = strUserCode;


        strProductLineRelated = ShareClass.GetDepartRelatedProductLineFromUserCode(strUserCode);

        string strTargetID = Request.QueryString["TargetID"];
        strProjectID = Request.QueryString["ProjectID"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", " aHandler();", true);
        if (Page.IsPostBack == false)
        {
            if (strTargetID != null)
            {
                LoadProjectDoc(strUserCode, strTargetID);
            }
            else
            {
                LoadAllDocument(strUserCode);
            }
        }
    }

    protected void LoadProjectDoc(string strUserCode, string strTarget)
    {
        string strRelatedType, strRelatedID;
        int intIndex;

        TreeNode node = new TreeNode();
        TreeNode parentNode = new TreeNode();

        LB_FindCondition1.Text = "";

        intIndex = strTarget.IndexOf("_");

        strRelatedType = strTarget.Substring(0, intIndex);
        strRelatedID = strTarget.Substring(intIndex + 1, strTarget.Length - intIndex - 1);

        if (strRelatedID != "0")
        {
            LoadProjectDoc(strUserCode, strRelatedType, strRelatedID);
        }
        else
        {
            if (strRelatedID == "0")
            {
                LoadProjectDocByType(strUserCode, strRelatedType, strRelatedID, strProjectID);
            }

            if (strTarget == "Project_0")
            {
                LoadAllDocument(strUserCode);
            }
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUploadManName = TB_UploadManName.Text.Trim();
        string strDocName = TB_DocName.Text.Trim();
        string strDocType = DL_DocType.SelectedValue.Trim();

        strUploadManName = "%" + strUploadManName + "%";
        strDocName = "%" + strDocName + "%";
        strDocType = "%" + strDocType + "%";

        strHQL = LB_Sql.Text.Trim();

        strHQL += " and document.UploadManName like " + "'" + strUploadManName + "'";
        strHQL += " and document.DocName like " + "'" + strDocName + "'";
        strHQL += " and document.DocType Like " + "'" + strDocType + "'";
        strHQL += " and document.Status <> '删除' Order by document.DocID DESC";

        try
        {
            DocumentBLL documentBLL = new DocumentBLL();
            lst = documentBLL.GetAllDocuments(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LB_FindCondition2.Text = " 文件上传者包含：" + strUploadManName;
            LB_Count.Text = Resources.lang.CXDDWJS + ": " + lst.Count.ToString();
        }
        catch
        {
        }
    }

    protected void DL_DocType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDocType;

        strDocType = DL_DocType.SelectedValue.Trim();

        strHQL = LB_Sql.Text.Trim();

        strHQL += " and document.DocType = " + "'" + strDocType + "'" + " and document.Status <> '删除' Order by document.DocID DESC";
        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_FindCondition2.Text = " 文件类型：" + strDocType;
        LB_Count.Text = Resources.lang.CXDDWJS + ": " + lst.Count.ToString();
    }

    protected void LoadProjectDoc(string strUserCode, string strRelatedType, string strRelatedID)
    {
        string strHQL = "";
        IList lst;

        string strDepartCode, strDepartString;
        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);

        if (strRelatedType == "Project")
        {
            strRelatedType = "项目";
            strRelatedName = GetProjectName(strRelatedID);
        }

        if (strRelatedType == "ProjectPlan")
        {
            strRelatedType = "计划";
            strRelatedName = GetProjectPlanName(strRelatedID);
        }

        if (strRelatedType == "ProjectTask")
        {
            strRelatedType = "任务";
            strRelatedName = GetProjectTaskName(strRelatedID);
        }

        if (strRelatedType == "Risk")
        {
            strRelatedType = "风险";
            strRelatedName = GetRiskName(strRelatedID);
        }

        if (strRelatedType == "Req")
        {
            strRelatedType = "需求";
            strRelatedName = GetReqName(strRelatedID);
        }

        if (strRelatedType == "WorkFlow")
        {
            strRelatedType = "工作流";
            strRelatedName = ShareClass.GetWorkFlowName(strRelatedID);
        }

        if (strRelatedType == "Collaboration")
        {
            strRelatedType = "协作";
            strRelatedName = GetCollaborationName(strRelatedID);
        }

        if (strRelatedType == "Meeting")
        {
            strRelatedType = "会议";
            strRelatedName = GetMeetingName(strRelatedID);
        }

        if (strRelatedType == "CustomerQuestion")
        {
            strRelatedType = "客服";
            strRelatedName = GetCustomerQuestionName(strRelatedID);
        }

        if (strRelatedType == "项目")
        {
            strHQL = "from Document as document where ((document.RelatedType = '项目' and document.RelatedID = " + strRelatedID + ")";
            strHQL += " or (document.RelatedType = '需求' and document.RelatedID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = " + strRelatedID + "))";
            strHQL += " or (document.RelatedType = '风险' and document.RelatedID in (select projectRisk.ID from ProjectRisk as projectRisk where projectRisk.ProjectID = " + strRelatedID + "))";
            strHQL += " or (document.RelatedType = '任务' and document.RelatedID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID = " + strRelatedID + "))";
            strHQL += " or (document.RelatedType = '计划' and document.RelatedID in (select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = " + strRelatedID + "))";
            strHQL += " or (document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedID = " + strRelatedID + ")))";
        }

        if (strRelatedType == "计划")
        {
            strHQL = "from Document as document where ";
            strHQL += " document.RelatedType = '计划' and document.RelatedID = " + strRelatedID;
        }

        if (strRelatedType == "任务")
        {
            strHQL = "from Document as document where ";
            strHQL += " ((document.RelatedType = '任务' and document.RelatedID = " + strRelatedID + " )";
            strHQL += " or ( document.RelatedType = '计划' and document.RelatedID in ( Select projectTask.PlanID from ProjectTask as projectTask where projectTask.TaskID = " + strRelatedID + ")))";
        }

        if (strRelatedType == "风险")
        {
            strHQL = "from Document as document where ";
            strHQL += " ((document.RelatedType = '风险' and document.RelatedID = " + strRelatedID + ")";
            strHQL += " or (document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedType='风险' and meeting.RelatedID = " + strRelatedID + ")))";
        }

        if (strRelatedType == "需求")
        {
            strHQL = "from Document as document where ";
            strHQL += " ((document.RelatedType = '需求' and document.RelatedID = " + strRelatedID + ")";
            strHQL += " or (document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedType='需求' and meeting.RelatedID = " + strRelatedID + ")))";
        }

        if (strRelatedType == "工作流")
        {
            strHQL = "from Document as document where ";
            strHQL += " ((document.RelatedType = '工作流' and document.RelatedID = " + strRelatedID + ")"; ;
            strHQL += " or (document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedType='工作流' and meeting.RelatedID = " + strRelatedID + ")))";
        }

        if (strRelatedType == "协作")
        {
            strHQL = " from Document as document where document.RelatedType = '协作' and document.RelatedID = " + strRelatedID;
        }

        if (strRelatedType == "会议")
        {
            strHQL = " from Document as document where document.RelatedType = '会议' and document.RelatedID = " + strRelatedID;
        }

        if (strRelatedType == "客服")
        {
            strHQL = " from Document as document where document.RelatedType = '客服' and document.RelatedID = " + strRelatedID;
        }

        strHQL += " and document.DepartCode in " + strDepartString;

        LB_Sql.Text = strHQL;

        LoadDocTypeList(strHQL);

        strHQL += " and rtrim(ltrim(document.Status)) <> '删除' Order by document.DocID DESC";

        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Count.Text = Resources.lang.CXDDWJS + ": " + lst.Count.ToString();

        LB_FindCondition1.Text = Resources.lang.ChaXunFanWeiShi + ": " + strRelatedType + ":" + strRelatedID + " " + strRelatedName + " ";
        LB_FindCondition2.Text = "";
    }

    protected void LoadProjectDocByType(string strUserCode, string strRelatedType, string strRelatedID, string strProjectID)
    {
        string strHQL = "";
        IList lst;

        string strDepartCode, strDepartString;

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);

        if (strRelatedType == "Project")
        {
            strRelatedType = "项目";
        }

        if (strRelatedType == "ProjectPlan")
        {
            strRelatedType = "计划";
        }

        if (strRelatedType == "ProjectTask")
        {
            strRelatedType = "任务";
        }

        if (strRelatedType == "Risk")
        {
            strRelatedType = "风险";
        }

        if (strRelatedType == "Req")
        {
            strRelatedType = "需求";
        }

        if (strRelatedType == "WorkFlow")
        {
            strRelatedType = "工作流";
        }

        if (strRelatedType == "Collaboration")
        {
            strRelatedType = "协作";
        }

        if (strRelatedType == "Meeting")
        {
            strRelatedType = "会议";
        }

        if (strRelatedType == "CustomerQuestion")
        {
            strRelatedType = "客服";
        }

        if (strRelatedType == "项目")
        {
            strHQL = "from Document as document where ((document.RelatedType = '项目' and document.RelatedID = " + strRelatedID + ")";
            strHQL += " or (document.RelatedType = '需求' and document.RelatedID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = " + strRelatedID + "))";
            strHQL += " or (document.RelatedType = '风险' and document.RelatedID in (select projectRisk.ID from ProjectRisk as projectRisk where projectRisk.ProjectID = " + strRelatedID + "))";
            strHQL += " or (document.RelatedType = '任务' and document.RelatedID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID = " + strRelatedID + "))";
            strHQL += " or (document.RelatedType = '计划' and document.RelatedID in (select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = " + strRelatedID + "))";
            strHQL += " or (document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedID = " + strRelatedID + ")))";

        }

        if (strRelatedType == "计划")
        {
            strHQL = "from Document as document where ";
            strHQL += " document.RelatedType = '计划' and document.RelatedID in (Select workPlan.ID from WorkPlan as workPlan Where workPlan.ProjectID = " + strProjectID + ")";
        }

        if (strRelatedType == "任务")
        {
            strHQL = "from Document as document where ";
            strHQL += " ((document.RelatedType = '任务' and document.RelatedID  in (Select projectTask.TaskID From ProjectTask as projectTask Where projectTask.ProjectID = " + strProjectID + "))";
            strHQL += " or ( document.RelatedType = '计划' and document.RelatedID in ( Select projectTask.PlanID from ProjectTask as projectTask where projectTask.TaskID = " + strRelatedID + ")))";
        }

        if (strRelatedType == "风险")
        {
            strHQL = "from Document as document where ";
            strHQL += " ((document.RelatedType = '风险' and document.RelatedID  in (Select projectRisk.ID From ProjectRisk as projectRisk Where projectRisk.ProjectID = " + strProjectID + "))";
            strHQL += " or (document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedType='风险' and meeting.RelatedID = " + strRelatedID + ")))";
        }

        if (strRelatedType == "需求")
        {
            strHQL = "from Document as document where ";
            strHQL += " ((document.RelatedType = '需求' and document.RelatedID  in (Select relatedReq.ReqID From RelatedReq as relatedReq Where relatedReq.ProjectID = " + strProjectID + "))";
            strHQL += " or (document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedType='需求' and meeting.RelatedID = " + strRelatedID + ")))";
        }

        if (strRelatedType == "工作流")
        {
            strHQL = "from Document as document where ";
            strHQL += " ((document.RelatedType = '工作流' and document.RelatedID in (Select workFlow.WLID from WorkFlow as workFlow where workFlow.RelatedType = '项目' and workFlow.RelatedID = " + strProjectID + "))";
            strHQL += " or (document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedType='工作流' and meeting.RelatedID = " + strRelatedID + ")))";
        }

        if (strRelatedType == "会议")
        {
            strHQL = " from Document as document where document.RelatedType = '会议' and document.RelatedID  in (Select meeting.ID from Meeting as meeting where meeting.RelatedType = '项目' and meeting.RelatedID = " + strProjectID + ")";
        }

        if (strRelatedType == "协作")
        {
            strHQL = " from Document as document where document.RelatedType = '协作' and document.RelatedID = " + strRelatedID;
        }

        if (strRelatedType == "客服")
        {
            strHQL = " from Document as document where document.RelatedType = '客服' and document.RelatedID = " + strRelatedID;
        }

        strHQL += " and document.DepartCode in " + strDepartString;

        LB_Sql.Text = strHQL;

        LoadDocTypeList(strHQL);

        strHQL += " and rtrim(ltrim(document.Status)) <> '删除' Order by document.DocID DESC";

        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Count.Text = Resources.lang.CXDDWJS + ": " + lst.Count.ToString();

        LB_FindCondition1.Text = Resources.lang.ChaXunFanWeiShi + ": " + strRelatedType + ":" + strRelatedID + " " + strRelatedName + " ";
        LB_FindCondition2.Text = "";
    }

    protected void LoadAllDocument(string strUserCode)
    {
        string strHQL;
        IList lst;

        string strDepartCode, strDepartString;

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);

        strHQL = "from Document as document where document.Status <> '删除'";
        strHQL += " and document.DepartCode in " + strDepartString;

        LB_Sql.Text = strHQL;

        LoadDocTypeList(strHQL);

        strHQL += "  Order by document.DocID DESC";
        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Count.Text = Resources.lang.CXDDWJS + ": " + lst.Count.ToString();

        LB_FindCondition1.Text = Resources.lang.CXFWXMSY;
        LB_FindCondition2.Text = "";
    }

    protected void LoadDocTypeList(string strHQL)
    {
        string strHQL1;
        IList lst;

        strHQL1 = "from DocType as docType where docType.Type in ( Select document.DocType  " + strHQL + ")" + " Order by docType.SortNumber ASC";
        DocTypeBLL docTypeBLL = new DocTypeBLL();
        lst = docTypeBLL.GetAllDocTypes(strHQL1);

        DL_DocType.DataSource = lst;
        DL_DocType.DataBind();

        DL_DocType.Items.Add(new ListItem("", ""));
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DocumentBLL documentBLL = new DocumentBLL();
        IList lst = documentBLL.GetAllDocuments(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected string GetDocTypeCreator(string strDocTypeID)
    {
        string strHQL = "from DocType as docType where docType.ID = " + strDocTypeID;
        DocTypeBLL docTypeBLL = new DocTypeBLL();

        IList lst = docTypeBLL.GetAllDocTypes(strHQL);

        DocType docType = (DocType)lst[0];

        return docType.UserCode.Trim();
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

    protected string GetProjectPlanName(string strPlanID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkPlan as workPlan where workPlan.ID = " + strPlanID;
        WorkPlanBLL workPlanBLL = new WorkPlanBLL();
        WorkPlan workPlan = new WorkPlan();
        lst = workPlanBLL.GetAllWorkPlans(strHQL);
        workPlan = (WorkPlan)lst[0];

        return workPlan.Name.Trim();
    }

    protected string GetProjectTaskName(string strTaskID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectTask as projectTask where projectTask.TaskID = " + strTaskID;
        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        ProjectTask projectTask = new ProjectTask();
        lst = projectTaskBLL.GetAllProjectTasks(strHQL);
        projectTask = (ProjectTask)lst[0];

        return projectTask.Task.Trim();
    }

    protected string GetRiskName(string strRiskID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectRisk as projectRisk where projectRisk.ID = " + strRiskID;
        ProjectRiskBLL projectRiskBLL = new ProjectRiskBLL();
        lst = projectRiskBLL.GetAllProjectRisks(strHQL);
        ProjectRisk projectRisk = (ProjectRisk)lst[0];

        return projectRisk.Risk.Trim();
    }

    protected string GetReqName(string strReqID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Requirement as requirement where requirement.ReqID = " + strReqID;
        RequirementBLL requirementBLL = new RequirementBLL();
        lst = requirementBLL.GetAllRequirements(strHQL);
        Requirement requirement = (Requirement)lst[0];

        return requirement.ReqName.Trim();
    }


    protected string GetCollaborationName(string strCoID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Collaboration as collaboration where collaboration.CoID = " + strCoID;
        CollaborationBLL collaborationBLL = new CollaborationBLL();
        lst = collaborationBLL.GetAllCollaborations(strHQL);

        Collaboration collaboration = (Collaboration)lst[0];

        return collaboration.CollaborationName.Trim();
    }

    protected string GetMeetingName(string strMeetingID)
    {
        string strHQL = "from Meeting as meeting where meeting.ID = " + strMeetingID;
        MeetingBLL meetingBLL = new MeetingBLL();
        IList lst = meetingBLL.GetAllMeetings(strHQL);
        Meeting meeting = (Meeting)lst[0];

        string strMeetingName = meeting.Name.Trim();

        return strMeetingName;
    }

    protected string GetCustomerQuestionName(string strQuestionID)
    {
        string strHQL;
        IList lst;

        strHQL = "from CustomerQuestion as customerQuestion where customerQuestion.ID = " + strQuestionID;
        CustomerQuestionBLL customerQuestionBLL = new CustomerQuestionBLL();
        lst = customerQuestionBLL.GetAllCustomerQuestions(strHQL);

        CustomerQuestion customerQuestion = (CustomerQuestion)lst[0];

        return customerQuestion.Question.Trim();
    }

}
