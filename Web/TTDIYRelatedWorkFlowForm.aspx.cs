using System;
using System.Collections;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TakeTopCore;
using TakeTopWF;

using TakeTopInfoPathSoft.Service;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTDIYRelatedWorkFlowForm : System.Web.UI.Page
{
    //The variable PublishUrl is static, it is used to keep the publish url of the form template registered in TakeTopInfoPath Service.
    //private static string PublishUrl = null;
    //protected string uri = null;

    //private static string OldPublishUrl = null;
    //protected string OldUri = null;

    string PublishUrl = null;
    string uri = null;

    string OldPublishUrl = null;
    string OldUri = null;

    public string strUserCode, strCNRelatedType, strRelatedType, strRelatedID, strRelatedName = "";
    public string strProjectRelatedType, strProjectRelatedTypeCN, strProjectRelatedID, strBMBidSupplierRecordID, strBMBidPlanID, strBMBidPlanEnterCode, strBMBidPlanType, strBidType;
    public string strWLType, strTemName, strWLID;

    string strOriginRelatedType, strOriginRelateID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strRelatedType = Request.QueryString["RelatedType"].Trim();
        strRelatedID = Request.QueryString["RelatedID"].Trim();

        strOriginRelatedType = strRelatedType;
        strOriginRelateID = strRelatedID;

        strBidType = Request.QueryString["BMBidType"];

        if (strRelatedType == "Project")
        {
            strCNRelatedType = "项目";
            strRelatedName = ShareClass.GetProjectName(strRelatedID);

            strOriginRelatedType = "项目";
            strOriginRelateID = strRelatedID;

            strProjectRelatedType = strRelatedType;
            strProjectRelatedID = strRelatedID;

            //装载相应的业务数据
            try
            {
                LoadRelatedBusinessData(strRelatedType, strRelatedID);
            }
            catch
            {
            }
        }

        if (strRelatedType == "ProjectPlan")
        {
            strCNRelatedType = "计划";

            strProjectRelatedType = strRelatedType;
            strProjectRelatedTypeCN = "计划";
            strProjectRelatedID = strRelatedID;

            strOriginRelatedType = "计划";
            strOriginRelateID = strRelatedID;

            //装载相应的业务数据
            try
            {
                LoadRelatedBusinessData(strRelatedType, strRelatedID);
            }
            catch
            {
            }

            string strHQL;
            string strProjectID;
            strHQL = "Select ProjectID,Name From T_ImplePlan Where ID = " + strRelatedID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");
            strProjectID = ds.Tables[0].Rows[0]["ProjectID"].ToString().Trim();

            strRelatedType = "Project";
            strCNRelatedType = "项目";
            strRelatedID = strProjectID;
            strRelatedName = ds.Tables[0].Rows[0]["Name"].ToString().Trim();
        }

        if (strRelatedType == "ProjectTask")
        {
            strCNRelatedType = "任务";

            strProjectRelatedType = strRelatedType;
            strProjectRelatedTypeCN = "任务";
            strProjectRelatedID = strRelatedID;

            strOriginRelatedType = "任务";
            strOriginRelateID = strRelatedID;

            string strHQL;
            string strProjectID;
            strHQL = "Select ProjectID,Task From T_ProjectTask Where TaskID = " + strRelatedID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectTask");
            strProjectID = ds.Tables[0].Rows[0]["ProjectID"].ToString().Trim();

            strRelatedType = "Project";
            strCNRelatedType = "项目";
            strRelatedID = strProjectID;
            strRelatedName = ds.Tables[0].Rows[0]["Task"].ToString().Trim();
        }

        if (strRelatedType == "ProjectRisk")
        {
            strCNRelatedType = "风险";

            strProjectRelatedType = strRelatedType;
            strProjectRelatedTypeCN = "风险";
            strProjectRelatedID = strRelatedID;

            strOriginRelatedType = "风险";
            strOriginRelateID = strRelatedID;

            string strHQL;
            string strProjectID;
            strHQL = "Select ProjectID,Risk From T_ProjectRisk Where ID = " + strRelatedID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectRisk");
            strProjectID = ds.Tables[0].Rows[0]["ProjectID"].ToString().Trim();

            strRelatedType = "Project";
            strCNRelatedType = "项目";
            strRelatedID = strProjectID;
            strRelatedName = ds.Tables[0].Rows[0]["Risk"].ToString().Trim();
        }

        if (strRelatedType == "Req")
        {
            strCNRelatedType = "需求";
            strRelatedName = ShareClass.GetRequirement(strRelatedID).ReqName.Trim();

            strOriginRelatedType = "需求";
            strOriginRelateID = strRelatedID;
        }

        if (strRelatedType == "Constract")
        {
            strCNRelatedType = "合同";
            strRelatedName = GetConstractName(strRelatedID);

            strOriginRelatedType = "合同";
            strOriginRelateID = strRelatedID;

            //装载相应的业务数据
            try
            {
                LoadRelatedBusinessData(strRelatedType, strRelatedID);
            }
            catch
            {
            }
        }

        if (strRelatedType == "Tender")
        {
            strCNRelatedType = "投标";
            strRelatedName = GetTenderName(strRelatedID);

            strOriginRelatedType = "投标";
            strOriginRelateID = strRelatedID;

            //装载相应的业务数据
            try
            {
                LoadRelatedBusinessData(strRelatedType, strRelatedID);
            }
            catch
            {
            }
        }

        if (strRelatedType == "CustomerService")
        {
            strCNRelatedType = "客服评审";
            strRelatedName = "客服评审";

            strOriginRelatedType = "客服评审";
            strOriginRelateID = strRelatedID;
        }

        if (strRelatedType == "Supplier")
        {
            strCNRelatedType = "供应商";

            strOriginRelatedType = "供应商";
            strOriginRelateID = strRelatedID;
        }

        if (strRelatedType == "BMBidRecord" | strRelatedType == "BMBidType")
        {
            if (strRelatedType == "BMBidType")
            {
                strBMBidPlanID = strRelatedID;
                strBMBidPlanEnterCode = strUserCode;
                strBMBidPlanType = GetBMBidPlanType(strRelatedID);
            }
            else
            {
                strBMBidSupplierRecordID = strRelatedID;
                strRelatedID = GetBMBidPlanID(strBMBidSupplierRecordID);

                strBMBidPlanID = GetBMBidPlanID(strBMBidSupplierRecordID);
                strBMBidPlanType = GetBMBidPlanType(strBMBidPlanID);
                strBMBidPlanEnterCode = GetBMBidPlanEnterCode(strBMBidSupplierRecordID);
            }

            strRelatedType = "BMBidType";
            strCNRelatedType = "招标计划";

            strOriginRelatedType = "招标计划";
            strOriginRelateID = strRelatedID;
        }

        if (Page.IsPostBack == false)
        {
            try
            {
                //列出此计划关联的流程模板
                if (strProjectRelatedType != null & strProjectRelatedID != null)
                {
                    LoadWorkFlowTemplate(strProjectRelatedType, strProjectRelatedID);
                }
                else
                {
                    LoadWorkFlowTemplate(strRelatedType, strRelatedID);
                }
            }
            catch
            {
            }

            Session["AutoActiveWorkflow"] = "NO";

            LoadWorkFlowType(strRelatedType, strCNRelatedType, strRelatedID);

            HL_WLTem.NavigateUrl = "TTRelatedWorkFlowTemplate.aspx?RelatedType= " + strRelatedType + "&RelatedID=" + strRelatedID;

            //HL_AttachWFTemplate.NavigateUrl = "javascript:popShowByURL('TTAttachWorkFlowTemplate.aspx?RelatedType=" + strRelatedType + "&RelatedID=" + strRelatedID + "', 'workflow', '99%', '99%')";
            //HL_AttachWFTemplate.Target = "top";
            HL_AttachWFTemplate.NavigateUrl = "TTAttachWorkFlowTemplate.aspx?RelatedType=" + strRelatedType + "&RelatedID=" + strRelatedID;



            //列出关联的所有存在的工作流
            LoadWorkFlow();
        }
    }

    protected void BT_AttachWFTemplate_Click(object sender, EventArgs e)
    {
        string strURL = "TTAttachWorkFlowTemplate.aspx?RelatedType=" + strRelatedType + "&RelatedID=" + strRelatedID;

        ClientScript.RegisterStartupScript(this.GetType(), "HH99H", "<script>popShowByURLNoCloseButton('" + strURL + "');</script>");
    }


    protected void DL_WLType_SelectedIndexChanged(object sender, EventArgs e)
    {
        strWLType = DL_WLType.SelectedValue.Trim();

        LoadWorkFlowTemplate(strWLType);
        DL_WorkFlow.Items.Clear();

        LB_WLID.Text = "";

        TB_WorkFlowName.Text = "";
        TB_WLDescription.Text = "";
        HL_RelatedDoc.Enabled = false;

        //列表项增加提示
        //PreREnderListBox();
    }

    protected void DL_WorkFlowTemplate_SelectedIndexChanged(object sender, EventArgs e)
    {
        int intResult;

        if (PublishUrl != null)
        {
            TakeTopInfoPathService.Remove(PublishUrl);
            PublishUrl = null;
        }

        strTemName = DL_WorkFlowTemplate.SelectedValue.Trim();
        LB_TemName.Text = strTemName;

        try
        {
            //DL_WLType.SelectedValue =
            strWLType = GetWorkflowTemplateType(strTemName);

            //列出关联的此类型和模板所有工作流
            LoadWorkFlow(strWLType, strTemName);
        }
        catch
        {

        }

        Session["AutoActiveWorkflow"] = GetWorkflowTemplateAutoActive(strTemName);

        //如果是常规流程，那么打开新页面
        if (PopRegularWorkflowTemplateRelatedPage(strTemName) > 0)
        {
            return;
        }

        try
        {
            WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
            intResult = wfSubmitHandle.RegisterWorkFlowTemplate(strTemName, this.Context, this.uri, PublishUrl, xdoc, LB_XSNFile);

            PublishUrl = wfSubmitHandle.wfPublishUrl.ToString();
            uri = wfSubmitHandle.wfUri.ToString();

            OldPublishUrl = null;

            if (intResult == 0)
            {
                xdoc.Text = Resources.lang.CWXYMBWJBCZQJC;
                return;
            }

            if (intResult == -1)
            {
                xdoc.Text = Resources.lang.CWBDMBZCSBQJC;
                return;
            }

            LB_WLID.Text = "";

            TB_WorkFlowName.Text = strCNRelatedType + strRelatedID + strRelatedName + strTemName;

            if (strProjectRelatedType == "ProjectTask" | strProjectRelatedType == "ProjectPlan" | strProjectRelatedType == "ProjectRisk")
            {
                TB_WorkFlowName.Text = strProjectRelatedTypeCN + strProjectRelatedID + strRelatedName + strTemName;
            }

            if (strProjectRelatedType == "ProjectPlan")
            {
                TB_WorkFlowName.Text = Resources.lang.XiangMuJiHua + strOriginRelateID + strRelatedName + strTemName;
            }

            if (strRelatedType == "Constract")
            {
                strCNRelatedType = "合同";
                TB_WorkFlowName.Text = strCNRelatedType + GetConstractCode(strRelatedID) + strRelatedName + strTemName;
            }

            TB_WLDescription.Text = TB_WorkFlowName.Text;

            LB_PublishUrl.Text = PublishUrl;
            LB_Uri.Text = uri;

            HL_RelatedDoc.Enabled = false;
            BT_SaveXMLFile.Enabled = false;

            BT_Download.Enabled = true;
            BT_Upload.Enabled = true;

            HL_WFXSNFile.NavigateUrl = LB_XSNFile.Text;
            string strDesignType = ShareClass.GetWLTemplateDesignType(strTemName);
            if (strDesignType == "SL")
            {
                HL_WFChartView.NavigateUrl = "TTWFChartViewSL.aspx?WLID=0&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(strTemName);
            }
            if (strDesignType == "JS")
            {
                HL_WFChartView.NavigateUrl = "TTWFChartViewJS.aspx?WLID=0&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(strTemName);
            }
            //附加用户自定义的JSCode到页面
            WFShareClass.AttachUserJSCodeFromWFTemplate(strTemName, LIT_AttachUserJSCode, strUserCode, strRelatedType, strRelatedID, "");
            ClientScript.RegisterStartupScript(this.GetType(), "HH77H", "<script>jqueryDocumentReady();</script>");

            //附加工作流步骤用户自定义的JSCode到页面
            WFShareClass.AttachUserJSCodeFromWFTemplateStep(strTemName, "0", LIT_AttachUserWFStepJSCode, strUserCode);
            ClientScript.RegisterStartupScript(this.GetType(), "HH88H", "<script>setWorkflowForm();</script>");

            //列表项增加提示
            //PreREnderListBox();

        }
        catch (Exception err)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "HH99H", "<script>alert('警告，此流程模板没有关联自定义表单或模块页面，请检查！');</script>");
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }

    protected void DL_WorkFlow_SelectedIndexChanged(object sender, EventArgs e)
    {
        int intResult;

        strWLID = DL_WorkFlow.SelectedValue.Trim();
        LB_WLID.Text = strWLID;

        //如果是常规流程，那么打开新页面
        if (PopRegularWorkflow(strWLID) > 0)
        {
            return;
        }

        //如果数据库表中存在此工作流的数据，那么把表中数据附加到表单中
        int intMainTableID;
        string strWFXMLFile;

        strTemName = LB_TemName.Text.Trim();
        if (strTemName == "")
        {
            strTemName = GetWorkflowTemplate(strWLID);
        }
        LB_TemName.Text = strTemName;

        Session["AutoActiveWorkflow"] = ShareClass.GetWorkflowTemplateAutoActive(strTemName);


        intMainTableID = ShareClass.GetWorkflowMainTableID(strWLID);
        strWFXMLFile = Server.MapPath(ShareClass.GetWorkflowXMLFile(strWLID));

        TakeTopXML.TableConvertToFormByMainID(strWLID, intMainTableID, strTemName, strWFXMLFile);

        if (PublishUrl == null)
        {
            PublishUrl = LB_PublishUrl.Text.Trim();
        }

        if (this.uri == null)
        {
            this.uri = LB_Uri.Text.Trim();
        }

        WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
        intResult = wfSubmitHandle.SelectedWorkFlow(strWLID, DL_WorkFlow, LB_WLID, LB_XSNFile, TB_WorkFlowName,
            TB_WLDescription, xdoc, BT_SaveXMLFile, HL_RelatedDoc, HL_RedirectToMyWFDetail, this.Context, PublishUrl, this.uri);

        OldPublishUrl = wfSubmitHandle.wfOldPublishUrl.ToString();
        OldUri = wfSubmitHandle.wfOldUri.ToString();

        HL_OldWFXMLFile.NavigateUrl = LB_OldWFXMLFile.Text;

        BT_ExportFormToExcel.Enabled = true;
        BT_Download.Enabled = true;

        //HL_WorkflowProgressView.NavigateUrl = "TTWFChartViewJS.aspx?WLID=" + strWLID;

        if (intResult == 0)
        {
            xdoc.Text = Resources.lang.SBZGZLMBHSJWJBCZKNYBSCQJC;
        }

        //列表项增加提示
        //PreREnderListBox();


        string strDesignType = ShareClass.GetWLTemplateDesignType(strTemName);
        if (strDesignType == "SL")
        {
            HL_WFChartView.NavigateUrl = "TTWFChartViewSL.aspx?WLID=" + LB_WLID.Text + "&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(strTemName);
        }
        if (strDesignType == "JS")
        {
            HL_WFChartView.NavigateUrl = "TTWFChartViewJS.aspx?WLID=" + LB_WLID.Text + "&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(strTemName);
        }

        //附加用户自定义的JSCode到页面
        WFShareClass.AttachUserJSCodeFromWFTemplate(strTemName, LIT_AttachUserJSCode, strUserCode, strRelatedType, strRelatedID, "");
        ClientScript.RegisterStartupScript(this.GetType(), "HH77H", "<script>jqueryDocumentReady();</script>");

        //附加工作流步骤用户自定义的JSCode到页面
        WFShareClass.AttachUserJSCodeFromWFTemplateStep(strTemName, "0", LIT_AttachUserWFStepJSCode, strUserCode);
        ClientScript.RegisterStartupScript(this.GetType(), "HH88H", "<script>setWorkflowForm();</script>");
    }

    //装载相应的业务数据
    protected void LoadRelatedBusinessData(string strRelateType, string strRelatedID)
    {
        string strHQL;

        DataSet ds;

        if (strRelateType == "Constract")
        {
            strHQL = "select * from T_Constract where ConstractID = " + strRelatedID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_Constract");

            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        if (strRelateType == "Project")
        {
            strHQL = "select * from T_Project where ProjectID = " + strRelatedID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_Project");

            DataList2.DataSource = ds;
            DataList2.DataBind();
        }

        if (strRelateType == "ProjectPlan")
        {
            strHQL = "select * from T_ImplePlan where ID = " + strRelatedID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_ImplePlan");

            DataList3.DataSource = ds;
            DataList3.DataBind();
        }

        if (strRelateType == "Tender")
        {
            strHQL = "select * from T_Tender_HYYQ where ID = " + strRelatedID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_Tender_HYYQ");

            DataList4.DataSource = ds;
            DataList4.DataBind();
        }
    }

    //取得是否自动激活工作流
    public static string GetWorkflowTemplateAutoActive(string strTemName)
    {
        string strHQL;

        strHQL = "Select AutoActive From T_WorkFlowTemplate Where TemName = '" + strTemName + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");

        return ds.Tables[0].Rows[0][0].ToString().Trim();
    }

    //打开常规流程相关模板
    protected int PopRegularWorkflowTemplateRelatedPage(string strWFTemName)
    {
        string strHQL;
        string strPageName;

        strHQL = "Select * from T_WorkFlowTemplate where Visible = 'YES' and Type = " + "'" + strWLType + "'" + " and char_length(ltrim(rtrim(COALESCE(XSNFile,'')))) = 0 ";
        strHQL += " And  char_length(ltrim(rtrim(COALESCE(PageFile,'')))) > 0 And TemName = '" + strWFTemName + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        if (ds.Tables[0].Rows.Count > 0)
        {
            strPageName = ds.Tables[0].Rows[0]["PageFile"].ToString().Trim();

            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>popShowByURL('" + strPageName + "?RelatedType=" + strOriginRelatedType + "&RelatedID=" + strOriginRelateID + "','Workflow','99%', '99%');</script>");
            return ds.Tables[0].Rows.Count;
        }
        else
        {
            return 0;
        }
    }

    //打开流程相关页面
    protected int PopRegularWorkflow(string strWFID)
    {
        string strHQL;
        string strWFTemName;

        strWFTemName = ShareClass.GetWorkflowTemNameByWLID(strWFID);

        strHQL = "Select * from T_WorkFlowTemplate where char_length(ltrim(rtrim(COALESCE(XSNFile,'')))) = 0 ";
        strHQL += " And TemName = '" + strWFTemName + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        if (ds.Tables[0].Rows.Count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>popShowByURL('TTWorkFlowViewMain.aspx?WLID=" + strWFID + "','WorkFlow','99%','99%',window.location);</script>");

            return ds.Tables[0].Rows.Count;
        }
        else
        {
            return 0;
        }
    }

    protected void BT_ExportFormToExcel_Click(object sender, EventArgs e)
    {
        int intResult;

        strWLID = DL_WorkFlow.SelectedValue.Trim();
        LB_WLID.Text = strWLID;

        string strWFName = strWLID + DL_WorkFlow.SelectedItem.Text;

        //如果数据库表中存在此工作流的数据，那么把表中数据附加到表单中
        int intMainTableID;
        string strWFXMLFile;
        strTemName = DL_WorkFlowTemplate.SelectedValue.Trim();
        intMainTableID = ShareClass.GetWorkflowMainTableID(strWLID);
        strWFXMLFile = Server.MapPath(ShareClass.GetWorkflowXMLFile(strWLID));
        TakeTopXML.TableConvertToFormByMainID(strWLID, intMainTableID, strTemName, strWFXMLFile);

        if (PublishUrl == null)
        {
            PublishUrl = LB_PublishUrl.Text.Trim();
        }

        if (this.uri == null)
        {
            this.uri = LB_Uri.Text.Trim();
        }

        string strExportFileURL = "Doc\\XML\\" + strWFName + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".xls";

        WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
        intResult = wfSubmitHandle.ExportFormToExcel(strWLID, DL_WorkFlow, LB_WLID, LB_XSNFile, TB_WorkFlowName,
            TB_WLDescription, xdoc, BT_SaveXMLFile, HL_RelatedDoc, HL_RedirectToMyWFDetail, this.Context, PublishUrl, this.uri, strExportFileURL);

        if (intResult == 1)
        {
            HL_ExportFileURL.NavigateUrl = strExportFileURL;
            HL_ExportFileURL.Text = strWFName + ".xls";

            ReloadWorkflowDataToForm(strWLID, strTemName);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ShiBai + "');</script>");
        }
    }

    protected void ReloadWorkflowDataToForm(string strWLID, string strTemName)
    {
        int intResult;


        LB_WLID.Text = strWLID;

        //如果数据库表中存在此工作流的数据，那么把表中数据附加到表单中
        int intMainTableID;
        string strWFXMLFile;

        intMainTableID = ShareClass.GetWorkflowMainTableID(strWLID);
        strWFXMLFile = Server.MapPath(ShareClass.GetWorkflowXMLFile(strWLID));
        TakeTopXML.TableConvertToFormByMainID(strWLID, intMainTableID, strTemName, strWFXMLFile);

        if (PublishUrl == null)
        {
            PublishUrl = LB_PublishUrl.Text.Trim();
        }

        if (this.uri == null)
        {
            this.uri = LB_Uri.Text.Trim();
        }

        WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
        intResult = wfSubmitHandle.SelectedWorkFlow(strWLID, DL_WorkFlow, LB_WLID, LB_XSNFile, TB_WorkFlowName,
            TB_WLDescription, xdoc, BT_SaveXMLFile, HL_RelatedDoc, HL_RedirectToMyWFDetail, this.Context, PublishUrl, this.uri);

        OldPublishUrl = wfSubmitHandle.wfOldPublishUrl.ToString();
        OldUri = wfSubmitHandle.wfOldUri.ToString();

        HL_OldWFXMLFile.NavigateUrl = LB_OldWFXMLFile.Text;
        BT_ExportFormToExcel.Enabled = true;

        if (intResult == 0)
        {
            xdoc.Text = Resources.lang.SBZGZLMBHSJWJBCZKNYBSCQJC;
        }
    }

    protected void BT_ActiveYes_Click(object sender, EventArgs e)
    {
        string strXSNFile, strWLTemName = "";
        string strWorkFlowName, strDescription, strIsPlanMainWorkflow;
        int intWLID;

        strWLID = "0";
        strWLType = DL_WLType.SelectedValue.Trim();


        strWorkFlowName = TB_WorkFlowName.Text.Trim();

        strWLTemName = LB_TemName.Text.Trim();

        if (strWLTemName == "" | strWLTemName == null)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSSCSBLCMBBNWKJC + "');</script>");
            return;
        }

        if (strWLType == "")
        {
            strWLType = GetWorkflowTemplateType(strWLTemName);
        }

        strDescription = TB_WLDescription.Text.Trim();
        strXSNFile = GetWorkTemplateXSNFile(strWLTemName);
        strIsPlanMainWorkflow = "YES";

        if (PublishUrl == OldPublishUrl | OldPublishUrl == null)
        {
            if (PublishUrl == null)
            {
                PublishUrl = LB_PublishUrl.Text.Trim();
            }

            if (this.uri == null)
            {
                this.uri = LB_Uri.Text.Trim();
            }

            WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();

            if (strProjectRelatedType == "ProjectTask" | strProjectRelatedType == "ProjectPlan" | strProjectRelatedType == "ProjectRisk")
            {
                intWLID = wfSubmitHandle.SubmitApplyForDIYForm(strWLType, strWLTemName, strXSNFile, strWLID, strWorkFlowName, strDescription, strProjectRelatedTypeCN, int.Parse(strProjectRelatedID), strUserCode, strIsPlanMainWorkflow,
                     CB_SMS, CB_Mail, LB_WLID, HL_RelatedDoc, HL_RedirectToMyWFDetail, BT_SaveXMLFile, DL_WorkFlow, PublishUrl, this.uri, this.Context, xdoc);
            }
            else
            {
                intWLID = wfSubmitHandle.SubmitApplyForDIYForm(strWLType, strWLTemName, strXSNFile, strWLID, strWorkFlowName, strDescription, strCNRelatedType, int.Parse(strRelatedID), strUserCode, strIsPlanMainWorkflow,
                     CB_SMS, CB_Mail, LB_WLID, HL_RelatedDoc, HL_RedirectToMyWFDetail, BT_SaveXMLFile, DL_WorkFlow, PublishUrl, this.uri, this.Context, xdoc);
            }

            strWLID = intWLID.ToString();

            if (intWLID <= 0)
            {
                if (intWLID == 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSSCSBLCMBBNWKJC + "');</script>");
                }

                if (intWLID == -1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBXYSJWJBNCGBCJC + "');</script>");
                }

                if (intWLID == -2)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBBNSCXGZLJC + "');</script>");
                }

                if (intWLID == -3)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBGZLMCHMSBNWKJC + "');</script>");
                }

                try
                {
                    wfSubmitHandle.ReLoadFormDataBeforeSubmit(this.Context, LB_PublishUrl.Text.Trim(), LB_Uri.Text.Trim(), xdoc);
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZJGZXJZTJSJSBJC + "');</script>");
                }
            }
            else
            {
                //赋全局变量给工作流XML文件
                try
                {
                    wfSubmitHandle.AddGlobalVariable(strWLTemName, strWLID, strRelatedType, strRelatedID, "");
                }
                catch (Exception ex)
                {

                }

                try
                {
                    //同步表单数据到相应的数据库表
                    TakeTopXML.FormConvertToTable(int.Parse(strWLID), 0);

                    //保存表单数据到数据库
                    ClientScript.RegisterStartupScript(this.GetType(), "SaveData", "<script>saveWFFormDataToDatabase(" + intWLID.ToString() + ");</script>");
                }
                catch
                {
                }

                new System.Threading.Thread(delegate ()
                {
                    try
                    {
                        //保存自定义表单数据到统一流程数据表，用于数据分析用
                        string strWFXMLFile = ShareClass.GetWorkflowXMLFile(strWLID);
                        XmlDbWorker.AddFormFromXml(Server.MapPath(strWFXMLFile), int.Parse(strWLID), strWLTemName);
                    }
                    catch
                    {
                    }

                }).Start();

                //HL_RelatedDoc.NavigateUrl = "javascript:popShowByURL('" + HL_RelatedDoc.NavigateUrl + "','ChartView','99%','99%',window.location);";

                string strURL = "<script>top.frames[0].frames[2].parent.frames['rightTabFrame'].popShowByURL('TTMyWorkDetailMain.aspx?RelatedType=Other&WLID=" + strWLID + "','Active Workflow', 800, 600,window.location);</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "Sav899eData", strURL);
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBZZXMBTXGZLS + "');</script>");
        }
    }

    protected void BT_ActiveNo_Click(object sender, EventArgs e)
    {
        string strXSNFile, strWLTemName = "";
        string strWorkFlowName, strDescription, strIsPlanMainWorkflow;
        int intWLID;

        strWLID = "0";
        strWLType = DL_WLType.SelectedValue.Trim();

        strWorkFlowName = TB_WorkFlowName.Text.Trim();

        strWLTemName = LB_TemName.Text.Trim();

        if (strWLTemName == "" | strWLTemName == null)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSSCSBLCMBBNWKJC + "');</script>");
            return;
        }

        if (strWLType == "")
        {
            strWLType = GetWorkflowTemplateType(strWLTemName);
        }

        strDescription = TB_WLDescription.Text.Trim();
        strXSNFile = GetWorkTemplateXSNFile(strWLTemName);

        strIsPlanMainWorkflow = "YES";

        if (PublishUrl == OldPublishUrl | OldPublishUrl == null)
        {
            if (PublishUrl == null)
            {
                PublishUrl = LB_PublishUrl.Text.Trim();
            }

            if (this.uri == null)
            {
                this.uri = LB_Uri.Text.Trim();
            }

            WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();

            if (strProjectRelatedType == "ProjectTask" | strProjectRelatedType == "ProjectPlan" | strProjectRelatedType == "ProjectRisk")
            {
                intWLID = wfSubmitHandle.SubmitApplyForDIYForm(strWLType, strWLTemName, strXSNFile, strWLID, strWorkFlowName, strDescription, strProjectRelatedTypeCN, int.Parse(strProjectRelatedID), strUserCode, strIsPlanMainWorkflow,
                 CB_SMS, CB_Mail, LB_WLID, HL_RelatedDoc, HL_RedirectToMyWFDetail, BT_SaveXMLFile, DL_WorkFlow, PublishUrl, this.uri, Context, xdoc);
            }
            else
            {
                intWLID = wfSubmitHandle.SubmitApplyForDIYForm(strWLType, strWLTemName, strXSNFile, strWLID, strWorkFlowName, strDescription, strCNRelatedType, int.Parse(strRelatedID), strUserCode, strIsPlanMainWorkflow,
                CB_SMS, CB_Mail, LB_WLID, HL_RelatedDoc, HL_RedirectToMyWFDetail, BT_SaveXMLFile, DL_WorkFlow, PublishUrl, this.uri, Context, xdoc);
            }

            strWLID = intWLID.ToString();

            if (intWLID <= 0)
            {
                if (intWLID == 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSSCSBLCMBBNWKJC + "');</script>");
                }

                if (intWLID == -1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBXYSJWJBNCGBCJC + "');</script>");
                }

                if (intWLID == -2)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBBNSCXGZLJC + "');</script>");
                }

                if (intWLID == -3)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBGZLMCHMSBNWKJC + "');</script>");
                }

                try
                {
                    wfSubmitHandle.ReLoadFormDataBeforeSubmit(this.Context, LB_PublishUrl.Text.Trim(), LB_Uri.Text.Trim(), xdoc);
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZJGZXJZTJSJSBJC + "');</script>");
                }
            }
            else
            {
                LB_WLID.Text = strWLID;

                //赋全局变量给工作流XML文件
                try
                {
                    wfSubmitHandle.AddGlobalVariable(strWLTemName, strWLID, strRelatedType, strRelatedID, "");
                }
                catch (Exception ex)
                {
                }

                //保存表单数据到数据库
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>saveWFFormDataToDB();</script>");


                try
                {
                    //同步表单数据到相应的数据库表
                    TakeTopXML.FormConvertToTable(int.Parse(strWLID), 0);

                    //保存表单数据到数据库
                    ClientScript.RegisterStartupScript(this.GetType(), "SaveData", "<script>saveWFFormDataToDatabase(" + intWLID.ToString() + ");</script>");
                }
                catch
                {
                }

                new System.Threading.Thread(delegate ()
                {
                    try
                    {
                        //保存自定义表单数据到统一流程数据表，用于数据分析用
                        string strWFXMLFile = ShareClass.GetWorkflowXMLFile(strWLID);
                        XmlDbWorker.AddFormFromXml(Server.MapPath(strWFXMLFile), int.Parse(strWLID), strWLTemName);
                    }
                    catch
                    {
                    }

                }).Start();

                //定义此工作流是否是计划转的流程
                try
                {
                    string strHQL;
                    strHQL = "Update T_WorkFlow Set IsPlanMainWorkFlow = 'YES' Where WLID = " + strWLID;
                    ShareClass.RunSqlCommand(strHQL);
                }
                catch
                {
                }

                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJGZLSCG + "');</script>");
            }

            //HL_RelatedDoc.NavigateUrl = "javascript:popShowByURL('" + HL_RelatedDoc.NavigateUrl + "','ChartView','99%','99%',window.location);";
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBZZXMBTXGZLS + "');</script>");
        }
    }

    protected void BT_SaveXMLFile_Click(object sender, EventArgs e)
    {
        string strWLID, strWLName, strDescription;
        int intResult;

        strWLID = LB_WLID.Text.Trim();
        strWLName = TB_WorkFlowName.Text.Trim();
        strDescription = TB_WLDescription.Text.Trim();

        if (PublishUrl == null)
        {
            PublishUrl = LB_PublishUrl.Text.Trim();
        }

        if (this.uri == null)
        {
            this.uri = LB_Uri.Text.Trim();
        }

        WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
        intResult = wfSubmitHandle.SaveWorkFlowXMLFile(strWLID, strWLName, strDescription, xdoc, this.Context, PublishUrl, this.uri);

        if (intResult == 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZBCSBJC + "');</script>");
        }
        else
        {
            //赋全局变量给工作流XML文件
            try
            {
                wfSubmitHandle.AddGlobalVariable(strTemName, strWLID, strRelatedType, strRelatedID, "");
            }
            catch (Exception ex)
            {

            }

            try
            {
                //同步表单数据到相应的数据库表
                TakeTopXML.FormConvertToTable(int.Parse(strWLID), 0);

                //保存表单数据到数据库
                ClientScript.RegisterStartupScript(this.GetType(), "SaveData", "<script>saveWFFormDataToDatabase(" + strWLID + ");</script>");
            }
            catch
            {
            }

            new System.Threading.Thread(delegate ()
            {
                try
                {
                    //保存自定义表单数据到统一流程数据表，用于数据分析用
                    string strWFXMLFile = ShareClass.GetWorkflowXMLFile(strWLID);
                    XmlDbWorker.AddFormFromXml(Server.MapPath(strWFXMLFile), int.Parse(strWLID), strTemName);
                }
                catch
                {
                }

            }).Start();

            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZBCCG + "');</script>");
        }
    }

    protected void BT_BackupSaveXMLFile_Click(object sender, EventArgs e)
    {
        string strWLID, strWLName, strDescription;

        strWLID = LB_WLID.Text.Trim();
        strWLName = TB_WorkFlowName.Text.Trim();
        strDescription = TB_WLDescription.Text.Trim();

        if (PublishUrl == null)
        {
            PublishUrl = LB_PublishUrl.Text.Trim();
        }

        if (this.uri == null)
        {
            this.uri = LB_Uri.Text.Trim();
        }

        WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
        int intResult = wfSubmitHandle.SaveWorkFlowXMLFile(strWLID, strWLName, strDescription, xdoc, this.Context, PublishUrl, this.uri);

        if (intResult == 0)
        {

        }
        else
        {
            //赋全局变量给工作流XML文件
            try
            {
                wfSubmitHandle.AddGlobalVariable(strTemName, strWLID, strRelatedType, strRelatedID, "");
            }
            catch (Exception ex)
            {

            }

            try
            {
                //同步表单数据到相应的数据库表
                TakeTopXML.FormConvertToTable(int.Parse(strWLID), 0);

                //保存表单数据到数据库
                ClientScript.RegisterStartupScript(this.GetType(), "SaveData", "<script>saveWFFormDataToDatabase(" + strWLID + ");</script>");
            }
            catch
            {
            }

            new System.Threading.Thread(delegate ()
            {
                try
                {
                    //保存自定义表单数据到统一流程数据表，用于数据分析用
                    string strWFXMLFile = ShareClass.GetWorkflowXMLFile(strWLID);
                    XmlDbWorker.AddFormFromXml(Server.MapPath(strWFXMLFile), int.Parse(strWLID), strTemName);
                }
                catch
                {
                }

            }).Start();
        }
    }

    //protected void CB_IsPlanMainWorkflow_CheckedChanged(object sender, EventArgs e)
    //{
    //    string strWLID;
    //    string strHQL;

    //    string strIsPlanMainWorkflow;

    //    try
    //    {
    //        strWLID = DL_WorkFlow.SelectedValue;

    //        if (CB_IsPlanMainWorkflow.Checked == true)
    //        {
    //            strIsPlanMainWorkflow = "YES";
    //        }
    //        else
    //        {
    //            strIsPlanMainWorkflow = "NO";
    //        }

    //        strHQL = "Update T_WorkFlow Set IsPlanMainWorkflow = '" + strIsPlanMainWorkflow + "' Where WLID = " + strWLID;
    //        ShareClass.RunSqlCommand(strHQL);
    //    }
    //    catch
    //    {

    //    }
    //}

    protected void BT_Download_Click(object sender, EventArgs e)
    {
        string strWorkFlowName, strXMLFileName;

        try
        {
            strTemName = DL_WorkFlowTemplate.SelectedValue.Trim();
        }
        catch
        {
            strTemName = LB_TemName.Text.Trim();
        }

        strWorkFlowName = "";

        try
        {
            strWorkFlowName = DL_WorkFlow.SelectedItem.Text.Trim();
            strXMLFileName = strWorkFlowName + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".xml";
        }
        catch
        {
            strXMLFileName = strTemName + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".xml";
        }

        if (PublishUrl == null)
        {
            PublishUrl = LB_PublishUrl.Text.Trim();
        }

        if (this.uri == null)
        {
            this.uri = LB_Uri.Text.Trim();
        }

        WFDataHandle wfDataHandle = new WFDataHandle();
        wfDataHandle.DownloadWFXMLData(strTemName, strWorkFlowName, xdoc, PublishUrl, this.Context, this.Response);
    }

    protected void BT_Upload_Click(object sender, EventArgs e)
    {
        try
        {
            if (PublishUrl == null)
            {
                PublishUrl = LB_PublishUrl.Text.Trim();
            }

            if (this.uri == null)
            {
                this.uri = LB_Uri.Text.Trim();
            }

            if (PublishUrl != null)
            {
                //The method TakeTopInfoPathService.BuildFormByXML() requires the string content of an existing xml document as a parameter.
                byte[] xmlContent = new byte[XMLFile.PostedFile.ContentLength];
                XMLFile.PostedFile.InputStream.Read(xmlContent, 0, xmlContent.Length);
                string xml = System.Text.UTF8Encoding.UTF8.GetString(xmlContent);

                TakeTopInfoPathForm editForm = TakeTopInfoPathService.BuildFormByXML(Context, PublishUrl, xml);
                xdoc.Text = editForm.Xhtml;

                BT_Download.Enabled = true;
            }
            else
            {
                xdoc.Text = Resources.lang.QingXianZhuCheBiaoDanMoBan;
            }
        }
        catch
        {
            xdoc.Text = Resources.lang.CWNSXDGZLSJXMLWJBSZGLCMBDXMLDSJWJQJC;
        }
    }

    protected void BT_AppendXML_Click(object sender, EventArgs e)
    {
        if (PublishUrl != null)
        {
            string strTriggerID = this.HF_TriggerID.Value;
            int intTriggerID = 0;
            int.TryParse(strTriggerID, out intTriggerID);
            //写入XML文件
            string strFolder = "Doc\\XML\\";
            if (!System.IO.Directory.Exists(Server.MapPath(strFolder)))
            {
                System.IO.Directory.CreateDirectory(Server.MapPath(strFolder));
            }
            string strTemNameR = DL_WorkFlowTemplate.SelectedValue.Trim();
            string strFileName = strFolder + strTemNameR + DateTime.Now.ToString("yyyyMMddHHmmssff") + ".xml";
            strFileName = Server.MapPath(strFileName);

            //表单数据
            string strXMLHQL = string.Empty;
            strXMLHQL = "select * from T_WorkFlow WHERE TemName = '" + strTemNameR + "' order by CreateTime desc";
            DataSet dsTest = ShareClass.GetDataSetFromSql(strXMLHQL, "XMLTest");
            if (dsTest != null && dsTest.Tables[0].Rows.Count > 0)
            {
                string strXSNFile = dsTest.Tables[0].Rows[0]["XMLFile"] == DBNull.Value ? "" : dsTest.Tables[0].Rows[0]["XMLFile"].ToString();
                if (!string.IsNullOrEmpty(strXSNFile))
                {
                    strXSNFile = Server.MapPath(strXSNFile);
                    TakeTopXML.TableConvertToFormByTriggerID(intTriggerID, strTemNameR, strFileName, strXSNFile);
                    try
                    {
                        string xml = ShareClass.ReadXML(strFileName);
                        TakeTopInfoPathForm editForm = TakeTopInfoPathService.BuildFormByXML(Context, PublishUrl, xml);
                        xdoc.Text = editForm.Xhtml;
                    }
                    catch (Exception ex) { }
                }
            }
        }
        else
        {
            xdoc.Text = "请先注册表单模板.";
        }
    }

    protected void LoadWorkFlowType(string strRelatedType, string strCNRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        string strLangCode = HttpContext.Current.Session["LangCode"].ToString();

        strHQL = string.Format(@"Select * from T_WLType as wlType where (wlType.Type in  (Select workFlowTemplate.Type from T_WorkFlowTemplate as workFlowTemplate 
									     where workFlowTemplate.Visible = 'YES'  and  workFlowTemplate.TemName in
									     (Select relatedWorkFlowTemplate.WFTemplateName from T_RelatedWorkFlowTemplate as relatedWorkFlowTemplate
										  where ((relatedWorkFlowTemplate.RelatedType ='{0}' and relatedWorkFlowTemplate.RelatedID = {1})
										 Or (relatedWorkFlowTemplate.WFTemplateName in (Select PlanStartupRelatedWorkflowTemplate From T_Project 
										 Where ProjectID = {1})))) Or wlType.Type like '{2}'|| '%'))
										 and wlType.LangCode = 'zh-CN'  order by wlType.SortNumber ASC", strRelatedType, strRelatedID, strCNRelatedType);

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WLType");

        DL_WLType.DataSource = ds;
        DL_WLType.DataBind();

        DL_WLType.Items.Insert(0, new ListItem("--Select--", ""));

        //列表项增加提示
        //PreREnderListBox();
    }


    protected void LoadWorkFlowTemplate(string strRelatedType, string strRelatedID)
    {
        string strHQL;

        strHQL = string.Format(@"Select trim(wftemplatename) as TemName From t_relatedworkflowtemplate Where ((RelatedType='{0}' and RelatedID={1})
                                Or (wftemplatename in (Select PlanStartupRelatedWorkflowTemplate From T_Project Where ProjectID = {1}))",
            strRelatedType, strRelatedID);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "t_relatedworkflowtemplate");

        DL_WorkFlowTemplate.DataSource = ds;
        DL_WorkFlowTemplate.DataBind();

        DL_WorkFlowTemplate.Items.Insert(0, new ListItem("--Select--", ""));
    }

    protected void LoadWorkFlowTemplate(string strWLType)
    {
        string strHQL;
        DataSet ds;

        strHQL = "Select distinct TemName,SortNumber from T_WorkFlowTemplate where Visible = 'YES' and Type = " + "'" + strWLType + "'" + " and (char_length(ltrim(rtrim(COALESCE(XSNFile,'')))) > 0 Or char_length(ltrim(rtrim(COALESCE(PageFile,'')))) > 0) ";
        strHQL += " and (TemName in (Select WFTemplateName from T_RelatedWorkFlowTemplate where RelatedType = " + "'" + strRelatedType + "' and RelatedID = " + strRelatedID + ")";
        strHQL += "  Or (TemName in (Select PlanStartupRelatedWorkflowTemplate From T_Project Where ProjectID = " + strRelatedID + "))";
        strHQL += " or TemName in (Select WFTemplateName from T_RelatedWorkFlowTemplate where Type = '" + strWLType + "' and Type like '" + strCNRelatedType + "%'))";
        strHQL += " order by SortNumber ASC";

        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlow");
        DL_WorkFlowTemplate.DataSource = ds;
        DL_WorkFlowTemplate.DataBind();

        DL_WorkFlowTemplate.Items.Insert(0, new ListItem("--Select--", ""));

        //列表项增加提示
        //PreREnderListBox();
    }


    //取得工作流模板设计类型
    public static string GetWorkflowTemplateType(string strTemName)
    {
        string strHQL;
        IList lst;

        WorkFlowTemplateBLL workFlowTemplateBLL = new WorkFlowTemplateBLL();
        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.TemName = " + "'" + strTemName + "'";
        lst = workFlowTemplateBLL.GetAllWorkFlowTemplates(strHQL);

        WorkFlowTemplate workFlowTemplate = (WorkFlowTemplate)lst[0];

        return workFlowTemplate.Type.Trim();
    }

    protected string GetBMBidPlanID(string strBMBidRecordID)
    {
        string strHQL;

        strHQL = "Select C.ID From T_BMSupplierBidRecord A,T_BMAnnInvitation B,T_BMBidPlan C";
        strHQL += " Where A.AnnInvitationID = B.ID And B.BidPlanID = C.ID ";
        strHQL += " And A.ID =" + strBMBidRecordID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierBidRecord");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "0";
        }
    }

    protected string GetBMBidPlanType(string strBidPlanID)
    {
        string strHQL;

        strHQL = "Select BidType From T_BMBidPlan Where ID = " + strBidPlanID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMBidPlan");

        return ds.Tables[0].Rows[0][0].ToString().Trim();
    }

    protected string GetBMBidPlanEnterCode(string strBMBidRecordID)
    {
        string strHQL;

        strHQL = "Select C.EnterCode From T_BMSupplierBidRecord A,T_BMAnnInvitation B,T_BMBidPlan C";
        strHQL += " Where A.AnnInvitationID = B.ID And B.BidPlanID = C.ID ";
        strHQL += " And A.ID =" + strBMBidRecordID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierBidRecord");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "";
        }
    }

    protected void LoadWorkFlow(string strWLType, string strTemName)
    {
        string strHQL;

        if (strProjectRelatedType == "ProjectTask" | strProjectRelatedType == "ProjectRisk")
        {
            strHQL = "Select * from T_WorkFlow where WLType = " + "'" + strWLType + "'" + " and TemName = " + "'" + strTemName + "'" + " and CreatorCode = " + "'" + strUserCode + "'" + " and char_length(rtrim(ltrim(XSNFile)))>0";
            strHQL += " and RelatedType = " + "'" + strProjectRelatedTypeCN + "'" + " and RelatedID = " + strProjectRelatedID;
        }
        else if (strProjectRelatedType == "ProjectPlan")
        {
            strHQL = "Select distinct WLID,WLName from T_WorkFlow where (TemName In (Select TemName From T_WorkFlowTemplate Where char_length(ltrim(rtrim(COALESCE(XSNFile, '')))) > 0 Or char_length(ltrim(rtrim(COALESCE(PageFile, '')))) > 0)) ";
            strHQL += " and RelatedType = " + "'" + strOriginRelatedType + "'" + " and RelatedID = " + strOriginRelateID;
            strHQL += " and CreatorCode = " + "'" + strUserCode + "'";
        }
        else if (strRelatedType == "BMBidType")
        {
            strHQL = "Select * from T_WorkFlow where char_length(rtrim(ltrim(XSNFile)))>0";
            strHQL += " and RelatedType = " + "'" + strCNRelatedType + "'" + " and RelatedID = " + strBMBidPlanID;
            strHQL += " and (CreatorCode = '" + strBMBidPlanEnterCode + "' or CreatorCode = '" + strUserCode + "')";
        }
        else
        {
            strHQL = "Select * from T_WorkFlow where WLType = " + "'" + strWLType + "'" + " and TemName = " + "'" + strTemName + "'" + " and CreatorCode = " + "'" + strUserCode + "'" + " and char_length(rtrim(ltrim(XSNFile)))>0 ";
            strHQL += " and RelatedType = " + "'" + strCNRelatedType + "'" + " and RelatedID = " + strRelatedID;
        }
        strHQL += " Order by WLID DESC Limit 50";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlow");

        DL_WorkFlow.DataSource = ds;
        DL_WorkFlow.DataBind();

        DL_WorkFlow.Items.Insert(0, new ListItem("--Select--", ""));

        //列表项增加提示
        //PreREnderListBox();
    }

    protected void LoadWorkFlow()
    {
        string strHQL;

        if (strProjectRelatedType == "ProjectTask" | strProjectRelatedType == "ProjectPlan" | strProjectRelatedType == "ProjectRisk")
        {
            strHQL = "Select distinct WLID,WLName from T_WorkFlow where (TemName In (Select TemName From T_WorkFlowTemplate Where char_length(ltrim(rtrim(COALESCE(XSNFile, '')))) > 0 Or char_length(ltrim(rtrim(COALESCE(PageFile, '')))) > 0)) ";
            strHQL += " and RelatedType = " + "'" + strProjectRelatedTypeCN + "'" + " and RelatedID = " + strProjectRelatedID;
            strHQL += " and CreatorCode = " + "'" + strUserCode + "'";
        }

        if (strProjectRelatedType == "ProjectPlan")
        {
            strHQL = "Select distinct WLID,WLName from T_WorkFlow where (TemName In (Select TemName From T_WorkFlowTemplate Where char_length(ltrim(rtrim(COALESCE(XSNFile, '')))) > 0 Or char_length(ltrim(rtrim(COALESCE(PageFile, '')))) > 0)) ";
            strHQL += " and RelatedType = " + "'" + strOriginRelatedType + "'" + " and RelatedID = " + strOriginRelateID;
            strHQL += " and CreatorCode = " + "'" + strUserCode + "'";
        }
        else if (strRelatedType == "BMBidType")
        {
            strHQL = "Select distinct WLID,WLName from T_WorkFlow where (TemName In (Select TemName From T_WorkFlowTemplate Where char_length(ltrim(rtrim(COALESCE(XSNFile, '')))) > 0 Or char_length(ltrim(rtrim(COALESCE(PageFile, '')))) > 0)) ";
            strHQL += " and RelatedType = " + "'" + strCNRelatedType + "'" + " and RelatedID = " + strBMBidPlanID;
            strHQL += " and (CreatorCode = '" + strBMBidPlanEnterCode + "' or CreatorCode = '" + strUserCode + "')";
        }
        else
        {
            strHQL = "Select distinct WLID,WLName from T_WorkFlow where (TemName In (Select TemName From T_WorkFlowTemplate Where char_length(ltrim(rtrim(COALESCE(XSNFile, '')))) > 0 Or char_length(ltrim(rtrim(COALESCE(PageFile, '')))) > 0)) ";
            strHQL += " and RelatedType = " + "'" + strCNRelatedType + "'" + " and RelatedID = " + strRelatedID;
            strHQL += " and CreatorCode = " + "'" + strUserCode + "'";
        }
        strHQL += " Order by WLID DESC Limit 50";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlow");

        DL_WorkFlow.DataSource = ds;
        DL_WorkFlow.DataBind();

        DL_WorkFlow.Items.Insert(0, new ListItem("--Select--", ""));

        //列表项增加提示
        //PreREnderListBox();
    }

    //列表项增加提示
    protected void PreREnderListBox()
    {
        //列表项增加提示
        DL_WLType.PreRender += DL_WLType_PreRender;

        DL_WorkFlowTemplate.PreRender += DL_WorkFlowTemplate_PreRender;

        //DL_WorkFlow.PreRender += DL_WorkFlow_PreRender;
    }

    //列表项增加提示
    private void DL_WorkFlowTemplate_PreRender(object sender, System.EventArgs e)
    {
        foreach (ListItem item in DL_WorkFlowTemplate.Items)
        {
            item.Attributes.Add("title", item.Text);
        }
    }

    //列表项增加提示
    private void DL_WLType_PreRender(object sender, System.EventArgs e)
    {
        foreach (ListItem item in DL_WLType.Items)
        {
            item.Attributes.Add("title", item.Text);
        }
    }

    //列表项增加提示
    private void DL_WorkFlow_PreRender(object sender, System.EventArgs e)
    {
        foreach (ListItem item in DL_WorkFlow.Items)
        {
            item.Attributes.Add("title", item.Text);
        }
    }

    protected string GetWorkflowTemplate(string strWLID)
    {
        string strHQL;

        strHQL = "Select TemName From T_WorkFlow Where WLID = " + strWLID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlow");

        return ds.Tables[0].Rows[0][0].ToString().Trim();
    }

    protected string GetWorkTemplateXSNFile(string strTemName)
    {
        IList lst;
        string strHQL, strXSNFile;

        WorkFlowTemplateBLL workFlowTemplateBLL = new WorkFlowTemplateBLL();
        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.TemName =" + "'" + strTemName + "'";
        lst = workFlowTemplateBLL.GetAllWorkFlowTemplates(strHQL);

        WorkFlowTemplate workFlowTemplate = (WorkFlowTemplate)lst[0];

        try
        {
            strXSNFile = workFlowTemplate.XSNFile.Trim();
        }
        catch
        {
            strXSNFile = "";
        }

        return strXSNFile;
    }

    protected string GetWorkFlowXMLFile(string strWLID)
    {
        string strHQL, strXMLFile;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLID = " + strWLID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        WorkFlow workFlow = (WorkFlow)lst[0];

        strXMLFile = workFlow.XMLFile.Trim();

        return strXMLFile;
    }

    protected string GetWorkFlowXSNFile(string strWLID)
    {
        string strHQL, strXSNFile;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLID = " + strWLID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        WorkFlow workFlow = (WorkFlow)lst[0];

        strXSNFile = workFlow.XSNFile.Trim();

        return strXSNFile;
    }

    protected string GetConstractCode(string strConstractID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Constract as constract where constract.ConstractID = " + strConstractID;

        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);

        Constract constract = (Constract)lst[0];

        return constract.ConstractCode.Trim();
    }

    protected string GetConstractName(string strConstractID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Constract as constract where constract.ConstractID = " + strConstractID;

        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);

        Constract constract = (Constract)lst[0];

        return constract.ConstractName.Trim();
    }

    protected string GetTenderName(string strTenderID)
    {
        string strHQL;
        IList lst;

        Tender_HYYQBLL tender_HYYQBLL = new Tender_HYYQBLL();
        strHQL = "from Tender_HYYQ as tender_HYYQ where tender_HYYQ.id = " + strTenderID;
        lst = tender_HYYQBLL.GetAllTender_HYYQs(strHQL);

        if (lst.Count > 0)
        {
            Tender_HYYQ tender_HYYQ = (Tender_HYYQ)lst[0];

            return tender_HYYQ.ProjectName.Trim();
        }
        else
        {
            return "";
        }
    }

    protected bool GetWorkFlowStatus(string strWLID)
    {
        string strHQL = "from WorkFlowStepDetail as workFlowStepDetail where workFlowStepDetail.WLID = " + strWLID + " and workFlowStepDetail.Status = '批准'";
        WorkFlowStepDetailBLL workFlowStepDetailBLL = new WorkFlowStepDetailBLL();

        IList lst = workFlowStepDetailBLL.GetAllWorkFlowStepDetails(strHQL);

        if (lst.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

}
