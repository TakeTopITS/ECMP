using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTDefectDetail : System.Web.UI.Page
{
    string strIsMobileDevice;
    string strApplicantCode, strDefectID, strDefectName, strType;
    string strStatus, strDefectDetail, strAcceptStandard, strUserCode, strUserName;
    string strAssignManCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;
        string strCreatorCode, strDepartCode;

        //CKEditor初始化
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(HE_Operation);

        string strID = Request.QueryString["ID"];
        LB_ApproveID.Text = strID;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.ID = " + strID;
        DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
        lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
        DataList2.DataSource = lst;
        DataList2.DataBind();

        DefectAssignRecord defectAssignRecord = (DefectAssignRecord)lst[0];
        strDefectID = defectAssignRecord.DefectID.ToString();
        strAssignManCode = defectAssignRecord.AssignManCode.Trim();

        LB_RouteNumber.Text = defectAssignRecord.RouteNumber.ToString();
        LB_AssignID.Text = defectAssignRecord.ID.ToString();

        Defectment defectment = GetAndLoadDefectment(strDefectID);
        strDefectName = defectment.DefectName.Trim();
        strApplicantCode = defectment.ApplicantCode.Trim();
        strDefectDetail = defectment.DefectDetail.Trim();
        strAcceptStandard = defectment.AcceptStandard.Trim();
        strType = defectment.DefectType.Trim();
        strStatus = defectment.Status.Trim();
        strCreatorCode = defectment.ApplicantCode.Trim();

        TB_TransferProject.Text = strDefectName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            if (strIsMobileDevice == "YES")
            {
                HT_Operation.Visible = true; HT_Operation.Toolbar = "";
            }
            else
            {
                 HE_Operation.Visible = true; 
            }

            TB_Content.Text = defectAssignRecord.OperatorContent.Trim();

            InitialPrjectTree();
            ShareClass.LoadMemberByUserCodeForDropDownList(strUserCode, DL_Member);
            TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthority(Resources.lang.ZZJGT, TreeView2, strUserCode);

            DLC_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);
            if (strUserCode == strCreatorCode)
            {
                BT_CloseDefect.Enabled = true;
                BT_ActiveDefect.Enabled = true;
            }

            if (strStatus == "关闭" || defectAssignRecord.Status.Trim() == "转项")
            {
                BT_Refuse.Enabled = false;
                BT_Approve.Enabled = false;
                BT_Assign.Enabled = false;
                BT_Activity.Enabled = false;
                BT_Finish.Enabled = false;
                BT_TBD.Enabled = false;

                BT_CloseDefect.Enabled = false;
                BT_ActiveDefect.Enabled = false;
            }

            LB_Type.Text = defectment.DefectType.Trim();
            HL_ApproveRecord.NavigateUrl = "TTDefectAssignRecord.aspx?DefectID=" + strDefectID;
            HL_RelatedMeeting.NavigateUrl = "TTMakeDefectMeeting.aspx?DefectID=" + strDefectID;
            HL_DefectReview.NavigateUrl = "TTDefectReviewWL.aspx?DefectID=" + strDefectID;
            HL_DefectRelatedDoc.NavigateUrl = "TTDefectRelatedDoc.aspx?DefectID=" + strDefectID;
            HL_MakeCollaboration.NavigateUrl = "TTMakeCollaboration.aspx?RelatedType=REQ&RelatedID=" + strDefectID;

            LoadChildRecord(strID);

            //BusinessForm，如果不含业务表单，就隐藏“相关表单按钮”
            if (ShareClass.getRelatedBusinessFormTemName("DefectRecord", strID) == "")
            {
                BT_StartupBusinessForm.Visible = false;
            }

            string strNewProjectCode = ShareClass.GetCodeByRule("ProjectCode", "OtherProject", strDefectID);
            if (strNewProjectCode != "")
            {
                TB_ProjectCode.Enabled = false;
            }
        }
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);

        TreeView2.SelectedNode.Selected = false;
    }

    protected void BT_Approve_Click(object sender, EventArgs e)
    {
        string strHQL, strContent;
        string strID;

        strContent = TB_Content.Text.Trim();
        strUserCode = LB_UserCode.Text.Trim();

        TB_Content.Text = strContent;

        strID = LB_AssignID.Text.Trim();

        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.ID = " + strID;
        DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
        IList lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
        DefectAssignRecord defectAssignRecord = (DefectAssignRecord)lst[0];
        defectAssignRecord.OperatorContent = TB_Content.Text.Trim();
        defectAssignRecord.Status = "受理";

        try
        {
            defectAssignRecordBLL.UpdateDefectAssignRecord(defectAssignRecord, int.Parse(strID));
            LoadAssignRecord(strID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ChengGong + "')", true);
            TB_Message.Text = strUserName + " 受理了你的缺陷: " + strDefectID + " " + strDefectName;
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

        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.ID = " + strID;
        DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
        IList lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
        DefectAssignRecord defectAssignRecord = (DefectAssignRecord)lst[0];
        defectAssignRecord.OperatorContent = TB_Content.Text.Trim();
        defectAssignRecord.Status = "拒绝";

        try
        {
            defectAssignRecordBLL.UpdateDefectAssignRecord(defectAssignRecord, int.Parse(strID));
            LoadAssignRecord(strID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ChengGong + "')", true);
            TB_Message.Text = strUserName + " 拒绝了你的缺陷: " + strDefectID + " " + strDefectName;
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJJSBJC + "')", true);
        }
    }

    protected void BT_Assign_Click(object sender, EventArgs e)
    {
        Msg msg = new Msg();

        int intDefectID, intPriorID;
        string strOperatorCode, strOperatorName, strAssignManCode, strAssignManName;
        string strContent, strOperation, strType;
        string strRouteNumber;
        DateTime dtBeginDate, dtEndDate, dtMakeDate;

        string strID = LB_AssignID.Text.Trim();
        strUserCode = LB_UserCode.Text.Trim();

        intDefectID = int.Parse(strDefectID);
        strType = LB_Type.Text.Trim();
        strOperatorCode = TB_ReceiverCode.Text.Trim();
        try
        {
            strOperatorName = ShareClass.GetUserName(strOperatorCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGSLRDMCWCWCRJC + "')", true);
            return;
        }

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

        DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
        DefectAssignRecord defectAssignRecord = new DefectAssignRecord();

        defectAssignRecord.DefectID = intDefectID;
        defectAssignRecord.DefectName = strDefectName;
        defectAssignRecord.Type = strType;
        defectAssignRecord.OperatorCode = strOperatorCode;
        defectAssignRecord.OperatorName = strOperatorName;
        defectAssignRecord.OperationTime = DateTime.Now;
        defectAssignRecord.OperatorContent = " ";
        defectAssignRecord.BeginDate = dtBeginDate;
        defectAssignRecord.EndDate = dtEndDate;
        defectAssignRecord.AssignManCode = strAssignManCode;
        defectAssignRecord.AssignManName = strAssignManName;
        defectAssignRecord.Content = "";
        defectAssignRecord.Operation = strOperation;
        defectAssignRecord.PriorID = intPriorID;
        defectAssignRecord.RouteNumber = int.Parse(strRouteNumber);
        defectAssignRecord.MakeDate = dtMakeDate;
        defectAssignRecord.Status = "待处理";
        defectAssignRecord.MoveTime = DateTime.Now;
        defectAssignRecord.MoveTime = DateTime.Now;

        try
        {
            defectAssignRecordBLL.AddDefectAssignRecord(defectAssignRecord);

            //更改前缺陷分派记录状态
            updateDefectAssignRecordStatus(intPriorID, "已分派");

            LoadAssignRecord(strID);
            LoadChildRecord(strID);

            string strAssignID = ShareClass.GetMyCreatedMaxDefectAssignRecordID(strDefectID, strUserCode);
            //BusinessForm,处理关联的业务表单数据
            ShareClass.InsertOrUpdateTaskAssignRecordWFXMLData("DefectRecord", intPriorID.ToString(), "DefectRecord", strAssignID, strUserCode);

            ShareClass.SendInstantMessage(Resources.lang.QueXianFenPaiTongZi, strUserName + Resources.lang.GeiNiFenPaiLeXuQiu + " :" + strDefectID + "  " + strDefectName + "，" + Resources.lang.QingJiShiChuLi, strUserCode, strOperatorCode);

            TB_AssignMessage.Text = strUserName + Resources.lang.GeiNiFenPaiLeQueXian + "：" + strDefectID + "  " + strDefectName + "，" + Resources.lang.QingJiShiChuLi;


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPSBJC + "')", true);
        }
    }

    //更改缺陷分派记录状态
    protected void updateDefectAssignRecordStatus(int intAssignID,string strStatus)
    {
        string strHQL;

        strHQL = string.Format(@"Update T_DefectAssignRecord Set Status = '{0}',MoveTime = now()   Where ID = {1}", strStatus,intAssignID);
        ShareClass.RunSqlCommand(strHQL);
    }


    //BusinessForm,启动关联的业务表单
    protected void BT_StartupBusinessForm_Click(object sender, EventArgs e)
    {
        string strURL;
        string strAssignID = LB_AssignID.Text;

        string strTemName, strIdentifyString;

        strTemName = ShareClass.getRelatedBusinessFormTemName("DefectRecord", strAssignID);

        if (strTemName != "")
        {
            strIdentifyString = ShareClass.GetWLTemplateIdentifyString(strTemName);
            strURL = "popShowByURL(" + "'TTRelatedDIYBusinessForm.aspx?RelatedType=DefectRecord&RelatedID=" + strAssignID + "&IdentifyString=" + strIdentifyString+ "','" + Resources.lang.XiangGuanYeWuDan + "', 800, 600,window.location);";

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop12", strURL, true);
        }
    }

    protected void BT_PopTranferProjectWindow_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popTranferProjectWindow','false') ", true);
    }

    protected void BT_SelectProject_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popTranferProjectWindow','false','popProjectTreeWindow') ", true);
    }

    protected void BT_TransferProject_Click(object sender, EventArgs e)
    {
        string strOperatorCode, StrID;
        string strProjectCode, strProjectName, strProjectDetail, strContent;
        string strHQL;
        DateTime dtBeginDate, dtEndDate, dtMakeDate, dtAssignTime;
        int intDefectID, intProjectID, intPriorID, intParentID;
        IList lst, lst1;

        string strID = LB_ID.Text.Trim();
        string strApproveID = LB_ApproveID.Text.Trim();
        int intRouteNumber = int.Parse(LB_RouteNumber.Text.Trim());

        Defectment defectment = GetAndLoadDefectment(strDefectID);

        strProjectCode = TB_ProjectCode.Text.Trim();
        strUserCode = LB_UserCode.Text.Trim().ToUpper();
        strOperatorCode = DL_Member.SelectedValue.Trim();
        strApplicantCode = defectment.ApplicantCode.Trim();
        strProjectName = TB_TransferProject.Text.Trim();
        strProjectDetail = strDefectDetail;
        strAcceptStandard = defectment.AcceptStandard.Trim();
        dtBeginDate = DateTime.Now;
        dtEndDate = DateTime.Now;
        dtMakeDate = DateTime.Now;
        intParentID = 1;
        intDefectID = int.Parse(strDefectID);
        intPriorID = int.Parse(LB_AssignID.Text.Trim());
        StrID = LB_AssignID.Text.Trim();

        strContent = strDefectName;
        intParentID = int.Parse(LB_ParentProjectID.Text.Trim());

        if (strProjectCode != "")
        {
            if (ShareClass.GetProjecCountByProjectCodeAndID(strProjectCode, "0") > 0)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBCZXTDXMDMDXMJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popTranferProjectWindow','false') ", true);

                return;
            }
        }

        if (strOperatorCode != "")
        {
            if (strContent != "")
            {
                ProjectBLL projectBLL = new ProjectBLL();
                Project project = new Project();

                project.ProjectCode = strProjectCode;
                project.UserCode = strUserCode;
                project.UserName = ShareClass.GetUserName(strUserCode);
                project.PMCode = strOperatorCode;
                project.PMName = ShareClass.GetUserName(strOperatorCode);
                project.CustomerPMName = "";
                project.ProjectType = "OtherProject";
                project.ProjectClass = "常规项目";
                project.ProjectName = strProjectName;
                project.ProjectDetail = strProjectDetail;
                project.AcceptStandard = strAcceptStandard + "<br/><br/><b>我的意见：</b><br/>" + strContent;
                project.BeginDate = dtBeginDate;
                project.EndDate = dtEndDate;
                project.MakeDate = dtMakeDate;
                project.ProjectAmount = 0;
                project.ManHour = 0;
                project.ManNumber = 0;
                project.Status = "新建";
                project.StatusValue = "进行中";
                project.ParentID = intParentID;

                project.CurrencyType = "人民币";
                project.Priority = "COMMON";

                try
                {
                    projectBLL.AddProject(project);
                    InitialPrjectTree();

                    strHQL = " from Project as project where project.UserCode = " + "'" + strUserCode + "'" + " and project.PMCode = " + "'" + strOperatorCode + "'";
                    strHQL = strHQL + " and project.ProjectName = " + "'" + strProjectName + "'" + " and project.ParentID = " + intParentID + " Order by project.ProjectID DESC";

                    lst = projectBLL.GetAllProjects(strHQL);
                    project = (Project)lst[0];
                    intProjectID = project.ProjectID;

                    //自动生成项目代码
                    string strNewProjectCode = ShareClass.GetCodeByRule("ProjectCode", "OtherProject", intProjectID.ToString());
                    if (strNewProjectCode != "")
                    {
                        TB_ProjectCode.Text = strNewProjectCode;
                        strHQL = "Update T_Project Set ProjectCode = " + "'" + strNewProjectCode + "'" + " Where ProjectID = " + intProjectID.ToString();
                        ShareClass.RunSqlCommand(strHQL);
                    }

                    RelatedDefectBLL relatedDefectBLL = new RelatedDefectBLL();
                    RelatedDefect relatedDefect = new RelatedDefect();
                    relatedDefect.DefectID = intDefectID;
                    relatedDefect.ProjectID = intProjectID;
                    relatedDefectBLL.AddRelatedDefect(relatedDefect);


                    DefectmentBLL defectmentBLL = new DefectmentBLL();
                    defectment.Status = "转项";
                    defectmentBLL.UpdateDefectment(defectment, intDefectID);

                    DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();

                    strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.ID = " + intPriorID.ToString();
                    lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
                    DefectAssignRecord defectAssignRecord = (DefectAssignRecord)lst[0];
                    defectAssignRecord.Status = "转项";

                    try
                    {
                        defectAssignRecordBLL.UpdateDefectAssignRecord(defectAssignRecord, intPriorID);
                    }
                    catch
                    {
                    }

                    defectAssignRecord = new DefectAssignRecord();

                    defectAssignRecord.DefectID = intDefectID;
                    defectAssignRecord.DefectName = strDefectName;
                    defectAssignRecord.Type = strType;
                    defectAssignRecord.OperatorCode = strOperatorCode;
                    defectAssignRecord.OperatorName = ShareClass.GetUserName(strOperatorCode);
                    defectAssignRecord.OperationTime = DateTime.Now;
                    defectAssignRecord.OperatorContent = "";
                    defectAssignRecord.BeginDate = dtBeginDate;
                    defectAssignRecord.EndDate = dtEndDate;
                    defectAssignRecord.AssignManCode = strUserCode;
                    defectAssignRecord.AssignManName = ShareClass.GetUserName(strUserCode);
                    defectAssignRecord.Content = strContent;
                    defectAssignRecord.Operation = "转项";
                    defectAssignRecord.PriorID = intPriorID;
                    defectAssignRecord.RouteNumber = intRouteNumber;
                    defectAssignRecord.MakeDate = DateTime.Now;
                    defectAssignRecord.Status = "转项";
                    defectAssignRecord.MoveTime = DateTime.Now;

                    try
                    {
                        defectAssignRecordBLL.AddDefectAssignRecord(defectAssignRecord);

                        LoadAssignRecord(strID);
                        LoadChildRecord(strID);
                    }
                    catch
                    {
                    }



                    TB_TransferProjectMsg.Text = strUserName + " 把缺陷：" + strDefectID + " " + strDefectName + " 转成了项目给你，请及时受理！";

                    BT_Approve.Enabled = false;
                    BT_Refuse.Enabled = false;

                    RelatedUserBLL relatedUserBLL = new RelatedUserBLL();
                    RelatedUser relatedUser = new RelatedUser();

                    strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.DefectID = " + strDefectID;
                    lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);

                    for (int i = 0; i < lst.Count; i++)
                    {
                        defectAssignRecord = (DefectAssignRecord)lst[i];

                        strUserCode = defectAssignRecord.OperatorCode;
                        dtAssignTime = defectAssignRecord.OperationTime;

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
                            relatedUser.Actor = "缺陷评审";
                            relatedUser.Status = "计划";
                            relatedUser.WorkDetail = "缺陷评审";
                            relatedUser.UnitHourSalary = 0;

                            try
                            {
                                relatedUserBLL.AddRelatedUser(relatedUser);
                            }
                            catch
                            {

                            }
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

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popTranferProjectWindow','false') ", true);

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

            strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.ID = " + strID;
            DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
            DefectAssignRecord defectAssignRecord = new DefectAssignRecord();
            lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);

            defectAssignRecord = (DefectAssignRecord)lst[0];

            LB_ID.Text = defectAssignRecord.ID.ToString();
            LB_Type.Text = defectAssignRecord.Type;

            if (strIsMobileDevice == "YES")
            {
                HT_Operation.Text = defectAssignRecord.Operation.Trim();
            }
            else
            {
                HE_Operation.Text = defectAssignRecord.Operation.Trim();
            }

            TB_ReceiverCode.Text = defectAssignRecord.OperatorCode;
            LB_ReceiverName.Text = defectAssignRecord.OperatorName.Trim();
            DLC_BeginDate.Text = defectAssignRecord.BeginDate.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = defectAssignRecord.EndDate.ToString("yyyy-MM-dd");

            if (strStatus == "关闭" || defectAssignRecord.Status.Trim() == "转项")
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
            string strDepartCode = ((Button)e.Item.FindControl("BT_DepartCode")).Text.Trim();

            string strHQL = "from ProjectMember as projectMember where projectMember.DepartCode= " + "'" + strDepartCode + "'";

            ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();

            IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);

            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();
        }
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strReceiverCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();


        TB_ReceiverCode.Text = strReceiverCode;
        LB_ReceiverName.Text = ShareClass.GetUserName(strReceiverCode);
    }


    protected void BT_Activity_Click(object sender, EventArgs e)
    {
        string strHQL, strContent;
        string strID;

        strUserCode = LB_UserCode.Text.Trim();
        strContent = TB_Content.Text.Trim();

        TB_Content.Text = strContent;

        strID = LB_AssignID.Text.Trim();
        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.ID = " + strID;
        DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
        IList lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
        DefectAssignRecord defectAssignRecord = (DefectAssignRecord)lst[0];
        defectAssignRecord.OperatorContent = TB_Content.Text.Trim();
        defectAssignRecord.Status = "处理中";

        try
        {
            defectAssignRecordBLL.UpdateDefectAssignRecord(defectAssignRecord, int.Parse(strID));
            LoadAssignRecord(strID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ChengGong + "')", true);
            TB_Message.Text = strUserName + " 正在处理你的缺陷: " + strDefectID + " " + strDefectName;
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
        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.ID = " + strID;
        DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
        IList lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
        DefectAssignRecord defectAssignRecord = (DefectAssignRecord)lst[0];
        defectAssignRecord.OperatorContent = TB_Content.Text.Trim();
        defectAssignRecord.Status = "完成";

        try
        {
            defectAssignRecordBLL.UpdateDefectAssignRecord(defectAssignRecord, int.Parse(strID));
            LoadAssignRecord(strID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ChengGong + "')", true);
            TB_Message.Text = strUserName + " 完成了你的缺陷: " + strDefectID + " " + strDefectName;

        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZWCSBJC + "')", true);
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
            strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.ID = " + strID;
            DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
            IList lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
            DefectAssignRecord defectAssignRecord = (DefectAssignRecord)lst[0];

            defectAssignRecord.OperatorContent = TB_Content.Text;

            defectAssignRecordBLL.UpdateDefectAssignRecord(defectAssignRecord, int.Parse(strID));

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

            LoadAssignRecord(strID);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_TBD_Click(object sender, EventArgs e)
    {
        string strHQL, strContent;
        string strID;

        strContent = TB_Content.Text.Trim();

        TB_Content.Text = strContent;

        strID = LB_AssignID.Text.Trim();
        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.ID = " + strID;
        DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
        IList lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
        DefectAssignRecord defectAssignRecord = (DefectAssignRecord)lst[0];
        defectAssignRecord.OperatorContent = TB_Content.Text.Trim();
        defectAssignRecord.Status = "挂起";

        try
        {
            defectAssignRecordBLL.UpdateDefectAssignRecord(defectAssignRecord, int.Parse(strID));
            LoadAssignRecord(strID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ChengGong + "')", true);
            TB_Message.Text = strUserName + " 挂起了你的缺陷: " + strDefectID + " " + strDefectName;
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGSBJC + "')", true);
        }
    }

    protected void BT_CloseDefect_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from Defectment as defectment where defectment.DefectID = " + strDefectID;
        DefectmentBLL defectmentBLL = new DefectmentBLL();
        lst = defectmentBLL.GetAllDefectments(strHQL);

        Defectment defectment = (Defectment)lst[0];

        defectment.Status = "关闭";

        try
        {
            defectmentBLL.UpdateDefectment(defectment, int.Parse(strDefectID));
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

    protected void BT_ActiveDefect_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from Defectment as defectment where defectment.DefectID = " + strDefectID;
        DefectmentBLL defectmentBLL = new DefectmentBLL();
        lst = defectmentBLL.GetAllDefectments(strHQL);

        Defectment defectment = (Defectment)lst[0];

        defectment.Status = "处理中";

        try
        {
            defectmentBLL.UpdateDefectment(defectment, int.Parse(strDefectID));
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJHCG + "')", true);

            BT_Refuse.Enabled = true;
            BT_Approve.Enabled = true;
            BT_Assign.Enabled = true;
            BT_Activity.Enabled = true;
            BT_Finish.Enabled = true;
            BT_TBD.Enabled = true;
            BT_TransferProject.Enabled = true;
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJHSBJC + "')", true);
        }
    }


    protected bool UpdateWorkFlowStatus(string strWLID, string strStatus)
    {
        string strCmdText, strDIYNextStep, strSMS, strEMail;

        strSMS = "Yes";
        strEMail = "Yes";
        strDIYNextStep = "Yes";

        strCmdText = "Update T_WorkFlow Set Status = " + "'" + strStatus + "'" + ",DIYNextStep = " + "'" + strDIYNextStep + "'" + ",ReceiveSMS = " + "'" + strSMS + "'" + ",ReceiveEMail = " + "'" + strEMail + "'" + "  where WLID = " + strWLID;

        try
        {
            ShareClass.RunSqlCommand(strCmdText);
            return true;
        }
        catch
        {
            return false;
        }
    }


    protected void BT_Select_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);

    }

    protected void BT_Send_Click(object sender, EventArgs e)
    {
        string strSubject, strMsg;
        string strUserCode;

        strUserCode = LB_UserCode.Text.Trim();

        if (CB_ReturnMsg.Checked == true | CB_ReturnMail.Checked == true)
        {
            Msg msg = new Msg();

            strSubject = "缺陷处理情况反馈";
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

            strSubject = "缺陷分派通知";

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

    protected void InitialPrjectTree()
    {
        string strHQL, strUserCode, strProjectID, strProject;
        IList lst;

        //添加根节点
        TreeView1.Nodes.Clear();

        TreeNode node1 = new TreeNode();
        TreeNode node3 = new TreeNode();

        node1.Text = "<B>总项目</B>";
        node1.Target = "1";
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

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popTranferProjectWindow','false') ", true);
    }

    protected void BT_TransferProjectMsg_Click(object sender, EventArgs e)
    {
        string strSubject, strMsg;
        string strOperatorCode;

        strOperatorCode = DL_Member.SelectedValue.Trim();

        if (CB_SMS.Checked == true | CB_Mail.Checked == true)
        {
            Msg msg = new Msg();

            strSubject = "缺陷转项通知";
            strMsg = ShareClass.GetUserName(strUserCode).Trim() + " 把缺陷：" + strDefectID + " " + strDefectName + "转成项目给你，请及时受理！";

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

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popTranferProjectWindow','false') ", true);

    }

    protected void LoadAssignRecord(string strID)
    {
        string strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.ID = " + strID;
        DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
        IList lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
        DataList2.DataSource = lst;
        DataList2.DataBind();
    }

    protected void LoadChildRecord(string strPriorID)
    {
        string strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.PriorID = " + strPriorID;
        DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
        IList lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void BT_UpdateAssign_Click(object sender, EventArgs e)
    {
        string strHQL, strID;
        IList lst;

        strID = LB_ID.Text.Trim();

        string strPriorID = LB_AssignID.Text.Trim();

        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.ID = " + strID;
        DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
        DefectAssignRecord defectAssignRecord = new DefectAssignRecord();
        lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
        defectAssignRecord = (DefectAssignRecord)lst[0];

        defectAssignRecord.Type = LB_Type.Text.Trim();
        defectAssignRecord.OperatorContent = "";

        if (strIsMobileDevice == "YES")
        {
            defectAssignRecord.Operation = HT_Operation.Text.Trim();
        }
        else
        {
            defectAssignRecord.Operation = HE_Operation.Text.Trim();
        }
        defectAssignRecord.OperatorCode = TB_ReceiverCode.Text.Trim();
        defectAssignRecord.OperatorName = ShareClass.GetUserName(TB_ReceiverCode.Text.Trim());
        defectAssignRecord.BeginDate = DateTime.Parse(DLC_BeginDate.Text);
        defectAssignRecord.EndDate = DateTime.Parse(DLC_EndDate.Text);

        try
        {
            defectAssignRecordBLL.UpdateDefectAssignRecord(defectAssignRecord, int.Parse(strID));
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

        strHQL = "from DefectAssignRecord as defectAssignRecord where defectAssignRecord.ID = " + strID;
        DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
        DefectAssignRecord defectAssignRecord = new DefectAssignRecord();
        lst = defectAssignRecordBLL.GetAllDefectAssignRecords(strHQL);
        defectAssignRecord = (DefectAssignRecord)lst[0];

        try
        {
            defectAssignRecordBLL.DeleteDefectAssignRecord(defectAssignRecord);
            LoadChildRecord(strPriorID);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }
    }


    protected void UpdateDefectStatus(string strDefectID, string strStatus)
    {
        string strHQL = "from ProjectDefect as projectDefect where projectDefect.DefectID = " + strDefectID;
        DefectmentBLL defectmentBLL = new DefectmentBLL();
        IList lst = defectmentBLL.GetAllDefectments(strHQL);

        Defectment defectment = (Defectment)lst[0];

        defectment.Status = strStatus;

        defectmentBLL.UpdateDefectment(defectment, int.Parse(strDefectID));
    }

    protected Defectment GetAndLoadDefectment(string strDefectID)
    {
        string strHQL = "from Defectment as defectment where defectment.DefectID = " + strDefectID;
        DefectmentBLL defectmentBLL = new DefectmentBLL();

        IList lst = defectmentBLL.GetAllDefectments(strHQL);

        DataList3.DataSource = lst;
        DataList3.DataBind();

        Defectment defectment = (Defectment)lst[0];

        return defectment;
    }


}
