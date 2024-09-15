using System;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
using System.Text;
using System.IO;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;
using System.Linq;

using System.Xml.XPath;
using System.Xml.Xsl;
using System.Xml;

using System.CodeDom;
using Microsoft.CSharp;
using System.CodeDom.Compiler;

using TakeTopInfoPathSoft.Service;


using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

using TakeTopWF;
using TakeTopCore;

public partial class TTAPPDIYWorkFlowForm : System.Web.UI.Page
{
    string PublishUrl = null;
    string uri = null;

    string OldPublishUrl = null;
    string OldUri = null;

    public string strUserCode;
    public string strWLType, strTemName, strWLID;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        string strWFTypeID = Request.QueryString["TargetID"].Trim();

        strWLType = GetWorkFlowType(strWFTypeID);

        if (Page.IsPostBack == false)
        {
            Session["AutoActiveWorkflow"] = "NO";

            LB_WFType.Text = strWLType;

            LoadWorkFlowType(strWLType);
        }
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
        if (strTemName == "")
        {
            LoadWorkFlow(strWLType, "0");
            return;
        }

        Session["AutoActiveWorkflow"] = ShareClass.GetWorkflowTemplateAutoActive(strTemName);

        LoadWorkFlow(strWLType, strTemName);

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
        TB_WorkFlowName.Text = "";
        TB_WLDescription.Text = "";

        LB_PublishUrl.Text = PublishUrl;
        LB_Uri.Text = uri;

        HL_RelatedDoc.Enabled = false;
        BT_SaveXMLFile.Enabled = false;

        BT_Download.Enabled = true;
        BT_Upload.Enabled = true;

        TB_WorkFlowName.Text = strTemName;
        TB_WLDescription.Text = strTemName;

        string strDesignType = ShareClass.GetWLTemplateDesignType(strTemName);
        if (strDesignType == "SL")
        {
            //strJS = "popShowByURL('TTWFChartViewSL.aspx?WLID=0&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(strTemName) + "','ChartView','99%','99%',window.location);";
            //ClientScript.RegisterStartupScript(this.GetType(), "HH11H", "<script>setOnClick(" + HL_WFChartView + ",'" + strJS + "';</script>");

            HL_WFChartView.NavigateUrl = "TTWFChartViewSL.aspx?WLID=0&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(strTemName);
        }
        if (strDesignType == "JS")
        {
            //strJS = "popShowByURL('TTWFChartViewJS.aspx?WLID=0&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(strTemName) + "','ChartView','99%','99%',window.location);";
            //ClientScript.RegisterStartupScript(this.GetType(), "HH11H", "<script>setOnClick(" + HL_WFChartView + ",'" + strJS + "';</script>");

            HL_WFChartView.NavigateUrl = "TTWFChartViewJS.aspx?WLID=0&IdentifyString=" + ShareClass.GetWLTemplateIdentifyString(strTemName);
        }

        //列出待处理的业务单据
        LoadToBeHandledBusinessForm(strUserCode, strTemName);

        //附加用户自定义的JSCode到页面
        WFShareClass.AttachUserJSCodeFromWFTemplate(strTemName, LIT_AttachUserJSCode, strUserCode, "", "0", "");
        ClientScript.RegisterStartupScript(this.GetType(), "HH77H", "<script>jqueryDocumentReady();</script>");

        //附加工作流步骤用户自定义的JSCode到页面
        WFShareClass.AttachUserJSCodeFromWFTemplateStep(strTemName, "0", LIT_AttachUserWFStepJSCode, strUserCode);
        ClientScript.RegisterStartupScript(this.GetType(), "HH88H", "<script>setWorkflowForm();</script>");

