using System;
using System.Collections;
using System.Data;
using System.Web.UI;

using TakeTopWF;

using TakeTopInfoPathSoft.Service;
using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTRelatedDIYBusinessForm : System.Web.UI.Page
{
    string PublishUrl = null;
    string uri = null;

    string OldPublishUrl = null;
    string OldUri = null;

    public string strUserCode;
    public string strWLID, strWLType, strTemName, strIdentifyString, strXSNFile;

    string strRelatedType, strRelatedID;

    public string wfUri;
    public string wfPublishUrl;
    public string wfOldUri;
    public string wfOldPublishUrl;

    string strLangCode;
    string strIsMobileDevice;

    protected void Page_Load(object sender, EventArgs e)
    {
        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();

        Session["AutoActiveWorkflow"] = "NO";

        strIsMobileDevice = Session["IsMobileDevice"].ToString();

        try
        {
            strRelatedType = Request.QueryString["RelatedType"].Trim();
            strRelatedID = Request.QueryString["RelatedID"].Trim();
            strIdentifyString = Request.QueryString["IdentifyString"].Trim();
        }
        catch
        {
            xdoc.Text = Resources.lang.SBZGZLMBHSJWJBCZKNYBSCQJC;
            return;
        }

        try
        {
            ClientScript.RegisterStartupScript(this.GetType(), "HHH", "<script>aHandler();</script>");
            if (Page.IsPostBack == false)
            {
                //删除无效记录
                string strHQL = "Delete From T_RelatedBusinessForm Where COALESCE(TemName,'') = '' and COALESCE(XSNFile,'') = ''";
                ShareClass.RunSqlCommand(strHQL);

                //列出关联的流程模板
                LoadBusinessFormRelatedWorkFlowTemplate(strRelatedType, strRelatedID);

                strTemName = GetWorkFlowTemName(strIdentifyString);
                if (strTemName == "")
                {
                    xdoc.Text = Resources.lang.SBZGZLMBHSJWJBCZKNYBSCQJC;
                    return;
                }
                strXSNFile = GetWorkFlowTemXSNFile(strIdentifyString);

                if (CheckIsExistBusinessFormData(strRelatedType, strRelatedID, strTemName, strXSNFile) > 0)
                {
                    DL_WorkflowTemplate.SelectedValue = strXSNFile;

                    LoadRelatedExistBusinessForm(strRelatedType, strRelatedID, strTemName, strXSNFile);
                }
                else
                {
                    LoadRelatedNewBusinessForm(strTemName, strXSNFile);
                }
                LB_TemName.Text = strTemName;
                LB_XSNFile.Text = strXSNFile;

                if (strRelatedID == "0")
                {
                    BT_SaveXMLFile.Visible = false;
                    BT_DeleteWorkflowTemplate.Visible = false;
                }

                if (strIsMobileDevice == "YES")
                {
                    TD_Printer.Visible = false;
                }

                if (strRelatedType.IndexOf("Record") >= 0 & (strUserCode != getBusinessFormOperatorCode(strRelatedType, strRelatedID) || getBusinessFormAllowUpdate(strRelatedType, strRelatedID) == "NO"))
                {
                    BT_SaveXMLFile.Visible = false;
                    BT_DeleteWorkflowTemplate.Visible = false;
                }

                string strOperatorCode = getBusinessFormOperatorCode(strRelatedType, strRelatedID);
                if (strRelatedType == "Project" & strUserCode != strOperatorCode & strOperatorCode != "")
                {
                    BT_SaveXMLFile.Visible = false;
                    BT_DeleteWorkflowTemplate.Visible = false;
                }
            }
        }
        catch
        {
            xdoc.Text = Resources.lang.ZZZBCXXBCZYGSMYDY;
        }
    }

    protected void DL_WorkflowTemplate_SelectedIndexChanged(object sender, EventArgs e)
    {
        strTemName = DL_WorkflowTemplate.SelectedItem.Text.Trim();
        strXSNFile = DL_WorkflowTemplate.SelectedValue.Trim();

        LB_TemName.Text = strTemName;
        LB_XSNFile.Text = strXSNFile;

        LoadRelatedExistBusinessForm(strRelatedType, strRelatedID, strTemName, strXSNFile);
    }

    protected void BT_SaveXMLFile_Click(object sender, EventArgs e)
    {
        int intResult;

        string strWLID, strWLName, strDescription;

        strWLID = LB_WLID.Text.Trim();
        strWLName = TB_WorkFlowName.Text.Trim();
        strDescription = TB_WLDescription.Text.Trim();

        strTemName = LB_TemName.Text;
        strXSNFile = LB_XSNFile.Text;

        if (PublishUrl == null)
        {
            PublishUrl = LB_PublishUrl.Text.Trim();
        }

        if (this.uri == null)
        {
            this.uri = LB_Uri.Text.Trim();
        }

        WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
        intResult = wfSubmitHandle.SaveWorkFlowXMLFileForBusinessForm(strRelatedType, strRelatedID, "", xdoc, this.Context, PublishUrl, this.uri, strTemName, strXSNFile, strUserCode);

        if (intResult == 0)
        {
            LB_Msg.Text = Resources.lang.ZZBCSBJC;
            //ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZBCSBJC + "');</script>");
        }
        else
        {
            try
            {
                //保存表单数据到数据库
                ClientScript.RegisterStartupScript(this.GetType(), "SaveData",  "<script>saveWFFormDataToDatabase(" + strWLID + ");</script>");
            }
            catch
            {
            }

            //列出关联的流程模板
            LoadBusinessFormRelatedWorkFlowTemplate(strRelatedType, strRelatedID);
            DL_WorkflowTemplate.SelectedValue = strXSNFile;

            LB_Msg.Text = Resources.lang.ZZBCCG;
            //ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZBCCG + "');</script>");
        }
    }

    protected void BT_DeleteWorkflowTemplate_Click(object sender, EventArgs e)
    {
        string strHQL;

        strTemName = DL_WorkflowTemplate.SelectedItem.Text.Trim();
        strXSNFile = DL_WorkflowTemplate.SelectedValue.Trim();


        strHQL = "Delete From T_RelatedBusinessForm Where RelatedType = '" + strRelatedType + "' and RelatedID = " + strRelatedID;
        strHQL += " and TemName = '" + strTemName + "' and XSNFile = '" + strXSNFile + "'";

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            //列出关联的流程模板
            LoadBusinessFormRelatedWorkFlowTemplate(strRelatedType, strRelatedID);

            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSCCG + "');</script>");
        }
        catch
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSCSBJC + "');</script>");
        }
    }


    protected void LoadBusinessFormRelatedWorkFlowTemplate(string strRelatedType, string strRelatedID)
    {
        string strHQL;

        strHQL = "Select * From T_RelatedBusinessForm Where RelatedType = '" + strRelatedType + "' and RelatedID = " + strRelatedID;
        strHQL += " Order By CreateTime DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_RelatedBusinessForm");

        DL_WorkflowTemplate.DataSource = ds;
        DL_WorkflowTemplate.DataBind();
    }


    protected string GetWorkFlowTemName(string strIdentifyString)
    {
        IList lst;
        string strHQL, strTemName;

        WorkFlowTemplateBLL workFlowTemplateBLL = new WorkFlowTemplateBLL();
        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.IdentifyString =" + "'" + strIdentifyString + "'";
        lst = workFlowTemplateBLL.GetAllWorkFlowTemplates(strHQL);

        WorkFlowTemplate workFlowTemplate = (WorkFlowTemplate)lst[0];
        strTemName = workFlowTemplate.TemName.Trim();

        return strTemName;
    }

    protected string GetWorkFlowTemXSNFile(string strIdentifyString)
    {
        string strHQL;
        IList lst;

        WorkFlowTemplateBLL workFlowTemplateBLL = new WorkFlowTemplateBLL();
        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.IdentifyString =" + "'" + strIdentifyString + "'";
        lst = workFlowTemplateBLL.GetAllWorkFlowTemplates(strHQL);

        WorkFlowTemplate workFlowTemplate = (WorkFlowTemplate)lst[0];

        return workFlowTemplate.XSNFile.Trim();
    }

    protected int CheckIsExistBusinessFormData(string strRelatedType, string strRelatedID, string strTemName, string strXSNFile)
    {
        string strHQL;

        DataSet ds = null;

        strHQL = "Select * From T_RelatedBusinessForm Where RelatedType = '" + strRelatedType + "' and  RelatedID = " + strRelatedID;
        strHQL += " and TemName = '" + strTemName + "' and XSNFile = '" + strXSNFile + "'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_RelatedBusinessForm");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows.Count;
        }
        else
        {
            return 0;
        }
    }

    protected void LoadRelatedNewBusinessForm(string strTemName, string strXSNFile)
    {
        int intResult;

        if (PublishUrl != null)
        {
            TakeTopInfoPathService.Remove(PublishUrl);
            PublishUrl = null;
        }

        WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
        intResult = wfSubmitHandle.RegisterWorkFlowTemplateForBusinessForm(strTemName, strXSNFile, this.Context, this.uri, PublishUrl, xdoc, LB_XSNFile);

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

        //附加用户自定义的JSCode到页面
        WFShareClass.AttachUserJSCodeFromWFTemplate(strTemName, LIT_AttachUserJSCode, strUserCode, "", "0", "");
        ClientScript.RegisterStartupScript(this.GetType(), "HH77H", "<script>jqueryDocumentReady();</script>");

        //附加工作流步骤用户自定义的JSCode到页面
        WFShareClass.AttachUserJSCodeFromWFTemplateStep(strTemName, "0", LIT_AttachUserWFStepJSCode, strUserCode);

        ClientScript.RegisterStartupScript(this.GetType(), "HH88H", "<script>setWorkflowForm();</script>");
    }

    protected void LoadRelatedExistBusinessForm(string strRelatedType, string strRelatedID, string strTemName, string strXSNFile)
    {
        int intResult;
        //如果数据库表中存在此工作流的数据，那么把表中数据附加到表单中


        if (PublishUrl == null)
        {
            PublishUrl = LB_PublishUrl.Text.Trim();
        }

        if (this.uri == null)
        {
            this.uri = LB_Uri.Text.Trim();
        }

        WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
        intResult = wfSubmitHandle.SelectedWorkFlowForBusinessForm(strRelatedType, strRelatedID, strTemName, strXSNFile, LB_WLID, LB_XSNFile, TB_WorkFlowName,
            TB_WLDescription, xdoc, BT_SaveXMLFile, HL_RelatedDoc, HL_RedirectToMyWFDetail, this.Context, PublishUrl, this.uri);

        //OldPublishUrl = wfSubmitHandle.wfOldPublishUrl.ToString();
        //OldUri = wfSubmitHandle.wfOldUri.ToString();

        //HL_OldWFXMLFile.NavigateUrl = LB_OldWFXMLFile.Text;

        if (intResult == 0)
        {
            xdoc.Text = Resources.lang.SBZGZLMBHSJWJBCZKNYBSCQJC;
        }


        //附加用户自定义的JSCode到页面
        WFShareClass.AttachUserJSCodeFromWFTemplate(strTemName, LIT_AttachUserJSCode, strUserCode, "", "0", "");
        ClientScript.RegisterStartupScript(this.GetType(), "HH66H", "<script>jqueryDocumentReady();</script>");

        ////附加工作流步骤用户自定义的JSCode到页面
        //WFShareClass.AttachUserJSCodeFromWFTemplateStep(strTemName, "0", LIT_AttachUserWFStepJSCode, strUserCode);
        ////设置表格属性
        //ClientScript.RegisterStartupScript(this.GetType(), "HH99H", "<script>setWorkflowForm();</script>");
    }

    //BusinessForm,依类型和ID取得流程操作者名称
    public static string getBusinessFormOperatorCode(string strRelatedType, string strRelatedID)
    {
        string strHQL;

        DataSet ds = null;

        strHQL = "Select OperatorCode From T_RelatedBusinessForm Where RelatedType = '" + strRelatedType + "' and  RelatedID = " + strRelatedID;
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_RelatedBusinessForm");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0]["OperatorCode"].ToString().Trim();
        }
        else
        {
            return "";
        }
    }
    //BusinessForm,依类型和ID取得流程模板名称
    public static string getBusinessFormAllowUpdate(string strRelatedType, string strRelatedID)
    {
        string strHQL;

        DataSet ds = null;

        strHQL = "Select AllowUpdate From T_RelatedBusinessForm Where RelatedType = '" + strRelatedType + "' and  RelatedID = " + strRelatedID;
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_RelatedBusinessForm");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0]["AllowUpdate"].ToString().Trim();
        }
        else
        {
            return "";
        }
    }

    protected string GetWorkFlowType(string strWFTypeID)
    {
        string strHQL;
        IList lst;

        strHQL = "From WLType as wlType Where wlType.ID = " + strWFTypeID;
        WLTypeBLL wlTypeBLL = new WLTypeBLL();
        lst = wlTypeBLL.GetAllWLTypes(strHQL);
        WLType wlType = (WLType)lst[0];

        return wlType.Type.Trim();
    }


}
