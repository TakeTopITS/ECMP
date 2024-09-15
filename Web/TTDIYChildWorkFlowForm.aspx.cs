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

public partial class TTDIYChildWorkFlowForm : System.Web.UI.Page
{
    //The variable PublishUrl is static, it is used to keep the publish url of the form template registered in TakeTopInfoPath Service.
    private static string PublishUrl = null;
    protected string uri = null;

    private static string OldPublishUrl = null;
    protected string OldUri = null;

    public string strUserCode;
    public string strWLType, strTemName, strIdentifyString, strWLID, strParentWFID, strParentWFStepID, strParentWFName;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strUserCode = Session["UserCode"].ToString();

        strParentWFID = Request.QueryString["WFID"].Trim();
        strParentWFStepID = Request.QueryString["StepID"].Trim();
        strIdentifyString = Request.QueryString["IdentifyString"].Trim();

        strHQL = "Select TemName,Type,WFDefinition From T_WorkFlowTemplate Where IdentifyString = " + "'" + strIdentifyString + "'";
        DataSet ds = new DataSet();
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        strTemName = ds.Tables[0].Rows[0][0].ToString().Trim();
        strWLType = ds.Tables[0].Rows[0][1].ToString().Trim();

        Session["AutoActiveWorkflow"] = ShareClass.GetWorkflowTemplateAutoActive(strTemName);

