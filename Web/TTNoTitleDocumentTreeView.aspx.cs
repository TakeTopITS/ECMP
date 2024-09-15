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

public partial class TTNoTitleDocumentTreeView : System.Web.UI.Page
{

    string strRelatedType, strRelatedID, strRelatedName, strProjectID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL = "";
        IList lst;

        string strUserCode = Session["UserCode"].ToString();
        string strDepartCode = GetDepartCode(strUserCode);
        LB_UserCode.Text = strUserCode;

        strRelatedType = Request.QueryString["RelatedType"].Trim();
        strRelatedID = Request.QueryString["RelatedID"];
        strProjectID = strRelatedID;

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

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack != true)
        {
            if (strRelatedType == "项目")
            {
                strHQL = "from Document as document where ";
                strHQL += " ((document.RelatedType = '项目' and document.RelatedID = " + strProjectID + ")";
                strHQL += " or (document.RelatedType = '需求' and document.RelatedID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = " + strProjectID + "))";
                strHQL += " or (document.RelatedType = '风险' and document.RelatedID in (select projectRisk.ID from ProjectRisk as projectRisk where projectRisk.ProjectID = " + strProjectID + "))";
                strHQL += " or (document.RelatedType = '任务' and document.RelatedID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID = " + strProjectID + "))";
                strHQL += " or (document.RelatedType = '计划' and document.RelatedID in (select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + "))";
                strHQL += " or (document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedID = " + strProjectID + ")))";

            }

            if (strRelatedType == "计划")
            {
                strHQL = "from Document as document where ";
                strHQL += " (document.RelatedType = '计划' and document.RelatedID = " + strRelatedID;
                strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
                strHQL += " or (document.Visible in ( '部门','全体'))))";
            }

            if (strRelatedType == "任务")
            {
                strHQL = "from Document as document where ";
                strHQL += " (((document.RelatedType = '任务' and document.RelatedID = " + strRelatedID + " )";
                strHQL += " or ( document.RelatedType = '计划' and document.RelatedID in ( Select projectTask.PlanID from ProjectTask as projectTask where projectTask.TaskID = " + strRelatedID + ")))";
                strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
                strHQL += " or (document.Visible in ( '部门','全体'))))";
            }

            if (strRelatedType == "风险")
            {
                strHQL = "from Document as document where ";
                strHQL += " ((document.RelatedType = '风险' and document.RelatedID = " + strRelatedID;
                strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
                strHQL += " or (document.Visible = '部门' and document.DepartCode = " + "'" + strDepartCode + "'" + " )";
                strHQL += " or ( document.Visible = '全体'))) ";
                strHQL += " or ((document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedType='风险' and meeting.RelatedID = " + strRelatedID + "))";
                strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
                strHQL += " or ( document.Visible = '会议'))))";
            }

            if (strRelatedType == "需求")
            {
                strHQL = "from Document as document where ";
                strHQL += " ((document.RelatedType = '需求' and document.RelatedID = " + strRelatedID;
                strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
                strHQL += " or (document.Visible = '部门' and document.DepartCode = " + "'" + strDepartCode + "'" + " )";
                strHQL += " or ( document.Visible = '全体'))) ";
                strHQL += " or ((document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedType='需求' and meeting.RelatedID = " + strRelatedID + "))";
                strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
                strHQL += " or ( document.Visible = '会议'))))";
            }

            if (strRelatedType == "工作流")
            {
                strHQL = "from Document as document where document.Status <> '删除' ";
                strHQL += " and (document.RelatedType = '工作流' and document.RelatedID = " + strRelatedID;
                strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
                strHQL += " or (document.Visible = '部门' and document.DepartCode = " + "'" + strDepartCode + "'" + " )";
                strHQL += " or ( document.Visible = '全体'))) ";
                strHQL += " or ((document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedType='工作流' and meeting.RelatedID = " + strRelatedID + "))";
                strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
                strHQL += " or ( document.Visible = '会议')))";
            }

            if (strRelatedType == "协作")
            {
                strHQL = " from Document as document where document.RelatedType = '协作' and document.RelatedID = " + strRelatedID;
                strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
                strHQL += " or (document.Visible = '全体' and document.RelatedID in (select collaborationMember.CoID from CollaborationMember as collaborationMember where collaborationMember.UserCode = " + "'" + strUserCode + "'" + " )))";
            }

            if (strRelatedType == "会议")
            {
                strHQL = " from Document as document where document.RelatedType = '会议' and document.RelatedID = " + strRelatedID;
                strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
                strHQL += " or (document.Visible = '会议' and document.RelatedID in (select meetingAttendant.MeetingID from MeetingAttendant as meetingAttendant where meetingAttendant.UserCode = " + "'" + strUserCode + "'" + " )))";
            }

            if (strRelatedType == "客服")
            {
                strHQL = " from Document as document where document.RelatedType = '客服' and document.RelatedID = " + strRelatedID;
                strHQL += " and (document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";

            }

            LB_Sql.Text = strHQL;

            strHQL += " and rtrim(ltrim(document.Status)) <> '删除' Order by document.DocID DESC";

            DocumentBLL documentBLL = new DocumentBLL();
            lst = documentBLL.GetAllDocuments(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LB_Count.Text = Resources.lang.CXDDWJS + ": " + lst.Count.ToString();

            LB_FindCondition.Text = Resources.lang.CXFWWJLXSY;

            InitialProTree();

            //必传没传的文档
            if (strRelatedType == "项目")
            {
                strHQL = string.Format(@"select t1.* FROM  t_documentForProjectPlanTemplate t1
                    where t1.RelatedType='计划' and t1.Status<> '删除' and t1.RelatedID in (Select ID From T_ImplePlan Where ProjectID = {0})
			        and t1.DocName Not in (Select t2.MustUploadDoc From T_Document t2 Where t2.RelatedType='计划' and t2.Status<> '删除' and t2.RelatedID in (Select ID From T_ImplePlan Where ProjectID = {0})
			    )", strProjectID);
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Document");
                DataGrid2.DataSource = ds;
                DataGrid2.DataBind();

                LB_UnUploadMustDocCount.Text = Resources.lang.CXDDWJS + ": " + ds.Tables[0].Rows.Count.ToString();

                TR_UnUploadForMustDocList.Visible = true;
            }
            else
            {
                TR_UnUploadForMustDocList.Visible = false;
            }

        }
    }

    protected void InitialProTree()
    {
        string strHQL, strUserCode, strDocTypeID, strTotalDocType = "", strDocType, strDepartCode;
        IList lst;

        //添加根节点
        TreeView1.Nodes.Clear();

        TreeNode node1 = new TreeNode();
        TreeNode node3 = new TreeNode();

        node1.Text = strRelatedType + "：" + strRelatedID + " " + strRelatedName + " 文档列表";
        node1.Target = "0";
        node1.Expanded = true;
        TreeView1.Nodes.Add(node1);

        strUserCode = LB_UserCode.Text.Trim();
        strDepartCode = GetDepartCode(strUserCode);

        if (strRelatedType == "项目")
        {
            strHQL = "from DocTypeFilter as docTypeFilter where docTypeFilter.DocType in (";
            strHQL += " Select distinct document.DocType from Document as document where  ((";
            strHQL += " (document.RelatedType = '项目' and document.RelatedID = " + strProjectID + ")";
            strHQL += " or (document.RelatedType = '需求' and document.RelatedID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = " + strProjectID + "))";
            strHQL += " or (document.RelatedType = '风险' and document.RelatedID in (select projectRisk.ID from ProjectRisk as projectRisk where projectRisk.ProjectID = " + strProjectID + "))";
            strHQL += " or (document.RelatedType = '任务' and document.RelatedID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID = " + strProjectID + "))";
            strHQL += " or (document.RelatedType = '计划' and document.RelatedID in (select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + "))";
            strHQL += " or (document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedType='项目' and  meeting.RelatedID = " + strProjectID + "))";
            strHQL += " )";
            strHQL += " and rtrim(ltrim(document.Status)) <> '删除' ))";
        }
        else
        {
            strHQL = "from DocTypeFilter as docTypeFilter where docTypeFilter.RelatedType = " + "'" + strRelatedType + "'" + " and docTypeFilter.RelatedID = " + strRelatedID;
        }

        DocTypeFilterBLL docTypeFilterBLL = new DocTypeFilterBLL();
        DocTypeFilter docTypeFilter = new DocTypeFilter();

        lst = docTypeFilterBLL.GetAllDocTypeFilters(strHQL);

        for (int i = 0; i < lst.Count; i++)
        {
            docTypeFilter = (DocTypeFilter)lst[i];

            strDocTypeID = docTypeFilter.DocTypeID.ToString();

            strDocType = docTypeFilter.DocType.Trim();

            if (strTotalDocType.IndexOf(strDocType) <= -1)
            {
                strTotalDocType += strDocType + ",";

                node3 = new TreeNode();

                node3.Text = docTypeFilter.DocTypeID.ToString().Trim() + "." + strDocType;
                node3.Target = strDocTypeID;
                node3.Expanded = false;

                node1.ChildNodes.Add(node3);
                TreeView1.DataBind();
            }
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDocTypeID, strHQL, strUserCode, strDepartCode, strDocType;
        IList lst1, lst2;

        strUserCode = LB_UserCode.Text.Trim();
        strDepartCode = GetDepartCode(strUserCode);

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        strDocTypeID = treeNode.Target.Trim();

        DocTypeBLL docTypeBLL = new DocTypeBLL();
        strHQL = "from DocType as docType where docType.ID = " + strDocTypeID;
        lst1 = docTypeBLL.GetAllDocTypes(strHQL);

        DocumentBLL documentBLL = new DocumentBLL();
        strHQL = LB_Sql.Text.Trim();

        if (strDocTypeID != "0")
        {
            if (lst1.Count > 0)
            {
                DocType docType = (DocType)lst1[0];
                strDocType = docType.Type.Trim();

                strHQL += " and document.DocType = " + "'" + strDocType + "'" + " and document.Status <> '删除' Order by document.DocID DESC";

                lst2 = documentBLL.GetAllDocuments(strHQL);
                DataGrid1.DataSource = lst2;
                DataGrid1.DataBind();

                LB_FindCondition.Text = Resources.lang.CXFWWJLX + strDocType;

                LB_Count.Text = Resources.lang.CXDDWJS + ": " + lst2.Count.ToString();
            }
        }
        else
        {
            strHQL += "  and document.Status <> '删除' Order by document.DocID DESC";

            lst2 = documentBLL.GetAllDocuments(strHQL);
            DataGrid1.DataSource = lst2;
            DataGrid1.DataBind();

            LB_FindCondition.Text = Resources.lang.CXFWWJLXSY;

            LB_Count.Text = Resources.lang.CXDDWJS + ": " + lst2.Count.ToString();
        }

    }

    //取得必传文件名
    public string GetMustBeUploadDoc(string strDocID)
    {
        string strHQL;

        strHQL = string.Format(@"Select MustUploadDoc From T_Document Where DocID = {0}", strDocID);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Document");

        return ds.Tables[0].Rows[0][0].ToString().Trim();
    }

    public int GetNotPlanTemplatedDocumentNotInDocumentCount(string strPlanID)
    {
        string strHQL;

        strHQL = string.Format(@"select * FROM   
            t_documentForProjectPlanTemplate
	
	        where DocName Not in (

            SELECT   
                DocName
            FROM   
                t_documentForProjectPlanTemplate t2  
            WHERE   
                EXISTS (  
                    SELECT 1  
                    FROM T_Document t1  
                    WHERE  RelatedType='计划' and RelatedID = {0}  and Status<> '删除' and find_longest_common_substring(t2.DocName, t1.DocName) IS NOT NULL  
                ) and RelatedType='计划' and RelatedID = {0} and Status<> '删除')", strPlanID);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Document");

        return ds.Tables[0].Rows.Count;
    }


    public string GetNotPlanTemplatedDocumentNotInDocumentList(string strPlanID)
    {
        string strHQL;
        string strDocNameListString = "<br/>";

        strHQL = string.Format(@"select DocName FROM   
            t_documentForProjectPlanTemplate
	
	        where DocName Not in (

            SELECT   
                DocName
            FROM   
                t_documentForProjectPlanTemplate t2  
            WHERE   
                EXISTS (  
                    SELECT 1  
                    FROM T_Document t1  
                    WHERE  RelatedType='计划' and RelatedID = {0} and Status<> '删除' and find_longest_common_substring(t2.DocName, t1.DocName) IS NOT NULL  
                ) and RelatedType='计划' and RelatedID = {0}  and Status<> '删除')", strPlanID);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Document");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            strDocNameListString += ds.Tables[0].Rows[0]["DocName"].ToString() + "<br/> ";
        }

        strDocNameListString = strDocNameListString.Trim();
        if (strDocNameListString.Length > 0)
        {
            strDocNameListString = strDocNameListString.Substring(0, strDocNameListString.Length - 5);
        }

        return strDocNameListString;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;
        LogClass.WriteLogFile(strHQL);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Document");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected string GetDepartCode(string strUserCode)
    {
        string strDepartCode, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strDepartCode = projectMember.DepartCode.Trim();
        return strDepartCode;
    }


    protected string GetUserName(string strUserCode)
    {
        string strUserName, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strUserName = projectMember.UserName.Trim();
        return strUserName.Trim();
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
