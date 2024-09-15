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

public partial class TTDocumentTreeView : System.Web.UI.Page
{
    string strRelatedType, strRelatedID, strRelatedName, strProjectID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL = "";
        IList lst;

        string strUserCode = Session["UserCode"].ToString();
        string strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        LB_UserCode.Text = strUserCode;

        strRelatedType = Request.QueryString["RelatedType"].Trim();
        strRelatedID = Request.QueryString["RelatedID"];
        strProjectID = strRelatedID;

        if (strRelatedType == "Project")
        {
            strRelatedType = "项目";
            strRelatedName = ShareClass.GetProjectName(strRelatedID);

            //列出模板要求完成没见完成的文档
            LoadNotFinishedProjectDocument(ShareClass.GetProject(strProjectID).ProjectType.Trim());
        }

        if (strRelatedType == "ProjectPlan")
        {
            strRelatedType = "计划";
            strRelatedName = GetProjectPlanName(strRelatedID);

            if (ShareClass.CheckUserCanViewProjectPlan(strRelatedID, strUserCode) == false)
            {
                Response.Redirect("TTDisplayCustomErrorMessage.aspx?ErrorMsg='" + Resources.lang.ZZJGZYXMJLJHYJHCJRHLXZJHFZRCNJXZCZQJC + "'");
            }
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

        if (strRelatedType == "Defect")
        {
            strRelatedType = "缺陷";
            strRelatedName = GetDefectName(strRelatedID);
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

        if (strRelatedType == "LargePlan")
        {
            strRelatedType = "大计划";
            strRelatedName = GetPlanName(strRelatedID);
        }

        if (strRelatedType == "BOM")
        {
            strRelatedType = "物料";
            string strRelatedItemCode = Request.QueryString["RelatedItemCode"].Trim();
            strRelatedID = GetItemBomVersionBomID(strRelatedItemCode, strRelatedID);
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack != true)
        {
            if (strRelatedType == "项目")
            {
                string strPMCode = ShareClass.GetProject(strProjectID).PMCode.Trim();
                string strCreatorCode = ShareClass.GetProject(strProjectID).UserCode.Trim();

                if (strUserCode == strPMCode | strUserCode == strCreatorCode)
                {
                    strHQL = string.Format(@"from Document as document where ((document.RelatedType = '项目' and document.RelatedID = {0} ))
                   or (((document.RelatedType = '需求' and document.RelatedID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = {0}))
                   or (document.RelatedType = '工作流' and document.RelatedID in (Select workFlow.WLID From WorkFlow as workFlow Where workFlow.RelatedType = '项目' and workFlow.RelatedID = {0}))
                   or (document.RelatedType = '风险' and document.RelatedID in (select projectRisk.ID from ProjectRisk as projectRisk where projectRisk.ProjectID = {0}))
                   or (document.RelatedType = '任务' and document.RelatedID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID = {0}))
                   or (document.RelatedType = '计划' and document.RelatedID in (select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = {0}))
                   or (document.RelatedType = '工作流' and document.RelatedID in (Select workFlow.WLID From WorkFlow as workFlow Where workFlow.RelatedType = '计划' and workFlow.RelatedID in (select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = {0})))
                   or (document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedID = {0}))
                   ))
                   and rtrim(ltrim(document.Status)) <> '删除'", strProjectID, strUserCode, strDepartCode);
                }
                else
                {
                    strHQL = "from Document as document where (((document.RelatedType = '项目' and document.RelatedID = " + strProjectID + ")";
                    strHQL += " and (((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
                    strHQL += " or (document.Visible in ( '部门','全体')))";
                    strHQL += " or (document.Visible in (select actorGroupDetail.GroupName from ActorGroupDetail as actorGroupDetail where actorGroupDetail.UserCode = " + "'" + strUserCode + "'" + " ))))";

                    strHQL += " or (document.RelatedType = '需求' and document.RelatedID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = " + strProjectID + "))";

                    strHQL += " or (document.RelatedType = '工作流' and document.RelatedID in (Select workFlow.WLID From WorkFlow as workFlow Where workFlow.RelatedType = '项目' and workFlow.RelatedID = " + strProjectID + "))";
                    strHQL += " or (document.RelatedType = '工作流' and document.RelatedID in (Select workFlowBackup.WLID From WorkFlowBackup as workFlowBackup Where workFlowBackup.RelatedType = '项目' and workFlowBackup.RelatedID = " + strProjectID + "))";

                    strHQL += " or (document.RelatedType = '风险' and document.RelatedID in (select projectRisk.ID from ProjectRisk as projectRisk where projectRisk.ProjectID = " + strProjectID + "))";
                    strHQL += " or (document.RelatedType = '任务' and document.RelatedID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID = " + strProjectID + "))";

                    strHQL += " or (document.RelatedType = '计划' and document.RelatedID in (select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + "))";
                    strHQL += " or (document.RelatedType = '工作流' and document.RelatedID in (Select workFlow.WLID From WorkFlow as workFlow Where workFlow.RelatedType = '计划' and workFlow.RelatedID in (select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + ")))";
                    strHQL += " or (document.RelatedType = '工作流' and document.RelatedID in (Select workFlowBackup.WLID From WorkFlowBackup as workFlowBackup Where workFlowBackup.RelatedType = '计划' and workFlowBackup.RelatedID in (select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + ")))";

                    strHQL += " or (document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedID = " + strProjectID + "))";
                    strHQL += " and ((document.Visible in ('会议','部门') and document.DepartCode = " + "'" + strDepartCode + "'" + " ) ";
                    strHQL += " or (document.Visible = '全体' )))";
                }
            }

            if (strRelatedType == "计划")
            {
                strHQL = "from Document as document where ";
                strHQL += " (document.RelatedType = '计划' and document.RelatedID = " + strRelatedID;
                strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
                strHQL += " or (document.Visible in (select actorGroupDetail.GroupName from ActorGroupDetail as actorGroupDetail where actorGroupDetail.UserCode = " + "'" + strUserCode + "'" + " ))";
                strHQL += " or (document.Visible in ( '部门','全体'))))";
            }

            if (strRelatedType == "任务")
            {
                strHQL = "from Document as document where ";
                strHQL += " (((document.RelatedType = '任务' and document.RelatedID = " + strRelatedID + " )";
                strHQL += " or ( document.RelatedType = '计划' and document.RelatedID in ( Select projectTask.PlanID from ProjectTask as projectTask where projectTask.TaskID = " + strRelatedID + ")))";
                strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
                strHQL += " or (document.Visible in (select actorGroupDetail.GroupName from ActorGroupDetail as actorGroupDetail where actorGroupDetail.UserCode = " + "'" + strUserCode + "'" + " ))";
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

            if (strRelatedType == "缺陷")
            {
                strHQL = "from Document as document where ";
                strHQL += " ((document.RelatedType = '缺陷' and document.RelatedID = " + strRelatedID;
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

            if (strRelatedType == "大计划")
            {
                strHQL = " from Document as document where document.RelatedType = '大计划' and document.RelatedID = " + strRelatedID;
                strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
                strHQL += " or (document.Visible = '全体' and document.RelatedID in (select planRelatedLeader.PlanID from PlanRelatedLeader as planRelatedLeader where planRelatedLeader.LeaderCode = " + "'" + strUserCode + "'" + ")))";
            }

            if (strRelatedType == "物料")
            {
                strHQL = " from Document as document where document.RelatedType = '物料' and document.RelatedID = " + strRelatedID;
                strHQL += " and (document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";

            }
            strHQL += " and rtrim(ltrim(document.Status)) <> '删除' ";

            LB_Sql.Text = strHQL;

            strHQL += "  Order by document.DocID DESC";

            DocumentBLL documentBLL = new DocumentBLL();
            lst = documentBLL.GetAllDocuments(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LB_Count.Text = Resources.lang.CXDDWJS + ": " + lst.Count.ToString();

            LB_FindCondition.Text = Resources.lang.CXFWWJLXSY;

            InitialProjectDocTypeTree();
        }
    }

    //列出没有完成的项目文档模板
    protected void LoadNotFinishedProjectDocument(string strProjectType)
    {
        string strHQL;

        //string strUserCode, strDepartCode;

        //strUserCode = HttpContext.Current.Session["UserCode"].ToString();
        //strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        //strHQL = string.Format(@"Select * From T_Document Where RelatedType = 'ProjectType' and RelatedName = '{3}' and rtrim(ltrim(Status)) <> '删除' 
        //            and DocName NOT IN (Select D.DocName From (select distinct B.DocID, B.DocName From  (Select DocID,  DocName  from T_Document as document where ((document.RelatedType = '项目' and document.RelatedID = {0}))
        //                or (((document.RelatedType = '需求' and document.RelatedID in (select relatedReq.ReqID from T_RelatedReq as relatedReq where relatedReq.ProjectID = {0}))
        //                or (document.RelatedType = '工作流' and document.RelatedID in (Select workFlow.WLID From T_WorkFlow as workFlow Where workFlow.RelatedType = '项目' and workFlow.RelatedID = {0}))
        //                or (document.RelatedType = '风险' and document.RelatedID in (select projectRisk.ID from T_ProjectRisk as projectRisk where projectRisk.ProjectID = {0}))
        //                or (document.RelatedType = '任务' and document.RelatedID in (select projectTask.TaskID from T_ProjectTask as projectTask where projectTask.ProjectID = {0}))
        //                or (document.RelatedType = '计划' and document.RelatedID in (select workPlan.ID From T_ImplePlan as workPlan where workPlan.ProjectID = {0}))
        //                or (document.RelatedType = '工作流' and document.RelatedID in (Select workFlow.WLID From T_WorkFlow as workFlow Where workFlow.RelatedType = '计划' and workFlow.RelatedID in (select workPlan.ID From T_ImplePlan as workPlan where workPlan.ProjectID = {0})))
        //                or (document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from T_Meeting as meeting where meeting.RelatedID = {0}))
        //                ))
        //                and rtrim(ltrim(document.Status)) <> '删除') A, (Select DocID, DocName From T_Document Where RelatedType = 'ProjectType' and RelatedName = '{3}' and rtrim(ltrim(Status)) <> '删除') B
        //             Where A.DocName  Like '%' || B.DocName || '%') D)", strProjectID, strUserCode, strDepartCode, strProjectType);

   
        strHQL = string.Format(@"select * FROM   
            t_documentForProjectPlanTemplate

         where DocName  in (

            SELECT   
                DocName
            FROM   
                t_documentForProjectPlanTemplate t2  
            WHERE   
                EXISTS (  
                    SELECT 1  
                    FROM T_Document t1  
                    WHERE  RelatedType='计划' and RelatedID = {0} and Status<>  '删除' and find_longest_common_substring(t2.DocName, t1.DocName) IS NOT NULL  
                ) and RelatedType='计划' and Status<> '删除' and RelatedID in (Select ID From T_ImplePlan Where ProjectID = {0}))", strProjectID);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Document");


        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
    }

    protected void InitialProjectDocTypeTree()
    {
        string strHQL, strUserCode, strDocTypeID, strTotalDocType = "", strDocType, strDepartCode;
        IList lst;

        //添加根节点
        TreeView1.Nodes.Clear();

        TreeNode node1 = new TreeNode();
        TreeNode node3 = new TreeNode();

        node1.Text = "<B>" + strRelatedType + "：" + strRelatedID + " " + strRelatedName + " 文档列表</B>";
        node1.Target = "0";
        node1.Expanded = true;
        TreeView1.Nodes.Add(node1);

        strUserCode = LB_UserCode.Text.Trim();
        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        if (strRelatedType == "项目")
        {
            strHQL = "from DocTypeFilter as docTypeFilter where docTypeFilter.DocTypeID In (Select document.DocTypeID from Document as document where (((document.RelatedType = '项目' and document.RelatedID = " + strProjectID + ")";
            strHQL += " and (((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
            strHQL += " or (document.Visible in ( '部门','全体')))";
            strHQL += " or (document.Visible in (select actorGroupDetail.GroupName from ActorGroupDetail as actorGroupDetail where actorGroupDetail.UserCode = " + "'" + strUserCode + "'" + " ))))";

            strHQL += " or (document.RelatedType = '需求' and document.RelatedID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = " + strProjectID + "))";

            strHQL += " or (document.RelatedType = '工作流' and document.RelatedID in (Select workFlow.WLID From WorkFlow as workFlow Where workFlow.RelatedType = '项目' and workFlow.RelatedID = " + strProjectID + "))";
            strHQL += " or (document.RelatedType = '工作流' and document.RelatedID in (Select workFlowBackup.WLID From WorkFlowBackup as workFlowBackup Where workFlowBackup.RelatedType = '项目' and workFlowBackup.RelatedID = " + strProjectID + "))";

            strHQL += " or (document.RelatedType = '风险' and document.RelatedID in (select projectRisk.ID from ProjectRisk as projectRisk where projectRisk.ProjectID = " + strProjectID + "))";
            strHQL += " or (document.RelatedType = '任务' and document.RelatedID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID = " + strProjectID + "))";

            strHQL += " or (document.RelatedType = '计划' and document.RelatedID in (select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + "))";
            strHQL += " or (document.RelatedType = '工作流' and document.RelatedID in (Select workFlow.WLID From WorkFlow as workFlow Where workFlow.RelatedType = '计划' and workFlow.RelatedID in (select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + ")))";
            strHQL += " or (document.RelatedType = '工作流' and document.RelatedID in (Select workFlowBackup.WLID From WorkFlowBackup as workFlowBackup Where workFlowBackup.RelatedType = '计划' and workFlowBackup.RelatedID in (select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + ")))";

            strHQL += " or (document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedID = " + strProjectID + "))";
            strHQL += " and ((document.Visible in ('会议','部门') and document.DepartCode = " + "'" + strDepartCode + "'" + " ) ";
            strHQL += " or (document.Visible = '全体' ))))";
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
        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

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

                ////设置缺省的文件类型
                //ShareClass.SetDefaultDocType(strDocType, LB_DocTypeID, TB_DocType);
                ////按文件类型设置缺省的工作流模板树
                //ShareClass.SetDefaultWorkflowTemplate(strDocType, DL_TemName);
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

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DocumentBLL documentBLL = new DocumentBLL();
        IList lst = documentBLL.GetAllDocuments(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }


    public string GetNotPlanTemplatedDocumentNotInDocumentList(string strPlanID)
    {
        string strHQL;
        string strDocNameListString = "";

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
                    WHERE  RelatedType='计划' and RelatedID = {0} and find_longest_common_substring(t2.DocName, t1.DocName) IS NOT NULL  
                ) and RelatedType='计划' and RelatedID = {0})", strPlanID);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Document");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            strDocNameListString += ds.Tables[0].Rows[0]["DocName"].ToString() + "， ";
        }

        return strDocNameListString;
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

    protected string GetDefectName(string strDefectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Defectment as defectment where defectment.DefectID = " + strDefectID;
        DefectmentBLL defectmentBLL = new DefectmentBLL();
        lst = defectmentBLL.GetAllDefectments(strHQL);
        Defectment defectment = (Defectment)lst[0];

        return defectment.DefectName.Trim();
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

    protected string GetPlanName(string strPlanID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Plan as plan where plan.PlanID = " + strPlanID;
        PlanBLL planBLL = new PlanBLL();
        lst = planBLL.GetAllPlans(strHQL);

        Plan plan = (Plan)lst[0];

        return plan.PlanName.Trim();
    }

    protected string GetItemBomVersionBomID(string strItemCode, string strVerID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ItemBomVersion as itemBomVersion where itemBomVersion.ItemCode = " + "'" + strItemCode + "'" + " and itemBomVersion.VerID = " + strVerID;
        ItemBomVersionBLL itemBomVersionBLL = new ItemBomVersionBLL();
        lst = itemBomVersionBLL.GetAllItemBomVersions(strHQL);
        if (lst.Count > 0)
        {
            ItemBomVersion itemBomVersion = (ItemBomVersion)lst[0];
            return itemBomVersion.ID.ToString();
        }
        else
        {
            return "0";
        }
    }
}
