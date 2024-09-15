using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;

using TakeTopWF;

public partial class TTWorkFlowCommonDataView : System.Web.UI.Page
{
    string strUserCode, strWFStatus, strWFStepStatus, strIsAllowFullEdit;
    public string strWLID, strStepID, strID;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            strUserCode = Session["UserCode"].ToString();

            string strXMLFile = Request.QueryString["XMLFile"].Trim();
            string strTemName = Request.QueryString["TemName"].Trim();

            strWLID = Request.QueryString["WLID"].Trim();
            strStepID = Request.QueryString["StepID"].Trim();
            strID = Request.QueryString["ID"].Trim();

            string strUnVisibleFieldXMLFile;

            LB_WLID.Text = strWLID;
            strWFStatus = GetWorkflowStatus(strWLID);
            strIsAllowFullEdit = GetWorkflowStepDetailAllowFullEdit(strID);

            strWFStepStatus = GetWorkflowStepStatus(strStepID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForWorkflowCommonFormDataPopWindow();", true);
            if (Page.IsPostBack == false)
            {
                if (ShareClass.IsMobileDeviceCheckAgent())
                {
                    IMG_LRArrow.Visible = false;
                    Panel_Head.Visible = false;

                    aPrintAll.Visible = false;
                    aPrintForm.Visible = false;
                }

                LB_WorkflowStatus.Text = GetStatusHomeNameByWorkflowStatus(strWLID);
                LB_Owner.Text = System.Configuration.ConfigurationManager.AppSettings["CopyRight"];

                //附加用户自定义的JSCode到页面
                string strWFCreatorCode = GetWFCreatorCodeByWorkflowID(strWLID);
                TakeTopWF.WFShareClass.AttachUserJSCodeFromWFTemplate(strTemName, LIT_AttachUserJSCode, strWFCreatorCode, "", "0", "");

                //附加工作流步骤用户自定义的JSCode到页面
                if (strStepID != "0")
                {
                    string strCurrentStepSortNumber = ShareClass.GetWorkFlowCurrentStepSortNumber(strStepID).ToString();
                    TakeTopWF.WFShareClass.AttachUserJSCodeFromWFTemplateStep(strTemName, strCurrentStepSortNumber, LIT_AttachUserWFStepJSCode, strWFCreatorCode);
                }

                //把绝对路径转为相对路径
                string strXMLFileName, strXMLFileURL;
                strXMLFileName = System.IO.Path.GetFileName(strXMLFile);//文件名 
                strXMLFileURL = "Doc\\" + "XML" + "\\" + strXMLFileName;

                //取最新流程表单数据文件，并在替换不可视域
                WFDataHandle wfDataHandle = new WFDataHandle();
                strUnVisibleFieldXMLFile = wfDataHandle.GetXMLFileAfterReplaceWFXmlUNVisibleFieldNode(strWLID, strID, strXMLFileURL);
                LB_UnVisibleFieldXMLFile.Text = strUnVisibleFieldXMLFile;

                DataSet ds = new DataSet();
                ds.ReadXml(strUnVisibleFieldXMLFile);

                try
                {
                    DataList43.DataSource = ds;
                    DataList43.DataBind();

                    string strOvertimeType = ((Label)(DataList43.Items[0].FindControl("LB_OvertimeType"))).Text;
                    string strOvertimeApplicantCode = ((Label)(DataList43.Items[0].FindControl("LB_ApplicantCode"))).Text;
                    string strOvertimeStartTime = DateTime.Parse(((Label)(DataList43.Items[0].FindControl("LB_StartTime"))).Text).ToString("yyyyMMdd");

                    ((Label)(DataList43.Items[0].FindControl("LB_TotalOvertimeDaysForCurrrentMonth"))).Text = ShareClass.GetTotalOvertimeDayNumberInCurrentMonth(strOvertimeType, strOvertimeApplicantCode, strOvertimeStartTime);
                    ((Label)(DataList43.Items[0].FindControl("LB_TotalOvertimeDaysForCurrrentYear"))).Text = ShareClass.GetTotalOvertimeDayNumberInCurrentYear(strOvertimeType, strOvertimeApplicantCode, strOvertimeStartTime);

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList43, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList43.Visible = false;
                }


                try
                {
                    DataList1.DataSource = ds;
                    DataList1.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList1, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList1.Visible = false;
                }


                try
                {
                    DataList2.DataSource = ds;
                    DataList2.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList2, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList2.Visible = false;
                }

                try
                {
                    DataList3.DataSource = ds;
                    DataList3.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList3, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList3.Visible = false;
                }

                try
                {
                    DataList4.DataSource = ds;
                    DataList4.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList4, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList4.Visible = false;
                }

                try
                {
                    DataList5.DataSource = ds;
                    DataList5.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList5, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList5.Visible = false;
                }

                try
                {
                    DataList7.DataSource = ds;
                    DataList7.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList7, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList7.Visible = false;
                }

                try
                {
                    DataList8.DataSource = ds;
                    DataList8.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList8, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList8.Visible = false;
                }

                try
                {
                    DataList9.DataSource = ds;
                    DataList9.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList9, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList9.Visible = false;
                }

                try
                {
                    DataList10.DataSource = ds;
                    DataList10.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList10, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList10.Visible = false;
                }

                try
                {
                    DataList11.DataSource = ds;
                    DataList11.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList11, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList11.Visible = false;
                }

                try
                {
                    DataList12.DataSource = ds;
                    DataList12.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList12, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList12.Visible = false;
                }

                try
                {
                    DataList13.DataSource = ds;
                    DataList13.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList13, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList13.Visible = false;
                }

                try
                {
                    DataList14.DataSource = ds;
                    DataList14.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList14, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList14.Visible = false;
                }

                try
                {
                    DataList15.DataSource = ds;
                    DataList15.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList15, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList15.Visible = false;
                }

                try
                {
                    DataList16.DataSource = ds;
                    DataList16.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList16, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList16.Visible = false;
                }

                try
                {
                    DataList17.DataSource = ds;
                    DataList17.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList17, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList17.Visible = false;
                }

                try
                {
                    DataList18.DataSource = ds;
                    DataList18.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList18, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList18.Visible = false;
                }

                try
                {
                    DataList19.DataSource = ds;
                    DataList19.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList19, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList19.Visible = false;
                }

                try
                {
                    DataList20.DataSource = ds;
                    DataList20.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList20, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList20.Visible = false;
                }

                try
                {
                    DataList21.DataSource = ds;
                    DataList21.DataBind();

                    string strLeaveType = ((Label)(DataList21.Items[0].FindControl("LB_LeaveType"))).Text;
                    string strLeaveApplicantCode = ((Label)(DataList21.Items[0].FindControl("LB_ApplicantCode"))).Text;
                    string strLeaveStartTime = DateTime.Parse(((Label)(DataList21.Items[0].FindControl("LB_StartTime"))).Text).ToString("yyyyMMdd");

                    ((Label)(DataList21.Items[0].FindControl("LB_TotalLeaveDaysForCurrrentMonth"))).Text = ShareClass.GetTotalLeaveDayNumberInCurrentMonth(strLeaveType, strLeaveApplicantCode, strLeaveStartTime);
                    ((Label)(DataList21.Items[0].FindControl("LB_TotalLeaveDaysForCurrrentYear"))).Text = ShareClass.GetTotalLeaveDayNumberInCurrentYear(strLeaveType, strLeaveApplicantCode, strLeaveStartTime);

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList21, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList21.Visible = false;
                }


                try
                {
                    DataList22.DataSource = ds;
                    DataList22.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList22, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList22.Visible = false;
                }

                try
                {
                    DataList23.DataSource = ds;
                    DataList23.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList23, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList23.Visible = false;
                }

                try
                {
                    DataList24.DataSource = ds;
                    DataList24.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList24, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList24.Visible = false;
                }

                try
                {
                    DataList25.DataSource = ds;
                    DataList25.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList25, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList25.Visible = false;
                }

                try
                {
                    DataList26.DataSource = ds;
                    DataList26.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList26, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList26.Visible = false;
                }

                try
                {
                    DataList39.DataSource = ds;
                    DataList39.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList39, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList39.Visible = false;
                }

                try
                {
                    DataList40.DataSource = ds;
                    DataList40.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList40, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList40.Visible = false;
                }

                try
                {
                    DataList41.DataSource = ds;
                    DataList41.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList41, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList41.Visible = false;
                }

                try
                {
                    DataList27.DataSource = ds;
                    DataList27.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList27, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList27.Visible = false;
                }

                try
                {
                    DataList28.DataSource = ds;
                    DataList28.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList28, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList28.Visible = false;
                }

                try
                {
                    DataList30.DataSource = ds;
                    DataList30.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList30, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList30.Visible = false;
                }

                try
                {
                    DataList36.DataSource = ds;
                    DataList36.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList36, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList36.Visible = false;
                }

                try
                {
                    DataList37.DataSource = ds;
                    DataList37.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList37, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList37.Visible = false;
                }

                try
                {
                    DataList38.DataSource = ds;
                    DataList38.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList38, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList38.Visible = false;
                }

                try
                {

                    DataList42.DataSource = ds;
                    DataList42.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList42, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch (Exception err)
                {
                    DataList42.Visible = false;
                }

                try
                {
                    DataList6.DataSource = ds;
                    DataList6.DataBind();

                    string strECID = DataList6.DataKeys[0].ToString();
                    ExpenseClaim expenseClaim = GetExpenseClaim(strECID);
                    ((Label)(DataList6.Items[0].FindControl("LB_Status"))).Text = expenseClaim.Status.Trim();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList6, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList6.Visible = false;
                }

                try
                {
                    DataList31.DataSource = ds;
                    DataList31.DataBind();

                    string strPPOID = DataList31.DataKeys[0].ToString();
                    ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant = GetProjectMaterialPaymentApplicant(strPPOID);
                    ((Label)(DataList31.Items[0].FindControl("LB_Status"))).Text = projectMaterialPaymentApplicant.Status.Trim();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList31, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList31.Visible = false;
                }

                try
                {
                    DataList32.DataSource = ds;
                    DataList32.DataBind();

                    string strBMPOID = DataList32.DataKeys[0].ToString();
                    BMPurchaseApplication bMPurchaseApplication = GetBMPurchaseApplication(strBMPOID);
                    ((Label)(DataList32.Items[0].FindControl("LB_Status"))).Text = bMPurchaseApplication.Status.Trim();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList32, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList32.Visible = false;
                }

                try
                {
                    DataList33.DataSource = ds;
                    DataList33.DataBind();

                    string strPPOID = DataList33.DataKeys[0].ToString();
                    ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant = GetProjectMaterialPaymentApplicant(strPPOID);
                    ((Label)(DataList33.Items[0].FindControl("LB_Status"))).Text = projectMaterialPaymentApplicant.Status.Trim();


                    //设置“修改”链接为不可视
                    SetControlDisable(DataList33, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList33.Visible = false;
                }

                try
                {
                    DataList34.DataSource = ds;
                    DataList34.DataBind();

                    string strPPOID = DataList34.DataKeys[0].ToString();
                    SupplierAssetPaymentApplicant supplierAssetPaymentApplicant = GetSupplierAssetPaymentApplicant(strPPOID);
                    ((Label)(DataList34.Items[0].FindControl("LB_Status"))).Text = supplierAssetPaymentApplicant.Status.Trim();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList34, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch
                {
                    DataList34.Visible = false;
                }

                try
                {
                    DataList35.DataSource = ds;
                    DataList35.DataBind();

                    string strCPVID = DataList35.DataKeys[0].ToString();
                    ConstractPayableVisa constractPayableVisa = GetConstractPayableVisa(strCPVID);

                    try
                    {
                        if (constractPayableVisa.ProjectID != 0)
                        {
                            ((Label)(DataList35.Items[0].FindControl("LB_ProjectName"))).Text = ShareClass.GetProjectName(constractPayableVisa.ProjectID.ToString());
                        }
                    }
                    catch
                    {
                    }

                    try
                    {
                        if (constractPayableVisa.ConstractPayableID != 0)
                        {
                            ((Label)(DataList35.Items[0].FindControl("LB_ConstractPayablePlanName"))).Text = GetConstractPayableAccount(constractPayableVisa.ConstractPayableID.ToString());
                        }
                    }
                    catch
                    {
                    }

                    ((TextBox)(DataList35.Items[0].FindControl("TB_RelatedImpact"))).Text = constractPayableVisa.RelatedImpact;
                    ((TextBox)(DataList35.Items[0].FindControl("TB_RelatedResult"))).Text = constractPayableVisa.RelatedResult;

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList35, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch (Exception err)
                {
                    //LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
                    DataList35.Visible = false;
                }

                try
                {
                    DataList44.DataSource = ds;
                    DataList44.DataBind();

                    //设置“修改”链接为不可视
                    SetControlDisable(DataList44, "HL_WLBusinessUpdate", strWFStatus, strWFStepStatus, strIsAllowFullEdit);
                }
                catch(Exception err)
                {
                    //LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
                    DataList44.Visible = false;
                }


                try
                {
                    LoadRelatedDoc(strWLID);
                    LoadWorkFlowRelatedOtherDoc(strUserCode, strWLID);
                    LoadWorkflowApproveRecord(strWLID);
                    //LoadWorkflowDataFileList(strID);

                    //取和上级流程的审批记录
                    string strParentWFID, strParentWFStepID;
                    strParentWFID = ShareClass.GetParentWorklowID(strWLID);
                    strParentWFStepID = ShareClass.GetParentWorklowStepID(strWLID);
                    if (strParentWFID != "0")
                    {
                        HL_ParentWorkflowApproveRecord.Visible = true;
                        HL_ParentWorkflowApproveRecord.NavigateUrl = "TTWorkFlowViewMain.aspx?WLID=" + strParentWFID;
                    }
                    else
                    {
                        HL_ParentWorkflowApproveRecord.Visible = false;
                    }
                }
                catch (Exception err)
                {
                    //LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
                }
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "click", "alert('" + Resources.lang.ZZJGCGZLMBBCZQJC + "')", true);
        }
    }

    //设置元素为不可视
    protected void SetControlDisable(DataList dataList, string strControlName, string strWFStatus, string strWFStepStatus, string strIsAllowFullEdit)
    {
        try
        {
            if (strWFStatus == "通过" | strWFStatus == "结案" | strIsAllowFullEdit == "NO" | strWFStepStatus == "通过")
            {
                ((HyperLink)(dataList.Items[0].FindControl(strControlName))).Visible = false;
            }
        }
        catch
        {
        }
    }

    //取得是否允许全表编辑
    protected string GetWorkflowStepDetailAllowFullEdit(string strStepDetailID)
    {
        string strHQL;

        if (strID == "0")
        {
            return "YES";
        }

        strHQL = "Select AllowFullEdit From T_WorkFlowStepDetail Where ID = " + strStepDetailID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepDetail");
        if (ds.Tables[0].Rows.Count == 0)
        {
            strHQL = "Select AllowFullEdit From T_WorkFlowStepDetailBackup Where ID = " + strStepDetailID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepDetailBackup");
        }

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "NO";
        }
    }

    //取得工作流步骤的状态
    protected string GetWorkflowStepStatus(string strStepID)
    {
        string strHQL;

        strHQL = "Select Status From T_WorkFlowStep Where StepID = " + strStepID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStep");
        if (ds.Tables[0].Rows.Count == 0)
        {
            strHQL = "Select Status From T_WorkFlowStepBackup Where StepID = " + strStepID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepBackup");
        }

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "处理中";
        }
    }

    protected ConstractPayableVisa GetConstractPayableVisa(string strVisaID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ConstractPayableVisa as constractPayableVisa Where constractPayableVisa.ID = " + strVisaID;
        ConstractPayableVisaBLL constractPayableVisaBLL = new ConstractPayableVisaBLL();
        lst = constractPayableVisaBLL.GetAllConstractPayableVisas(strHQL);
        ConstractPayableVisa constractPayableVisa = (ConstractPayableVisa)lst[0];

        return constractPayableVisa;
    }

    protected string GetConstractPayableAccount(string strPayableID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractPayable as constractPayable where constractPayable.ID = " + strPayableID;

        strHQL += " Order By constractPayable.ID DESC";
        ConstractPayableBLL constractPayableBLL = new ConstractPayableBLL();
        lst = constractPayableBLL.GetAllConstractPayables(strHQL);

        ConstractPayable constractPayable = (ConstractPayable)lst[0];

        return constractPayable.Account.Trim();
    }

    protected void DataList6_ItemCommand(object sender, DataListCommandEventArgs e)
    {
        string strECID, strAccountCode, strAccountName, strRelatedType, strRelatedID, strApplicantCode;
        int intReAndPayalbeID;
        string strHQL;
        IList lst;

        if (e.CommandName == "OpenAccount")
        {
            strECID = DataList6.DataKeys[e.Item.ItemIndex].ToString();

            ExpenseClaim expenseClaim = GetExpenseClaim(strECID);

            //插入应收应付数据到应收应付表
            //decimal deAmount = expenseClaim.Amount;
            string strCurrencyType = expenseClaim.CurrencyType.Trim();
            string strReAndPayer = expenseClaim.ApplicantCode.Trim() + expenseClaim.ApplicantName.Trim();
            string strStatus = expenseClaim.Status.Trim();
            string strPayMethod = "转账";

            strApplicantCode = expenseClaim.ApplicantCode.Trim();
            strRelatedType = expenseClaim.RelatedType.Trim();
            strRelatedID = expenseClaim.RelatedID.ToString();

            int intProjectID = 1;

            if (strStatus != "已记账")
            {
                decimal deDetailAmount;

                LB_WorkflowStatus.Text = strWFStatus;

                if (strWFStatus == "通过" | strWFStatus == "结案")
                {
                    strHQL = "From ExpenseClaimDetail as expenseClaimDetail Where expenseClaimDetail.ECID = " + strECID;
                    ExpenseClaimDetailBLL expenseClaimDetailBLL = new ExpenseClaimDetailBLL();
                    lst = expenseClaimDetailBLL.GetAllExpenseClaimDetails(strHQL);
                    ExpenseClaimDetail expenseClaimDetail = new ExpenseClaimDetail();

                    for (int i = 0; i < lst.Count; i++)
                    {
                        expenseClaimDetail = (ExpenseClaimDetail)lst[i];
                        strAccountName = expenseClaimDetail.Account;
                        strAccountCode = expenseClaimDetail.AccountCode;
                        deDetailAmount = expenseClaimDetail.Amount;

                        intReAndPayalbeID = ShareClass.InsertReceivablesOrPayableByAccount("Payables", "ExpenseCO", "ExpenseCO", strECID, strECID, strAccountCode, strAccountName, deDetailAmount, strCurrencyType, strReAndPayer, strApplicantCode, intProjectID);
                        ShareClass.InsertReceivablesOrPayableRecord("Payables", intReAndPayalbeID, deDetailAmount, strCurrencyType, strPayMethod, strReAndPayer, strApplicantCode, intProjectID);

                        strHQL = "Update T_ConstractPayable Set OutOfPocketAccount = " + deDetailAmount.ToString() + ",UNPayAmount = 0 Where ID = " + intReAndPayalbeID.ToString();
                        ShareClass.RunSqlCommand(strHQL);

                        if (strRelatedType != "项目")
                        {
                            //把报销费用列入预算费用
                            if (strAccountCode != "")
                            {
                                ShareClass.AddClaimExpenseToBudget(strAccountCode, strAccountName, 0, strApplicantCode, deDetailAmount, DateTime.Now.Year, DateTime.Now.Month);
                            }
                        }
                    }

                    strHQL = "Update T_ExpenseClaim Set Status = '已记账' Where ECID = " + strECID;
                    ShareClass.RunSqlCommand(strHQL);

                    ((Label)(DataList6.Items[0].FindControl("LB_Status"))).Text = "已记账";

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJZCG + "')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('只有流程状态为通过或结案的才能记账！')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBBNZFJZ + "')", true);
            }
        }
    }

    protected void DataList31_ItemCommand(object sender, DataListCommandEventArgs e)
    {
        string strAOID, strAccountCode, strAccountName;
        int intReAndPayalbeID;
        string strHQL;
        IList lst;

        if (e.CommandName == "OpenAccount")
        {
            strAOID = DataList31.DataKeys[e.Item.ItemIndex].ToString();

            ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant = GetProjectMaterialPaymentApplicant(strAOID);

            //插入应收应付数据到应收应付表
            //decimal deAmount = projectMaterialPaymentApplicant.CurrentTotalPaymentAmount;
            string strCurrencyType = projectMaterialPaymentApplicant.CurrencyType.Trim();
            string strReAndPayer = projectMaterialPaymentApplicant.PartA.Trim();
            string strStatus = projectMaterialPaymentApplicant.Status.Trim();
            int intProjectID = projectMaterialPaymentApplicant.ProjectID;
            string strApplicantCode = projectMaterialPaymentApplicant.UserCode.Trim();
            string strApplicantName = projectMaterialPaymentApplicant.UserName.Trim();
            string strPayMethod = projectMaterialPaymentApplicant.PaymentMethod.Trim();

            decimal deDetailAmount;

            if (strStatus != "已记账")
            {
                LB_WorkflowStatus.Text = strWFStatus;

                if (strWFStatus == "通过" | strWFStatus == "结案")
                {
                    strHQL = "From ProjectMaterialPaymentApplicantDetail as projectMaterialPaymentApplicantDetail Where projectMaterialPaymentApplicantDetail.AOID = " + strAOID;
                    ProjectMaterialPaymentApplicantDetailBLL projectMaterialPaymentApplicantDetailBLL = new ProjectMaterialPaymentApplicantDetailBLL();
                    lst = projectMaterialPaymentApplicantDetailBLL.GetAllProjectMaterialPaymentApplicantDetails(strHQL);
                    ProjectMaterialPaymentApplicantDetail projectMaterialPaymentApplicantDetail = new ProjectMaterialPaymentApplicantDetail();

                    for (int i = 0; i < lst.Count; i++)
                    {
                        projectMaterialPaymentApplicantDetail = (ProjectMaterialPaymentApplicantDetail)lst[i];
                        strAccountName = projectMaterialPaymentApplicantDetail.AccountName;
                        strAccountCode = projectMaterialPaymentApplicantDetail.AccountCode;
                        deDetailAmount = projectMaterialPaymentApplicantDetail.Amount;

                        intReAndPayalbeID = ShareClass.InsertReceivablesOrPayableByAccount("Payables", "GoodsPUPO", "GoodsPUPO", strAOID, strAOID, strAccountCode, strAccountName, deDetailAmount, strCurrencyType, strReAndPayer, strApplicantCode, intProjectID);
                        ShareClass.InsertReceivablesOrPayableRecord("Payables", intReAndPayalbeID, deDetailAmount, strCurrencyType, strPayMethod, strReAndPayer, strApplicantCode, intProjectID);

                        strHQL = "Update T_ConstractPayable Set OutOfPocketAccount = " + deDetailAmount.ToString() + ",UNPayAmount = 0 Where ID = " + intReAndPayalbeID.ToString();
                        ShareClass.RunSqlCommand(strHQL);

                        //把申报费用列入项目费用
                        if (intProjectID > 1)
                        {
                            ShareClass.AddConstractPayAmountToProExpense(intProjectID.ToString(), intReAndPayalbeID.ToString(), strAccountCode, strAccountName, "物资采购费用", deDetailAmount, strCurrencyType, strApplicantCode, strApplicantName);
                        }
                    }

                    strHQL = "Update T_ProjectMaterialPaymentApplicant Set Status = '已记账' Where AOID = " + strAOID;
                    ShareClass.RunSqlCommand(strHQL);


                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJZCG + "')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('只有流程状态为通过或结案的才能记账！')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBBNZFJZ + "')", true);
            }
        }
    }

    protected void DataList32_ItemCommand(object sender, DataListCommandEventArgs e)
    {
        string strID, strAccountCode, strAccountName;
        int intReAndPayalbeID;
        string strHQL;

        if (e.CommandName == "OpenAccount")
        {
            strID = DataList32.DataKeys[e.Item.ItemIndex].ToString();

            BMPurchaseApplication bMPurchaseApplication = GetBMPurchaseApplication(strID);

            //插入应收应付数据到应收应付表
            decimal deAmount = bMPurchaseApplication.TotalPayAmount;
            string strCurrencyType = bMPurchaseApplication.CurrencyType.Trim();
            string strReAndPayer = bMPurchaseApplication.SupplierName.Trim();
            string strStatus = bMPurchaseApplication.Status.Trim();
            int intProjectID = bMPurchaseApplication.ProjectID;
            string strApplicantCode = bMPurchaseApplication.EnterCode.Trim();
            string strApplicantName = bMPurchaseApplication.Application;
            strAccountCode = bMPurchaseApplication.AccountCode.Trim();
            strAccountName = bMPurchaseApplication.AccountName.Trim();
            string strPayMethod = "转账";

            if (strStatus != "已记账")
            {
                if (strWFStatus == "通过" | strWFStatus == "结案")
                {
                    intReAndPayalbeID = ShareClass.InsertReceivablesOrPayableByAccount("Payables", "BMOPO", "BMOPO", strID, strID, strAccountCode, strAccountName, deAmount, strCurrencyType, strReAndPayer, strApplicantCode, intProjectID);
                    ShareClass.InsertReceivablesOrPayableRecord("Payables", intReAndPayalbeID, deAmount, strCurrencyType, strPayMethod, strReAndPayer, strApplicantCode, intProjectID);

                    strHQL = "Update T_ConstractPayable Set OutOfPocketAccount = " + deAmount.ToString() + ",UNPayAmount = 0 Where ID = " + intReAndPayalbeID.ToString();
                    ShareClass.RunSqlCommand(strHQL);

                    //把申报费用列入项目费用
                    if (intProjectID > 1)
                    {
                        ShareClass.AddConstractPayAmountToProExpense(intProjectID.ToString(), intReAndPayalbeID.ToString(), strAccountCode, strAccountName, "工程分包费用", deAmount, strCurrencyType, strApplicantCode, strApplicantName);
                    }

                    strHQL = "Update T_BMPurchaseApplication Set Status = '已记账' Where ID = " + strID;
                    ShareClass.RunSqlCommand(strHQL);

                    ((Label)(DataList32.Items[0].FindControl("LB_Status"))).Text = "已记账";

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJZCG + "')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('只有流程状态为通过或结案的才能记账！')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBBNZFJZ + "')", true);
            }
        }
    }


    protected void DataList33_ItemCommand(object sender, DataListCommandEventArgs e)
    {
        string strAOID, strAccountCode, strAccountName;
        int intReAndPayalbeID;
        string strHQL;
        IList lst;

        if (e.CommandName == "OpenAccount")
        {
            strAOID = DataList33.DataKeys[e.Item.ItemIndex].ToString();

            ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant = GetProjectMaterialPaymentApplicant(strAOID);

            //插入应收应付数据到应收应付表
            //decimal deAmount = projectMaterialPaymentApplicant.CurrentTotalPaymentAmount;
            string strCurrencyType = projectMaterialPaymentApplicant.CurrencyType.Trim();
            string strReAndPayer = projectMaterialPaymentApplicant.PartA.Trim();
            string strStatus = projectMaterialPaymentApplicant.Status.Trim();
            int intProjectID = projectMaterialPaymentApplicant.ProjectID;
            string strApplicantCode = projectMaterialPaymentApplicant.UserCode.Trim();
            string strApplicantName = projectMaterialPaymentApplicant.UserName.Trim();
            string strPayMethod = projectMaterialPaymentApplicant.PaymentMethod.Trim();

            decimal deDetailAmount;

            if (strStatus != "已记账")
            {
                LB_WorkflowStatus.Text = strWFStatus;

                if (strWFStatus == "通过" | strWFStatus == "结案")
                {
                    strHQL = "From ProjectMaterialPaymentApplicantDetail as projectMaterialPaymentApplicantDetail Where projectMaterialPaymentApplicantDetail.AOID = " + strAOID;
                    ProjectMaterialPaymentApplicantDetailBLL projectMaterialPaymentApplicantDetailBLL = new ProjectMaterialPaymentApplicantDetailBLL();
                    lst = projectMaterialPaymentApplicantDetailBLL.GetAllProjectMaterialPaymentApplicantDetails(strHQL);
                    ProjectMaterialPaymentApplicantDetail projectMaterialPaymentApplicantDetail = new ProjectMaterialPaymentApplicantDetail();

                    for (int i = 0; i < lst.Count; i++)
                    {
                        projectMaterialPaymentApplicantDetail = (ProjectMaterialPaymentApplicantDetail)lst[i];
                        strAccountName = projectMaterialPaymentApplicantDetail.AccountName;
                        strAccountCode = projectMaterialPaymentApplicantDetail.AccountCode;
                        deDetailAmount = projectMaterialPaymentApplicantDetail.Amount;

                        intReAndPayalbeID = ShareClass.InsertReceivablesOrPayableByAccount("Payables", "GoodsPUPO", "GoodsPUPO", strAOID, strAOID, strAccountCode, strAccountName, deDetailAmount, strCurrencyType, strReAndPayer, strApplicantCode, intProjectID);
                        ShareClass.InsertReceivablesOrPayableRecord("Payables", intReAndPayalbeID, deDetailAmount, strCurrencyType, strPayMethod, strReAndPayer, strApplicantCode, intProjectID);

                        strHQL = "Update T_ConstractPayable Set OutOfPocketAccount = " + deDetailAmount.ToString() + ",UNPayAmount = 0 Where ID = " + intReAndPayalbeID.ToString();
                        ShareClass.RunSqlCommand(strHQL);

                        //把申报费用列入项目费用
                        if (intProjectID > 1)
                        {
                            ShareClass.AddConstractPayAmountToProExpense(intProjectID.ToString(), intReAndPayalbeID.ToString(), strAccountCode, strAccountName, "物资采购费用", deDetailAmount, strCurrencyType, strApplicantCode, strApplicantName);
                        }
                    }

                    strHQL = "Update T_ProjectMaterialPaymentApplicant Set Status = '已记账' Where AOID = " + strAOID;
                    ShareClass.RunSqlCommand(strHQL);


                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJZCG + "')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('只有流程状态为通过或结案的才能记账！')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBBNZFJZ + "')", true);
            }
        }
    }

    protected void DataList34_ItemCommand(object sender, DataListCommandEventArgs e)
    {
        string strAOID, strAccountCode, strAccountName;
        int intReAndPayalbeID;
        string strHQL;
        IList lst;

        if (e.CommandName == "OpenAccount")
        {
            strAOID = DataList34.DataKeys[e.Item.ItemIndex].ToString();

            SupplierAssetPaymentApplicant supplierAssetPaymentApplicant = GetSupplierAssetPaymentApplicant(strAOID);

            //插入应收应付数据到应收应付表
            //decimal deAmount = supplierAssetPaymentApplicant.CurrentTotalPaymentAmount;
            string strCurrencyType = supplierAssetPaymentApplicant.CurrencyType.Trim();
            string strReAndPayer = supplierAssetPaymentApplicant.PartA.Trim();
            string strStatus = supplierAssetPaymentApplicant.Status.Trim();
            int intProjectID = supplierAssetPaymentApplicant.ProjectID;
            string strApplicantCode = supplierAssetPaymentApplicant.UserCode.Trim();
            string strApplicantName = supplierAssetPaymentApplicant.UserName.Trim();
            string strPayMethod = supplierAssetPaymentApplicant.PaymentMethod.Trim();

            decimal deDetailAmount;

            if (strStatus != "已记账")
            {
                LB_WorkflowStatus.Text = strWFStatus;

                if (strWFStatus == "通过" | strWFStatus == "结案")
                {
                    strHQL = "From SupplierAssetPaymentApplicantDetail as supplierAssetPaymentApplicantDetail Where supplierAssetPaymentApplicantDetail.AOID = " + strAOID;
                    SupplierAssetPaymentApplicantDetailBLL supplierAssetPaymentApplicantDetailBLL = new SupplierAssetPaymentApplicantDetailBLL();
                    lst = supplierAssetPaymentApplicantDetailBLL.GetAllSupplierAssetPaymentApplicantDetails(strHQL);
                    SupplierAssetPaymentApplicantDetail supplierAssetPaymentApplicantDetail = new SupplierAssetPaymentApplicantDetail();

                    for (int i = 0; i < lst.Count; i++)
                    {
                        supplierAssetPaymentApplicantDetail = (SupplierAssetPaymentApplicantDetail)lst[i];
                        strAccountName = supplierAssetPaymentApplicantDetail.AccountName;
                        strAccountCode = supplierAssetPaymentApplicantDetail.AccountCode;
                        deDetailAmount = supplierAssetPaymentApplicantDetail.Amount;

                        intReAndPayalbeID = ShareClass.InsertReceivablesOrPayableByAccount("Payables", "AssetPUPO", "AssetPUPO", strAOID, strAOID, strAccountCode, strAccountName, deDetailAmount, strCurrencyType, strReAndPayer, strApplicantCode, intProjectID);
                        ShareClass.InsertReceivablesOrPayableRecord("Payables", intReAndPayalbeID, deDetailAmount, strCurrencyType, strPayMethod, strReAndPayer, strApplicantCode, intProjectID);

                        strHQL = "Update T_ConstractPayable Set OutOfPocketAccount = " + deDetailAmount.ToString() + ",UNPayAmount = 0 Where ID = " + intReAndPayalbeID.ToString();
                        ShareClass.RunSqlCommand(strHQL);

                        //把申报费用列入项目费用
                        if (intProjectID > 1)
                        {
                            ShareClass.AddConstractPayAmountToProExpense(intProjectID.ToString(), intReAndPayalbeID.ToString(), strAccountCode, strAccountName, "资产采购费用", deDetailAmount, strCurrencyType, strApplicantCode, strApplicantName);
                        }
                    }

                    strHQL = "Update T_SupplierAssetPaymentApplicant Set Status = '已记账' Where AOID = " + strAOID;
                    ShareClass.RunSqlCommand(strHQL);


                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJZCG + "')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('只有流程状态为通过或结案的才能记账！')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBBNZFJZ + "')", true);
            }
        }
    }

    protected void DataList35_ItemCommand(object sender, DataListCommandEventArgs e)
    {
        string strID, strRelatedImpact, strRelatedResult;

        string strHQL;

        strID = DataList35.DataKeys[e.Item.ItemIndex].ToString();

        if (e.CommandName == "SelectConstractPayablePlan")
        {

        }

        if (e.CommandName == "SaveImpact")
        {
            strRelatedImpact = ((TextBox)e.Item.FindControl("TB_RelatedImpact")).Text.Trim();

            LB_WorkflowStatus.Text = strWFStatus;

            if (strWFStatus != "通过" | strWFStatus != "结案")
            {
                strHQL = "Update T_ConstractPayableVisa Set RelatedImpact = '" + strRelatedImpact + "' Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('只有流程状态不为通过或结案的才能保存！')", true);
            }
        }

        if (e.CommandName == "SaveResult")
        {
            strRelatedResult = ((TextBox)e.Item.FindControl("TB_RelatedResult")).Text.Trim();

            LB_WorkflowStatus.Text = strWFStatus;

            if (strWFStatus != "通过" | strWFStatus != "结案")
            {
                strHQL = "Update T_ConstractPayableVisa Set RelatedResult = '" + strRelatedResult + "' Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('只有流程状态不为通过或结案的才能保存！')", true);
            }
        }
    }



    //取得物资供应商的累计金额
    public decimal GetTotalProjectMaterialPaymentApplicantAmount(string strSupplier, string strProjectID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(CurrentTotalPaymentAmount),0) From T_ProjectMaterialPaymentApplicant Where PartA = '" + strSupplier + "'";
        if (strProjectID != "1")
        {
            strHQL += " and ProjectID = " + strProjectID;
        }
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMaterialPaymentApplicant");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }

    //取得物资已付供应商的累计金额
    public decimal GetProjectTotalAleadyMaterialPaymentApplicantAmount(string strSupplier, string strProjectID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(CurrentTotalPaymentAmount),0) From T_ProjectMaterialPaymentApplicant Where PartA = '" + strSupplier + "'";
        if (strProjectID != "1")
        {
            strHQL += " and ProjectID = " + strProjectID;
        }
        strHQL += " and Status = '已记账'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMaterialPaymentApplicant");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }

    //取得资产供应商的累计金额
    public decimal GetTotalSupplierAssetPaymentApplicantAmount(string strSupplier, string strProjectID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(CurrentTotalPaymentAmount),0) From T_SupplierAssetPaymentApplicant Where PartA = '" + strSupplier + "'";
        if (strProjectID != "1")
        {
            strHQL += " and ProjectID = " + strProjectID;
        }
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_SupplierAssetPaymentApplicant");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }

    //取得资产已付供应商的累计金额
    public decimal GetSupplierAssetAleadyMaterialPaymentApplicantAmount(string strSupplier, string strProjectID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(CurrentTotalPaymentAmount),0) From T_SupplierAssetPaymentApplicant Where PartA = '" + strSupplier + "'";
        if (strProjectID != "1")
        {
            strHQL += " and ProjectID = " + strProjectID;
        }
        strHQL += " and Status = '已记账'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_SupplierAssetPaymentApplicant");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }


