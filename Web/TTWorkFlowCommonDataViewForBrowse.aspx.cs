using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;

using TakeTopWF;

public partial class TTWorkFlowCommonDataViewForBrowse : System.Web.UI.Page
{
    string strUserCode, strWFStatus, strIsAllowFullEdit;
    public string strWLID, strStepID, strID;
    public string strXMLFileURL, strDetailXMLFileURL;

    protected void Page_Load(object sender, EventArgs e)
    {

        strUserCode = Session["UserCode"].ToString();

        strWLID = Request.QueryString["WLID"].Trim();
        strID = Request.QueryString["ID"].Trim();


        try
        {
            strXMLFileURL = GetWorkflowStepDetailXMLFile(strID);
            if (strXMLFileURL == null | strXMLFileURL == "")
            {
                strXMLFileURL = ShareClass.GetWorkflowXMLFile(strWLID);
            }
            strDetailXMLFileURL = GetWorkflowStepDetailDetailXMLFile(strID);
            if (strDetailXMLFileURL == null)
            {
                strDetailXMLFileURL = "";
            }

            string strUnVisibleFieldXMLFile;

            LB_WLID.Text = strWLID;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForWorkflowCommonFormDataPopWindow();", true);
            if (Page.IsPostBack == false)
            {
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
                }
                catch
                {
                    DataList43.Visible = false;
                }

                try
                {
                    DataList1.DataSource = ds;
                    DataList1.DataBind();
                }
                catch
                {
                    DataList1.Visible = false;
                }

                try
                {
                    DataList2.DataSource = ds;
                    DataList2.DataBind();
                }
                catch
                {
                    DataList2.Visible = false;
                }

                try
                {
                    DataList3.DataSource = ds;
                    DataList3.DataBind();
                }
                catch
                {
                    DataList3.Visible = false;
                }

                try
                {
                    DataList4.DataSource = ds;
                    DataList4.DataBind();
                }
                catch
                {
                    DataList4.Visible = false;
                }

                try
                {
                    DataList5.DataSource = ds;
                    DataList5.DataBind();
                }
                catch
                {
                    DataList5.Visible = false;
                }

                try
                {
                    DataList7.DataSource = ds;
                    DataList7.DataBind();
                }
                catch
                {
                    DataList7.Visible = false;
                }

                try
                {
                    DataList8.DataSource = ds;
                    DataList8.DataBind();
                }
                catch
                {
                    DataList8.Visible = false;
                }

                try
                {
                    DataList9.DataSource = ds;
                    DataList9.DataBind();
                }
                catch
                {
                    DataList9.Visible = false;
                }

                try
                {
                    DataList10.DataSource = ds;
                    DataList10.DataBind();
                }
                catch
                {
                    DataList10.Visible = false;
                }

                try
                {
                    DataList11.DataSource = ds;
                    DataList11.DataBind();
                }
                catch
                {
                    DataList11.Visible = false;
                }

                try
                {
                    DataList12.DataSource = ds;
                    DataList12.DataBind();
                }
                catch
                {
                    DataList12.Visible = false;
                }

                try
                {
                    DataList13.DataSource = ds;
                    DataList13.DataBind();
                }
                catch
                {
                    DataList13.Visible = false;
                }

                try
                {
                    DataList14.DataSource = ds;
                    DataList14.DataBind();
                }
                catch
                {
                    DataList14.Visible = false;
                }

                try
                {
                    DataList15.DataSource = ds;
                    DataList15.DataBind();
                }
                catch
                {
                    DataList15.Visible = false;
                }

                try
                {
                    DataList16.DataSource = ds;
                    DataList16.DataBind();
                }
                catch
                {
                    DataList16.Visible = false;
                }

                try
                {
                    DataList17.DataSource = ds;
                    DataList17.DataBind();
                }
                catch
                {
                    DataList17.Visible = false;
                }

                try
                {
                    DataList18.DataSource = ds;
                    DataList18.DataBind();
                }
                catch
                {
                    DataList18.Visible = false;
                }

                try
                {
                    DataList19.DataSource = ds;
                    DataList19.DataBind();
                }
                catch
                {
                    DataList19.Visible = false;
                }

                try
                {
                    DataList20.DataSource = ds;
                    DataList20.DataBind();
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

                }
                catch
                {
                    DataList21.Visible = false;
                }

                try
                {
                    DataList22.DataSource = ds;
                    DataList22.DataBind();
                }
                catch
                {
                    DataList22.Visible = false;
                }

                try
                {
                    DataList23.DataSource = ds;
                    DataList23.DataBind();
                }
                catch
                {
                    DataList23.Visible = false;
                }

                try
                {
                    DataList24.DataSource = ds;
                    DataList24.DataBind();
                }
                catch
                {
                    DataList24.Visible = false;
                }

                try
                {
                    DataList25.DataSource = ds;
                    DataList25.DataBind();
                }
                catch
                {
                    DataList25.Visible = false;
                }

                try
                {
                    DataList26.DataSource = ds;
                    DataList26.DataBind();
                }
                catch
                {
                    DataList26.Visible = false;
                }

                try
                {
                    DataList39.DataSource = ds;
                    DataList39.DataBind();
                }
                catch
                {
                    DataList39.Visible = false;
                }

                try
                {
                    DataList40.DataSource = ds;
                    DataList40.DataBind();
                }
                catch
                {
                    DataList40.Visible = false;
                }

                try
                {
                    DataList41.DataSource = ds;
                    DataList41.DataBind();
                }
                catch
                {
                    DataList41.Visible = false;
                }

                try
                {
                    DataList27.DataSource = ds;
                    DataList27.DataBind();
                }
                catch
                {
                    DataList27.Visible = false;
                }

                try
                {
                    DataList28.DataSource = ds;
                    DataList28.DataBind();
                }
                catch
                {
                    DataList28.Visible = false;
                }

                try
                {
                    DataList30.DataSource = ds;
                    DataList30.DataBind();
                }
                catch
                {
                    DataList30.Visible = false;
                }

                try
                {
                    DataList36.DataSource = ds;
                    DataList36.DataBind();
                }
                catch
                {
                    DataList36.Visible = false;
                }

                try
                {
                    DataList37.DataSource = ds;
                    DataList37.DataBind();
                }
                catch
                {
                    DataList37.Visible = false;
                }

                try
                {
                    DataList38.DataSource = ds;
                    DataList38.DataBind();
                }
                catch
                {
                    DataList38.Visible = false;
                }

                try
                {

                    DataList42.DataSource = ds;
                    DataList42.DataBind();
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
                }
                catch (Exception err)
                {
                    LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
                    DataList35.Visible = false;
                }

                try
                {
                    DataList44.DataSource = ds;
                    DataList44.DataBind();
                }
                catch (Exception err)
                {
                    LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
                    DataList44.Visible = false;
                }
            }

        }
        catch
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "click", "alert('" + Resources.lang.ZZJGCGZLMBBCZQJC + "')", true);
        }

     

    }

    //取得此步的主表数据文件
    protected string GetWorkflowStepDetailXMLFile(string strID)
    {
        string strHQL;

        strHQL = "Select XMLFile From T_WorkFlowStepDetail Where ID =" + strID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepDetail");
        if (ds.Tables[0].Rows.Count == 0)
        {
            strHQL = "Select XMLFile From T_WorkFlowStepDetailBackup Where ID =" + strID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepDetailBackup");
        }

        return ds.Tables[0].Rows[0][0].ToString();
    }

    //取得此步的明细表数据文件
    protected string GetWorkflowStepDetailDetailXMLFile(string strID)
    {
        string strHQL;

        strHQL = "Select DetailXMLFile From T_WorkFlowStepDetail Where ID =" + strID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepDetail");
        if (ds.Tables[0].Rows.Count == 0)
        {
            strHQL = "Select DetailXMLFile From T_WorkFlowStepDetailBackup Where ID =" + strID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowStepDetailBackup");
        }

        return ds.Tables[0].Rows[0][0].ToString();
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

    protected ExpenseClaim GetExpenseClaim(string strECID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ExpenseClaim as expenseClaim where expenseClaim.ECID = " + strECID;
        ExpenseClaimBLL expenseClaimBLL = new ExpenseClaimBLL();
        lst = expenseClaimBLL.GetAllExpenseClaims(strHQL);

        return (ExpenseClaim)lst[0];
    }


}
