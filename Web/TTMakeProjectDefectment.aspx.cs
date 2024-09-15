using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class TTMakeProjectDefectment : System.Web.UI.Page
{
    string strProjectID;

    string strLangCode;
    string strIsMobileDevice;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();
        string strHQL;
        IList lst;

        string strUserName;

        strLangCode = Session["LangCode"].ToString();
        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        strProjectID = Request.QueryString["ProjectID"].Trim();

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
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

            strHQL = "from DefectType as defectType Order by defectType.SortNumber ASC";
            DefectTypeBLL defectTypeBLL = new DefectTypeBLL();
            lst = defectTypeBLL.GetAllDefectTypes(strHQL);
            DL_Type.DataSource = lst;
            DL_Type.DataBind();
            DL_Type.Items.Insert(0, new ListItem("--Select--", ""));

            ShareClass.InitialProjectMemberTree(TreeView1, strProjectID);

            LoadDefectment(strProjectID);

            //BusinessForm,列出业务表单类型 
            ShareClass.LoadWorkflowType(DL_WLType, strLangCode);
        }
    }


    protected void DL_AllowUpdate_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        string strDefectID, strAllowUpdate;

        strAllowUpdate = DL_AllowUpdate.SelectedValue;
        strDefectID = LB_DefectID.Text.Trim();

        try
        {
            strHQL = "Update T_RelatedBusinessForm Set AllowUpdate = '" + strAllowUpdate + "'  Where RelatedType = 'Defect' and RelatedID = " + strDefectID;
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Update T_RelatedBusinessForm Set AllowUpdate = '" + strAllowUpdate + "'  Where RelatedType = 'DefectRecord' ";
            strHQL += " and RelatedID in (Select ID From T_DefectAssignRecord Where DefectID =  " + strDefectID + ")";
            ShareClass.RunSqlCommand(strHQL);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZGGSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_AllDefect_Click(object sender, EventArgs e)
    {
        LoadDefectment(strProjectID);
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        //BusinessForm，隐藏业务表单元素
        Panel_RelatedBusiness.Visible = false;

        LB_DefectID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strDefectID;

        strDefectID = LB_DefectID.Text.Trim();

        if (strDefectID == "")
        {
            AddDefectment();
        }
        else
        {
            UpdateDefectment();
        }
    }

    protected void AddDefectment()
    {
        string strDefectID;

        string strUserCode = LB_UserCode.Text.Trim();
        string strApplicantName;
        string strDefectType, strDefectName, strDefectDetail, strAcceptStandard;
        string strDefectFinishedDate, strApplicantCode, strStatus;
        DateTime dtMakeDate;

        strDefectType = DL_Type.SelectedValue;
        strDefectName = TB_DefectName.Text.Trim();
        strDefectDetail = TB_DefectDetail.Text.Trim();
        strAcceptStandard = TB_AcceptStandard.Text.Trim();
        strDefectFinishedDate = DLC_DefectFinishedDate.Text;
        strApplicantCode = strUserCode;
        strApplicantName = ShareClass.GetUserName(strUserCode);
        dtMakeDate = DateTime.Now;
        strStatus = "计划";

        if (strDefectName == "" | strDefectDetail == "" | strDefectFinishedDate == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXMXNRYWCRSLRBNWKJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
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
            defectment.ApplicantName = strApplicantName;
            defectment.Status = strStatus;

            try
            {
                defectmentBLL.AddDefectment(defectment);
                AddProjectRelatedDefect(strProjectID, strUserCode);

                strDefectID = ShareClass.GetMyCreatedMaxDefectID(strUserCode);
                LB_DefectID.Text = strDefectID;

                //分派缺限给自己
                AssignDefect(int.Parse(strDefectID), strDefectType, strDefectName);

                HL_RelatedDoc.NavigateUrl = "TTProjectRelatedDefectDoc.aspx?DefectID=" + strDefectID;
                HL_ApproveRecord.NavigateUrl = "TTDefectAssignRecord.aspx?DefectID=" + strDefectID;

                HL_DefectReview.Enabled = true;
                HL_DefectReview.NavigateUrl = "TTDefectReviewWL.aspx?DefectID=" + strDefectID;
                HL_WFTemName.Enabled = true;
                HL_WFTemName.NavigateUrl = "TTRelatedWorkFlowTemplate.aspx?RelatedType=Defect&RelatedID=" + strDefectID;

                HL_RunDefectByWF.Enabled = true;
                HL_RunDefectByWF.NavigateUrl = "TTRelatedDIYWorkFlowForm.aspx?RelatedType=Defect&RelatedID=" + strDefectID;

                HL_RelatedWorkFlowTemplate.Enabled = true;
                HL_RelatedWorkFlowTemplate.NavigateUrl = "TTAttachWorkFlowTemplate.aspx?RelatedType=Defect&RelatedID=" + strDefectID;
                HL_ActorGroup.Enabled = true;
                HL_ActorGroup.NavigateUrl = "TTRelatedActorGroup.aspx?RelatedType=Defect&RelatedID=" + strDefectID;

                HL_RelatedDoc.Enabled = true;
                HL_ApproveRecord.Enabled = true;

                BT_Close.Enabled = true;
                BT_Open.Enabled = true;
                BT_Assign.Enabled = true;

                LoadDefectment(strProjectID);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
    }

    //自动分派缺陷给创建者
    protected void AssignDefect(int intDefectID, string strType, string strDefectName)
    {
        int intPriorID;
        string strOperatorCode, strOperatorName, strAssignManCode, strAssignManName;

        DateTime dtBeginDate, dtEndDate, dtMakeDate;
        string strUserCode;

        strUserCode = LB_UserCode.Text.Trim();

        strOperatorCode = LB_UserCode.Text.Trim();
        strOperatorName = LB_UserName.Text.Trim();

        strAssignManCode = LB_UserCode.Text.Trim();
        strAssignManName = LB_UserName.Text.Trim();

        intPriorID = 0;
        dtBeginDate = DateTime.Parse(DLC_BeginDate.Text);
        dtEndDate = DateTime.Parse(DLC_EndDate.Text);
        dtMakeDate = DateTime.Now;

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
        defectAssignRecord.Operation = strDefectName;
        defectAssignRecord.PriorID = intPriorID;
        defectAssignRecord.RouteNumber = GetRouteNumber(intDefectID.ToString());
        defectAssignRecord.MakeDate = dtMakeDate;
        defectAssignRecord.Status = "待处理";
        defectAssignRecord.MoveTime = DateTime.Now;

        try
        {
            defectAssignRecordBLL.AddDefectAssignRecord(defectAssignRecord);

            string strAssignID = ShareClass.GetMyCreatedMaxDefectAssignRecordID(intDefectID.ToString(), strUserCode);
            //BusinessForm,处理关联的业务表单数据
            ShareClass.InsertOrUpdateTaskAssignRecordWFXMLData("Defect", intDefectID.ToString(), "DefectRecord", strAssignID, strUserCode);

            UpdateDefectStatus(intDefectID.ToString(), "处理中");
        }
        catch
        {
        }
    }

    protected void UpdateDefectment()
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

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
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

                    //BusinessForm，关联相应的业务表单模板
                    ShareClass.SaveRelatedBusinessForm("Defect", strDefectID, DL_WFTemplate.SelectedValue, DL_AllowUpdate.SelectedValue, strUserCode);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

                    LoadDefectment(strProjectID);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWXXBNGXJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
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
                    LoadDefectment(strProjectID);
                    LB_Status.Text = ShareClass.GetStatusHomeNameByDefectmentStatus("关闭");

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

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
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
                LoadDefectment(strProjectID);
                LB_Status.Text = ShareClass.GetStatusHomeNameByDefectmentStatus("处理中");

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJHCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJHCCJC + "')", true);
            }
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode, strMakeUserCode, strHQL;
            string strStatus;
            string strDefectID, strDefectName;

            strUserCode = LB_UserCode.Text.Trim();

            strDefectID = e.Item.Cells[3].Text.Trim();

            if (e.CommandName == "Update" | e.CommandName == "Assign")
            {
                strHQL = "from  Defectment as defectment where defectment.DefectID= " + strDefectID;

                DefectmentBLL defectmentBLL = new DefectmentBLL();

                IList lst = defectmentBLL.GetAllDefectments(strHQL);

                for (int i = 0; i < DataGrid1.Items.Count; i++)
                {
                    DataGrid1.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                Defectment defectment = (Defectment)lst[0];

                strDefectName = defectment.DefectName.Trim();
                strMakeUserCode = defectment.ApplicantCode.Trim();

                LB_DefectID.Text = defectment.DefectID.ToString();
                DL_Type.SelectedValue = defectment.DefectType;
                TB_DefectName.Text = defectment.DefectName;
                TB_DefectDetail.Text = defectment.DefectDetail;
                TB_AcceptStandard.Text = defectment.AcceptStandard;
                DLC_DefectFinishedDate.Text = defectment.DefectFinishedDate.ToString("yyyy-MM-dd");
                LB_Status.Text = ShareClass.GetStatusHomeNameByDefectmentStatus(defectment.Status);
                strStatus = defectment.Status.Trim();

                HL_RelatedDoc.NavigateUrl = "TTProjectRelatedDefectDoc.aspx?DefectID=" + strDefectID;
                HL_ApproveRecord.NavigateUrl = "TTDefectAssignRecord.aspx?DefectID=" + strDefectID;

                HL_DefectReview.Enabled = true;
                HL_DefectReview.NavigateUrl = "TTDefectReviewWL.aspx?DefectID=" + strDefectID;
                HL_WFTemName.Enabled = true;
                HL_WFTemName.NavigateUrl = "TTRelatedWorkFlowTemplate.aspx?RelatedType=Defect&RelatedID=" + strDefectID;

                HL_RunDefectByWF.Enabled = true;
                HL_RunDefectByWF.NavigateUrl = "TTRelatedDIYWorkFlowForm.aspx?RelatedType=Defect&RelatedID=" + strDefectID;

                HL_RelatedWorkFlowTemplate.Enabled = true;
                HL_RelatedWorkFlowTemplate.NavigateUrl = "TTAttachWorkFlowTemplate.aspx?RelatedType=Defect&RelatedID=" + strDefectID;
                HL_ActorGroup.Enabled = true;
                HL_ActorGroup.NavigateUrl = "TTRelatedActorGroup.aspx?RelatedType=Defect&RelatedID=" + strDefectID;

                HL_RelatedDoc.Enabled = true;
                HL_ApproveRecord.Enabled = true;

                BT_Close.Enabled = true;
                BT_Open.Enabled = true;
                BT_Assign.Enabled = true;
                //BusinessForm，列出关联表单模板
                try
                {
                    Panel_RelatedBusiness.Visible = true;

                    string strTemName;
                    strHQL = "Select * From T_RelatedBusinessForm Where RelatedType = 'Defect' and RelatedID = " + strDefectID;
                    strHQL += " Order By CreateTime DESC";
                    DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_RelatedBusinessForm");

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        strTemName = ds.Tables[0].Rows[0]["TemName"].ToString().Trim();

                        DL_WLType.SelectedValue = ShareClass.GetWorkTemplateType(strTemName);
                        ShareClass.LoadWFTemplate(strUserCode, DL_WLType.SelectedValue.Trim(), DL_WFTemplate);
                        DL_WFTemplate.SelectedValue = strTemName;

                        DL_AllowUpdate.SelectedValue = ds.Tables[0].Rows[0]["AllowUpdate"].ToString().Trim();
                    }
                }
                catch
                {
                }

                //BusinessForm,装载关联信息
                TabContainer1.ActiveTabIndex = 0;
                ShareClass.LoadBusinessForm("Defect", strDefectID, DL_WFTemplate.SelectedValue.Trim(), IFrame_RelatedInformation);

                if (strStatus == "关闭")
                {
                    BT_Open.Enabled = true;
                }

                TB_Message.Text = ShareClass.GetUserName(strUserCode) + Resources.lang.GeiNiFenPaiLeQueXian + "：" + strDefectID + "  " + strDefectName + "，" + Resources.lang.QingJiShiChuLi;


                if (e.CommandName == "Update")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

                }

                if (e.CommandName == "Assign")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

                }
            }

            if (e.CommandName == "Delete")
            {
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

                            LoadDefectment(strProjectID);

                            LB_DefectID.Text = "";
                            TB_DefectName.Text = "";
                            TB_DefectDetail.Text = "";
                            TB_ReceiverCode.Text = "";
                            DLC_DefectFinishedDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                            TB_AcceptStandard.Text = "";
                            LB_Status.Text = ShareClass.GetStatusHomeNameByDefectmentStatus("计划");

                            HL_RelatedDoc.Enabled = false;
                            HL_ApproveRecord.Enabled = false;

                            BT_Close.Enabled = false;
                            BT_Open.Enabled = false;
                            BT_Assign.Enabled = false;
                            HL_DefectReview.Enabled = false;
                            HL_WFTemName.Enabled = false;
                            HL_RelatedWorkFlowTemplate.Enabled = false;
                            HL_ActorGroup.Enabled = false;
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
        }
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

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

        TreeView1.SelectedNode.Selected = false;
    }


    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        DefectmentBLL defectmentBLL = new DefectmentBLL();
        IList lst = defectmentBLL.GetAllDefectments(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
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

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

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

            string strAssignID = ShareClass.GetMyCreatedMaxDefectAssignRecordID(intDefectID.ToString(), strUserCode);
            //BusinessForm,处理关联的业务表单数据
            ShareClass.InsertOrUpdateTaskAssignRecordWFXMLData("Defect", intDefectID.ToString(), "DefectRecord", strAssignID, strUserCode);

            ShareClass.SendInstantMessage(Resources.lang.QueXianFenPaiTongZi, ShareClass.GetUserName(strUserCode) + Resources.lang.GeiNiFenPaiLeXuQiu + " :" + intDefectID.ToString() + "  " + strDefectName + "，" + Resources.lang.QingJiShiChuLi, strUserCode, strOperatorCode);

            TB_Message.Text = ShareClass.GetUserName(strUserCode) + Resources.lang.GeiNiFenPaiLeQueXian + "：" + intDefectID.ToString() + "  " + strDefectName + "，" + Resources.lang.QingJiShiChuLi;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFPSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);
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

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);
    }

    protected void AddProjectRelatedDefect(string strProjectID, string strUserCode)
    {
        string strHQL;
        IList lst;
        string strDefectID;

        string strStatus = ShareClass.GetProjectStatus(strProjectID);

        if (strStatus == "挂起" || strStatus == "取消")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFJSBCXMYBGHX + "')", true);
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

    //BusinessForm,工作流类型查询
    protected void DL_WLType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL, strWLType;

        strWLType = DL_WLType.SelectedValue.Trim();
        if (string.IsNullOrEmpty(strWLType))
        {
            return;
        }
        strHQL = "Select TemName From T_WorkFlowTemplate Where type = " + "'" + strWLType + "'" + " and Visible = 'YES' and Authority = '所有'";
        strHQL += " Order by SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        DL_WFTemplate.DataSource = ds;
        DL_WFTemplate.DataBind();

        DL_WFTemplate.Items.Add(new ListItem(""));

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    //BusinessForm,启动关联的业务表单
    protected void BT_StartupBusinessForm_Click(object sender, EventArgs e)
    {
        string strURL;
        string strTemName, strIdentifyString;
        strTemName = DL_WFTemplate.SelectedValue.Trim();
        strIdentifyString = ShareClass.GetWLTemplateIdentifyString(strTemName);

        string strDefectID;
        strDefectID = LB_DefectID.Text.Trim();


        if (strDefectID == "")
        {
            strDefectID = "0";
        }

        //strURL = "popShowByURL(" + "'TTRelatedDIYBusinessForm.aspx?RelatedType=Defect&RelatedID=" + strDefectID + "&IdentifyString=" + strIdentifyString + "','" + Resources.lang.XiangGuanYeWuDan + "', 800, 600,window.location);";
        //ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop12", strURL, true);

        strURL = "TTRelatedDIYBusinessForm.aspx?RelatedType=Defect&RelatedID=" + strDefectID + "&IdentifyString=" + strIdentifyString;
        IFrame_RelatedInformation.Attributes.Add("src", strURL);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    //BusinessForm,删除关联的业务表单
    protected void BT_DeleteBusinessForm_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strTemName;
        strTemName = DL_WFTemplate.SelectedValue.Trim();

        string strDefectID;
        strDefectID = LB_DefectID.Text.Trim();

        strHQL = "Delete From T_RelatedBusinessForm Where RelatedType = 'Defect' and RelatedID = " + strDefectID;

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
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

    protected void LoadDefectment(string strProjectID)
    {
        string strHQL, strUserCode, strPMCode, strCreatorCode;
        IList lst;

        strUserCode = LB_UserCode.Text.Trim();

        Project project = ShareClass.GetProject(strProjectID);
        strPMCode = project.PMCode.Trim();
        strCreatorCode = project.UserCode.Trim();

        if (strUserCode == strPMCode | strUserCode == strCreatorCode)
        {
            strHQL = "from Defectment as defectment where ";
            strHQL += " defectment.DefectID in (Select relatedDefect.DefectID from RelatedDefect as relatedDefect Where relatedDefect.ProjectID = " + "'" + strProjectID + "'" + ")";
            strHQL += " order by defectment.DefectID DESC";
        }
        else
        {
            strHQL = "from Defectment as defectment where defectment.ApplicantCode = " + "'" + strUserCode + "'";
            strHQL += " and defectment.DefectID in (Select relatedDefect.DefectID from RelatedDefect as relatedDefect Where relatedDefect.ProjectID = " + "'" + strProjectID + "'" + ")";
            strHQL += " order by defectment.DefectID DESC";
        }

        DefectmentBLL defectmentBLL = new DefectmentBLL();
        lst = defectmentBLL.GetAllDefectments(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void BT_Select_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop1", "popShow('popAssignWindow','true') ", true);
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop2", "popShow('popSelectwindow','false') ", true);
    }
    
}