    //取得分包供应商的付款总额
    public decimal GetTotalBMPurchaseApplicationAmount(string strSupplierName, string strProjectID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(TotalPayAmount),0) From T_BMPurchaseApplication Where SupplierName = '" + strSupplierName + "'";
        if (strProjectID != "1")
        {
            strHQL += " and ProjectID = " + strProjectID;
        }
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMPurchaseApplication");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }

    //取得分包供应商的已付款总额
    public decimal GetTotalAleadyBMPurchaseApplicationAmount(string strSupplierName, string strProjectID)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(TotalPayAmount),0) From T_BMPurchaseApplication Where SupplierName = '" + strSupplierName + "'";
        if (strProjectID != "1")
        {
            strHQL += " and ProjectID = " + strProjectID;
        }
        strHQL += " and Status = '已记账'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMPurchaseApplication");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            return 0;
        }
    }

    protected ProjectMaterialPaymentApplicant GetProjectMaterialPaymentApplicant(string strAOID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ProjectMaterialPaymentApplicant as projectMaterialPaymentApplicant Where projectMaterialPaymentApplicant.AOID = " + strAOID;
        ProjectMaterialPaymentApplicantBLL projectMaterialPaymentApplicantBLL = new ProjectMaterialPaymentApplicantBLL();
        lst = projectMaterialPaymentApplicantBLL.GetAllProjectMaterialPaymentApplicants(strHQL);
        ProjectMaterialPaymentApplicant projectMaterialPaymentApplicant = (ProjectMaterialPaymentApplicant)lst[0];

        return projectMaterialPaymentApplicant;
    }

    protected SupplierAssetPaymentApplicant GetSupplierAssetPaymentApplicant(string strAOID)
    {
        string strHQL;
        IList lst;

        strHQL = "From SupplierAssetPaymentApplicant as supplierAssetPaymentApplicant Where supplierAssetPaymentApplicant.AOID = " + strAOID;
        SupplierAssetPaymentApplicantBLL supplierAssetPaymentApplicantBLL = new SupplierAssetPaymentApplicantBLL();
        lst = supplierAssetPaymentApplicantBLL.GetAllSupplierAssetPaymentApplicants(strHQL);
        SupplierAssetPaymentApplicant supplierAssetPaymentApplicant = (SupplierAssetPaymentApplicant)lst[0];

        return supplierAssetPaymentApplicant;
    }

    protected BMPurchaseApplication GetBMPurchaseApplication(string strID)
    {
        string strHQL;
        IList lst;

        strHQL = "From BMPurchaseApplication as bMPurchaseApplication Where bMPurchaseApplication.ID = " + strID;
        BMPurchaseApplicationBLL bMPurchaseApplicationBLL = new BMPurchaseApplicationBLL();
        lst = bMPurchaseApplicationBLL.GetAllBMPurchaseApplications(strHQL);
        BMPurchaseApplication bMPurchaseApplication = (BMPurchaseApplication)lst[0];

        return bMPurchaseApplication;
    }

    //取得非具体业务对销报销款的申请人代码
    protected string GetExpenseClaimApplicantCode(string strECID)
    {
        string strHQL;

        strHQL = "Select ApplicantCode From T_ExpenseClaim Where ECID = " + strECID;
        strHQL += " and RelatedType = '其它' ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ExpenseClaim");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "";
        }
    }

    protected ExpenseClaim GetExpenseClaim(string strECID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ExpenseClaim as expenseClaim where expenseClaim.ECID = " + strECID;
        ExpenseClaimBLL expenseClaimBLL = new ExpenseClaimBLL();
        lst = expenseClaimBLL.GetAllExpenseClaims(strHQL);

        return (ExpenseClaim)lst[0];
    }

    protected string GetWFCreatorCodeByWorkflowID(string strWLID)
    {
        string strHQL;
        string strWFCreatorCode;

        DataSet ds;


        strHQL = "Select CreatorCode From T_WorkFlow Where WLID = " + strWLID;
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_Workflow");
        if (ds.Tables[0].Rows.Count == 0)
        {
            strHQL = "Select CreatorCode From T_WorkFlowBackup Where WLID = " + strWLID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkflowBackup");
        }

        strWFCreatorCode = ds.Tables[0].Rows[0][0].ToString();

        return ShareClass.GetStatusHomeNameByWorkflowStatus(strWFCreatorCode);
    }

    protected string GetWorkflowStatus(string strWLID)
    {
        string strHQL;
        string strStatus;

        DataSet ds;


        strHQL = "Select Status From T_WorkFlow Where WLID = " + strWLID;
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_Workflow");
        if (ds.Tables[0].Rows.Count == 0)
        {
            strHQL = "Select Status From T_WorkFlowBackup Where WLID = " + strWLID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkflowBackup");
        }

        strStatus = ds.Tables[0].Rows[0][0].ToString().Trim();

        return strStatus;
    }

    protected string GetStatusHomeNameByWorkflowStatus(string strWLID)
    {
        string strHQL;
        string strStatus;

        DataSet ds;


        strHQL = "Select Status From T_WorkFlow Where WLID = " + strWLID;
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_Workflow");
        if (ds.Tables[0].Rows.Count == 0)
        {
            strHQL = "Select Status From T_WorkFlowBackup Where WLID = " + strWLID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkflowBackup");
        }

        strStatus = ds.Tables[0].Rows[0][0].ToString();

        return ShareClass.GetStatusHomeNameByWorkflowStatus(strStatus);
    }

    //列出审核记录
    protected void LoadWorkflowApproveRecord(string strWFID)
    {
        string strHQL;
        DataSet ds;

        try
        {
            strHQL = "Select A.*,B.SortNumber,B.StepName from T_WorkFlowStepDetail A,T_WorkFlowStep B where A.StepID = B.StepID and  (A.WLID = " + strWFID;
            strHQL += " or A.WLID in (Select WFChildID From T_WFStepRelatedWF Where WFID = " + strWFID + " ))";
            strHQL += " and COALESCE(A.Operation,'')  <> ''";
            strHQL += " Order by A.ID DESC";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_ApproveFlow");
            if (ds.Tables[0].Rows.Count == 0)
            {
                strHQL = "Select A.*,B.SortNumber,B.StepName from T_WorkFlowStepDetailBackup A,T_WorkFlowStepBackup B where A.StepID = B.StepID and  (A.WLID = " + strWFID;
                strHQL += " or A.WLID in (Select WFChildID From T_WFStepRelatedWF Where WFID = " + strWFID + " ))";
                strHQL += " and COALESCE(A.Operation,'') <> ''";
                strHQL += " Order by A.ID DESC";
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_ApproveFlowBackup");
            }

            DataList29.DataSource = ds;
            DataList29.DataBind();
        }
        catch
        {
        }
    }

    protected void LoadRelatedDoc(string strWLID)
    {
        string strHQL, strUserCode, strDepartCode;
        IList lst;

        strUserCode = Session["UserCode"].ToString();
        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strHQL = "from Document as document where document.Status <> '删除' ";
        strHQL += " and (document.RelatedType = '工作流' and (document.RelatedID = " + strWLID + " Or document.RelatedID in (Select wfStepRelatedWF.WFChildID From WFStepRelatedWF as wfStepRelatedWF Where wfStepRelatedWF.WFID = " + strWLID + ")";
        strHQL += " Or document.RelatedID in (Select wfStepRelatedWF.WFID From WFStepRelatedWF as wfStepRelatedWF Where wfStepRelatedWF.WFChildID = " + strWLID + "))";
        strHQL += " or ((document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedType='工作流' and (meeting.RelatedID = " + strWLID + " or meeting.RelatedID in (Select wfStepRelatedWF.WFChildID From WFStepRelatedWF as wfStepRelatedWF Where wfStepRelatedWF.WFID = " + strWLID + "))))";
        strHQL += " and ((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
        strHQL += " or ( document.Visible = '会议')))";
        strHQL += " and (((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
        strHQL += " or (document.Visible in ( '部门','全体')))";
        strHQL += " or (document.Visible in (select actorGroupDetail.GroupName from ActorGroupDetail as actorGroupDetail where actorGroupDetail.UserCode = " + "'" + strUserCode + "'" + " ))))";
        strHQL += " and rtrim(ltrim(document.Status)) <> '删除' Order by document.DocID DESC";
        DocumentBLL documentBLL = new DocumentBLL();
        lst = documentBLL.GetAllDocuments(strHQL);
        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void LoadWorkFlowRelatedOtherDoc(string strUserCode, string strWLID)
    {
        string strHQL, strDepartCode, strProjectID;
        IList lst;

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        DataSet ds = GetWorkFlowByWLID(strWLID);
        if (ds == null)
        {
            return;
        }

        if (ds.Tables[0].Rows[0]["RelatedType"].ToString().Trim() == "项目")
        {
            strProjectID = ds.Tables[0].Rows[0]["RelatedID"].ToString().Trim();

            strHQL = "from Document as document where (((document.RelatedType = '项目' and document.RelatedID = " + strProjectID + ")";
            strHQL += " and (((document.UploadManCode = " + "'" + strUserCode + "'" + " and document.DepartCode = " + "'" + strDepartCode + "'" + ")";
            strHQL += " or (document.Visible in ( '部门','全体')))";
            strHQL += " or (document.Visible in (select actorGroupDetail.GroupName from ActorGroupDetail as actorGroupDetail where actorGroupDetail.UserCode = " + "'" + strUserCode + "'" + " ))))";

            strHQL += " or (((document.RelatedType = '需求' and document.RelatedID in (select relatedReq.ReqID from RelatedReq as relatedReq where relatedReq.ProjectID = " + strProjectID + "))";
            //strHQL += " or (document.RelatedType = '工作流' and document.RelatedID in (Select workFlow.WLID From WorkFlow as workFlow Where workFlow.RelatedType = '项目' and workFlow.RelatedID = " + strProjectID + "))";

            strHQL += " or (document.RelatedType = '风险' and document.RelatedID in (select projectRisk.ID from ProjectRisk as projectRisk where projectRisk.ProjectID = " + strProjectID + "))";
            strHQL += " or (document.RelatedType = '任务' and document.RelatedID in (select projectTask.TaskID from ProjectTask as projectTask where projectTask.ProjectID = " + strProjectID + "))";
            strHQL += " or (document.RelatedType = '计划' and document.RelatedID in (select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + "))";
            //strHQL += " or (document.RelatedType = '工作流' and document.RelatedID in (Select workFlow.WLID From WorkFlow as workFlow Where workFlow.RelatedType = '计划' and workFlow.RelatedID in (select workPlan.ID from WorkPlan as workPlan where workPlan.ProjectID = " + strProjectID + ")))";
            strHQL += " or (document.RelatedType = '会议' and document.RelatedID in (select meeting.ID from Meeting as meeting where meeting.RelatedID = " + strProjectID + "))";

            strHQL += " and ((document.Visible in ('会议','部门') and document.DepartCode = " + "'" + strDepartCode + "'" + " ) ";
            strHQL += " or (document.Visible = '全体' )))))";
            strHQL += " and rtrim(ltrim(document.Status)) <> '删除' Order by document.DocID DESC";

            DocumentBLL documentBLL = new DocumentBLL();
            lst = documentBLL.GetAllDocuments(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();

            LB_ProjectDocNumber.Text = lst.Count.ToString();
        }
    }


    protected DataSet GetWorkFlowByWLID(string strWLID)
    {
        string strHQL;

        strHQL = "Select * From T_WorkFlow Where WLID  = " + strWLID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlow");
        if (ds.Tables[0].Rows.Count == 0)
        {
            strHQL = "Select * From T_WorkFlowBackup Where WLID  = " + strWLID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowBackup");
        }

        if (ds.Tables[0].Rows.Count == 0)
        {
            return null;
        }
        else
        {
            return ds;
        }
    }

}
