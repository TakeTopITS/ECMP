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

public partial class TTReqDetailThirdPart : System.Web.UI.Page
{
    string strApplicantCode, strReqID, strReqName, strType;
    string strStatus, strReqDetail, strAcceptStandard, strUserCode, strUserName;
    string strAssignManCode;

    string strIsMobileDevice;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strID = Request.QueryString["ID"];
        string strHQL;
        IList lst;
        string strCreatorCode;

        //CKEditor初始化
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(HE_Operation);

        LB_ApproveID.Text = strID;
        LB_AssignID.Text = strID;

      strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.ID = " + strID;
        ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
        lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
        ReqAssignRecord reqAssignRecord = (ReqAssignRecord)lst[0];

        DataList2.DataSource = lst;
        DataList2.DataBind();

        strReqID = reqAssignRecord.ReqID.ToString();
        strAssignManCode = reqAssignRecord.AssignManCode.Trim();
        LB_RouteNumber.Text = reqAssignRecord.RouteNumber.ToString();

        Requirement requirement = GetAndLoadRequirement(strReqID);
        strReqName = requirement.ReqName.Trim();
        strApplicantCode = requirement.ApplicantCode.Trim();
        strReqDetail = requirement.ReqDetail.Trim();
        strAcceptStandard = requirement.AcceptStandard.Trim();
        strType = requirement.ReqType.Trim();
        strStatus = requirement.Status.Trim();
        strCreatorCode = requirement.ApplicantCode.Trim();

