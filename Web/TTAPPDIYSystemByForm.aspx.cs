using System;
using System.Resources;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using TakeTopInfoPathSoft.Service;

using System.Xml.XPath;
using System.Xml.Xsl;
using System.Xml;
using System.Text;
using System.IO;
using System.Collections.Generic;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

using TakeTopWF;
using TakeTopCore;
using TakeTopGantt.models;

public partial class TTAPPDIYSystemByForm : System.Web.UI.Page
{
    private static string PublishUrl = null;
    protected string uri = null;

    private static string OldPublishUrl = null;
    protected string OldUri = null;

    public string strUserCode, strModuleName;
    public string strWFType, strTemName, strWLID, strTemIdentifyString;
    //加上关联RelatedCode TODO:CAOJIAN(曹健)
    string strRelatedType, strRelatedID, strRelatedCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;

        strUserCode = Session["UserCode"].ToString();
        strModuleName = Request.QueryString["ModuleName"];

        strTemIdentifyString = Request.QueryString["TemIdentifyString"].Trim();

        //加上关联RelatedID,RelatedType,RelatedCode TODO:CAOJIAN(曹健)
        strRelatedType = Request.QueryString["RelatedType"];
        if (strRelatedType == null)
        {
            strRelatedType = "OTHER";
        }

        strRelatedID = Request.QueryString["RelatedID"];
        if (strRelatedID == null)
        {
            strRelatedID = "0";
        }

        strRelatedCode = Request.QueryString["RelatedCode"];
        if (strRelatedCode == null)
        {
            strRelatedCode = "";
        }

        strHQL = "select TemName,Type from T_WorkFlowTemplate Where IdentifyString = " + "'" + strTemIdentifyString + "'";
        DataSet ds = new DataSet();
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");

        strTemName = ds.Tables[0].Rows[0][0].ToString().Trim();
        strWFType = ds.Tables[0].Rows[0][1].ToString().Trim();

