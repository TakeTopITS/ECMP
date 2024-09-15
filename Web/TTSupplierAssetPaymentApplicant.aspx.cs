using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


using System.Data.SqlClient;

using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTSupplierAssetPaymentApplicant : System.Web.UI.Page
{
    string strProjectID;
    string strToDoWLID, strToDoWLDetailID, strWLBusinessID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserName, strDepartString;

        strProjectID = "1";

        //从流程中打开的业务单
        strToDoWLID = Request.QueryString["WLID"]; strToDoWLDetailID= Request.QueryString["WLStepDetailID"];
        strWLBusinessID = Request.QueryString["BusinessID"];

        string strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", DL_WFType.SelectedValue.Trim(), strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_CreateTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_OpenDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
            LB_DepartString.Text = strDepartString;

            //取得会计科目列表
            ShareClass.LoadAccountForDDL(DL_Account);

            strHQL = "from JNUnit as jnUnit order by jnUnit.SortNumber ASC";
            JNUnitBLL jnUnitBLL = new JNUnitBLL();
            lst = jnUnitBLL.GetAllJNUnits(strHQL);
            DL_Unit.DataSource = lst;
            DL_Unit.DataBind();

            strHQL = "from AssetType as assetType Order by assetType.SortNumber ASC";
            AssetTypeBLL assetTypeBLL = new AssetTypeBLL();
            lst = assetTypeBLL.GetAllAssetTypes(strHQL);
            DL_Type.DataSource = lst;
            DL_Type.DataBind();
            DL_Type.Items.Insert(0, new ListItem("--Select--", ""));

            ShareClass.LoadWFTemplate(strUserCode, DL_WFType.SelectedValue.Trim(), DL_TemName);

            ShareClass.LoadCurrencyType(DL_CurrencyType);
            ShareClass.LoadVendorList(DL_VendorList, strUserCode);

            TB_CreatorCode.Text = strUserCode;
            LB_CreatorName.Text = strUserName;

            LoadSupplierAssetPaymentApplicant(strUserCode);

            LoadItemMainPlan(strUserCode);

            NB_RelatedID.Amount = int.Parse(strProjectID);

            ShareClass.InitialInvolvedProjectTree(TreeView2, strUserCode);
        }
    }

    protected void DataGrid15_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strID;
        string strUserCode;

        strUserCode = LB_UserCode.Text;

        if (e.CommandName != "Page")
        {
            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();
            strHQL = "from AssetCheckInOrderDetail as assetCheckInOrderDetail where assetCheckInOrderDetail.ID = " + "'" + strID + "'";

            for (int i = 0; i < DataGrid15.Items.Count; i++)
            {
                DataGrid15.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            AssetCheckInOrderDetailBLL assetCheckInOrderDetailBLL = new AssetCheckInOrderDetailBLL();
            lst = assetCheckInOrderDetailBLL.GetAllAssetCheckInOrderDetails(strHQL);
            AssetCheckInOrderDetail assetCheckInOrderDetail = (AssetCheckInOrderDetail)lst[0];

            TB_AssetCode.Text = assetCheckInOrderDetail.AssetCode.Trim();

            TB_AssetCode.Text = assetCheckInOrderDetail.AssetCode;
            TB_AssetName.Text = assetCheckInOrderDetail.AssetName;

            NB_Number.Amount = assetCheckInOrderDetail.Number;

            NB_Price.Amount = assetCheckInOrderDetail.Price;
            DL_Unit.SelectedValue = assetCheckInOrderDetail.UnitName;
            TB_Spec.Text = assetCheckInOrderDetail.Spec;

            NB_Price.Amount = assetCheckInOrderDetail.Price;

            DL_Type.SelectedValue = assetCheckInOrderDetail.Type;
            TB_ModelNumber.Text = assetCheckInOrderDetail.ModelNumber;

            TB_Manufacturer.Text = assetCheckInOrderDetail.Manufacturer;

            NB_Amount.Amount = assetCheckInOrderDetail.Amount;

            DL_RecordSourceType.SelectedValue = "CheckInOrderRecord";
            NB_RecordSourceID.Amount = int.Parse(strID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popDetailWindow') ", true);
        }
    }

    //计算出未申请付款数
    protected decimal SummaryNoApplyNumber(string strSourceType, string strSourceID)
    {
        string strHQL;
        decimal deAleadyNumber, deNumber;

        try
        {
            strHQL = "Select COALESCE(Sum(Number),0) From T_SupplierAssetPaymentApplicantDetail Where SourceType= 'CheckInOrderRecord' and SourceID = " + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_SupplierAssetPaymentApplicantDetail");

            if (ds.Tables[0].Rows.Count > 0)
            {
                deAleadyNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            else
            {
                deAleadyNumber = 0;
            }

            strHQL = "Select Number From T_AssetCheckInOrderDetail Where ID = " + strSourceID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_AssetCheckInOrderDetail");

            deNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());

            return deNumber - deAleadyNumber;
        }
        catch
        {
            return 0;
        }
    }

    //计算出未申请付款额
    protected decimal SummaryNoApplyAmount(string strSourceType, string strSourceID)
    {
        string strHQL;
        decimal deAleadyAmount, deAmount;

        try
        {
            strHQL = "Select COALESCE(Sum(Amount),0) From T_SupplierAssetPaymentApplicantDetail Where SourceType= 'CheckInOrderRecord' and SourceID = " + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_SupplierAssetPaymentApplicantDetail");

            if (ds.Tables[0].Rows.Count > 0)
            {
                deAleadyAmount = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            else
            {
                deAleadyAmount = 0;
            }

            strHQL = "Select Amount From T_AssetCheckInOrderDetail Where ID = " + strSourceID;
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_AssetCheckInOrderDetail");

            deAmount = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());

            return deAmount - deAleadyAmount;
        }
        catch
        {
            return 0;
        }
    }

    protected void DL_RelatedType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strRelatedType;

        strRelatedType = DL_RelatedType.SelectedValue.Trim();

        if (strRelatedType == "Other")
        {
            BT_SelectProject.Visible = false;
            NB_RelatedID.Amount = 0;
        }

        if (strRelatedType == "Project")
        {
            BT_SelectProject.Visible = true;
            NB_RelatedID.Amount = 0;
        }
        else
        {
            BT_SelectProject.Visible = false;
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DL_PaymentMethod_SelectedIndexChanged(object sender, EventArgs e)
    {
        TB_PaymentMethod.Text = DL_PaymentMethod.SelectedValue;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DL_Attachment_SelectedIndexChanged(object sender, EventArgs e)
    {
        TB_Attachment.Text += DL_Attachment.SelectedValue.Trim() + ",";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid9_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strSOID;

        if (e.CommandName != "Page")
        {
            strSOID = ((Button)e.Item.FindControl("BT_SOID")).Text.Trim();

            for (int i = 0; i < DataGrid6.Items.Count; i++)
            {
                DataGrid6.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            NB_RelatedID.Amount = int.Parse(strSOID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void DataGrid5_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strAOID;
            IList lst;
            int intWLNumber;

            strAOID = e.Item.Cells[3].Text.Trim();

            intWLNumber = GetRelatedWorkFlowNumber(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
            if (intWLNumber > 0)
            {
                BT_NewMain.Visible = false;
                BT_NewDetail.Visible = false;

                BT_SubmitApply.Enabled = false;
            }
            else
            {
                BT_NewMain.Visible = true;
                BT_NewDetail.Visible = true;

                BT_SubmitApply.Enabled = true;
            }

            //从流程中打开的业务单
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue(DL_WFType.SelectedValue.Trim(), "项目", strAOID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                BT_NewMain.Visible = true;
                BT_NewDetail.Visible = true;
            }

            strHQL = "from SupplierAssetPaymentApplicant as supplierAssetPaymentApplicant where supplierAssetPaymentApplicant.AOID = " + strAOID;
            SupplierAssetPaymentApplicantBLL supplierAssetPaymentApplicantBLL = new SupplierAssetPaymentApplicantBLL();
            lst = supplierAssetPaymentApplicantBLL.GetAllSupplierAssetPaymentApplicants(strHQL);
            SupplierAssetPaymentApplicant supplierAssetPaymentApplicant = (SupplierAssetPaymentApplicant)lst[0];


            if (e.CommandName == "Update" | e.CommandName == "Assign" | e.CommandName == "INVOICE")
            {
                for (int i = 0; i < DataGrid5.Items.Count; i++)
                {
                    DataGrid5.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;


                LB_AOID.Text = supplierAssetPaymentApplicant.AOID.ToString();
                TB_AOName.Text = supplierAssetPaymentApplicant.AOName.Trim();
                DLC_CreateTime.Text = supplierAssetPaymentApplicant.CreateTime.ToString("yyyy-MM-dd");

                NB_CurrentTotalPaymentAmount.Amount = supplierAssetPaymentApplicant.CurrentTotalPaymentAmount;

                DL_CurrencyType.SelectedValue = supplierAssetPaymentApplicant.CurrencyType;

                TB_BankCode.Text = supplierAssetPaymentApplicant.BankCode;
                TB_BankName.Text = supplierAssetPaymentApplicant.BankName;

                TB_ContractPayCondition.Text = supplierAssetPaymentApplicant.ContractPayCondition;

                TB_Attachment.Text = supplierAssetPaymentApplicant.Attachment;


                DL_AOStatus.SelectedValue = supplierAssetPaymentApplicant.Status.Trim();
                TB_CreatorCode.Text = supplierAssetPaymentApplicant.UserCode.Trim();
                LB_CreatorName.Text = supplierAssetPaymentApplicant.UserName.Trim();

                TB_PartA.Text = supplierAssetPaymentApplicant.PartA.Trim();
                TB_PartAContactInformation.Text = supplierAssetPaymentApplicant.PartAContactInformation;

                TB_PaymentMethod.Text = supplierAssetPaymentApplicant.PaymentMethod.Trim();

                if (supplierAssetPaymentApplicant.ProjectID > 1)
                {
                    DL_RelatedType.SelectedValue = "Project";
                    BT_SelectProject.Visible = true;
                }
                else
                {
                    DL_RelatedType.SelectedValue = "Other";
                }

                NB_RelatedID.Amount = supplierAssetPaymentApplicant.ProjectID;

                LoadSupplierAssetPaymentApplicantDetail(strAOID);

                //取得此供应商关联的入库单明细
                if (TB_PartA.Text.Trim() != "")
                {
                    LoadAssetCheckInOrderDetail(TB_PartA.Text.Trim());
                }

                TB_WLName.Text = Resources.lang.GongYingShangWuZiCaiGouFuKuanShengQing + supplierAssetPaymentApplicant.AOName.Trim() ;

                LoadRelatedWL(DL_WFType.SelectedValue.Trim(), "项目", supplierAssetPaymentApplicant.AOID);

                if (e.CommandName == "Update")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }

                if (e.CommandName == "Assign")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);
                }

                if (e.CommandName == "INVOICE")
                {
                    LoadConstractRelatedInvoice(strAOID);
                    CountInvoiceAmount(strAOID);
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true') ", true);
                }
            }

            if (e.CommandName == "Delete")
            {
                intWLNumber = GetRelatedWorkFlowNumber(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
                if (intWLNumber > 0 | supplierAssetPaymentApplicant.Status == "已记账")
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBCSQDYTJSPHYJC + "')", true);
                    return;
                }

                strUserCode = LB_UserCode.Text.Trim();

                strHQL = "Delete From T_SupplierAssetPaymentApplicant Where AOID = " + strAOID;

                try
                {
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "Delete From T_SupplierAssetPaymentApplicantDetail Where AOID = " + strAOID;
                    ShareClass.RunSqlCommand(strHQL);

                    LoadSupplierAssetPaymentApplicant(strUserCode);
                    LoadSupplierAssetPaymentApplicantDetail(strAOID);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCCJC + "')", true);
                }
            }
        }
    }

    protected void BT_CreateMain_Click(object sender, EventArgs e)
    {
        LB_AOID.Text = "";

        BT_NewMain.Visible = true;
        BT_NewDetail.Visible = true;

        LoadSupplierAssetPaymentApplicantDetail("0");

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_NewMain_Click(object sender, EventArgs e)
    {
        string strAOID;

        strAOID = LB_AOID.Text.Trim();

        if (strAOID == "")
        {
            AddMain();
        }
        else
        {
            UpdateMain();
        }
    }

    protected void AddMain()
    {
        string strAOID, strAOName, strUserCode, strUserName, strCurrencyType, strPartA, strPartAContactInformation, strPaymentMethod;
        DateTime dtCreateTime;
        decimal deCurrentTotalPaymentAmount;
        string strStatus;

        strAOName = TB_AOName.Text.Trim();
        strUserCode = TB_CreatorCode.Text.Trim();
        strUserName = LB_CreatorName.Text.Trim();
        strUserCode = LB_UserCode.Text.Trim();

        strPartA = TB_PartA.Text.Trim();
        strPartAContactInformation = TB_PartAContactInformation.Text.Trim();

        strPaymentMethod = TB_PaymentMethod.Text.Trim();

        dtCreateTime = DateTime.Parse(DLC_CreateTime.Text);

        deCurrentTotalPaymentAmount = NB_CurrentTotalPaymentAmount.Amount;
        strCurrencyType = DL_CurrencyType.SelectedValue.Trim();
        strStatus = DL_AOStatus.SelectedValue.Trim();

        SupplierAssetPaymentApplicantBLL supplierAssetPaymentApplicantBLL = new SupplierAssetPaymentApplicantBLL();
        SupplierAssetPaymentApplicant supplierAssetPaymentApplicant = new SupplierAssetPaymentApplicant();

        if (GetSupplierAssetPaymentApplicantCodeCount("0", strAOName) > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCZXTDMQJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }

        supplierAssetPaymentApplicant.AOName = strAOName;
        supplierAssetPaymentApplicant.UserCode = strUserCode;
        try
        {
            supplierAssetPaymentApplicant.UserName = ShareClass.GetUserName(strUserCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWCGRDMBZCWCRJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }
        supplierAssetPaymentApplicant.UserCode = strUserCode;
        supplierAssetPaymentApplicant.UserName = strUserName;
        supplierAssetPaymentApplicant.CreateTime = dtCreateTime;

        supplierAssetPaymentApplicant.CurrentTotalPaymentAmount = deCurrentTotalPaymentAmount;
        supplierAssetPaymentApplicant.CurrencyType = strCurrencyType;
        supplierAssetPaymentApplicant.PartA = strPartA;
        supplierAssetPaymentApplicant.PartAContactInformation = strPartAContactInformation;
        supplierAssetPaymentApplicant.CompanyName = strPartA;

        supplierAssetPaymentApplicant.PaymentMethod = strPaymentMethod;

        supplierAssetPaymentApplicant.AleadyTotalInvoice = NB_AleadyTotalInvoice.Amount;
        supplierAssetPaymentApplicant.ShouldTotalInvoice = NB_ShouldTotalInvoice.Amount;

        supplierAssetPaymentApplicant.ContractPayCondition = TB_ContractPayCondition.Text;

        supplierAssetPaymentApplicant.Attachment = TB_Attachment.Text;

        supplierAssetPaymentApplicant.BankCode = TB_BankCode.Text.Trim();
        supplierAssetPaymentApplicant.BankName = TB_BankName.Text.Trim();
        supplierAssetPaymentApplicant.Status = "新建";
        if (DL_RelatedType.SelectedValue == "Other")
        {
            try
            {
                supplierAssetPaymentApplicant.ProjectID = 1;
                supplierAssetPaymentApplicant.ProjectName = ShareClass.GetProjectName("1");
            }
            catch
            {

            }
        }
        else
        {
            supplierAssetPaymentApplicant.ProjectID = int.Parse(NB_RelatedID.Amount.ToString());
            supplierAssetPaymentApplicant.ProjectName = ShareClass.GetProjectName(NB_RelatedID.Amount.ToString());
        }


        try
        {
            supplierAssetPaymentApplicantBLL.AddSupplierAssetPaymentApplicant(supplierAssetPaymentApplicant);

            strAOID = ShareClass.GetMyCreatedMaxSupplierAssetPaymentApplicantID(strUserCode);
            LB_AOID.Text = strAOID;

            //自动产生单号
            string strNewPOCode = ShareClass.GetCodeByRule("PayApplyOrderCode", "PayApplyOrderCode", strAOID);
            if (strNewPOCode != "")
            {
                TB_AOName.Text = strNewPOCode;
                string strHQL = "Update T_SupplierAssetPaymentApplicant Set AOName = " + "'" + strNewPOCode + "'" + " Where AOID = " + strAOID;
                ShareClass.RunSqlCommand(strHQL);
            }

            NB_CurrentTotalPaymentAmount.Amount = 0;

            TB_WLName.Text = Resources.lang.FeiYong  + strAOName + Resources.lang.ShenQing;

            BT_SubmitApply.Enabled = true;

            LoadSupplierAssetPaymentApplicant(strUserCode);
            LoadSupplierAssetPaymentApplicantDetail(strAOID);

            //LoadRelatedConstract(strAOID);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJCCKNCGMCZD50GHZHBZZSZD100GHZGDJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strProjectID;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strProjectID = treeNode.Target.Trim();

            NB_RelatedID.Amount = int.Parse(strProjectID);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected int GetSupplierAssetPaymentApplicantCodeCount(string strAOID, string strAssetPOCode)
    {
        string strHQL;

        if (strAssetPOCode != "")
        {
            strHQL = "Select * From T_SupplierAssetPaymentApplicant Where AOID <> " + strAOID + " and AOName =  " + "'" + strAssetPOCode + "'";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_SupplierAssetPaymentApplicant");

            return ds.Tables[0].Rows.Count;
        }
        else
        {
            return 0;
        }
    }

    protected void UpdateMain()
    {
        string strHQL;
        IList lst;

        string strAOID, strAOName, strUserCode, strUserName, strCurrencyType, strPartA, strPartAContactInformation, strPaymentMethod;
        DateTime dtCreateTime;
        decimal deCurrentTotalPaymentAmount;
        string strStatus;

        strAOID = LB_AOID.Text;
        strAOName = TB_AOName.Text.Trim();
        strUserCode = TB_CreatorCode.Text.Trim();
        strUserName = LB_CreatorName.Text.Trim();
        strUserCode = LB_UserCode.Text.Trim();

        strPartA = TB_PartA.Text.Trim();
        strPartAContactInformation = TB_PartAContactInformation.Text.Trim();

        strPaymentMethod = TB_PaymentMethod.Text.Trim();

        dtCreateTime = DateTime.Parse(DLC_CreateTime.Text);

        deCurrentTotalPaymentAmount = NB_CurrentTotalPaymentAmount.Amount;
        strCurrencyType = DL_CurrencyType.SelectedValue.Trim();
        strStatus = DL_AOStatus.SelectedValue.Trim();


        if (GetSupplierAssetPaymentApplicantCodeCount(strAOID, strAOName) > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCZXTDMQJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }

        strHQL = "from SupplierAssetPaymentApplicant as supplierAssetPaymentApplicant where supplierAssetPaymentApplicant.AOID = " + strAOID;
        SupplierAssetPaymentApplicantBLL supplierAssetPaymentApplicantBLL = new SupplierAssetPaymentApplicantBLL();
        lst = supplierAssetPaymentApplicantBLL.GetAllSupplierAssetPaymentApplicants(strHQL);

        SupplierAssetPaymentApplicant supplierAssetPaymentApplicant = (SupplierAssetPaymentApplicant)lst[0];

        supplierAssetPaymentApplicant.AOName = strAOName;

        supplierAssetPaymentApplicant.UserCode = strUserCode;
        try
        {
            supplierAssetPaymentApplicant.UserName = ShareClass.GetUserName(strUserCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWCGRDMBZCWCRJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }

        supplierAssetPaymentApplicant.AOName = strAOName;
        supplierAssetPaymentApplicant.UserCode = strUserCode;
        try
        {
            supplierAssetPaymentApplicant.UserName = ShareClass.GetUserName(strUserCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWCGRDMBZCWCRJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }
        supplierAssetPaymentApplicant.UserCode = strUserCode;
        supplierAssetPaymentApplicant.UserName = strUserName;
        supplierAssetPaymentApplicant.CreateTime = dtCreateTime;

        //supplierAssetPaymentApplicant.CurrentTotalPaymentAmount = deCurrentTotalPaymentAmount;
        supplierAssetPaymentApplicant.CurrencyType = strCurrencyType;
        supplierAssetPaymentApplicant.PartA = strPartA;
        supplierAssetPaymentApplicant.PartAContactInformation = strPartAContactInformation;
        supplierAssetPaymentApplicant.CompanyName = strPartA;

        supplierAssetPaymentApplicant.PaymentMethod = strPaymentMethod;

        supplierAssetPaymentApplicant.AleadyTotalInvoice = NB_AleadyTotalInvoice.Amount;
        supplierAssetPaymentApplicant.ShouldTotalInvoice = NB_ShouldTotalInvoice.Amount;

        supplierAssetPaymentApplicant.ContractPayCondition = TB_ContractPayCondition.Text;

        supplierAssetPaymentApplicant.Attachment = TB_Attachment.Text;

        supplierAssetPaymentApplicant.BankCode = TB_BankCode.Text.Trim();
        supplierAssetPaymentApplicant.BankName = TB_BankName.Text.Trim();
        supplierAssetPaymentApplicant.Status = "新建";

        if (DL_RelatedType.SelectedValue == "Other")
        {
            try
            {
                supplierAssetPaymentApplicant.ProjectID = 1;
                supplierAssetPaymentApplicant.ProjectName = ShareClass.GetProjectName("1");
            }
            catch
            {

            }
        }
        else
        {
            supplierAssetPaymentApplicant.ProjectID = int.Parse(NB_RelatedID.Amount.ToString());
            supplierAssetPaymentApplicant.ProjectName = ShareClass.GetProjectName(NB_RelatedID.Amount.ToString());
        }


        try
        {
            supplierAssetPaymentApplicantBLL.UpdateSupplierAssetPaymentApplicant(supplierAssetPaymentApplicant, int.Parse(strAOID));
            LoadSupplierAssetPaymentApplicant(strUserCode);

            //从流程中打开的业务单
            //更改工作流关联的数据文件
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue(DL_WFType.SelectedValue.Trim(), "项目", strAOID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                string strCmdText = "select AOID as DetailAOID, * from V_SupplierAssetPaymentApplicant where AOID = " + strAOID;
                if (strToDoWLID == null)
                {
                    strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
                }

                if (strToDoWLID != null)
                {
                    if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Asset");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql5.Text;

        SupplierAssetPaymentApplicantBLL puchaseOrderBLL = new SupplierAssetPaymentApplicantBLL();
        IList lst = puchaseOrderBLL.GetAllSupplierAssetPaymentApplicants(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void DL_VendorList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strVendorCode, strVendorName, strVendorPhone, strClearingForm, strContacts, strFax;
        decimal deTaxRate;

        strVendorCode = DL_VendorList.SelectedValue.Trim();
        strHQL = "Select COALESCE(Tel1,''),TaxRate,ClearingForm ,ContactName,Fax,VendorName From T_Vendor Where VendorCode = " + "'" + strVendorCode + "'";

        try
        {
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Vendor");
            if (ds.Tables[0].Rows.Count == 0)
            {
                strHQL = "Select COALESCE(PhoneNum,''),1,'' ,TechnicalDirector,Fax,Name From T_BMSupplierInfo Where Code = " + "'" + strVendorCode + "'";
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierInfo");
            }

            strVendorPhone = ds.Tables[0].Rows[0][0].ToString();
            deTaxRate = decimal.Parse(ds.Tables[0].Rows[0][1].ToString());
            strClearingForm = ds.Tables[0].Rows[0][2].ToString();
            strContacts = ds.Tables[0].Rows[0][3].ToString();
            strFax = ds.Tables[0].Rows[0][4].ToString();
            strVendorName = ds.Tables[0].Rows[0][5].ToString().Trim();

            TB_PartA.Text = DL_VendorList.SelectedItem.Text;
            TB_PartAContactInformation.Text = strContacts + "," + strVendorPhone;

            LoadAssetCheckInOrderDetail(TB_PartA.Text.Trim());
        }
        catch
        {
            TB_PartA.Text = "";
            TB_PartAContactInformation.Text = "";

            strVendorName = "";
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DL_RecordSourceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        NB_RecordSourceID.Amount = 0;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_FindAsset_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strType, strAssetCode, strAssetName, strModelNumber, strSpec;

        DataGrid4.CurrentPageIndex = 0;
        TabContainer2.ActiveTabIndex = 1;

        strType = DL_Type.SelectedValue.Trim();
        strAssetCode = TB_AssetCode.Text.Trim();
        strAssetName = TB_AssetName.Text.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();

        strType = "%" + strType + "%";
        strAssetCode = "%" + strAssetCode + "%";
        strAssetName = "%" + strAssetName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";

        strHQL = "From Asset as asset Where asset.AssetCode Like " + "'" + strAssetCode + "'" + " and asset.AssetName like " + "'" + strAssetName + "'";
        strHQL += " and asset.Type Like " + "'" + strType + "'" + " and asset.ModelNumber Like " + "'" + strModelNumber + "'" + " and asset.Spec Like " + "'" + strSpec + "'";
        //strHQL += " and asset.Number > 0";
        strHQL += " Order by asset.Number DESC";
        AssetBLL assetBLL = new AssetBLL();
        lst = assetBLL.GetAllAssets(strHQL);

        DataGrid7.DataSource = lst;
        DataGrid7.DataBind();

        strHQL = "From Item as item Where item.ItemCode Like " + "'" + strAssetCode + "'" + " and item.ItemName like " + "'" + strAssetName + "'";
        strHQL += " and item.Specification Like " + "'" + strSpec + "'";
        strHQL += " and item.BigType = 'Asset'";

        ItemBLL itemBLL = new ItemBLL();
        lst = itemBLL.GetAllItems(strHQL);

        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_Clear_Click(object sender, EventArgs e)
    {
        TB_AssetCode.Text = "";
        TB_AssetName.Text = "";
        TB_ModelNumber.Text = "";
        TB_Spec.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_Count_Click(object sender, EventArgs e)
    {
        NB_Amount.Amount = NB_Number.Amount * NB_Price.Amount;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popDetailWindow') ", true);
    }

    protected void DL_Account_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strAccountCode = DL_Account.SelectedValue.Trim();
        lbl_AccountCode.Text = strAccountCode;
        TB_Account.Text = ShareClass.GetAccountName(strAccountCode);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }


    protected void DataGrid6_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strItemCode;

            strID = e.Item.Cells[0].Text;
            strItemCode = ((Button)e.Item.FindControl("BT_ItemCode")).Text.Trim();

            for (int i = 0; i < DataGrid6.Items.Count; i++)
            {
                DataGrid6.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "from Item as item where ItemCode = " + "'" + strItemCode + "'";
            ItemBLL itemBLL = new ItemBLL();
            lst = itemBLL.GetAllItems(strHQL);

            if (lst.Count > 0)
            {
                Item item = (Item)lst[0];

                TB_AssetCode.Text = item.ItemCode;
                TB_AssetName.Text = item.ItemName;
                try
                {
                    DL_Type.SelectedValue = item.SmallType;
                }
                catch
                {
                    DL_Type.SelectedValue = "";
                }
                TB_ModelNumber.Text = item.ModelNumber;
                DL_Unit.SelectedValue = item.Unit;
                TB_Spec.Text = item.Specification;
                NB_Price.Amount = item.PurchasePrice;
            }
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void DataGrid7_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strAssetCode;

            strID = e.Item.Cells[0].Text;
            strAssetCode = ((Button)e.Item.FindControl("BT_AssetCode")).Text.Trim();

            for (int i = 0; i < DataGrid7.Items.Count; i++)
            {
                DataGrid7.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "from Asset as asset where asset.ID = " + strID;
            AssetBLL assetBLL = new AssetBLL();
            lst = assetBLL.GetAllAssets(strHQL);

            if (lst.Count > 0)
            {
                Asset asset = (Asset)lst[0];

                TB_AssetCode.Text = asset.AssetCode;
                TB_AssetName.Text = asset.AssetName;
                TB_ModelNumber.Text = asset.ModelNumber;
                DL_Unit.SelectedValue = asset.UnitName;
                TB_Spec.Text = asset.Spec;
                DL_Type.SelectedValue = asset.Type;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid10_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strPlanVerID;

            strPlanVerID = ((Button)e.Item.FindControl("BT_PlanVerID")).Text.Trim();

            for (int i = 0; i < DataGrid10.Items.Count; i++)
            {
                DataGrid10.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            NB_RelatedID.Amount = int.Parse(strPlanVerID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid11_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strItemCode, strItemName, strBomVerID, strUnit, strDefaultProcess;
            decimal deNumber, deReservedNumber;

            for (int i = 0; i < DataGrid10.Items.Count; i++)
            {
                DataGrid10.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            strHQL = "From ProjectRelatedItem as projectRelatedItem where projectRelatedItem.ID = " + strID;
            ProjectRelatedItemBLL projectRelatedItemBLL = new ProjectRelatedItemBLL();
            lst = projectRelatedItemBLL.GetAllProjectRelatedItems(strHQL);

            ProjectRelatedItem projectRelatedItem = (ProjectRelatedItem)lst[0];

            strItemCode = projectRelatedItem.ItemCode.Trim();
            strItemName = projectRelatedItem.ItemName.Trim();
            strBomVerID = projectRelatedItem.BomVersionID.ToString();
            strUnit = projectRelatedItem.Unit;
            deNumber = projectRelatedItem.Number;
            deReservedNumber = projectRelatedItem.ReservedNumber;
            strDefaultProcess = projectRelatedItem.DefaultProcess.Trim();

            TB_AssetCode.Text = strItemCode;
            TB_AssetName.Text = strItemName;

            try
            {
                DL_Type.SelectedValue = projectRelatedItem.ItemType;
            }
            catch
            {
            }
            TB_Spec.Text = projectRelatedItem.Specification;
            TB_ModelNumber.Text = projectRelatedItem.ModelNumber;

            NB_Number.Amount = projectRelatedItem.Number;

            DL_Unit.SelectedValue = strUnit;

            //LB_SourceRelatedID.Text = projectRelatedItem.ProjectID.ToString();
            DL_RecordSourceType.SelectedValue = "AssetPJRecord";
            NB_RecordSourceID.Amount = projectRelatedItem.ID;

            //LoadItemBomVersion(strItemCode, DL_BomVerID);
            //DL_BomVerID.SelectedValue = strBomVerID;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected Item GetItem(string strItemCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From Item as item where item.ItemCode = " + "'" + strItemCode + "'";
        ItemBLL itemBLL = new ItemBLL();
        lst = itemBLL.GetAllItems(strHQL);
        Item item = (Item)lst[0];

        return item;
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strAOID;
            IList lst;

            strAOID = LB_AOID.Text.Trim();

            int intWLNumber = GetRelatedWorkFlowNumber(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
            if (intWLNumber > 0)
            {
                BT_NewMain.Visible = false;
                BT_NewDetail.Visible = false;
            }
            else
            {
                BT_NewMain.Visible = true;
                BT_NewDetail.Visible = true;
            }

            //从流程中打开的业务单
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue(DL_WFType.SelectedValue.Trim(), "项目", strAOID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                BT_NewMain.Visible = true;
                BT_NewDetail.Visible = true;
            }

            string strID = e.Item.Cells[2].Text.Trim();
            LB_ID.Text = strID;

            if (e.CommandName == "Update")
            {
                for (int i = 0; i < DataGrid1.Items.Count; i++)
                {
                    DataGrid1.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "from SupplierAssetPaymentApplicantDetail as supplierAssetPaymentApplicantDetail where supplierAssetPaymentApplicantDetail.ID = " + strID;

                SupplierAssetPaymentApplicantDetailBLL supplierAssetPaymentApplicantDetailBLL = new SupplierAssetPaymentApplicantDetailBLL();
                lst = supplierAssetPaymentApplicantDetailBLL.GetAllSupplierAssetPaymentApplicantDetails(strHQL);
                SupplierAssetPaymentApplicantDetail supplierAssetPaymentApplicantDetail = (SupplierAssetPaymentApplicantDetail)lst[0];

                TB_AssetCode.Text = supplierAssetPaymentApplicantDetail.AssetCode;
                TB_AssetName.Text = supplierAssetPaymentApplicantDetail.AssetName;
                TB_ModelNumber.Text = supplierAssetPaymentApplicantDetail.ModelNumber;
                TB_Spec.Text = supplierAssetPaymentApplicantDetail.Spec;

                NB_Price.Amount = supplierAssetPaymentApplicantDetail.Price;

                DL_Type.SelectedValue = supplierAssetPaymentApplicantDetail.Type;
                DL_Unit.SelectedValue = supplierAssetPaymentApplicantDetail.Unit;
                NB_Number.Amount = supplierAssetPaymentApplicantDetail.Number;

                TB_Manufacturer.Text = supplierAssetPaymentApplicantDetail.Manufacture;

                TB_Account.Text = supplierAssetPaymentApplicantDetail.AccountName.Trim();
                lbl_AccountCode.Text = supplierAssetPaymentApplicantDetail.AccountCode;

                NB_Amount.Amount = supplierAssetPaymentApplicantDetail.Amount;

                try
                {
                    DL_RecordSourceType.SelectedValue = supplierAssetPaymentApplicantDetail.SourceType.Trim();
                }
                catch
                {
                }

                NB_RecordSourceID.Amount = supplierAssetPaymentApplicantDetail.SourceID;


                //刷新关联的入库单明细
                if (supplierAssetPaymentApplicantDetail.SourceType.Trim() == "CheckInOrderRecord")
                {
                    LoadAssetCheckInOrderDetailByID(supplierAssetPaymentApplicantDetail.SourceID.ToString());
                }


                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }

            if (e.CommandName == "Delete")
            {
                intWLNumber = GetRelatedWorkFlowNumber(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
                if (intWLNumber > 0 & strToDoWLID == null)
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

                    return;
                }

                string strSourceType;
                int intSourceID;

                strSourceType = DL_RecordSourceType.SelectedValue.Trim();
                intSourceID = int.Parse(NB_RecordSourceID.Amount.ToString());


                SupplierAssetPaymentApplicantDetailBLL supplierAssetPaymentApplicantDetailBLL = new SupplierAssetPaymentApplicantDetailBLL();
                strHQL = "from SupplierAssetPaymentApplicantDetail as supplierAssetPaymentApplicantDetail where supplierAssetPaymentApplicantDetail.ID = " + strID;
                lst = supplierAssetPaymentApplicantDetailBLL.GetAllSupplierAssetPaymentApplicantDetails(strHQL);
                SupplierAssetPaymentApplicantDetail supplierAssetPaymentApplicantDetail = (SupplierAssetPaymentApplicantDetail)lst[0];

                try
                {
                    supplierAssetPaymentApplicantDetailBLL.DeleteSupplierAssetPaymentApplicantDetail(supplierAssetPaymentApplicantDetail);

                    LoadSupplierAssetPaymentApplicantDetail(strAOID);

                    UpdateSupplierAssetPaymentApplicantAmount(strAOID, SumSupplierAssetPaymentApplicantAmount(strAOID));

                    //刷新关联的入库单明细
                    if (supplierAssetPaymentApplicantDetail.SourceType.Trim() == "CheckInOrderRecord")
                    {
                        strHQL = "Update T_AssetCheckInOrderDetail Set Status = 'NO' Where ID = " + supplierAssetPaymentApplicantDetail.SourceID.ToString();
                        ShareClass.RunSqlCommand(strHQL);

                        LoadAssetCheckInOrderDetailByID(supplierAssetPaymentApplicantDetail.SourceID.ToString());
                    }

                    //从流程中打开的业务单
                    //更改工作流关联的数据文件
                    strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue(DL_WFType.SelectedValue.Trim(), "项目", strAOID, "0");
                    if (strToDoWLID != null | strAllowFullEdit == "YES")
                    {
                        string strCmdText;

                        strCmdText = "select AOID as DetailAOID, * from V_SupplierAssetPaymentApplicant where AOID = " + strAOID;
                        if (strToDoWLID == null)
                        {
                            strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
                        }

                        if (strToDoWLID != null)
                        {
                            if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }

                        if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                        {
                            strCmdText = "select * from T_SupplierAssetPaymentApplicantDetail where AOID = " + strAOID;
                            ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }
                    }

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
        }
    }

    //给品牌和工艺字段赋值
    protected void setAssetManufacturerAndProcessRoute(string strRecordID)
    {
        string strHQL;

        strHQL = "Select Manufacture,ProcessRoute From T_SupplierAssetPaymentApplicantDetail Where ID =  " + strRecordID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_SupplierAssetPaymentApplicantDetail");

        if (ds.Tables[0].Rows.Count > 0)
        {
            TB_Manufacturer.Text = ds.Tables[0].Rows[0]["Manufacture"].ToString();
            //TB_ProcessRoute.Text = ds.Tables[0].Rows[0]["ProcessRoute"].ToString();
        }
    }

    protected void BT_CreateDetail_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        //取得此供应商关联的入库单明细
        if (TB_PartA.Text.Trim() != "")
        {
            LoadAssetCheckInOrderDetail(TB_PartA.Text.Trim());
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popDetailWindow') ", true);
    }

    protected void BT_NewDetail_Click(object sender, EventArgs e)
    {
        string strAOID;

        strAOID = LB_AOID.Text.Trim();

        if (strAOID == "")
        {
            AddMain();
        }
        else
        {
            UpdateMain();
        }

        strAOID = LB_AOID.Text.Trim();
        int intWLNumber = GetRelatedWorkFlowNumber(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
        if (intWLNumber > 0 & strToDoWLID == null)
        {
            BT_SubmitApply.Enabled = false;
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBCZGLDGZLJLBNSCJC + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            return;
        }
        else
        {
            BT_SubmitApply.Enabled = true;
        }

        string strDetailID;

        strDetailID = LB_ID.Text.Trim();

        if (strDetailID == "")
        {
            AddDetail();
        }
        else
        {
            UpdateDetail();
        }
    }


    protected void AddDetail()
    {
        string strRecordID, strAOID, strType, strAssetCode, strAssetName, strModelNumber, strSpec;
        string strSupplier, strSupplierPhone, strUnitName;
        decimal decNumber;
        DateTime dtBuyTime;
        decimal dePrice, deTaxRate;
        string strApplicantCode, strPurReason, strClearingForm, strSourceType, strComment;
        int intSourceID;

        strAOID = LB_AOID.Text.Trim();
        strType = DL_Type.SelectedValue.Trim();
        strAssetCode = TB_AssetCode.Text.Trim();
        strAssetName = TB_AssetName.Text.Trim();
        strUnitName = DL_Unit.SelectedValue.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        decNumber = NB_Number.Amount;
        strSpec = TB_Spec.Text.Trim();

        dePrice = NB_Price.Amount;

        dtBuyTime = DateTime.Now;

        strSourceType = DL_RecordSourceType.SelectedValue.Trim();
        intSourceID = int.Parse(NB_RecordSourceID.Amount.ToString());

        if (DL_RelatedType.SelectedValue.Trim() == "Project")
        {
            //检查相应科目项目预算有没有超支 //检查相应科目项目预算有没有超支
            if (ShareClass.CheckProjectExpenseBudget(strProjectID, NB_RelatedID.Amount.ToString(), NB_Amount.Amount) == false)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBZFYCGKMYSHXMZYSJC + "')", true);
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
        }


        if (strType == "" | strAssetName == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
        }
        else
        {
            SupplierAssetPaymentApplicantDetailBLL supplierAssetPaymentApplicantDetailBLL = new SupplierAssetPaymentApplicantDetailBLL();
            SupplierAssetPaymentApplicantDetail supplierAssetPaymentApplicantDetail = new SupplierAssetPaymentApplicantDetail();

            supplierAssetPaymentApplicantDetail.AOID = int.Parse(strAOID);
            supplierAssetPaymentApplicantDetail.Type = strType;
            supplierAssetPaymentApplicantDetail.AssetCode = strAssetCode;
            supplierAssetPaymentApplicantDetail.AssetName = strAssetName;


            supplierAssetPaymentApplicantDetail.Price = dePrice;
            supplierAssetPaymentApplicantDetail.ModelNumber = strModelNumber;
            supplierAssetPaymentApplicantDetail.Spec = strSpec;

            supplierAssetPaymentApplicantDetail.Number = decNumber;
            supplierAssetPaymentApplicantDetail.Unit = strUnitName;
            supplierAssetPaymentApplicantDetail.Amount = NB_Amount.Amount;

            supplierAssetPaymentApplicantDetail.SourceType = strSourceType;
            supplierAssetPaymentApplicantDetail.SourceID = intSourceID;

            supplierAssetPaymentApplicantDetail.Manufacture = TB_Manufacturer.Text.Trim();

            supplierAssetPaymentApplicantDetail.AccountCode = lbl_AccountCode.Text;
            supplierAssetPaymentApplicantDetail.AccountName = TB_Account.Text.Trim();


            try
            {
                supplierAssetPaymentApplicantDetailBLL.AddSupplierAssetPaymentApplicantDetail(supplierAssetPaymentApplicantDetail);

                strRecordID = ShareClass.GetMyCreatedMaxSupplierAssetPaymentApplicantDetailID(strAOID);
                LB_ID.Text = strRecordID;


                LoadSupplierAssetPaymentApplicantDetail(strAOID);

                UpdateSupplierAssetPaymentApplicantAmount(strAOID, SumSupplierAssetPaymentApplicantAmount(strAOID));

                //刷新关联的入库单明细
                if (strSourceType == "CheckInOrderRecord")
                {
                    string strHQL = "Update T_AssetCheckInOrderDetail Set Status = 'YES' Where ID = " + intSourceID.ToString();
                    ShareClass.RunSqlCommand(strHQL);

                    LoadAssetCheckInOrderDetail(TB_PartA.Text.Trim());
                }

                //从流程中打开的业务单
                //更改工作流关联的数据文件
                string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue(DL_WFType.SelectedValue.Trim(), "项目", strAOID, "0");
                if (strToDoWLID != null | strAllowFullEdit == "YES")
                {
                    string strCmdText;

                    strCmdText = "select AOID as DetailAOID, * from V_SupplierAssetPaymentApplicant where AOID = " + strAOID;
                    if (strToDoWLID == null)
                    {
                        strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
                    }

                    if (strToDoWLID != null)
                    {
                        if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                    }

                    if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                    {
                        strCmdText = "select * from T_SupplierAssetPaymentApplicantDetail where AOID = " + strAOID;
                        ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                    }
                }

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }
        }
    }


    protected void UpdateDetail()
    {
        string strType, strAssetCode, strAssetName, strModelNumber, strSpec;
        string strSupplier, strSupplierPhone, strPurReason, strUnitName;
        DateTime dtBuyTime;
        decimal deNumber;
        decimal dePrice, deTaxRate;
        string strApplicantCode, strClearingForm, strComment;
        string strSourceType;
        int intSourceID;

        string strID, strAOID, strPurManCode, strPurManName;
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text;

        strID = LB_ID.Text.Trim();

        strAOID = LB_AOID.Text.Trim();
        strType = DL_Type.SelectedValue.Trim();
        strAssetCode = TB_AssetCode.Text.Trim();
        strAssetName = TB_AssetName.Text.Trim();
        strUnitName = DL_Unit.SelectedValue.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();

        dePrice = NB_Price.Amount;
        deNumber = NB_Number.Amount;

        dtBuyTime = DateTime.Now;


        strSourceType = DL_RecordSourceType.SelectedValue.Trim();
        intSourceID = int.Parse(NB_RecordSourceID.Amount.ToString());

        if (DL_RelatedType.SelectedValue.Trim() == "Project")
        {
            //检查相应科目项目预算有没有超支 //检查相应科目项目预算有没有超支
            if (ShareClass.CheckProjectExpenseBudget(strProjectID, NB_RelatedID.Amount.ToString(), NB_Amount.Amount) == false)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBZFYCGKMYSHXMZYSJC + "')", true);
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                return;
            }
        }


        if (strType == "" | strAssetName == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
        }
        else
        {
            SupplierAssetPaymentApplicantDetailBLL supplierAssetPaymentApplicantDetailBLL = new SupplierAssetPaymentApplicantDetailBLL();
            strHQL = "from SupplierAssetPaymentApplicantDetail as supplierAssetPaymentApplicantDetail where supplierAssetPaymentApplicantDetail.ID = " + strID;
            lst = supplierAssetPaymentApplicantDetailBLL.GetAllSupplierAssetPaymentApplicantDetails(strHQL);
            SupplierAssetPaymentApplicantDetail supplierAssetPaymentApplicantDetail = (SupplierAssetPaymentApplicantDetail)lst[0];

            supplierAssetPaymentApplicantDetail.AOID = int.Parse(strAOID);
            supplierAssetPaymentApplicantDetail.Type = strType;
            supplierAssetPaymentApplicantDetail.AssetCode = strAssetCode;
            supplierAssetPaymentApplicantDetail.AssetName = strAssetName;
            supplierAssetPaymentApplicantDetail.Number = deNumber;
            supplierAssetPaymentApplicantDetail.Unit = strUnitName;
            supplierAssetPaymentApplicantDetail.Price = dePrice;
            supplierAssetPaymentApplicantDetail.Amount = NB_Amount.Amount;

            supplierAssetPaymentApplicantDetail.ModelNumber = strModelNumber;
            supplierAssetPaymentApplicantDetail.Spec = strSpec;

            supplierAssetPaymentApplicantDetail.Manufacture = TB_Manufacturer.Text.Trim();

            supplierAssetPaymentApplicantDetail.Amount = dePrice * deNumber;

            supplierAssetPaymentApplicantDetail.AccountCode = lbl_AccountCode.Text;
            supplierAssetPaymentApplicantDetail.AccountName = TB_Account.Text.Trim();

            supplierAssetPaymentApplicantDetail.SourceType = strSourceType;
            supplierAssetPaymentApplicantDetail.SourceID = intSourceID;

            try
            {
                supplierAssetPaymentApplicantDetailBLL.UpdateSupplierAssetPaymentApplicantDetail(supplierAssetPaymentApplicantDetail, int.Parse(strID));

                LoadSupplierAssetPaymentApplicantDetail(strAOID);

                //更新资产采购付款申请单总金额
                UpdateSupplierAssetPaymentApplicantAmount(strAOID, SumSupplierAssetPaymentApplicantAmount(strAOID));

                //刷新关联的入库单明细
                if (strSourceType == "CheckInOrderRecord")
                {
                    LoadAssetCheckInOrderDetail(LB_CheckInOrderID.Text);
                }

                //从流程中打开的业务单
                //更改工作流关联的数据文件
                string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue(DL_WFType.SelectedValue.Trim(), "项目", strAOID, "0");
                if (strToDoWLID != null | strAllowFullEdit == "YES")
                {
                    string strCmdText;

                    strCmdText = "select AOID as DetailAOID, * from V_SupplierAssetPaymentApplicant where AOID = " + strAOID;
                    if (strToDoWLID == null)
                    {
                        strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID(DL_WFType.SelectedValue.Trim(), "项目", strAOID);
                    }

                    if (strToDoWLID != null)
                    {
                        if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                    }

                    if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                    {
                        strCmdText = "select * from T_SupplierAssetPaymentApplicantDetail where AOID = " + strAOID;
                        ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                    }
                }

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            }
            catch (Exception err)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

            }
        }
    }

    protected void BT_AllPurAsset_Click(object sender, EventArgs e)
    {
        //LB_AssetOwner.Text = Resources.lang.SYLPLB; 
        //LB_AssetOwner.Visible = true;

        string strUserCode = LB_UserCode.Text.Trim();

        LoadSupplierAssetPaymentApplicant(strUserCode);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

    }

    protected string SubmitApply()
    {
        string strWLName, strWLType, strTemName, strXMLFileName, strXMLFile2;
        string strDescription, strCreatorCode, strCreatorName;
        string strCmdText, strAOID;

        string strWLID, strUserCode;

        strWLID = "0";
        strUserCode = LB_UserCode.Text.Trim();

        strAOID = LB_AOID.Text.Trim();

        XMLProcess xmlProcess = new XMLProcess();

        strWLName = TB_WLName.Text.Trim();
        strWLType = DL_WFType.SelectedValue.Trim();
        strTemName = DL_TemName.SelectedValue.Trim();
        strDescription = TB_Description.Text.Trim();
        strCreatorCode = LB_UserCode.Text.Trim();
        strCreatorName = ShareClass.GetUserName(strCreatorCode);

        if (strTemName == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZSSCSBLCMBBNWKJC + "');</script>");

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

            return "0";
        }

        strXMLFileName = strWLType + DateTime.Now.ToString("yyyyMMddHHMMssff") + ".xml";
        strXMLFile2 = "Doc\\" + "XML" + "\\" + strXMLFileName;

        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        WorkFlow workFlow = new WorkFlow();

        workFlow.WLName = strWLName;
        workFlow.WLType = strWLType;
        workFlow.XMLFile = strXMLFile2;
        workFlow.TemName = strTemName;
        workFlow.Description = strDescription;
        workFlow.CreatorCode = strCreatorCode;
        workFlow.CreatorName = strCreatorName;
        workFlow.CreateTime = DateTime.Now;
        workFlow.RelatedType = "项目";
        workFlow.Status = "新建";
        workFlow.RelatedID = int.Parse(strAOID);
        workFlow.DIYNextStep = "Yes";
        workFlow.IsPlanMainWorkflow = "NO";

        if (CB_SMS.Checked == true)
        {
            workFlow.ReceiveSMS = "Yes";
        }
        else
        {
            workFlow.ReceiveSMS = "No";
        }

        if (CB_Mail.Checked == true)
        {
            workFlow.ReceiveEMail = "Yes";
        }
        else
        {
            workFlow.ReceiveEMail = "No";
        }

        try
        {
            workFlowBLL.AddWorkFlow(workFlow);

            strWLID = ShareClass.GetMyCreatedWorkFlowID(strUserCode);

            LoadRelatedWL(strWLType, "项目", int.Parse(strAOID));

            UpdateAssetPurchaseStatus(strAOID, "处理中");
            DL_AOStatus.SelectedValue = "处理中";

            strCmdText = "select AOID as DetailAOID, * from V_SupplierAssetPaymentApplicant where AOID = " + strAOID;
            strXMLFile2 = Server.MapPath(strXMLFile2);
            xmlProcess.DbToXML(strCmdText, "V_SupplierAssetPaymentApplicant", strXMLFile2);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZLPCGSSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZLPCGSSBKNGZLMCGCZD25GHZJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

            return "0";
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

        return strWLID;
    }

    protected void BT_ActiveYes_Click(object sender, EventArgs e)
    {
        string strWLID = SubmitApply();

        if (strWLID != "0")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop11", "popShowByURL('TTMyWorkDetailMain.aspx?RelatedType=Other&WLID=" + strWLID + "','workflow','99%','99%',window.location);", true);
        }
    }

    protected void BT_ActiveNo_Click(object sender, EventArgs e)
    {
        SubmitApply();
    }

    protected void BT_Reflash_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '资产采购付款申请'";
        strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC";
        WorkFlowTemplateBLL workFlowTemplateBLL = new WorkFlowTemplateBLL();
        lst = workFlowTemplateBLL.GetAllWorkFlowTemplates(strHQL);

        DL_TemName.DataSource = lst;
        DL_TemName.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

    }

    protected void DL_POStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strAOID, strStatus, strUserCode;

        strAOID = LB_AOID.Text.Trim();
        strStatus = DL_AOStatus.SelectedValue.Trim();
        strUserCode = LB_UserCode.Text.Trim();

        if (strAOID != "")
        {
            UpdateAssetPurchaseStatus(strAOID, strStatus);
            LoadSupplierAssetPaymentApplicant(strUserCode);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid12_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strUserCode;
            string strID;

            strUserCode = LB_UserCode.Text.Trim();

            strID = e.Item.Cells[2].Text.Trim();

            if (e.CommandName == "Update")
            {
                for (int i = 0; i < DataGrid12.Items.Count; i++)
                {
                    DataGrid12.Items[i].ForeColor = Color.Black;
                }
                e.Item.ForeColor = Color.Red;


                strHQL = "From ConstractRelatedInvoice as constractRelatedInvoice Where constractRelatedInvoice.ID = " + strID;
                ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
                lst = constractRelatedInvoiceBLL.GetAllConstractRelatedInvoices(strHQL);

                ConstractRelatedInvoice constractRelatedInvoice = (ConstractRelatedInvoice)lst[0];


                LB_InvoiceID.Text = constractRelatedInvoice.ID.ToString();
                DL_InvoiceReceiveOPen.SelectedValue = constractRelatedInvoice.ReceiveOpen.Trim();
                DL_TaxType.SelectedValue = constractRelatedInvoice.TaxType.Trim();
                TB_InvoiceCode.Text = constractRelatedInvoice.InvoiceCode.Trim();
                NB_InvoiceAmount.Amount = constractRelatedInvoice.Amount;
                NB_InvoiceTaxRate.Amount = constractRelatedInvoice.TaxRate;

                DLC_OpenDate.Text = constractRelatedInvoice.OpenDate.ToString("yyyy-MM-dd");

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true','popInvoiceDetailWindow') ", true);
            }

            if (e.CommandName == "Delete")
            {
                string strInvoiceCode, strAOID;
                decimal deAmount, deTaxRate;

                strAOID = LB_AOID.Text.Trim();
                strInvoiceCode = TB_InvoiceCode.Text.Trim();
                deAmount = NB_InvoiceAmount.Amount;
                deTaxRate = NB_InvoiceTaxRate.Amount;

                ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
                strHQL = "From ConstractRelatedInvoice as constractRelatedInvoice Where constractRelatedInvoice.ID = " + strID;
                lst = constractRelatedInvoiceBLL.GetAllConstractRelatedInvoices(strHQL);
                ConstractRelatedInvoice constractRelatedInvoice = (ConstractRelatedInvoice)lst[0];

                constractRelatedInvoice.ConstractCode = strAOID;
                constractRelatedInvoice.InvoiceCode = TB_InvoiceCode.Text.Trim();
                constractRelatedInvoice.Amount = deAmount;
                constractRelatedInvoice.TaxRate = deTaxRate;

                try
                {
                    constractRelatedInvoiceBLL.DeleteConstractRelatedInvoice(constractRelatedInvoice);
                    LoadConstractRelatedInvoice(strAOID);

                    CountInvoiceAmount(strAOID);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }


                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true') ", true);
            }
        }
    }

    protected void BT_OpenInvoice_Click(object sender, EventArgs e)
    {
        LB_InvoiceID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true','popInvoiceDetailWindow') ", true);
    }

    protected void BT_Invoice_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_InvoiceID.Text.Trim();

        if (strID == "")
        {
            AddInvoice();
        }
        else
        {
            UpdateInvoice();
        }
    }

    protected void AddInvoice()
    {
        string strInvoiceCode, strAOID, strTaxType;
        decimal deAmount, deTaxRate;
        DateTime dtOpenDate;

        strAOID = LB_AOID.Text.Trim();
        strInvoiceCode = TB_InvoiceCode.Text.Trim();
        strTaxType = DL_TaxType.SelectedValue.Trim();
        deAmount = NB_InvoiceAmount.Amount;
        deTaxRate = NB_InvoiceTaxRate.Amount;
        dtOpenDate = DateTime.Parse(DLC_OpenDate.Text);

        ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
        ConstractRelatedInvoice constractRelatedInvoice = new ConstractRelatedInvoice();

        constractRelatedInvoice.ReceiveOpen = DL_InvoiceReceiveOPen.SelectedValue.Trim();
        constractRelatedInvoice.ConstractCode = "";
        constractRelatedInvoice.InvoiceCode = TB_InvoiceCode.Text.Trim();
        constractRelatedInvoice.TaxType = strTaxType;
        constractRelatedInvoice.Amount = deAmount;
        constractRelatedInvoice.TaxRate = deTaxRate;
        constractRelatedInvoice.OpenDate = dtOpenDate;
        constractRelatedInvoice.RelatedType = "PO";
        constractRelatedInvoice.RelatedID = strAOID;

        try
        {
            constractRelatedInvoiceBLL.AddConstractRelatedInvoice(constractRelatedInvoice);

            LoadConstractRelatedInvoice(strAOID);
            CountInvoiceAmount(strAOID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true') ", true);

        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true','popInvoiceDetailWindow') ", true);
        }
    }

    protected void UpdateInvoice()
    {
        string strHQL;
        IList lst;

        string strID, strInvoiceCode, strAOID, strTaxType;
        decimal deAmount, deTaxRate;
        DateTime dtOpenDate;

        strID = LB_InvoiceID.Text.Trim();
        strAOID = LB_AOID.Text.Trim();
        strTaxType = DL_TaxType.SelectedValue.Trim();
        strInvoiceCode = TB_InvoiceCode.Text.Trim();
        deAmount = NB_InvoiceAmount.Amount;
        deTaxRate = NB_InvoiceTaxRate.Amount;
        dtOpenDate = DateTime.Parse(DLC_OpenDate.Text);

        ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
        strHQL = "From ConstractRelatedInvoice as constractRelatedInvoice Where constractRelatedInvoice.ID = " + strID;
        lst = constractRelatedInvoiceBLL.GetAllConstractRelatedInvoices(strHQL);
        ConstractRelatedInvoice constractRelatedInvoice = (ConstractRelatedInvoice)lst[0];

        constractRelatedInvoice.ReceiveOpen = DL_InvoiceReceiveOPen.SelectedValue.Trim();
        constractRelatedInvoice.ConstractCode = "";
        constractRelatedInvoice.InvoiceCode = TB_InvoiceCode.Text.Trim();
        constractRelatedInvoice.TaxType = strTaxType;
        constractRelatedInvoice.Amount = deAmount;
        constractRelatedInvoice.TaxRate = deTaxRate;
        constractRelatedInvoice.OpenDate = dtOpenDate;
        constractRelatedInvoice.RelatedType = "PO";
        constractRelatedInvoice.RelatedID = strAOID;

        try
        {
            constractRelatedInvoiceBLL.UpdateConstractRelatedInvoice(constractRelatedInvoice, int.Parse(strID));

            LoadConstractRelatedInvoice(strAOID);
            CountInvoiceAmount(strAOID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true') ", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true','popInvoiceDetailWindow') ", true);
        }
    }

    protected void CountInvoiceAmount(string strAOID)
    {
        string strHQL;
        IList lst;

        decimal deOpenInvoiceAmount = 0, deReceiveInvoiceAmount = 0;
        string strType;

        strHQL = "from ConstractRelatedInvoice as constractRelatedInvoice where constractRelatedInvoice.RelatedType = 'PO' And RelatedID = " + "'" + strAOID + "'";
        ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
        lst = constractRelatedInvoiceBLL.GetAllConstractRelatedInvoices(strHQL);

        ConstractRelatedInvoice constractRelatedInvoice = new ConstractRelatedInvoice();

        for (int i = 0; i < lst.Count; i++)
        {
            constractRelatedInvoice = (ConstractRelatedInvoice)lst[i];

            strType = constractRelatedInvoice.ReceiveOpen.Trim();

            if (strType == "OPEN")
            {
                deOpenInvoiceAmount += constractRelatedInvoice.Amount;
            }

            if (strType == "RECEIVE")
            {
                deReceiveInvoiceAmount += constractRelatedInvoice.Amount;
            }
        }


        LB_TotalOpenInvoiceAmount.Text = deOpenInvoiceAmount.ToString();
        LB_TotalReceiveInvoiceAmount.Text = deReceiveInvoiceAmount.ToString();

    }

    protected void LoadConstractRelatedInvoice(string strAOID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractRelatedInvoice as constractRelatedInvoice where constractRelatedInvoice.RelatedType = 'PO' And RelatedID = " + "'" + strAOID + "'";
        ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
        lst = constractRelatedInvoiceBLL.GetAllConstractRelatedInvoices(strHQL);

        DataGrid12.DataSource = lst;
        DataGrid12.DataBind();
    }


    protected void UpdateAssetPurchaseStatus(string strAOID, string strStatus)
    {
        string strHQL;
        IList lst;

        strHQL = "from SupplierAssetPaymentApplicant as supplierAssetPaymentApplicant where supplierAssetPaymentApplicant.AOID = " + strAOID;
        SupplierAssetPaymentApplicantBLL supplierAssetPaymentApplicantBLL = new SupplierAssetPaymentApplicantBLL();
        lst = supplierAssetPaymentApplicantBLL.GetAllSupplierAssetPaymentApplicants(strHQL);

        SupplierAssetPaymentApplicant supplierAssetPaymentApplicant = (SupplierAssetPaymentApplicant)lst[0];

        supplierAssetPaymentApplicant.Status = strStatus;

        try
        {
            supplierAssetPaymentApplicantBLL.UpdateSupplierAssetPaymentApplicant(supplierAssetPaymentApplicant, int.Parse(strAOID));
        }
        catch
        {
        }
    }

    protected void UpdatPurchasePlanNumber(string strSourceType, string strSourceID)
    {
        string strHQL;
        decimal deSumNumber;

        if (strSourceType == "PurchasePlan")
        {
            strHQL = "Select COALESCE(Sum(Number),0) From T_SupplierAssetPaymentApplicantDetail Where SourceType = 'PurchasePlan' And SourceID=" + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_SupplierAssetPaymentApplicantDetail");

            try
            {
                deSumNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            catch
            {
                deSumNumber = 0;
            }

            strHQL = "Update T_ItemMainPlanRelatedItemPurchasePlan Set OrderNumber = " + deSumNumber.ToString() + " Where ID = " + strSourceID;
            ShareClass.RunSqlCommand(strHQL);
        }
    }

    protected void UpdatProjectRelatedItemNumber(string strSourceType, string strSourceID)
    {
        string strHQL;
        decimal deSumNumber;

        if (strSourceType == "AssetPJRecord")
        {
            strHQL = "Select COALESCE(Sum(Number),0) From T_SupplierAssetPaymentApplicantDetail Where SourceType = 'AssetPJRecord' And SourceID=" + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_SupplierAssetPaymentApplicantDetail");

            try
            {
                deSumNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            catch
            {
                deSumNumber = 0;
            }

            strHQL = "Update T_ProjectRelatedItem Set AleadyPurchased = " + deSumNumber.ToString() + " Where ID = " + strSourceID;
            ShareClass.RunSqlCommand(strHQL);
        }
    }


    protected void LoadAssetCheckInOrderDetail(string strSupplier)
    {
        string strHQL;
        IList lst;

        try
        {
            strHQL = "from AssetCheckInOrderDetail as assetCheckInOrderDetail where assetCheckInOrderDetail.Manufacturer = " + "'" + strSupplier + "'";
            strHQL += " Order by assetCheckInOrderDetail.Status ASC,assetCheckInOrderDetail.ID DESC";
            AssetCheckInOrderDetailBLL assetCheckInOrderDetailBLL = new AssetCheckInOrderDetailBLL();
            lst = assetCheckInOrderDetailBLL.GetAllAssetCheckInOrderDetails(strHQL);
            DataGrid15.DataSource = lst;
            DataGrid15.DataBind();

            LB_Sql15.Text = strHQL;

        }
        catch (Exception err)
        {
        }
    }

    protected void LoadAssetCheckInOrderDetailByID(string strID)
    {
        string strHQL;
        IList lst;

        try
        {
            strHQL = "from AssetCheckInOrderDetail as assetCheckInOrderDetail where assetCheckInOrderDetail.ID = " + strID;
            strHQL += " Order by assetCheckInOrderDetail.Status ASC,assetCheckInOrderDetail.ID DESC";
            AssetCheckInOrderDetailBLL assetCheckInOrderDetailBLL = new AssetCheckInOrderDetailBLL();
            lst = assetCheckInOrderDetailBLL.GetAllAssetCheckInOrderDetails(strHQL);
            DataGrid15.DataSource = lst;
            DataGrid15.DataBind();
        }
        catch
        {
        }
    }


    protected void LoadRelatedWL(string strWLType, string strRelatedType, int intRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType=" + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + intRelatedID.ToString() + " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void LoadSupplierAssetPaymentApplicant(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from SupplierAssetPaymentApplicant as supplierAssetPaymentApplicant where (supplierAssetPaymentApplicant.UserCode = " + "'" + strUserCode + "'";
        strHQL += " or supplierAssetPaymentApplicant.UserCode in (select  memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")) ";
        strHQL += " Order by supplierAssetPaymentApplicant.AOID DESC";

        //从流程中打开的业务单
        if (strToDoWLID != null & strWLBusinessID != null)
        {
            strHQL = "from SupplierAssetPaymentApplicant as supplierAssetPaymentApplicant where supplierAssetPaymentApplicant.AOID = " + strWLBusinessID;
        }
        SupplierAssetPaymentApplicantBLL supplierAssetPaymentApplicantBLL = new SupplierAssetPaymentApplicantBLL();
        lst = supplierAssetPaymentApplicantBLL.GetAllSupplierAssetPaymentApplicants(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }

    protected void LoadItemMainPlan(string strUserCode)
    {
        string strHQL;

        strHQL = "Select * From T_ItemMainPlan Where CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " Or CreatorCode in (Select UserCode From T_ProjectMember Where DepartCode in  " + LB_DepartString.Text.Trim() + ")";
        strHQL += " Order By PlanVerID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlan");

        DataGrid10.DataSource = ds;
        DataGrid10.DataBind();
    }

    protected void LoadCurrencyType()
    {
        string strHQL;
        IList lst;

        strHQL = "From CurrencyType as currencyType Order By currencyType.SortNo ASC";
        CurrencyTypeBLL currencyTypeBLL = new CurrencyTypeBLL();
        lst = currencyTypeBLL.GetAllCurrencyTypes(strHQL);

        DL_CurrencyType.DataSource = lst;
        DL_CurrencyType.DataBind();
    }

    protected void LoadSupplierAssetPaymentApplicantDetail(string strAOID)
    {
        string strHQL = "Select * from T_SupplierAssetPaymentApplicantDetail where AOID = " + strAOID + " Order by ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_SupplierAssetPaymentApplicantDetail");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected int GetWLID()
    {
        int intWLID;
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where WLID in (select max(workFlow1.MLID) from WorkFlow as workFlow)";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        WorkFlow workFlow = (WorkFlow)lst[0];

        intWLID = workFlow.WLID;

        return intWLID;
    }

    protected decimal SumSupplierAssetPaymentApplicantAmount(string strAOID)
    {
        string strHQL;
        IList lst;

        decimal deAmount = 0;

        strHQL = "from SupplierAssetPaymentApplicantDetail as supplierAssetPaymentApplicantDetail where supplierAssetPaymentApplicantDetail.AOID = " + strAOID;
        SupplierAssetPaymentApplicantDetailBLL supplierAssetPaymentApplicantDetailBLL = new SupplierAssetPaymentApplicantDetailBLL();
        lst = supplierAssetPaymentApplicantDetailBLL.GetAllSupplierAssetPaymentApplicantDetails(strHQL);

        SupplierAssetPaymentApplicantDetail supplierAssetPaymentApplicantDetail = new SupplierAssetPaymentApplicantDetail();

        for (int i = 0; i < lst.Count; i++)
        {
            supplierAssetPaymentApplicantDetail = (SupplierAssetPaymentApplicantDetail)lst[i];
            deAmount += supplierAssetPaymentApplicantDetail.Amount;
        }

        NB_CurrentTotalPaymentAmount.Amount = deAmount;

        return deAmount;
    }

    protected void UpdateSupplierAssetPaymentApplicantAmount(string strAOID, decimal deAmount)
    {
        string strHQL;
        IList lst;

        strHQL = "from SupplierAssetPaymentApplicant as supplierAssetPaymentApplicant where supplierAssetPaymentApplicant.AOID = " + strAOID;
        SupplierAssetPaymentApplicantBLL supplierAssetPaymentApplicantBLL = new SupplierAssetPaymentApplicantBLL();
        lst = supplierAssetPaymentApplicantBLL.GetAllSupplierAssetPaymentApplicants(strHQL);

        SupplierAssetPaymentApplicant supplierAssetPaymentApplicant = (SupplierAssetPaymentApplicant)lst[0];

        supplierAssetPaymentApplicant.CurrentTotalPaymentAmount = deAmount;

        try
        {
            supplierAssetPaymentApplicantBLL.UpdateSupplierAssetPaymentApplicant(supplierAssetPaymentApplicant, int.Parse(strAOID));
        }
        catch
        {
        }
    }

    protected decimal GetAssetStockTotalNumber(string strAssetCode, string strBrand, string strModelNumber, string strSpec)
    {
        string strHQL;

        strHQL = "Select COALESCE(Sum(Number),0) From T_Asset Where AssetCode = '" + strAssetCode + "' and Manufacturer = '" + strBrand + "' and ModelNumber = '" + strModelNumber + "' and Spec = '" + strSpec + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Asset");

        try
        {
            return decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        catch
        {
            return 0;
        }
    }

    protected int GetRelatedWorkFlowNumber(string strWLType, string strRelatedType, string strRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType = " + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + strRelatedID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        return lst.Count;
    }


    public static void LoadAccountForDDL(DropDownList DL_Account)
    {
        DataTable dt = GetAccountList(string.Empty);
        if (dt != null && dt.Rows.Count > 0)
        {
            DL_Account.Items.Clear();
            DL_Account.Items.Insert(0, new ListItem("--Select--", ""));
            SetInterval(DL_Account, "0", " ");
        }
        else
        {
            DL_Account.Items.Clear();
            DL_Account.Items.Insert(0, new ListItem("--Select--", ""));
        }
    }

    public static DataTable GetAccountList(string strParentID)
    {
        string strHQL = "Select * From T_Account ";
        if (!string.IsNullOrEmpty(strParentID))
        {
            strHQL += " Where ParentID='" + strParentID.Trim() + "' ";
        }
        strHQL += " Order By SortNumber ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Account");
        return ds.Tables[0];
    }

    public static void SetInterval(DropDownList DDL, string strParentID, string interval)
    {
        interval += "├";

        DataTable list = GetAccountList(strParentID);
        if (list.Rows.Count > 0 && list != null)
        {
            for (int i = 0; i < list.Rows.Count; i++)
            {
                DDL.Items.Add(new ListItem(string.Format("{0}{1}", interval, list.Rows[i]["AccountType"].ToString().Trim() + "-" + list.Rows[i]["AccountName"].ToString().Trim()), list.Rows[i]["AccountCode"].ToString().Trim()));

                ///递归
                SetInterval(DDL, list.Rows[i]["ID"].ToString().Trim(), interval);
            }
        }
    }

    public static void LoadCurrencyType(DropDownList DL_CurrencyType)
    {
        string strHQL;
        IList lst;

        strHQL = "From CurrencyType as currencyType Order By currencyType.SortNo ASC";
        CurrencyTypeBLL currencyTypeBLL = new CurrencyTypeBLL();
        lst = currencyTypeBLL.GetAllCurrencyTypes(strHQL);

        DL_CurrencyType.DataSource = lst;
        DL_CurrencyType.DataBind();
    }
}