        strHQL = "from WorkFlow as workFlow where workFlow.WLID = " + strParentWFID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);
        WorkFlow workFlow = (WorkFlow)lst[0];
        strParentWFName = workFlow.WLName.Trim();

        if (Page.IsPostBack == false)
        {
            TB_WorkFlowName.Text = strTemName;
            TB_WLDescription.Text = strTemName;

            LoadWorkFlowByWFTemplate(strParentWFID, strParentWFStepID, strTemName);

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
            WFShareClass.AttachUserJSCodeFromWFTemplate(strTemName, LIT_AttachUserJSCode, strUserCode, "", "0", "");
            ClientScript.RegisterStartupScript(this.GetType(), "HH77H", "<script>jqueryDocumentReady();</script>");

            //附加工作流步骤用户自定义的JSCode到页面
            WFShareClass.AttachUserJSCodeFromWFTemplateStep(strTemName, "0", LIT_AttachUserWFStepJSCode, strUserCode);

            //设置表格属性
            ClientScript.RegisterStartupScript(this.GetType(), "HH88H", "<script>setWorkflowForm();</script>");
        }
    }

    protected void LoadWorkFlowByWFTemplate(string strParentWFID, string strParentWFStepID, string strTemName)
    {
        int intResult;

        if (PublishUrl != null)
        {
            TakeTopInfoPathService.Remove(PublishUrl);
            PublishUrl = null;
        }

        LoadWorkFlowList(strWLType, strTemName);

        WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
        intResult = wfSubmitHandle.RegisterWorkFlowTemplate(strTemName, this.Context, this.uri, PublishUrl, xdoc, LB_XSNFile);

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

        PublishUrl = wfSubmitHandle.wfPublishUrl.ToString();
        uri = wfSubmitHandle.wfUri.ToString();

        OldPublishUrl = null;

        LB_WLID.Text = "";
        //TB_WorkFlowName.Text = "";
        //TB_WLDescription.Text = "";

        LB_PublishUrl.Text = PublishUrl;
        LB_Uri.Text = uri;

        HL_RelatedDoc.Enabled = false;
        BT_SaveXMLFile.Enabled = false;

        BT_Download.Enabled = true;
        BT_Upload.Enabled = true;

        ////附加用户自定义的JSCode到页面
        WFShareClass.AttachUserJSCodeFromWFTemplate(strTemName, LIT_AttachUserJSCode, strUserCode, "", "0", "");
        ClientScript.RegisterStartupScript(this.GetType(), "HH66H", "<script>jqueryDocumentReady();</script>");
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
        BT_ExportFormToExcel.Enabled = true;

        if (intResult == 0)
        {
            xdoc.Text = Resources.lang.SBZGZLMBHSJWJBCZKNYBSCQJC;
        }

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
        WFShareClass.AttachUserJSCodeFromWFTemplate(strTemName, LIT_AttachUserJSCode, strUserCode, "", "0", "");
        ClientScript.RegisterStartupScript(this.GetType(), "HH55H", "<script>jqueryDocumentReady();</script>");


        ////附加工作流步骤用户自定义的JSCode到页面
        //WFShareClass.AttachUserJSCodeFromWFTemplateStep(strTemName, "0", LIT_AttachUserWFStepJSCode, strUserCode);
        ////设置表格属性
        //ClientScript.RegisterStartupScript(this.GetType(), "HH99H", "<script>setWorkflowForm();</script>");

        //列表项增加提示
        //DL_WorkFlow.PreRender += DL_WorkFlow_PreRender;

        //DL_WorkFlow.Width = 500;

        HL_RelatedDoc.Enabled = true;
    }

    //列表项增加提示
    private void DL_WorkFlow_PreRender(object sender, System.EventArgs e)
    {
        foreach (ListItem item in DL_WorkFlow.Items)
        {
            item.Attributes.Add("title", item.Text);
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
        string strXSNFile, strWLTemName;
        string strWorkFlowName, strDescription;
        int intWLID;
        string strHQL;

        strWLID = "0";

        strWorkFlowName = TB_WorkFlowName.Text.Trim();
        strWLTemName = strTemName;
        strDescription = TB_WLDescription.Text.Trim();
        strXSNFile = GetWorkTemplateXSNFile(strWLTemName);


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
            intWLID = wfSubmitHandle.SubmitApplyForDIYForm(strWLType, strWLTemName, strXSNFile, strWLID, strWorkFlowName, strDescription, "其它", 0, strUserCode, "NO",
                 CB_SMS, CB_Mail, LB_WLID, HL_RelatedDoc, HL_RedirectToMyWFDetail, BT_SaveXMLFile, DL_WorkFlow, PublishUrl, this.uri, this.Context, xdoc);

            strWLID = intWLID.ToString();

            if (intWLID <= 0)
            {
                try
                {
                    wfSubmitHandle.ReLoadFormDataBeforeSubmit(this.Context, LB_PublishUrl.Text.Trim(), LB_Uri.Text.Trim(), xdoc);
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZJGZXJZTJSJSBJC + "');</script>");
                }

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

                if (intWLID == -4)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBCLCMBMYSZYWJC + "');</script>");
                }

                if (intWLID == -5)
                {
                    //检查必填项不为空
                    string strCanNotNullFieldList = WFShareClass.GetCanNotNullFieldListFromWFTemplate(strWLTemName);
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBBTXSTRCANNOTNULLFIELDLISTBNWKJC + "');</script>");
                }
            }
            else
            {
                strHQL = "Insert Into T_WFStepRelatedWF(WFID,WFStepID,WFChildID) Values (" + "'" + strParentWFID + "'" + "," + "'" + strParentWFStepID + "'" + "," + "'" + strWLID + "'" + ")";
                ShareClass.RunSqlCommand(strHQL);

                //赋全局变量给工作流XML文件
                try
                {
                    wfSubmitHandle.AddGlobalVariable(strWLTemName, strWLID, "", "0", "");
                }
                catch (Exception ex)
                {

                }

                try
                {
                    //保存表单数据到数据库，用于开发平台一般处理程序方式
                    ClientScript.RegisterStartupScript(this.GetType(), "SaveData",  "<script>saveWFFormDataToDatabase(" + intWLID.ToString() + ");</script>");
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

                ////HL_RelatedDoc.NavigateUrl = "javascript:popShowByURL('" + HL_RelatedDoc.NavigateUrl + "','ChartView','99%','99%',window.location);";

                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>popShowByURL('" + "TTMyWorkDetailMain.aspx?RelatedType=Other&WLID=" + strWLID + "','ToWork','99%','99%',window.location);</script>");

            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBZZXMBTXGZLS + "');</script>");
        }
    }

    protected void BT_ActiveNo_Click(object sender, EventArgs e)
    {
        string strXSNFile, strWLTemName;
        string strWorkFlowName, strDescription;
        int intWLID;
        string strHQL;

        strWLID = "0";

        strWorkFlowName = TB_WorkFlowName.Text.Trim();
        strWLTemName = strTemName;
        strDescription = TB_WLDescription.Text.Trim();
        strXSNFile = GetWorkTemplateXSNFile(strWLTemName);

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
            intWLID = wfSubmitHandle.SubmitApplyForDIYForm(strWLType, strWLTemName, strXSNFile, strWLID, strWorkFlowName, strDescription, "其它", 0, strUserCode, "NO",
                CB_SMS, CB_Mail, LB_WLID, HL_RelatedDoc, HL_RedirectToMyWFDetail, BT_SaveXMLFile, DL_WorkFlow, PublishUrl, this.uri, Context, xdoc);

            strWLID = intWLID.ToString();

            if (intWLID <= 0)
            {
                try
                {
                    wfSubmitHandle.ReLoadFormDataBeforeSubmit(this.Context, LB_PublishUrl.Text.Trim(), LB_Uri.Text.Trim(), xdoc);
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZJGZXJZTJSJSBJC + "');</script>");
                }

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

                if (intWLID == -4)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBCLCMBMYSZYWJC + "');</script>");
                }

                if (intWLID == -5)
                {
                    //检查必填项不为空
                    string strCanNotNullFieldList = WFShareClass.GetCanNotNullFieldListFromWFTemplate(strWLTemName);
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJSBBTXSTRCANNOTNULLFIELDLISTBNWKJC + "');</script>");
                }
            }
            else
            {
                LB_WLID.Text = strWLID;

                strHQL = "Insert Into T_WFStepRelatedWF(WFID,WFStepID,WFChildID) Values (" + "'" + strParentWFID + "'" + "," + "'" + strParentWFStepID + "'" + "," + "'" + strWLID + "'" + ")";
                ShareClass.RunSqlCommand(strHQL);

                //赋全局变量给工作流XML文件
                try
                {
                    wfSubmitHandle.AddGlobalVariable(strWLTemName, strWLID, "", "0", "");
                }
                catch (Exception ex)
                {
                }

                try
                {
                    //保存表单数据到数据库，用于开发平台一般处理程序方式
                    ClientScript.RegisterStartupScript(this.GetType(), "SaveData",  "<script>saveWFFormDataToDatabase(" + intWLID.ToString() + ");</script>");
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


                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZTJGZLSCG + "');</script>");
            }

            ////HL_RelatedDoc.NavigateUrl = "javascript:popShowByURL('" + HL_RelatedDoc.NavigateUrl + "','ChartView','99%','99%',window.location);";
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
                wfSubmitHandle.AddGlobalVariable(strTemName, strWLID, "", "0", "");
            }
            catch (Exception ex)
            {

            }

            try
            {
                //同步表单数据到相应的数据库表
                TakeTopXML.FormConvertToTable(int.Parse(strWLID), 0);

                //保存表单数据到数据库
                ClientScript.RegisterStartupScript(this.GetType(), "SaveData",  "<script>saveWFFormDataToDatabase(" + strWLID + ");</script>");
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

        }
        else
        {
            //赋全局变量给工作流XML文件
            try
            {
                wfSubmitHandle.AddGlobalVariable(strTemName, strWLID, "", "0", "");
            }
            catch (Exception ex)
            {

            }

            try
            {
                //同步表单数据到相应的数据库表
                TakeTopXML.FormConvertToTable(int.Parse(strWLID), 0);

                //保存表单数据到数据库
                ClientScript.RegisterStartupScript(this.GetType(), "SaveData",  "<script>saveWFFormDataToDatabase(" + strWLID + ");</script>");
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


    protected void LoadWorkFlowList(string strWLType, string strTemName)
    {
        string strHQL;

        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        strHQL = "Select * from T_WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.TemName = " + "'" + strTemName + "'" + " and workFlow.CreatorCode = " + "'" + strUserCode + "'" + " and char_length(rtrim(ltrim(workFlow.XSNFile)))>0 Order by workFlow.CreateTime DESC Limit 50";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlow");

        DL_WorkFlow.DataSource = ds;
        DL_WorkFlow.DataBind();

        DL_WorkFlow.Items.Insert(0, new ListItem("--Select--", ""));

        //列表项增加提示
        //PreREnderListBox();
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

    protected string GetWorkFlowType(string strWFID)
    {
        string strHQL;
        IList lst;

        strHQL = "From WLType as wlType Where wlType.ID = " + strWFID;
        WLTypeBLL wlTypeBLL = new WLTypeBLL();
        lst = wlTypeBLL.GetAllWLTypes(strHQL);
        WLType wlType = (WLType)lst[0];

        return wlType.Type.Trim();
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
            string strTemNameR = strTemName;
            string strFileName = strFolder + strTemNameR + DateTime.Now.ToString("yyyyMMddHHmmssff") + ".xml";
            strFileName = Server.MapPath(strFileName);

            //表单数据
            string strXMLHQL = string.Empty;
            strXMLHQL = "select * from	T_WorkFlow WHERE TemName = '" + strTemNameR + "' order by CreateTime desc";
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