        Session["AutoActiveWorkflow"] = ShareClass.GetWorkflowTemplateAutoActive(strTemName);

        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx");
        if (Page.IsPostBack == false)
        {
            LB_WFType.Text = strWFType;
            UploadWFDIYFormTemplate(strTemName);

            string strDesignType = ShareClass.GetWLTemplateDesignType(strTemName);
            if (strDesignType == "SL")
            {
                HL_WFChartView.NavigateUrl = "TTWFChartViewSL.aspx?WLID=0&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(strTemName);
            }
            if (strDesignType == "JS")
            {
                HL_WFChartView.NavigateUrl = "TTWFChartViewJS.aspx?WLID=0&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(strTemName);
            }

            TB_WorkFlowName.Text = strTemName;
            TB_WLDescription.Text = strTemName;

            //附加用户自定义的JSCode到页面
            WFShareClass.AttachUserJSCodeFromWFTemplate(strTemName, LIT_AttachUserJSCode, strUserCode, "", "0", "");
            ClientScript.RegisterStartupScript(this.GetType(), "HH77H", "<script>jqueryDocumentReady();</script>");

            //附加工作流步骤用户自定义的JSCode到页面
            WFShareClass.AttachUserJSCodeFromWFTemplateStep(strTemName, "0", LIT_AttachUserWFStepJSCode, strUserCode);

            //设置表格属性
            ClientScript.RegisterStartupScript(this.GetType(), "HH88H", "<script>setWorkflowForm();</script>");
        }
    }

    protected void UploadWFDIYFormTemplate(string strWFTemName)
    {
        int intResult;

        if (PublishUrl != null)
        {
            TakeTopInfoPathService.Remove(PublishUrl);
            PublishUrl = null;
        }

        //加上关联RelatedCode TODO:CAOJIAN(曹健)
        LoadWorkFlow(strWFType, strTemName, strRelatedCode);

        WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
        intResult = wfSubmitHandle.RegisterWorkFlowTemplate(strTemName, this.Context, this.uri, PublishUrl, xdoc, LB_XSNFile);

        PublishUrl = wfSubmitHandle.wfPublishUrl.ToString();
        uri = wfSubmitHandle.wfUri.ToString();

        OldPublishUrl = null;

        if (intResult == 0)
        {
            xdoc.Text = "错误，相应模板或模板文件不存在，请检查！";
        }
        else
        {
            LB_OldWFXMLFile.Text = wfSubmitHandle.GetWFXMLFile("WorkFlow", PublishUrl, this.Context, xdoc);
        }

        LB_WLID.Text = "";
        TB_WorkFlowName.Text = "";
        TB_WLDescription.Text = "";

        HL_RelatedDoc.Enabled = false;
        BT_SaveXMLFile.Enabled = false;

        BT_Download.Enabled = true;
        BT_Upload.Enabled = true;

        HL_WFXSNFile.NavigateUrl = LB_XSNFile.Text;
    }

    protected void DL_WorkFlow_SelectedIndexChanged(object sender, EventArgs e)
    {
        int intResult;

        strWLID = DL_WorkFlow.SelectedValue.Trim();
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

        string strDesignType = ShareClass.GetWLTemplateDesignType(strTemName);
        if (strDesignType == "SL")
        {
            HL_WFChartView.NavigateUrl = "TTWFChartViewSL.aspx?WLID=" + LB_WLID.Text + "&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(strTemName);
        }
        if (strDesignType == "JS")
        {
            HL_WFChartView.NavigateUrl = "TTWFChartViewJS.aspx?WLID=" + LB_WLID.Text + "&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(strTemName);
        }

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

        //列表项增加提示
        //DL_WorkFlow.PreRender += DL_WorkFlow_PreRender;

        //DL_WorkFlow.Width = 500;

        //HL_RelatedDoc.NavigateUrl = "javascript:popShowByURL('" + HL_RelatedDoc.NavigateUrl + "','ChartView','99%','99%',window.location);";
    }

    //列表项增加提示
    private void DL_WorkFlow_PreRender(object sender, System.EventArgs e)
    {
        foreach (ListItem item in DL_WorkFlow.Items)
        {
            item.Attributes.Add("title", item.Text);
        }
    }

    protected void BT_ActiveYes_Click(object sender, EventArgs e)
    {
        string strXSNFile;
        string strWorkFlowName, strDescription;
        int intWLID;

        strWLID = "0";

        strWorkFlowName = TB_WorkFlowName.Text.Trim();
        strDescription = TB_WLDescription.Text.Trim();
        strXSNFile = GetWorkTemplateXSNFile(strTemName);

        if (PublishUrl == OldPublishUrl | OldPublishUrl == null)
        {
            WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
            intWLID = wfSubmitHandle.SubmitApplyForDIYForm(strWFType, strTemName, strXSNFile, strWLID, strWorkFlowName, strDescription, "其它", 0, strUserCode, "NO",
                 CB_SMS, CB_Mail, LB_WLID, HL_RelatedDoc, HL_RedirectToMyWFDetail, BT_SaveXMLFile, DL_WorkFlow, PublishUrl, this.uri, this.Context, xdoc);

            strWLID = intWLID.ToString();

            if (intWLID == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBJC + "');</script>");
            }
            else
            {
                //赋全局变量给工作流XML文件
                try
                {
                    wfSubmitHandle.AddGlobalVariable(strTemName, strWLID, strRelatedType, strRelatedID, strRelatedCode);
                }
                catch (Exception ex)
                {
                }

                //加上关联RelatedCode TODO:CAOJIAN(曹健)
                if (!string.IsNullOrEmpty(strRelatedCode))
                {
                    string strUpdateRelatedCodeHQL = string.Format("update T_WorkFlow set RelatedCode = '{0}' where WLID = {1}", strRelatedCode, strWLID);
                    ShareClass.RunSqlCommand(strUpdateRelatedCodeHQL);
                    LoadWorkFlow(strWFType, strTemName, strRelatedCode);
                }

                try
                {
                    //保存表单数据到数据库，用于开发平台一般处理程序方式
                    ClientScript.RegisterStartupScript(this.GetType(), "SaveData", "<script>saveWFFormDataToDatabase(" + intWLID.ToString() + ");</script>");
                }
                catch
                {
                }

                try
                {
                    //保存自定义表单数据到对应数据表,用于XML节点与字段对应方式
                    TakeTopXML.FormConvertToTable(int.Parse(strWLID), 0);
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

                //HL_RelatedDoc.NavigateUrl = "javascript:popShowByURL('" + HL_RelatedDoc.NavigateUrl + "','ChartView','99%','99%',window.location);";

                Response.Redirect("TTDIYSystemDataHandleDetailForMeMain.aspx?WLID=" + strWLID);
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBZZXMBTXGZLS + "');</script>");
        }
    }

    protected void BT_ActiveNo_Click(object sender, EventArgs e)
    {
        string strXSNFile;
        string strWorkFlowName, strDescription;
        int intWLID;

        strWLID = "0";

        strWorkFlowName = TB_WorkFlowName.Text.Trim();
        strDescription = TB_WLDescription.Text.Trim();
        strXSNFile = GetWorkTemplateXSNFile(strTemName);

        if (PublishUrl == OldPublishUrl | OldPublishUrl == null)
        {
            WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
            intWLID = wfSubmitHandle.SubmitApplyForDIYForm(strWFType, strTemName, strXSNFile, strWLID, strWorkFlowName, strDescription, "其它", 0, strUserCode, "NO",
                CB_SMS, CB_Mail, LB_WLID, HL_RelatedDoc, HL_RedirectToMyWFDetail, BT_SaveXMLFile, DL_WorkFlow, PublishUrl, this.uri, Context, xdoc);

            strWLID = intWLID.ToString();

            if (intWLID == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBJC + "');</script>");
            }
            else
            {
                LB_WLID.Text = strWLID;

                //赋全局变量给工作流XML文件
                try
                {
                    wfSubmitHandle.AddGlobalVariable(strTemName, strWLID, strRelatedType, strRelatedID, strRelatedCode);
                }
                catch (Exception ex)
                {

                }

                try
                {
                    //加上关联RelatedCode TODO:CAOJIAN(曹健)
                    if (!string.IsNullOrEmpty(strRelatedCode))
                    {
                        string strUpdateRelatedCodeHQL = string.Format("update T_WorkFlow set RelatedCode = '{0}' where WLID = {1}", strRelatedCode, strWLID);
                        ShareClass.RunSqlCommand(strUpdateRelatedCodeHQL);
                        LoadWorkFlow(strWFType, strTemName, strRelatedCode);
                    }

                    try
                    {
                        //保存表单数据到数据库，用于开发平台一般处理程序方式
                        ClientScript.RegisterStartupScript(this.GetType(), "SaveData", "<script>saveWFFormDataToDatabase(" + intWLID.ToString() + ");</script>");
                    }
                    catch
                    {
                    }

                    try
                    {
                        //保存自定义表单数据到对应数据表,用于XML节点与字段对应方式
                        TakeTopXML.FormConvertToTable(int.Parse(strWLID), 0);
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

        WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
        intResult = wfSubmitHandle.SaveWorkFlowXMLFile(strWLID, strWLName, strDescription, xdoc, this.Context, PublishUrl, this.uri);

        if (intResult == 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZBCSBJC + "');</script>");
        }
        else
        {
            try
            {
                //加上关联RelatedCode TODO:CAOJIAN(曹健)
                if (!string.IsNullOrEmpty(strRelatedCode))
                {
                    string strUpdateRelatedCodeHQL = string.Format("update T_WorkFlow set RelatedCode = '{0}' where WLID = {1}", strRelatedCode, strWLID);
                    ShareClass.RunSqlCommand(strUpdateRelatedCodeHQL);

                    LoadWorkFlow(strWFType, strTemName, strRelatedCode);
                }

                //赋全局变量给工作流XML文件
                try
                {
                    wfSubmitHandle.AddGlobalVariable(strTemName, strWLID, strRelatedType, strRelatedID, strRelatedCode);
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
            catch
            {
            }

            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZBCCG + "');</script>");
        }
    }

    protected void BT_BackupSaveXMLFile_Click(object sender, EventArgs e)
    {
        string strWLID, strWLName, strDescription;
        int intResult;

        strWLID = LB_WLID.Text.Trim();
        strWLName = TB_WorkFlowName.Text.Trim();
        strDescription = TB_WLDescription.Text.Trim();

        WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
        intResult = wfSubmitHandle.SaveWorkFlowXMLFile(strWLID, strWLName, strDescription, xdoc, this.Context, PublishUrl, this.uri);

        if (intResult == 0)
        {

        }
        else
        {
            try
            {
                //加上关联RelatedCode TODO:CAOJIAN(曹健)
                if (!string.IsNullOrEmpty(strRelatedCode))
                {
                    string strUpdateRelatedCodeHQL = string.Format("update T_WorkFlow set RelatedCode = '{0}' where WLID = {1}", strRelatedCode, strWLID);
                    ShareClass.RunSqlCommand(strUpdateRelatedCodeHQL);

                    LoadWorkFlow(strWFType, strTemName, strRelatedCode);
                }

                //赋全局变量给工作流XML文件
                try
                {
                    wfSubmitHandle.AddGlobalVariable(strTemName, strWLID, strRelatedType, strRelatedID, strRelatedCode);
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
            catch
            {
            }
        }
    }

    protected void BT_Download_Click(object sender, EventArgs e)
    {
        string strWorkFlowName, strXMLFileName;
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

        WFDataHandle wfDataHandle = new WFDataHandle();
        wfDataHandle.DownloadWFXMLData(strTemName, strWorkFlowName, xdoc, PublishUrl, this.Context, this.Response);
    }

    protected void BT_Upload_Click(object sender, EventArgs e)
    {
        try
        {
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

    protected void LoadWorkFlow(string strWFType, string strTemName, string strRelatedCode)
    {
        string strHQL;

        if (!string.IsNullOrEmpty(strRelatedCode))
        {
            strHQL = "Select * from T_WorkFlow as workFlow where workFlow.WLType = " + "'" + strWFType + "'" + " and workFlow.TemName = " + "'" + strTemName + "'" + " and workFlow.CreatorCode = " + "'" + strUserCode + "'" + " and workFlow.RelatedCode = '" + strRelatedCode + "' and char_length(rtrim(ltrim(workFlow.XSNFile)))>0 Order by workFlow.CreateTime DESC Limit 50";
        }
        else
        {
            strHQL = "Select * from T_WorkFlow as workFlow where workFlow.WLType = " + "'" + strWFType + "'" + " and workFlow.TemName = " + "'" + strTemName + "'" + " and workFlow.CreatorCode = " + "'" + strUserCode + "'" + " and char_length(rtrim(ltrim(workFlow.XSNFile)))>0 Order by workFlow.CreateTime DESC Limit 50";
        }
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlow");

        DL_WorkFlow.DataSource = ds;
        DL_WorkFlow.DataBind();

        DL_WorkFlow.Items.Insert(0, new ListItem("--Select--", ""));

        //列表项增加提示
        //DL_WorkFlow.PreRender += DL_WorkFlow_PreRender;
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

    protected string GetWorkFlowTem(string strWFID)
    {
        string strHQL;
        IList lst;

        strHQL = "From WorkFlowPage as workFlowPage Where workFlowPage.ID = " + strWFID;
        WorkFlowPageBLL workFlowPageBLL = new WorkFlowPageBLL();
        lst = workFlowPageBLL.GetAllWorkFlowPages(strHQL);

        WorkFlowPage workFlowPage = new WorkFlowPage();

        workFlowPage = (WorkFlowPage)lst[0];

        return workFlowPage.WFName.Trim();
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
            string strTemNameR = DL_WorkFlow.SelectedValue.Trim();
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
}