        TB_TransferProject.Text = strReqName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack != true)
        {
            if (strIsMobileDevice == "YES")
            {
                HT_Operation.Visible = true; HT_Operation.Toolbar = "";
            }
            else
            {
                 HE_Operation.Visible = true; 
            }

            DLC_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

     
            TB_Content.Text = reqAssignRecord.OperatorContent.Trim();


            strHQL = "from ActorGroup as actorGroup where actorGroup.GroupName ";
            strHQL += " in ( Select actorGroupDetail.GroupName from ActorGroupDetail as actorGroupDetail where actorGroupDetail.UserCode = " + "'" + strUserCode + "'" + ")";
            ActorGroupBLL actorGroupBLL = new ActorGroupBLL();
            lst = actorGroupBLL.GetAllActorGroups(strHQL);
            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            InitialPrjectTree();

            ShareClass.LoadMemberByUserCodeForDropDownList(strUserCode, DL_Member);

            HL_ReqRelatedDoc.NavigateUrl = "TTReqRelatedDoc.aspx?ReqID=" + strReqID;
            HL_ApproveRecord.NavigateUrl = "TTReqAssignRecord.aspx?Type=Req&RelatedID=" + strReqID;

            if (strUserCode == strCreatorCode)
            {
                BT_CloseReq.Enabled = true;
                BT_ActiveReq.Enabled = true;
            }

            if (strStatus == "关闭" || reqAssignRecord.Status.Trim() == "转项")
            {
                BT_Refuse.Enabled = false;
                BT_Approve.Enabled = false;
                BT_Assign.Enabled = false;
                BT_Activity.Enabled = false;
                BT_Finish.Enabled = false;
                BT_TBD.Enabled = false;

                //BT_TransferProject.Enabled = false;

                BT_CloseReq.Enabled = false;
                BT_ActiveReq.Enabled = false;
            }

            LoadChildRecord(strID);

            LB_Type.Text = requirement.ReqType.Trim();
            HL_ApproveRecord.NavigateUrl = "TTReqAssignRecord.aspx?ReqID=" + strReqID;
            HL_RelatedMeeting.NavigateUrl = "TTMakeReqMeeting.aspx?ReqID=" + strReqID;
        }
    }

    protected void BT_Approve_Click(object sender, EventArgs e)
    {
        string strHQL, strContent;
        string strID;

        strContent = TB_Content.Text.Trim();
        strUserCode = LB_UserCode.Text.Trim();

        TB_Content.Text = strContent;

        strID = LB_AssignID.Text.Trim();

        strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.ID = " + strID;
        ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
        IList lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
        ReqAssignRecord reqAssignRecord = (ReqAssignRecord)lst[0];
        reqAssignRecord.OperatorContent = TB_Content.Text.Trim();
        reqAssignRecord.Status = "受理";

        try
        {
            reqAssignRecordBLL.UpdateReqAssignRecord(reqAssignRecord, int.Parse(strID));
            LoadAssignRecord(strID);

            TB_Message.Text = strUserName + " 受理了你的需求: " + strReqID + " " + strReqName;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ChengGong + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSLSBJC + "')", true);
        }
    }

    protected void BT_Refuse_Click(object sender, EventArgs e)
    {
        string strHQL, strContent;
        string strID;

        strUserCode = LB_UserCode.Text.Trim();
        strContent = TB_Content.Text.Trim();


        TB_Content.Text = strContent;


        strID = LB_AssignID.Text.Trim();

        strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.ID = " + strID;
        ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
        IList lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
        ReqAssignRecord reqAssignRecord = (ReqAssignRecord)lst[0];
        reqAssignRecord.OperatorContent = TB_Content.Text.Trim();
        reqAssignRecord.Status = "拒绝";

        try
        {
            reqAssignRecordBLL.UpdateReqAssignRecord(reqAssignRecord, int.Parse(strID));
            LoadAssignRecord(strID);

            TB_Message.Text = strUserName + " 拒绝了你的需求: " + strReqID + " " + strReqName;
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ChengGong + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJJSBJC + "')", true);
        }
    }

    protected void BT_Assign_Click(object sender, EventArgs e)
    {
        Msg msg = new Msg();

        int intReqID, intPriorID;
        string strOperatorCode, strOperatorName, strAssignManCode, strAssignManName;
        string strContent, strOperation, strType;
        string strRouteNumber;
        DateTime dtBeginDate, dtEndDate, dtMakeDate;

        string strID = LB_AssignID.Text.Trim();
        strUserCode = LB_UserCode.Text.Trim();

        intReqID = int.Parse(strReqID);
        strType = LB_Type.Text.Trim();
        strOperatorCode = TB_ReceiverCode.Text.Trim();
        strOperatorName = ShareClass.GetUserName(strOperatorCode);
        strAssignManCode = LB_UserCode.Text.Trim();
        strAssignManName = LB_UserName.Text.Trim();

        if (strIsMobileDevice == "YES")
        {
            strOperation = HT_Operation.Text.Trim();
        }
        else
        {
            strOperation = HE_Operation.Text.Trim();
        }

        intPriorID = int.Parse(LB_AssignID.Text.Trim());
        dtBeginDate = DateTime.Parse(DLC_BeginDate.Text);
        dtEndDate = DateTime.Parse(DLC_EndDate.Text);
        dtMakeDate = DateTime.Now;
        strRouteNumber = LB_RouteNumber.Text.Trim();

        if (strOperation == "" | strOperatorCode == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPSBFPRYJGZYHSLRBNWKJC + "')", true);
            return;
        }

        ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
        ReqAssignRecord reqAssignRecord = new ReqAssignRecord();

        reqAssignRecord.ReqID = intReqID;
        reqAssignRecord.ReqName = strReqName;
        reqAssignRecord.Type = strType;
        reqAssignRecord.OperatorCode = strOperatorCode;
        reqAssignRecord.OperatorName = strOperatorName;
        reqAssignRecord.OperationTime = DateTime.Now;
        reqAssignRecord.OperatorContent = " ";
        reqAssignRecord.BeginDate = dtBeginDate;
        reqAssignRecord.EndDate = dtEndDate;
        reqAssignRecord.AssignManCode = strAssignManCode;
        reqAssignRecord.AssignManName = strAssignManName;
        reqAssignRecord.Content = "";
        reqAssignRecord.Operation = strOperation;
        reqAssignRecord.PriorID = intPriorID;
        reqAssignRecord.RouteNumber = int.Parse(strRouteNumber);
        reqAssignRecord.MakeDate = dtMakeDate;
        reqAssignRecord.Status = "待处理";
        reqAssignRecord.MoveTime = DateTime.Now;

        try
        {
            reqAssignRecordBLL.AddReqAssignRecord(reqAssignRecord);

            //更改需求分派记录状态
            updateReqAssignRecordStatus(intPriorID, "已分派");

            LoadAssignRecord(strID);
            LoadChildRecord(strID);

            ShareClass.SendInstantMessage(Resources.lang.XuQiuFenPaiTongZhi, strUserName + Resources.lang.GeiNiFenPaiLeXuQiu + " :" + strReqID + "  " + strReqName + "，" + Resources.lang.QingJiShiChuLi, strUserCode, strOperatorCode);

            TB_AssignMessage.Text = strUserName + Resources.lang.GeiNiFenPaiLeXuQiu + "：" + strReqID + "  " + strReqName + "，" + Resources.lang.QingJiShiChuLi;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPSBJC + "')", true);
        }
    }

    //更改需求分派记录状态
    protected void updateReqAssignRecordStatus(int intAssignID, string strStatus)
    {
        string strHQL;

        strHQL = string.Format(@"Update T_ReqAssignRecord Set Status = '{0}',MoveTime = now()  Where ID = {1}", strStatus, intAssignID);
        ShareClass.RunSqlCommand(strHQL);
    }

    protected void InitialPrjectTree()
    {
        string strHQL, strUserCode, strProjectID, strProject;
        IList lst;

        //添加根节点
        TreeView1.Nodes.Clear();

        TreeNode node1 = new TreeNode();
        TreeNode node3 = new TreeNode();

        node1.Text = "<B>总项目</B>";
        node1.Target = GetProjectId("总项目");
        node1.Expanded = true;
        TreeView1.Nodes.Add(node1);

        strUserCode = LB_UserCode.Text.Trim();
        strHQL = "from Project as project where  project.PMCode = " + "'" + strUserCode + "'";
        strHQL += " and project.ParentID not in (select project.ProjectID from Project as project where project.PMCode = " + "'" + strUserCode + "'" + ")";
        strHQL += "  and project.Status not in ('删除','归档') order by project.ProjectID DESC";
        ProjectBLL projectBLL = new ProjectBLL();
        Project project = new Project();

        lst = projectBLL.GetAllProjects(strHQL);

        for (int i = 0; i < lst.Count; i++)
        {
            project = (Project)lst[i];

            strProjectID = project.ProjectID.ToString(); ;
            strProject = project.ProjectName.Trim();

            node3 = new TreeNode();

            node3.Text = strProjectID + "." + strProject;
            node3.Target = strProjectID;
            node3.Expanded = false;

            node1.ChildNodes.Add(node3);
            TreeShow1(strProjectID, node3);
            TreeView1.DataBind();
        }
    }

    private void TreeShow1(string strParentID, TreeNode treeNode)
    {
        string strHQL, strProjectID, strProject;
        IList lst1, lst2;

        ProjectBLL projectBLL = new ProjectBLL();
        Project project = new Project();

        strHQL = "from Project as project where project.ParentID = " + strParentID + " and project.Status not in ('删除','归档') order by project.ProjectID DESC";
        lst1 = projectBLL.GetAllProjects(strHQL);

        for (int i = 0; i < lst1.Count; i++)
        {
            project = (Project)lst1[i];
            strProjectID = project.ProjectID.ToString();
            strProject = project.ProjectName.Trim();

            TreeNode node = new TreeNode();
            node.Target = strProjectID;
            node.Text = strProjectID + ". " + strProject;
            treeNode.ChildNodes.Add(node);
            node.Expanded = false;

            strHQL = "from Project as project where project.ParentID = " + strProjectID + " Order by project.ProjectID DESC";
            lst2 = projectBLL.GetAllProjects(strHQL);

            if (lst2.Count > 0)
            {
                TreeShow1(strProjectID, node);
            }
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strProjectID, strHQL;
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        strProjectID = treeNode.Target.Trim();

        ProjectBLL projectBLL = new ProjectBLL();
        strHQL = "from Project as project where project.ProjectID = " + strProjectID;
        lst = projectBLL.GetAllProjects(strHQL);

        Project project = (Project)lst[0];

        LB_ParentProjectID.Text = project.ProjectID.ToString();
        LB_ParentProjectName.Text = project.ProjectName.Trim();
    }

    protected void BT_SelectProject_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popProjectTreeWindow','false') ", true);
    }

    protected void BT_TransferProject_Click(object sender, EventArgs e)
    {
        string strOperatorCode, StrID;
        string strProjectName, strProjectDetail, strContent;
        string strHQL;
        DateTime dtBeginDate, dtEndDate, dtMakeDate, dtAssignTime;
        int intReqID, intProjectID, intPriorID, intParentID;
        IList lst, lst1;

        string strID = LB_ID.Text.Trim();
        string strApproveID = LB_ApproveID.Text.Trim();
        int intRouteNumber = int.Parse(LB_RouteNumber.Text.Trim());

        Requirement requirement = GetAndLoadRequirement(strReqID);

        strUserCode = LB_UserCode.Text.Trim().ToUpper();
        strOperatorCode = DL_Member.SelectedValue.Trim();
        strApplicantCode = requirement.ApplicantCode.Trim();
        strProjectName = TB_TransferProject.Text.Trim();
        strProjectDetail = strReqDetail;
        strAcceptStandard = requirement.AcceptStandard.Trim();
        dtBeginDate = DateTime.Now;
        dtEndDate = DateTime.Now;
        dtMakeDate = DateTime.Now;
        intParentID = 1;
        intReqID = int.Parse(strReqID);
        intPriorID = int.Parse(LB_AssignID.Text.Trim());
        StrID = LB_AssignID.Text.Trim();

        strContent = strReqName;
        intParentID = int.Parse(LB_ParentProjectID.Text.Trim());

        if (strOperatorCode != "")
        {
            if (strContent != "")
            {
                ProjectBLL projectBLL = new ProjectBLL();
                Project project = new Project();

                project.UserCode = strUserCode;
                project.UserName = ShareClass.GetUserName(strUserCode);
                project.PMCode = strOperatorCode;
                project.PMName = ShareClass.GetUserName(strOperatorCode);
                project.CustomerPMName = "";
                project.ProjectType = "OtherProject";
                project.ProjectName = strProjectName;
                project.ProjectDetail = strProjectDetail;
                project.AcceptStandard = strAcceptStandard;
                project.BeginDate = dtBeginDate;
                project.EndDate = dtEndDate;
                project.MakeDate = dtMakeDate;
                project.ProjectAmount = 0;
                project.ManHour = 0;
                project.ManNumber = 0;
                project.Status = "新建";
                project.StatusValue = "进行中";
                project.ParentID = intParentID;

                project.BelongDepartCode = ShareClass.GetDepartCodeFromUserCode(strOperatorCode);
                project.BelongDepartName = ShareClass.GetDepartName(project.BelongDepartCode.Trim());


                try
                {
                    projectBLL.AddProject(project);
                    InitialPrjectTree();

                    strHQL = " from Project as project where project.UserCode = " + "'" + strUserCode + "'" + " and project.PMCode = " + "'" + strOperatorCode + "'";
                    strHQL = strHQL + " and project.ProjectName = " + "'" + strProjectName + "'" + " and project.ParentID = " + intParentID + " Order by project.ProjectID DESC";

                    lst = projectBLL.GetAllProjects(strHQL);
                    project = (Project)lst[0];
                    intProjectID = project.ProjectID;

                    RelatedReqBLL relatedReqBLL = new RelatedReqBLL();
                    RelatedReq relatedReq = new RelatedReq();
                    relatedReq.ReqID = intReqID;
                    relatedReq.ProjectID = intProjectID;
                    relatedReqBLL.AddRelatedReq(relatedReq);


                    RequirementBLL requirementBLL = new RequirementBLL();
                    requirement.Status = "转项";
                    requirementBLL.UpdateRequirement(requirement, intReqID);

                    ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();

                    strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.ID = " + intPriorID.ToString();
                    lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
                    ReqAssignRecord reqAssignRecord = (ReqAssignRecord)lst[0];
                    reqAssignRecord.Status = "转项";

                    try
                    {
                        reqAssignRecordBLL.UpdateReqAssignRecord(reqAssignRecord, intPriorID);
                    }
                    catch
                    {
                    }

                    reqAssignRecord = new ReqAssignRecord();

                    reqAssignRecord.ReqID = intReqID;
                    reqAssignRecord.ReqName = strReqName;
                    reqAssignRecord.Type = strType;
                    reqAssignRecord.OperatorCode = strOperatorCode;
                    reqAssignRecord.OperatorName = ShareClass.GetUserName(strOperatorCode);
                    reqAssignRecord.OperationTime = DateTime.Now;
                    reqAssignRecord.OperatorContent = "";
                    reqAssignRecord.BeginDate = dtBeginDate;
                    reqAssignRecord.EndDate = dtEndDate;
                    reqAssignRecord.AssignManCode = strUserCode;
                    reqAssignRecord.AssignManName = ShareClass.GetUserName(strUserCode);
                    reqAssignRecord.Content = strContent;
                    reqAssignRecord.Operation = "转项";
                    reqAssignRecord.PriorID = intPriorID;
                    reqAssignRecord.RouteNumber = intRouteNumber;
                    reqAssignRecord.MakeDate = DateTime.Now;
                    reqAssignRecord.Status = "转项";
                    reqAssignRecord.MoveTime = DateTime.Now;

                    try
                    {
                        reqAssignRecordBLL.AddReqAssignRecord(reqAssignRecord);

                        LoadAssignRecord(strID);
                        LoadChildRecord(strID);
                    }
                    catch
                    {
                    }

                    TB_TransferProjectMsg.Text = strUserName + " 把需求：" + strReqID + " " + strReqName + " 转成了项目给你，请及时受理！";

                    BT_Approve.Enabled = false;
                    BT_Refuse.Enabled = false;

                    RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
                    RelatedUser relatedUser = new RelatedUser();

                    strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.ReqID = " + strReqID;
                    lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);

                    for (int i = 0; i < lst.Count; i++)
                    {
                        reqAssignRecord = (ReqAssignRecord)lst[i];

                        strUserCode = reqAssignRecord.OperatorCode;
                        dtAssignTime = reqAssignRecord.OperationTime;

                        strHQL = "from RelatedUser as relatedUser where relatedUser.ProjectID = " + intProjectID.ToString() + " and  relatedUser.UserCode = " + "'" + strUserCode + "'";
                        lst1 = relatedUserBLL.GetAllRelatedUsers(strHQL);

                        if (lst1.Count == 0)
                        {
                            relatedUser.ProjectID = intProjectID;
                            relatedUser.ProjectName = strProjectName;
                            relatedUser.UserCode = strUserCode;
                            relatedUser.UserName = ShareClass.GetUserName(strUserCode);
                            relatedUser.DepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
                            relatedUser.DepartName = ShareClass.GetDepartName(relatedUser.DepartCode);
                            relatedUser.JoinDate = dtAssignTime;
                            relatedUser.Actor = "需求评审";
                            relatedUser.Status = "计划";
                            relatedUser.WorkDetail = "需求评审";
                            relatedUser.UnitHourSalary = 0;

                            relatedUserBLL.AddRelatedUser(relatedUser);
                        }
                    }

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYCGZCXM + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZXMSBJC + "')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXSNDYJCNJCXZCXM + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZXRWKBNZCXMJC + "')", true);
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strID = e.Item.Cells[0].Text;
            IList lst;
            string strHQL;

            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {
                DataGrid1.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.ID = " + strID;
            ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
            ReqAssignRecord reqAssignRecord = new ReqAssignRecord();
            lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);

            reqAssignRecord = (ReqAssignRecord)lst[0];

            LB_ID.Text = reqAssignRecord.ID.ToString();
            LB_Type.Text = reqAssignRecord.Type;

            if (strIsMobileDevice == "YES")
            {
                HT_Operation.Text = reqAssignRecord.Operation.Trim();
            }
            else
            {
                HE_Operation.Text = reqAssignRecord.Operation.Trim();
            }

            TB_ReceiverCode.Text = reqAssignRecord.OperatorCode;
            LB_ReceiverName.Text = reqAssignRecord.OperatorName.Trim();
            DLC_BeginDate.Text = reqAssignRecord.BeginDate.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = reqAssignRecord.EndDate.ToString("yyyy-MM-dd");

            if (strStatus == "关闭" || reqAssignRecord.Status.Trim() == "转项")
            {
                BT_UpdateAssign.Enabled = false;
                BT_DeleteAssign.Enabled = false;
            }
            else
            {
                BT_UpdateAssign.Enabled = true;
                BT_DeleteAssign.Enabled = true;
            }
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strGroupName = ((Button)e.Item.FindControl("BT_ActorGroup")).Text.Trim();
            string strHQL = "from ActorGroupDetail as actorGroupDetail where actorGroupDetail.GroupName = " + "'" + strGroupName + "'";

            ActorGroupDetailBLL actroGroupDetailBLL = new ActorGroupDetailBLL();
            IList lst = actroGroupDetailBLL.GetAllActorGroupDetails(strHQL);

            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
        }
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strReceiverCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();

        TB_ReceiverCode.Text = strReceiverCode;
        LB_ReceiverName.Text = ShareClass.GetUserName(strReceiverCode);
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strUserCode = LB_UserCode.Text.Trim();
        string strHQL = "from ActorGroup as actorGroup where actorGroup.GroupName ";
        strHQL += " in ( Select actorGroupDetail.GroupName from ActorGroupDetail as actorGroupDetail where actorGroupDetail.UserCode = " + "'" + strUserCode + "'" + ")";
        ActorGroupBLL actorGroupBLL = new ActorGroupBLL();
        IList lst = actorGroupBLL.GetAllActorGroups(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }


    protected void BT_Activity_Click(object sender, EventArgs e)
    {
        string strHQL, strContent;
        string strID;

        strUserCode = LB_UserCode.Text.Trim();
        strContent = TB_Content.Text.Trim();


        TB_Content.Text = strContent;


        strID = LB_AssignID.Text.Trim();
        strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.ID = " + strID;
        ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
        IList lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
        ReqAssignRecord reqAssignRecord = (ReqAssignRecord)lst[0];
        reqAssignRecord.OperatorContent = TB_Content.Text.Trim();
        reqAssignRecord.Status = "处理中";

        try
        {
            reqAssignRecordBLL.UpdateReqAssignRecord(reqAssignRecord, int.Parse(strID));
            LoadAssignRecord(strID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ChengGong + "')", true);
            TB_Message.Text = strUserName + " 正在处理你的需求: " + strReqID + " " + strReqName;
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZHDSBJC + "')", true);
        }
    }

    protected void BT_Finish_Click(object sender, EventArgs e)
    {
        string strHQL, strContent;
        string strID;

        strUserCode = LB_UserCode.Text.Trim();
        strContent = TB_Content.Text.Trim();

        TB_Content.Text = strContent;

        strID = LB_AssignID.Text.Trim();
        strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.ID = " + strID;
        ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
        IList lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
        ReqAssignRecord reqAssignRecord = (ReqAssignRecord)lst[0];
        reqAssignRecord.OperatorContent = TB_Content.Text.Trim();
        reqAssignRecord.Status = "完成";

        try
        {
            reqAssignRecordBLL.UpdateReqAssignRecord(reqAssignRecord, int.Parse(strID));
            LoadAssignRecord(strID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ChengGong + "')", true);
            TB_Message.Text = strUserName + " 完成了你的需求: " + strReqID + " " + strReqName;

        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZWCSBJC + "')", true);
        }
    }

    protected void BT_TBD_Click(object sender, EventArgs e)
    {
        string strHQL, strContent;
        string strID;

        strContent = TB_Content.Text.Trim();

        TB_Content.Text = strContent;

        strID = LB_AssignID.Text.Trim();
        strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.ID = " + strID;
        ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
        IList lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
        ReqAssignRecord reqAssignRecord = (ReqAssignRecord)lst[0];
        reqAssignRecord.OperatorContent = TB_Content.Text.Trim();
        reqAssignRecord.Status = "挂起";

        try
        {
            reqAssignRecordBLL.UpdateReqAssignRecord(reqAssignRecord, int.Parse(strID));
            LoadAssignRecord(strID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ChengGong + "')", true);
            TB_Message.Text = strUserName + " 挂起了你的需求: " + strReqID + " " + strReqName;
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGSBJC + "')", true);
        }
    }

    protected void BT_Save_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strID;

        strUserCode = LB_UserCode.Text.Trim();
        strID = LB_AssignID.Text.Trim();

        if (TB_Content.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZJNRBNWKJC + "')", true);
            return;
        }

        try
        {
            strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.ID = " + strID;
            ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
            IList lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
            ReqAssignRecord reqAssignRecord = (ReqAssignRecord)lst[0];

            reqAssignRecord.OperatorContent = TB_Content.Text;

            reqAssignRecordBLL.UpdateReqAssignRecord(reqAssignRecord, int.Parse(strID));

            LoadAssignRecord(strID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }


    protected void BT_CloseReq_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from Requirement as requirement where requirement.ReqID = " + strReqID;
        RequirementBLL requirementBLL = new RequirementBLL();
        lst = requirementBLL.GetAllRequirements(strHQL);

        Requirement requirement = (Requirement)lst[0];

        requirement.Status = "关闭";

        try
        {
            requirementBLL.UpdateRequirement(requirement, int.Parse(strReqID));
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXGBCG + "')", true);

            BT_Refuse.Enabled = false;
            BT_Approve.Enabled = false;
            BT_Assign.Enabled = false;
            BT_Activity.Enabled = false;
            BT_Finish.Enabled = false;
            BT_TBD.Enabled = false;
            BT_TransferProject.Enabled = false;
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXGBSBJC + "')", true);
        }
    }

    protected void BT_ActiveReq_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from Requirement as requirement where requirement.ReqID = " + strReqID;
        RequirementBLL requirementBLL = new RequirementBLL();
        lst = requirementBLL.GetAllRequirements(strHQL);

        Requirement requirement = (Requirement)lst[0];

        requirement.Status = "处理中";

        try
        {
            requirementBLL.UpdateRequirement(requirement, int.Parse(strReqID));
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJHCG + "')", true);

            BT_Refuse.Enabled = true;
            BT_Approve.Enabled = true;
            BT_Assign.Enabled = true;
            BT_Activity.Enabled = true;
            BT_Finish.Enabled = true;
            BT_TBD.Enabled = true;
            BT_TransferProject.Enabled = true;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ChengGong + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJHSBJC + "')", true);
        }
    }

    protected void BT_Send_Click(object sender, EventArgs e)
    {
        string strSubject, strMsg;
        string strUserCode;

        strUserCode = LB_UserCode.Text.Trim();

        if (CB_ReturnMsg.Checked == true | CB_ReturnMail.Checked == true)
        {
            Msg msg = new Msg();

            strSubject = "需求处理情况反馈";
            strMsg = TB_Message.Text.Trim();

            if (CB_ReturnMsg.Checked == true)
            {
                msg.SendMSM("Message",strAssignManCode, strMsg, strUserCode);
            }

            if (CB_ReturnMail.Checked == true)
            {
                msg.SendMail(strAssignManCode, strSubject, strMsg, strUserCode);
            }
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFSWB + "')", true);

    }

    protected void BT_SendAssignMsg_Click(object sender, EventArgs e)
    {
        string strSubject, strMsg, strReceiverCode;

        strReceiverCode = TB_ReceiverCode.Text.Trim();

        if (CB_SendMsg.Checked == true | CB_SendMail.Checked == true)
        {
            Msg msg = new Msg();

            strSubject = "需求分派通知";

            strMsg = TB_AssignMessage.Text.Trim();

            if (CB_SendMsg.Checked == true)
            {
                msg.SendMSM("Message",strReceiverCode, strMsg, strUserCode);
            }

            if (CB_SendMail.Checked == true)
            {
                msg.SendMail(strReceiverCode, strSubject, strMsg, strUserCode);
            }
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFSWB + "')", true);
    }


    protected void BT_Select_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_TransferProjectMsg_Click(object sender, EventArgs e)
    {
        string strSubject, strMsg;
        string strOperatorCode;

        strOperatorCode = DL_Member.SelectedValue.Trim();

        if (CB_SMS.Checked == true | CB_Mail.Checked == true)
        {
            Msg msg = new Msg();

            strSubject = "需求转项通知";
            strMsg = ShareClass.GetUserName(strUserCode).Trim() + " 把需求：" + strReqID + " " + strReqName + "转成项目给你，请及时受理！";

            if (CB_SMS.Checked == true)
            {
                msg.SendMSM("Message",strOperatorCode, strMsg, strUserCode);
            }

            if (CB_Mail.Checked == true)
            {
                msg.SendMail(strOperatorCode, strSubject, strMsg, strUserCode);
            }
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFSWB + "')", true);

    }

    protected void LoadAssignRecord(string strID)
    {
        string strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.ID = " + strID;
        ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
        IList lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
        DataList2.DataSource = lst;
        DataList2.DataBind();
    }

    protected void LoadChildRecord(string strPriorID)
    {
        string strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.PriorID = " + strPriorID;
        ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
        IList lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void BT_UpdateAssign_Click(object sender, EventArgs e)
    {
        string strHQL, strID;
        IList lst;

        strID = LB_ID.Text.Trim();

        string strPriorID = LB_AssignID.Text.Trim();

        strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.ID = " + strID;
        ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
        ReqAssignRecord reqAssignRecord = new ReqAssignRecord();
        lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
        reqAssignRecord = (ReqAssignRecord)lst[0];

        reqAssignRecord.Type = LB_Type.Text.Trim();
        reqAssignRecord.OperatorContent = "";

        if (strIsMobileDevice == "YES")
        {
            reqAssignRecord.Operation = HT_Operation.Text.Trim();
        }
        else
        {
            reqAssignRecord.Operation = HE_Operation.Text.Trim();
        }


        reqAssignRecord.OperatorCode = TB_ReceiverCode.Text.Trim();
        reqAssignRecord.OperatorName = ShareClass.GetUserName(TB_ReceiverCode.Text.Trim());
        reqAssignRecord.BeginDate = DateTime.Parse(DLC_BeginDate.Text);
        reqAssignRecord.EndDate = DateTime.Parse(DLC_EndDate.Text);

        try
        {
            reqAssignRecordBLL.UpdateReqAssignRecord(reqAssignRecord, int.Parse(strID));
            LoadChildRecord(strPriorID);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_DeleteAssign_Click(object sender, EventArgs e)
    {
        string strHQL, strID;
        IList lst;

        string strPriorID = LB_AssignID.Text.Trim();

        strID = LB_ID.Text.Trim();

        strHQL = "from ReqAssignRecord as reqAssignRecord where reqAssignRecord.ID = " + strID;
        ReqAssignRecordBLL reqAssignRecordBLL = new ReqAssignRecordBLL();
        ReqAssignRecord reqAssignRecord = new ReqAssignRecord();
        lst = reqAssignRecordBLL.GetAllReqAssignRecords(strHQL);
        reqAssignRecord = (ReqAssignRecord)lst[0];

        try
        {
            reqAssignRecordBLL.DeleteReqAssignRecord(reqAssignRecord);
            LoadChildRecord(strPriorID);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }
    }

    protected void UpdateReqStatus(string strReqID, string strStatus)
    {
        string strHQL = "from ProjectReq as projectReq where projectReq.ReqID = " + strReqID;
        RequirementBLL requirementBLL = new RequirementBLL();
        IList lst = requirementBLL.GetAllRequirements(strHQL);

        Requirement requirement = (Requirement)lst[0];

        requirement.Status = strStatus;

        requirementBLL.UpdateRequirement(requirement, int.Parse(strReqID));
    }

    protected Requirement GetAndLoadRequirement(string strReqID)
    {
        string strHQL = "from Requirement as requirement where requirement.ReqID = " + strReqID;
        RequirementBLL requirementBLL = new RequirementBLL();
        IList lst = requirementBLL.GetAllRequirements(strHQL);

        DataList3.DataSource = lst;
        DataList3.DataBind();

        Requirement requirement = (Requirement)lst[0];
        return requirement;
    }

    protected string GetProjectId(string strProjectName)
    {
        string strHQL;
        IList lst;

        strHQL = "from Project as project where rtrim(ltrim(project.ProjectName)) = " + "'" + strProjectName + "'";
        ProjectBLL projectBLL = new ProjectBLL();
        lst = projectBLL.GetAllProjects(strHQL);

        Project project = (Project)lst[0];

        return project.ProjectID.ToString();
    }
}
