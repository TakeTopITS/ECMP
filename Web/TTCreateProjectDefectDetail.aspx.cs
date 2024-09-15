using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Web.UI;

public partial class TTCreateProjectDefectDetail : System.Web.UI.Page
{
    string strProjectID;
    string strIsMobileDevice;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strUserName;
        string strHQL;
        IList lst;

        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        string strDefectID = Request.QueryString["DefectID"];

        strProjectID = GetDefectRelatedProjectID(strDefectID);

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;

        //this.Title = "建立和分派项目需求";

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

            DLC_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_DefectFinishedDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strHQL = "from DefectType as reqType Order by reqType.SortNumber ASC";
            DefectTypeBLL reqTypeBLL = new DefectTypeBLL();
            lst = reqTypeBLL.GetAllDefectTypes(strHQL);
            DL_Type.DataSource = lst;
            DL_Type.DataBind();

            ShareClass.InitialProjectMemberTree(TreeView1, strProjectID);

            LoadProjectRelatedDefect(strDefectID, strUserCode);

            HL_DefectToTask.NavigateUrl = "TTDefectToTask.aspx?DefectID=" + strDefectID + "&ProjectID=" + strProjectID;
        }
    }

    protected void BT_Update_Click(object sender, EventArgs e)
    {
        string strUserCode = LB_UserCode.Text.Trim();
        string strDefectType, strDefectName, strDefectDetail, strAcceptStandard;
        string strDefectFinishedDate, strApplicantCode, strStatus;
        DateTime dtMakeDate;

        string strDefectID = LB_DefectID.Text.Trim();

        strDefectType = DL_Type.SelectedValue;
        strDefectName = TB_DefectName.Text.Trim();
        strDefectDetail = TB_DefectDetail.Text.Trim();
        strAcceptStandard = TB_AcceptStandard.Text.Trim();
        strDefectFinishedDate = DLC_DefectFinishedDate.Text;
        strApplicantCode = strUserCode;
        dtMakeDate = DateTime.Now;
        strStatus = LB_Status.Text.Trim();

        if (strDefectID != "")
        {
            if (strDefectName == "" | strDefectDetail == "" | strDefectFinishedDate == "")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMXNRYWCRSLRBNWKJC + "')", true);
            }
            else
            {
                Defectment defectment = new Defectment();
                DefectmentBLL defectmentBLL = new DefectmentBLL();

                defectment.DefectType = strDefectType;
                defectment.DefectName = strDefectName;
                defectment.DefectDetail = strDefectDetail;
                defectment.AcceptStandard = strAcceptStandard;
                defectment.DefectFinishedDate = DateTime.Parse(strDefectFinishedDate);
                defectment.MakeDate = dtMakeDate;
                defectment.ApplicantCode = strApplicantCode;
                defectment.ApplicantName = ShareClass.GetUserName(strApplicantCode);
                defectment.Status = strStatus;

                try
                {
                    defectmentBLL.UpdateDefectment(defectment, int.Parse(strDefectID));

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
                }
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWXXBNGXJC + "')", true);
        }
    }

    protected void BT_Close_Click(object sender, EventArgs e)
    {
        string strUserCode = LB_UserCode.Text.Trim();
        string strDefectType, strDefectName, strDefectDetail, strAcceptStandard;
        string strDefectFinishedDate, strReceiverCode, strApplicantCode, strStatus;
        DateTime dtMakeDate;

        string strDefectID = LB_DefectID.Text.Trim();

        strDefectType = DL_Type.SelectedValue;
        strDefectName = TB_DefectName.Text.Trim();
        strDefectDetail = TB_DefectDetail.Text.Trim();
        strAcceptStandard = TB_AcceptStandard.Text.Trim();
        strDefectFinishedDate = DLC_DefectFinishedDate.Text;
        strReceiverCode = TB_ReceiverCode.Text.Trim();
        strApplicantCode = strUserCode;
        dtMakeDate = DateTime.Now;
        strStatus = LB_Status.Text.Trim();

        if (strDefectID != "")
        {
            if (strDefectName == "" | strDefectDetail == "" | strDefectFinishedDate == "")
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMXNRYWCRSLRBNWKJC + "')", true);
            }
            else
            {
                Defectment defectment = new Defectment();
                DefectmentBLL defectmentBLL = new DefectmentBLL();

                defectment.DefectType = strDefectType;
                defectment.DefectName = strDefectName;
                defectment.DefectDetail = strDefectDetail;
                defectment.AcceptStandard = strAcceptStandard;
                defectment.DefectFinishedDate = DateTime.Parse(strDefectFinishedDate);
                defectment.MakeDate = dtMakeDate;
                defectment.ApplicantCode = strApplicantCode;
                defectment.ApplicantName = ShareClass.GetUserName(strApplicantCode);
                defectment.Status = "关闭";

                try
                {
                    defectmentBLL.UpdateDefectment(defectment, int.Parse(strDefectID));

                    LB_Status.Text = "关闭";

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXGBCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXGBCCJC + "')", true);
                }
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWXXBNGXJC + "')", true);
        }
    }

    protected void BT_Open_Click(object sender, EventArgs e)
    {
        string strUserCode = LB_UserCode.Text.Trim();
        string strDefectType, strDefectName, strDefectDetail, strAcceptStandard;
        string strDefectFinishedDate, strReceiverCode, strApplicantCode, strStatus;
        DateTime dtMakeDate;

        string strDefectID = LB_DefectID.Text.Trim();

        strDefectType = DL_Type.SelectedValue;
        strDefectName = TB_DefectName.Text.Trim();
        strDefectDetail = TB_DefectDetail.Text.Trim();
        strAcceptStandard = TB_AcceptStandard.Text.Trim();
        strDefectFinishedDate = DLC_DefectFinishedDate.Text;
        strReceiverCode = TB_ReceiverCode.Text.Trim();
        strApplicantCode = strUserCode;
        dtMakeDate = DateTime.Now;
        strStatus = LB_Status.Text.Trim();


        if (strDefectName == "" | strDefectDetail == "" | strDefectFinishedDate == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMXNRYWCRSLRBNWKJC + "')", true);
        }
        else
        {
            Defectment defectment = new Defectment();
            DefectmentBLL defectmentBLL = new DefectmentBLL();

            defectment.DefectType = strDefectType;
            defectment.DefectName = strDefectName;
            defectment.DefectDetail = strDefectDetail;
            defectment.AcceptStandard = strAcceptStandard;
            defectment.DefectFinishedDate = DateTime.Parse(strDefectFinishedDate);
            defectment.MakeDate = dtMakeDate;
            defectment.ApplicantCode = strApplicantCode;
            defectment.ApplicantName = ShareClass.GetUserName(strApplicantCode);
            defectment.Status = "处理中";

            try
            {
                defectmentBLL.UpdateDefectment(defectment, int.Parse(strDefectID));

                LB_Status.Text = "处理中";

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJHCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJHCCJC + "')", true);
            }
        }
    }

    protected void BT_Select_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void LoadProjectRelatedDefect(string strDefectID, string strUserCode)
    {
        string strMakeUserCode, strHQL;
        string strStatus;
        string strDefectName;

        strHQL = "from  Defectment as defectment where defectment.DefectID= " + strDefectID;
        DefectmentBLL defectmentBLL = new DefectmentBLL();
        IList lst = defectmentBLL.GetAllDefectments(strHQL);
        Defectment defectment = (Defectment)lst[0];

        strDefectName = defectment.DefectName.Trim();
        strMakeUserCode = defectment.ApplicantCode.Trim();

        LB_DefectID.Text = defectment.DefectID.ToString();
        DL_Type.SelectedValue = defectment.DefectType;
        TB_DefectName.Text = defectment.DefectName;
        TB_DefectDetail.Text = defectment.DefectDetail;
        TB_AcceptStandard.Text = defectment.AcceptStandard;
        DLC_DefectFinishedDate.Text = defectment.DefectFinishedDate.ToString("yyyy-MM-dd");
        LB_Status.Text = defectment.Status;
        strStatus = defectment.Status.Trim();

        HL_RelatedDoc.NavigateUrl = "";
        HL_RelatedDoc.NavigateUrl = "TTDefectRelatedDoc.aspx?DefectID=" + strDefectID;
        HL_ApproveRecord.NavigateUrl = "";
        HL_ApproveRecord.NavigateUrl = "TTDefectAssignRecord.aspx?DefectID=" + strDefectID;

        HL_DefectReview.Enabled = true;
        HL_DefectReview.NavigateUrl = "TTDefectReviewWL.aspx?DefectID=" + strDefectID;
        HL_WFTemName.Enabled = true;
        HL_WFTemName.NavigateUrl = "TTRelatedWorkFlowTemplate.aspx?RelatedType=Defect&RelatedID=" + strDefectID;

        HL_RelatedWorkFlowTemplate.Enabled = true;
        HL_RelatedWorkFlowTemplate.NavigateUrl = "TTAttachWorkFlowTemplate.aspx?RelatedType=Defect&RelatedID=" + strDefectID;
        HL_ActorGroup.Enabled = true;
        HL_ActorGroup.NavigateUrl = "TTRelatedActorGroup.aspx?RelatedType=Defect&RelatedID=" + strDefectID;

        HL_RelatedDoc.Enabled = true;
        HL_ApproveRecord.Enabled = true;

        BT_Update.Enabled = true;
        BT_Delete.Enabled = true;
        BT_Close.Enabled = true;
        BT_Open.Enabled = true;
        BT_Assign.Enabled = true;

        if (strStatus == "关闭")
        {
            BT_Open.Enabled = true;
        }

        TB_Message.Text = ShareClass.GetUserName(strUserCode) + " 给你分派了需求：" + strDefectID + "  " + strDefectName + "，请及时受理！";
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL, strID, strUserCode, strUserName;
        IList lst;

        strID = TreeView1.SelectedNode.Target.Trim();

        try
        {
            strID = int.Parse(strID).ToString();

            strHQL = "from ProRelatedUser as proRelatedUser Where proRelatedUser.ID = " + strID;
            ProRelatedUserBLL proRelatedUserBLL = new ProRelatedUserBLL();
            lst = proRelatedUserBLL.GetAllProRelatedUsers(strHQL);

            if (lst.Count > 0)
            {
                ProRelatedUser proRelatedUser = (ProRelatedUser)lst[0];

                strUserCode = proRelatedUser.UserCode.Trim();
                strUserName = proRelatedUser.UserName.Trim();

                LB_ReceiverName.Visible = true;

                TB_ReceiverCode.Text = strUserCode;
                LB_ReceiverName.Text = strUserName;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWDJCYMCJD + "')", true);
            }
        }
        catch
        {
        }

        TreeView1.SelectedNode.Selected = false;
    }

    protected void BT_Delete_Click(object sender, EventArgs e)
    {
        string strDefectID = LB_DefectID.Text.Trim();
        string strHQL;
        IList lst;

        if (strDefectID != "")
        {
            strHQL = "from Approve as approve where approve.Type = '需求' and approve.RelatedID = " + strDefectID;
            ApproveBLL approveBLL = new ApproveBLL();
            lst = approveBLL.GetAllApproves(strHQL);

            if (lst.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCXCZSPJLBNSC + "')", true);
            }
            else
            {
                Defectment defectment = new Defectment();
                DefectmentBLL defectmentBLL = new DefectmentBLL();

                defectment.DefectID = int.Parse(strDefectID);

                try
                {
                    defectmentBLL.DeleteDefectment(defectment);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);


                    LB_DefectID.Text = "";
                    TB_DefectName.Text = "";
                    TB_DefectDetail.Text = "";
                    TB_ReceiverCode.Text = "";
                    DLC_DefectFinishedDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                    TB_AcceptStandard.Text = "";
                    LB_Status.Text = "计划";
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWXXBNSCJC + "')", true);
        }
    }

    protected void BT_Assign_Click(object sender, EventArgs e)
    {
        int intDefectID, intPriorID;
        string strDefectName, strOperatorCode, strOperatorName, strAssignManCode, strAssignManName;
        string strOperation, strType;
        DateTime dtBeginDate, dtEndDate, dtMakeDate;
        string strUserCode;

        strUserCode = LB_UserCode.Text.Trim();
        intDefectID = int.Parse(LB_DefectID.Text.Trim());
        strType = DL_Type.SelectedValue.Trim();
        strDefectName = TB_DefectName.Text.Trim();
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

        intPriorID = 0;
        dtBeginDate = DateTime.Parse(DLC_BeginDate.Text);
        dtEndDate = DateTime.Parse(DLC_EndDate.Text);
        dtMakeDate = DateTime.Now;

        if (strOperation == "" | strOperatorCode == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPSBFPRYJGZYHSLRBNWKJC + "')", true);
            return;
        }

        DefectAssignRecordBLL defectAssignRecordBLL = new DefectAssignRecordBLL();
        DefectAssignRecord defectAssignRecord = new DefectAssignRecord();

        defectAssignRecord.DefectID = intDefectID;
        defectAssignRecord.Type = strType;
        defectAssignRecord.DefectName = strDefectName;
        defectAssignRecord.OperatorCode = strOperatorCode;
        defectAssignRecord.OperatorName = strOperatorName;
        defectAssignRecord.OperatorContent = "";
        defectAssignRecord.OperationTime = DateTime.Now;
        defectAssignRecord.BeginDate = dtBeginDate;
        defectAssignRecord.EndDate = dtEndDate;
        defectAssignRecord.AssignManCode = strAssignManCode;
        defectAssignRecord.AssignManName = strAssignManName;
        defectAssignRecord.Content = "";
        defectAssignRecord.Operation = strOperation;
        defectAssignRecord.PriorID = intPriorID;
        defectAssignRecord.RouteNumber = GetRouteNumber(intDefectID.ToString());
        defectAssignRecord.MakeDate = dtMakeDate;
        defectAssignRecord.Status = "待处理";
        defectAssignRecord.MoveTime = DateTime.Now;

        try
        {
            defectAssignRecordBLL.AddDefectAssignRecord(defectAssignRecord);
            UpdateDefectStatus(intDefectID.ToString(), "处理中");

            TB_Message.Text = ShareClass.GetUserName(strUserCode) + " 分派了需求：" + intDefectID.ToString() + " " + strDefectName + " 给你，请及时受理！";

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPSBJC + "')", true);
        }
    }

    protected void BT_Send_Click(object sender, EventArgs e)
    {
        string strSubject, strMsg;
        string strOperatorCode, strUserCode;

        strUserCode = LB_UserCode.Text.Trim();

        strOperatorCode = TB_ReceiverCode.Text.Trim();

        Msg msg = new Msg();

        if (CB_SendMsg.Checked == true | CB_SendMail.Checked == true)
        {
            strSubject = "需求分派通知";
            strMsg = TB_Message.Text.Trim();

            if (CB_SendMsg.Checked == true)
            {
                msg.SendMSM("Message",strOperatorCode, strMsg, strUserCode);
            }

            if (CB_SendMail.Checked == true)
            {
                msg.SendMail(strOperatorCode, strSubject, strMsg, strUserCode);
            }
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFSWB + "')", true);
    }

    protected void AddProjectRelatedDefect(string strProjectID, string strUserCode)
    {
        string strHQL;
        IList lst;
        string strDefectID;

        string strStatus = ShareClass.GetProjectStatus(strProjectID);

        if (strStatus == "结案" || strStatus == "挂起" || strStatus == "取消")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFJSBCXMYBJAGHX + "')", true);
        }
        else
        {
            strHQL = "from Defectment as defectment where defectment.ApplicantCode = " + "'" + strUserCode + "'" + " Order By DefectID DESC";
            DefectmentBLL defectmentBLL = new DefectmentBLL();
            lst = defectmentBLL.GetAllDefectments(strHQL);
            Defectment defectment = (Defectment)lst[0];

            strDefectID = defectment.DefectID.ToString();

            RelatedDefectBLL relatedDefectBLL = new RelatedDefectBLL();
            strHQL = "from RelatedDefect as relatedDefect where relatedDefect.ProjectID = " + strProjectID + " and relatedDefect.DefectID = " + strDefectID;
            lst = relatedDefectBLL.GetAllRelatedDefects(strHQL);

            if (lst.Count == 0)
            {
                RelatedDefect relatedDefect = new RelatedDefect();

                relatedDefect.ProjectID = int.Parse(strProjectID);
                relatedDefect.DefectID = int.Parse(strDefectID);

                try
                {
                    relatedDefectBLL.AddRelatedDefect(relatedDefect);
                }
                catch
                {

                }
            }
            else
            {

            }
        }
    }

    protected void UpdateDefectStatus(string strDefectID, string strStatus)
    {
        string strHQL = "from Defectment as defectment where defectment.DefectID = " + strDefectID;
        DefectmentBLL defectmentBLL = new DefectmentBLL();
        IList lst = defectmentBLL.GetAllDefectments(strHQL);
        Defectment defectment = (Defectment)lst[0];
        defectment.Status = "处理中";

        int intRouteNumber = defectment.RouteNumber;
        defectment.RouteNumber = intRouteNumber + 1;

        try
        {
            defectmentBLL.UpdateDefectment(defectment, int.Parse(strDefectID));
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPSBJC + "')", true);
        }
    }

    private int GetRouteNumber(string strDefectID)
    {
        DefectmentBLL defectmentBLL = new DefectmentBLL();
        string strHQL = "from Defectment as defectment where defectment.DefectID = " + strDefectID;
        IList lst = defectmentBLL.GetAllDefectments(strHQL);

        Defectment defectment = (Defectment)lst[0];

        return defectment.RouteNumber + 1;
    }

    protected string GetDefectRelatedProjectID(string strDefectID)
    {
        string strHQL;
        IList lst;

        strHQL = "from RelatedDefect as relatedDefect where relatedDefect.DefectID = " + strDefectID;
        RelatedDefectBLL relatedDefectBLL = new RelatedDefectBLL();
        lst = relatedDefectBLL.GetAllRelatedDefects(strHQL);

        RelatedDefect relatedDefect = (RelatedDefect)lst[0];

        return relatedDefect.ProjectID.ToString();
    }
}