        //列表项增加提示
        //PreREnderListBox();

    }

    protected void DL_WorkFlow_SelectedIndexChanged(object sender, EventArgs e)
    {
        int intResult;

        BT_ExportFormToExcel.Enabled = true;

        strWLID = DL_WorkFlow.SelectedValue.Trim();
        LB_WLID.Text = strWLID;

        if (strWLID == "")
        {
            return;
        }

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

        WFSubmitHandle wfSubmitHandle = new WFSubmitHandle();
        intResult = wfSubmitHandle.SelectedWorkFlow(strWLID, DL_WorkFlow, LB_WLID, LB_XSNFile, TB_WorkFlowName,
            TB_WLDescription, xdoc, BT_SaveXMLFile, HL_RelatedDoc, HL_RedirectToMyWFDetail, this.Context, PublishUrl, this.uri);

        OldPublishUrl = wfSubmitHandle.wfOldPublishUrl.ToString();
        OldUri = wfSubmitHandle.wfOldUri.ToString();

        HL_OldWFXMLFile.NavigateUrl = LB_OldWFXMLFile.Text;


        //HL_WorkflowProgressView.NavigateUrl = "TTWFChartViewJS.aspx?WLID=" + strWLID;

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
        ClientScript.RegisterStartupScript(this.GetType(), "HH66H", "<script>jqueryDocumentReady();</script>");

        ////附加工作流步骤用户自定义的JSCode到页面
        //WFShareClass.AttachUserJSCodeFromWFTemplateStep(strTemName, "0", LIT_AttachUserWFStepJSCode, strUserCode);
        ////设置表格属性
        //ClientScript.RegisterStartupScript(this.GetType(), "HH99H", "<script>setWorkflowForm();</script>");

        //列表项增加提示
        //PreREnderListBox();


        HL_RelatedDoc.Enabled = true;
        HL_RelatedDoc.NavigateUrl = HL_RelatedDoc.NavigateUrl;
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

    public void ReloadWorkflowDataToForm(string strWLID, string strTemName)
    {
        int intResult;

        LB_WLID.Text = strWLID;

        //如果数据库表中存在此工作流的数据，那么把表中数据附加到表单中
        int intMainTableID;
        string strWFXMLFile;

        BT_ExportFormToExcel.Enabled = true;


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

        strWLID = "0";

        strWorkFlowName = TB_WorkFlowName.Text.Trim();
        strWLTemName = DL_WorkFlowTemplate.SelectedValue.Trim();
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

            //ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + strWLID + "');</script>");


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
                    ClientScript.RegisterStartupScript(this.GetType(), "SaveData", "<script>saveWFFormDataToDatabase(" + intWLID.ToString() + ");</script>");
                }
                catch
                {
                }

                try
                {
                    //同步表单数据到相应的数据库表
                    int intMainID = GetMainID(DL_ToBeHandledBusinessForm.SelectedValue);
                    TakeTopXML.FormConvertToTable(int.Parse(strWLID), intMainID);

                    //提交后把待处理业务单状态改为已处理
                    string strHQL;
                    strHQL = "Update T_TriggerTableToFrom Set Status = 1 Where ID = " + DL_ToBeHandledBusinessForm.SelectedValue;
                    ShareClass.RunSqlCommand(strHQL);

                    LoadToBeHandledBusinessForm(strUserCode, strTemName);

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


                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>popShowByURL('" + "TTAPPMyWorkDetailMain.aspx?RelatedType=Other&WLID=" + strWLID + "','ToWork','99%','99%',window.location)</script>");

                //ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop11", "popShowByURL('TTMyWorkDetailMain.aspx?RelatedType=Other&WLID=" + strWLID + "','workflow','99%','99%',window.location);", true);
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

        strWLID = "0";

        strWorkFlowName = TB_WorkFlowName.Text.Trim();
        strWLTemName = DL_WorkFlowTemplate.SelectedValue.Trim();
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
                    ClientScript.RegisterStartupScript(this.GetType(), "SaveData", "<script>saveWFFormDataToDatabase(" + intWLID.ToString() + ");</script>");
                }
                catch
                {
                }

                try
                {
                    //同步表单数据到相应的数据库表
                    int intMainID = GetMainID(DL_ToBeHandledBusinessForm.SelectedValue);
                    TakeTopXML.FormConvertToTable(int.Parse(strWLID), intMainID);

                    //提交后把待处理业务单状态改为已处理
                    string strHQL;
                    strHQL = "Update T_TriggerTableToFrom Set Status = 1 Where ID = " + DL_ToBeHandledBusinessForm.SelectedValue;
                    ShareClass.RunSqlCommand(strHQL);

                    LoadToBeHandledBusinessForm(strUserCode, strTemName);

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
                string strWLTemName = DL_WorkFlowTemplate.SelectedValue.Trim();
                wfSubmitHandle.AddGlobalVariable(strWLTemName, strWLID, "", "0", "");
            }
            catch (Exception ex)
            {

            }

            try
            {
                //同步表单数据到相应的数据库表
                int intMainID = GetMainID(DL_ToBeHandledBusinessForm.SelectedValue);
                TakeTopXML.FormConvertToTable(int.Parse(strWLID), intMainID);

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
                    string strWLTemName = DL_WorkFlowTemplate.SelectedValue.Trim();
                    XmlDbWorker.AddFormFromXml(Server.MapPath(strWFXMLFile), int.Parse(strWLID), strWLTemName);
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
                string strWLTemName = DL_WorkFlowTemplate.SelectedValue.Trim();
                wfSubmitHandle.AddGlobalVariable(strWLTemName, strWLID, "", "0", "");
            }
            catch (Exception ex)
            {

            }

            try
            {
                //同步表单数据到相应的数据库表
                int intMainID = GetMainID(DL_ToBeHandledBusinessForm.SelectedValue);
                TakeTopXML.FormConvertToTable(int.Parse(strWLID), intMainID);

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
                    string strWLTemName = DL_WorkFlowTemplate.SelectedValue.Trim();
                    XmlDbWorker.AddFormFromXml(Server.MapPath(strWFXMLFile), int.Parse(strWLID), strWLTemName);
                }
                catch
                {
                }

            }).Start();
        }
    }

    protected void DL_ToBeHandledBusinessForm_SelectedIndexChanged(object sender, EventArgs e)
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
            string strTriggerID = DL_ToBeHandledBusinessForm.SelectedValue;
            int intTriggerID = 0;
            int.TryParse(strTriggerID, out intTriggerID);
            //写入XML文件
            string strFolder = "Doc\\XML\\";
            if (!System.IO.Directory.Exists(Server.MapPath(strFolder)))
            {
                System.IO.Directory.CreateDirectory(Server.MapPath(strFolder));
            }
            string strTemNameR = DL_WorkFlowTemplate.SelectedValue.Trim();
            string strNewWFXMLFile = strFolder + strTemNameR + DateTime.Now.ToString("yyyyMMddHHmmssff") + ".xml";
            strNewWFXMLFile = Server.MapPath(strNewWFXMLFile);

            //表单数据
            string strXMLHQL = string.Empty;
            strXMLHQL = "select * from	T_WorkFlow WHERE TemName = '" + strTemNameR + "' order by CreateTime desc";
            DataSet dsTest = ShareClass.GetDataSetFromSql(strXMLHQL, "XMLTest");
            if (dsTest != null && dsTest.Tables[0].Rows.Count > 0)
            {
                string strWFXMLFile = dsTest.Tables[0].Rows[0]["XMLFile"] == DBNull.Value ? "" : dsTest.Tables[0].Rows[0]["XMLFile"].ToString();
                if (!string.IsNullOrEmpty(strWFXMLFile))
                {
                    strWFXMLFile = Server.MapPath(strWFXMLFile);
                    TakeTopXML.TableConvertToFormByTriggerID(intTriggerID, strTemNameR, strNewWFXMLFile, strWFXMLFile);

                    try
                    {
                        if (PublishUrl != null)
                        {
                            //The method TakeTopInfoPathService.BuildFormByXML() requires the string content of an existing xml document as a parameter.
                            //byte[] xmlContent = new byte[XMLFile.PostedFile.ContentLength];
                            //XMLFile.PostedFile.InputStream.Read(xmlContent, 0, xmlContent.Length);
                            string xml = ShareClass.ReadXML(strNewWFXMLFile);

                            TakeTopInfoPathForm editForm = TakeTopInfoPathService.BuildFormByXML(Context, PublishUrl, xml);
                            xdoc.Text = editForm.Xhtml;

                            BT_Download.Enabled = true;
                        }
                        else
                        {
                            xdoc.Text = "请先注册表单模板.";
                        }
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


    protected void BT_AppendXML_Click(object sender, EventArgs e)
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
            strXMLHQL = "select * from	T_WorkFlow WHERE TemName = '" + strTemNameR + "' order by CreateTime desc";
            DataSet dsTest = ShareClass.GetDataSetFromSql(strXMLHQL, "XMLTest");
            if (dsTest != null && dsTest.Tables[0].Rows.Count > 0)
            {
                string strXMLFile = dsTest.Tables[0].Rows[0]["XMLFile"] == DBNull.Value ? "" : dsTest.Tables[0].Rows[0]["XMLFile"].ToString();
                if (!string.IsNullOrEmpty(strXMLFile))
                {
                    strXMLFile = Server.MapPath(strXMLFile);
                    TakeTopXML.TableConvertToFormByTriggerID(intTriggerID, strTemNameR, strFileName, strXMLFile);

                    try
                    {
                        //string xml = ShareClass.ReadXML(strFileName);
                        //TakeTopInfoPathForm editForm = TakeTopInfoPathService.BuildFormByXML(Context, PublishUrl, xml);
                        //xdoc.Text = editForm.Xhtml;



                        if (PublishUrl != null)
                        {
                            //The method TakeTopInfoPathService.BuildFormByXML() requires the string content of an existing xml document as a parameter.
                            //byte[] xmlContent = new byte[XMLFile.PostedFile.ContentLength];
                            //XMLFile.PostedFile.InputStream.Read(xmlContent, 0, xmlContent.Length);
                            string xml = ShareClass.ReadXML(strFileName);

                            TakeTopInfoPathForm editForm = TakeTopInfoPathService.BuildFormByXML(Context, PublishUrl, xml);
                            xdoc.Text = editForm.Xhtml;

                            BT_Download.Enabled = true;
                        }
                        else
                        {
                            xdoc.Text = "请先注册表单模板.";
                        }
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

    protected void BT_Download_Click(object sender, EventArgs e)
    {
        string strWorkFlowName, strXMLFileName;

        strTemName = DL_WorkFlowTemplate.SelectedValue.Trim();
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

    protected void LoadToBeHandledBusinessForm(string strUserCode, string strTemName)
    {
        DataTable dt = new DataTable();
        try
        {
            string strNotToFormHQL = string.Format(@"select t.ID,(cast(t.MainID as varchar(8)) + t.Name) as Name from T_TriggerTableToFrom t where t.MainTable in (
                            select m.TableName from T_TableTemplateMapping m where m.WFTemplateName = '{0}' 
                            and  m.WFTemplateName in (Select TemName From T_WorkFlowTemplateBusinessMember Where UserCode = '{1}' )
                            )
                            and t.Status = 0 order by CreateTime DESC limit 10", strTemName, strUserCode);
            dt = ShareClass.GetDataSetFromSql(strNotToFormHQL, "NotToForm").Tables[0];

            DL_ToBeHandledBusinessForm.DataSource = dt;
            DL_ToBeHandledBusinessForm.DataBind();

            DL_ToBeHandledBusinessForm.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        catch (Exception ex)
        {

        }
    }

    protected void LoadWorkFlowType(string strWFType)
    {
        LoadWorkFlowTemplate(strUserCode, strWLType);
        DL_WorkFlow.Items.Clear();

        LB_WLID.Text = "";
        TB_WorkFlowName.Text = "";
        TB_WLDescription.Text = "";
        HL_RelatedDoc.Enabled = false;

        //BT_SummitCheck.Enabled = false;
        BT_SaveXMLFile.Enabled = false;
        //BT_Download.Enabled = false;
        //BT_Upload.Enabled = false;
    }

    protected void LoadWorkFlowTemplate(string strUserCode, string strWFType)
    {
        string strHQL;
        string strDepartCode, strUnderDepartString, strParentDepartString;

        strParentDepartString = TakeTopCore.CoreShareClass.InitialParentDepartmentStringByAuthority(strUserCode);
        strUnderDepartString = TakeTopCore.CoreShareClass.InitialUnderDepartmentStringByAuthority(strUserCode);

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);


        strHQL = "Select TemName From T_WorkFlowTemplate Where Visible ='YES' and Type = " + "'" + strWFType + "'" + " and Authority = '所有'" + " and char_length(ltrim(rtrim(XSNFile))) > 0";
        //strHQL += " and (BelongDepartCode in (select ParentDepartCode from F_GetParentDepartCode(" + "'" + strDepartCode + "'" + "))";

        strHQL += " and (BelongDepartCode in " + strParentDepartString;
        strHQL += " Or BelongDepartCode in " + strUnderDepartString;
        strHQL += " Or TemName in (Select TemName From T_WorkFlowTemplateBusinessMember Where UserCode = '" + strUserCode + "')";
        strHQL += " Or TemName in (Select TemName From T_WorkFlowTemplateBusinessDepartment Where DepartCode in " + strParentDepartString + "))";
        strHQL += " Order by SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");

        DL_WorkFlowTemplate.DataSource = ds;
        DL_WorkFlowTemplate.DataBind();

        DL_WorkFlowTemplate.Items.Insert(0, new ListItem("--Select--", ""));

        //列表项增加提示
        //PreREnderListBox();
    }

    protected void LoadWorkFlow(string strWLType, string strTemName)
    {
        string strHQL;

        strHQL = "Select * from T_WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.TemName = " + "'" + strTemName + "'" + " and workFlow.CreatorCode = " + "'" + strUserCode + "'" + " and char_length(rtrim(ltrim(workFlow.XSNFile)))>0 Order by workFlow.CreateTime DESC Limit 50";
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
        DL_WorkFlowTemplate.PreRender += LLB_WorkFlowTemplate_PreRender;

        //LLB_WokFlow.PreRender += LLB_WokFlow_PreRender;
    }

    //列表项增加提示
    private void LLB_WorkFlowTemplate_PreRender(object sender, System.EventArgs e)
    {
        foreach (ListItem item in DL_WorkFlowTemplate.Items)
        {
            item.Attributes.Add("title", item.Text);
        }
    }

    //列表项增加提示
    private void LLB_WokFlow_PreRender(object sender, System.EventArgs e)
    {
        foreach (ListItem item in DL_WorkFlow.Items)
        {
            item.Attributes.Add("title", item.Text);
        }
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

    protected int GetMainID(string strTrigerID)
    {
        string strHQL;

        strHQL = "Select MainID From T_TriggerTableToFrom Where ID = " + strTrigerID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_TriggerTableToFrom");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return int.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }

    ///////////////////////////////////////////////////////////



}
