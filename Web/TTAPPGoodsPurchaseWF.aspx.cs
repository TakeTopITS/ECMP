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

public partial class TTAPPGoodsPurchaseWF : System.Web.UI.Page
{
    string strToDoWLID, strToDoWLDetailID, strWLBusinessID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode, strUserName, strDepartString;

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        //从流程中打开的业务单
        strToDoWLID = Request.QueryString["WLID"]; strToDoWLDetailID= Request.QueryString["WLStepDetailID"];
        strWLBusinessID = Request.QueryString["BusinessID"];

        if (Page.IsPostBack != true)
        {
            DLC_ArrivalTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_PurTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_OpenDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthorityAsset(Resources.lang.ZZJGT, TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            strHQL = "from JNUnit as jnUnit order by jnUnit.SortNumber ASC";
            JNUnitBLL jnUnitBLL = new JNUnitBLL();
            lst = jnUnitBLL.GetAllJNUnits(strHQL);
            DL_Unit.DataSource = lst;
            DL_Unit.DataBind();

            strHQL = "from GoodsType as goodsType Order by goodsType.SortNumber ASC";
            GoodsTypeBLL goodsTypeBLL = new GoodsTypeBLL();
            lst = goodsTypeBLL.GetAllGoodsTypes(strHQL);
            DL_Type.DataSource = lst;
            DL_Type.DataBind();
            DL_Type.Items.Insert(0, new ListItem("--Select--", ""));

            ShareClass.LoadWFTemplate(strUserCode, "物料采购", DL_TemName);

            ShareClass.LoadCurrencyType(DL_CurrencyType);
            ShareClass.LoadVendorList(DL_VendorList, strUserCode);

            TB_PurManCode.Text = strUserCode;
            LB_PurManName.Text = strUserName;

            TB_ApplicantCode.Text = strUserCode;
            LB_ApplicantName.Text = strUserName;

            LoadGoodsPurchaseOrder(strUserCode);
            LoadGoodsSaleOrder(strUserCode);
            LoadUsingConstract(strUserCode);

            LoadPlanVerID();
            LoadItemMainPlan(strUserCode);

            ShareClass.InitialInvolvedProjectTree(TreeView2, strUserCode);
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strDepartName;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = ShareClass.GetDepartName(strDepartCode);

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShowWithGrandson('popwindow','true','popDetailWindow','popDeparentUserSelectWindow') ", true);

        TreeView1.SelectedNode.Selected = false;
    }

    protected void BT_SelectUser_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShowWithGrandson('popwindow','true','popDetailWindow','popDeparentUserSelectWindow') ", true);
    }

    protected void BT_CloseSelectUser_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strProjectID;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strProjectID = treeNode.Target.Trim();
            LB_ProjectID.Text = strProjectID;

            NB_RelatedID.Amount = int.Parse(strProjectID);
            LoadProjectRelatedItem(strProjectID);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strUserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        string strUserName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();

        TB_ApplicantCode.Text = strUserCode;
        LB_ApplicantName.Text = ShareClass.GetUserName(strUserCode);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void DL_RelatedType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strRelatedType;

        strRelatedType = DL_RelatedType.SelectedValue.Trim();

        if (strRelatedType == "Other")
        {
            BT_SelectProject.Visible = false;
            BT_SelectSaleOrder.Visible = false;
            NB_RelatedID.Amount = 0;
        }

        if (strRelatedType == "MRPPlan")
        {
            BT_RelatedMRPPlan.Visible = true;
            NB_RelatedID.Amount = 0;
        }
        else
        {
            BT_RelatedMRPPlan.Visible = false;
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

        if (strRelatedType == "SaleOrder")
        {
            BT_SelectSaleOrder.Visible = true;
            NB_RelatedID.Amount = 0;
        }
        else
        {
            BT_SelectSaleOrder.Visible = false;
        }

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

    protected void DataGrid13_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strConstractCode;

            strConstractCode = ((Button)e.Item.FindControl("BT_ConstractCode")).Text.Trim();

            for (int i = 0; i < DataGrid13.Items.Count; i++)
            {
                DataGrid13.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            LB_ConstractCode.Text = strConstractCode;

            LoadConstractRelatedGoodsList(strConstractCode);

            TabContainer2.ActiveTabIndex = 5;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid14_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strConstractCode;

            strConstractCode = ((Button)e.Item.FindControl("BT_ConstractCode")).Text.Trim();

            for (int i = 0; i < DataGrid14.Items.Count; i++)
            {
                DataGrid14.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            LB_ConstractCode.Text = strConstractCode;

            LoadConstractRelatedGoodsList(strConstractCode);

            TabContainer2.ActiveTabIndex = 5;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid24_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strID, strConstractCode;
            IList lst;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();
            LB_ID.Text = strID;

            strConstractCode = LB_ConstractCode.Text.Trim();

            for (int i = 0; i < DataGrid24.Items.Count; i++)
            {
                DataGrid24.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "from ConstractRelatedGoods as constractRelatedGoods Where constractRelatedGoods.ConstractCode = " + "'" + strConstractCode + "'";

            ConstractRelatedGoodsBLL constractRelatedGoodsBLL = new ConstractRelatedGoodsBLL();
            lst = constractRelatedGoodsBLL.GetAllConstractRelatedGoodss(strHQL);
            ConstractRelatedGoods constractRelatedGoods = (ConstractRelatedGoods)lst[0];

            TB_GoodsCode.Text = constractRelatedGoods.GoodsCode;
            TB_GoodsName.Text = constractRelatedGoods.GoodsName;
            TB_ModelNumber.Text = constractRelatedGoods.ModelNumber;
            TB_Spec.Text = constractRelatedGoods.Spec;
            TB_Brand.Text = constractRelatedGoods.Brand;

            DL_Type.SelectedValue = constractRelatedGoods.Type;
            DL_Unit.SelectedValue = constractRelatedGoods.Unit;
            NB_Number.Amount = constractRelatedGoods.Number;

            DL_Unit.SelectedValue = constractRelatedGoods.Unit;

            DL_RecordSourceType.SelectedValue = "GoodsCSRecord";
            NB_RecordSourceID.Amount = constractRelatedGoods.ID;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void LoadConstractRelatedGoodsList(string strConstractCode)
    {
        string strHQL;
        IList lst;

        ConstractRelatedGoodsBLL constractRelatedGoodsBLL = new ConstractRelatedGoodsBLL();
        strHQL = "from ConstractRelatedGoods as constractRelatedGoods where constractRelatedGoods.ConstractCode = " + "'" + strConstractCode + "'";
        lst = constractRelatedGoodsBLL.GetAllConstractRelatedGoodss(strHQL);

        DataGrid24.DataSource = lst;
        DataGrid24.DataBind();
    }

    protected void DataGrid5_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strPOID, strPORelatedType;
            IList lst;
            int intWLNumber;

            strPOID = e.Item.Cells[3].Text.Trim();

            intWLNumber = GetRelatedWorkFlowNumber("物料采购", "物料", strPOID);
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
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料采购", "物料", strPOID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                BT_NewMain.Visible = true;
                BT_NewDetail.Visible = true;
            }

            if (e.CommandName == "Update" | e.CommandName == "Assign" | e.CommandName == "INVOICE")
            {
                for (int i = 0; i < DataGrid5.Items.Count; i++)
                {
                    DataGrid5.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where goodsPurchaseOrder.POID = " + strPOID;
                GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
                lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);
                GoodsPurchaseOrder goodsPurchaseOrder = (GoodsPurchaseOrder)lst[0];

                LB_POID.Text = goodsPurchaseOrder.POID.ToString();
                TB_GPOName.Text = goodsPurchaseOrder.GPOName.Trim();
                DLC_PurTime.Text = goodsPurchaseOrder.PurTime.ToString("yyyy-MM-dd");
                DLC_ArrivalTime.Text = goodsPurchaseOrder.ArrivalTime.ToString("yyyy-MM-dd");
                NB_Amount.Amount = goodsPurchaseOrder.Amount;

                DL_CurrencyType.SelectedValue = goodsPurchaseOrder.CurrencyType;

                TB_Comment.Text = goodsPurchaseOrder.Comment.Trim();
                DL_POStatus.SelectedValue = goodsPurchaseOrder.Status.Trim();
                TB_PurManCode.Text = goodsPurchaseOrder.OperatorCode.Trim();
                LB_PurManName.Text = goodsPurchaseOrder.OperatorName.Trim();

                TB_Supplier.Text = goodsPurchaseOrder.Supplier;
                TB_SupplierPhone.Text = goodsPurchaseOrder.SupplierPhone;
                TB_FaxNumber.Text = goodsPurchaseOrder.SupplierFax;
                TB_Contacts.Text = goodsPurchaseOrder.SupplierFax;
                TB_ClearingForm.Text = goodsPurchaseOrder.ClearingForm.Trim();

                DL_RelatedType.SelectedValue = goodsPurchaseOrder.RelatedType.Trim();
                NB_RelatedID.Amount = goodsPurchaseOrder.RelatedID;

                strPORelatedType = goodsPurchaseOrder.RelatedType.Trim();

                LoadGoodsPurchaseOrderDetail(strPOID);
                LoadRelatedConstract(strPOID);

                if (strPORelatedType == "Other")
                {
                    BT_SelectProject.Visible = false;
                    BT_SelectSaleOrder.Visible = false;
                }
                if (strPORelatedType == "Project")
                {
                    BT_SelectProject.Visible = true;
                    BT_SelectSaleOrder.Visible = false;
                }
                if (strPORelatedType == "SaleOrder")
                {
                    BT_SelectProject.Visible = false;
                    BT_SelectSaleOrder.Visible = true;
                }

                TB_WLName.Text = Resources.lang.GouMai  + goodsPurchaseOrder.GPOName.Trim() + Resources.lang.ShenQing;

                LoadRelatedWL("物料采购", "物料", goodsPurchaseOrder.POID);

                if (DL_RelatedType.SelectedValue == "Project")
                {
                    LoadProjectRelatedItem(NB_RelatedID.Amount.ToString());
                    LB_ProjectID.Text = NB_RelatedID.Amount.ToString();
                }


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
                    LoadConstractRelatedInvoice(strPOID);
                    CountInvoiceAmount(strPOID);
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true') ", true);
                }
            }

            if (e.CommandName == "Delete")
            {
                strUserCode = LB_UserCode.Text.Trim();

                strHQL = "Delete From T_GoodsPurchaseorder Where POID = " + strPOID;

                try
                {
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "Delete From T_GoodsPurRecord Where POID = " + strPOID;
                    ShareClass.RunSqlCommand(strHQL);

                    LoadGoodsPurchaseOrder(strUserCode);
                    LoadGoodsPurchaseOrderDetail(strPOID);
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
        LB_POID.Text = "";

        BT_NewMain.Visible = true;
        BT_NewDetail.Visible = true;

        LoadGoodsPurchaseOrderDetail("0");

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_NewMain_Click(object sender, EventArgs e)
    {
        string strPOID;

        strPOID = LB_POID.Text.Trim();

        if (strPOID == "")
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
        string strPOID, strPOName, strPurManCode, strPurManName, strOperatorCode, strOperatorName, strCurrencyType, strComment, strSupplier, strSupplierPhone, strFax, strContacts, strClearingForm;
        DateTime dtPurTime, dtArrivalTime;
        decimal deAmount;
        string strStatus;

        strPOName = TB_GPOName.Text.Trim();
        strPurManCode = TB_PurManCode.Text.Trim();
        strPurManName = LB_PurManName.Text.Trim();
        strOperatorCode = LB_UserCode.Text.Trim();
        strOperatorName = LB_UserName.Text.Trim();
        strSupplier = TB_Supplier.Text.Trim();
        strSupplierPhone = TB_SupplierPhone.Text.Trim();
        strFax = TB_FaxNumber.Text.Trim();
        strContacts = TB_Contacts.Text.Trim();

        strClearingForm = TB_ClearingForm.Text.Trim();
        dtPurTime = DateTime.Parse(DLC_PurTime.Text);
        dtArrivalTime = DateTime.Parse(DLC_ArrivalTime.Text);
        deAmount = NB_Amount.Amount;
        strCurrencyType = DL_CurrencyType.SelectedValue.Trim();
        strStatus = DL_POStatus.SelectedValue.Trim();
        strComment = TB_Comment.Text.Trim();

        GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
        GoodsPurchaseOrder goodsPurchaseOrder = new GoodsPurchaseOrder();

        if (GetGoodsPurchaseOrderCodeCount(strPOName) > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCZXTDMQJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }

        goodsPurchaseOrder.GPOName = strPOName;
        goodsPurchaseOrder.PurManCode = strPurManCode;
        try
        {
            goodsPurchaseOrder.PurManName = ShareClass.GetUserName(strPurManCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWCGRDMBZCWCRJC + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            return;
        }
        goodsPurchaseOrder.OperatorCode = strOperatorCode;
        goodsPurchaseOrder.OperatorName = strOperatorName;
        goodsPurchaseOrder.PurTime = dtPurTime;
        goodsPurchaseOrder.ArrivalTime = dtArrivalTime;
        goodsPurchaseOrder.Amount = 0;
        goodsPurchaseOrder.CurrencyType = strCurrencyType;
        goodsPurchaseOrder.Supplier = strSupplier;
        goodsPurchaseOrder.SupplierPhone = strSupplierPhone;
        goodsPurchaseOrder.SupplierFax = strFax;
        goodsPurchaseOrder.SupplierContacts = strContacts;
        goodsPurchaseOrder.ClearingForm = strClearingForm;

        goodsPurchaseOrder.Comment = strComment;
        goodsPurchaseOrder.Status = "新建";

        goodsPurchaseOrder.RelatedType = DL_RelatedType.SelectedValue.Trim();
        goodsPurchaseOrder.RelatedID = int.Parse(NB_RelatedID.Amount.ToString());


        try
        {
            goodsPurchaseOrderBLL.AddGoodsPurchaseOrder(goodsPurchaseOrder);

            strPOID = ShareClass.GetMyCreatedMaxGoodsPurchaseOrderID(strOperatorCode);
            LB_POID.Text = strPOID;

            string strNewPOCode = ShareClass.GetCodeByRule("PurchaseOrderCode", "PurchaseOrderCode", strPOID);
            if (strNewPOCode != "")
            {
                TB_GPOName.Text = strNewPOCode;
                string strHQL = "Update T_GoodsPurchaseOrder Set GPOName = " + "'" + strNewPOCode + "'" + " Where POID = " + strPOID;
                ShareClass.RunSqlCommand(strHQL);
            }

            NB_Amount.Amount = 0;

            TB_WLName.Text = Resources.lang.GouMai  + strPOName + Resources.lang.ShenQing;

            BT_SubmitApply.Enabled = true;

            LoadGoodsPurchaseOrder(strPurManCode);
            LoadGoodsPurchaseOrderDetail(strPOID);
            LoadRelatedConstract(strPOID);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJCCKNCGMCZD50GHZHBZZSZD100GHZGDJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

        }
    }

    protected void UpdateMain()
    {
        string strHQL;
        IList lst;

        string strPOID, strUserCode, strPOName, strPurManCode, strPurManName, strCurrrencyType, strComment, strSupplier, strSupplierPhone, strFax, strContacts, strClearingForm;
        DateTime dtPurTime, dtArrivalTime;
        decimal deAmount;
        string strStatus;

        strUserCode = LB_UserCode.Text.Trim();

        strPOID = LB_POID.Text.Trim();
        strPOName = TB_GPOName.Text.Trim();
        strPurManCode = TB_PurManCode.Text.Trim();
        strPurManName = LB_PurManName.Text.Trim();
        dtPurTime = DateTime.Parse(DLC_PurTime.Text);
        dtArrivalTime = DateTime.Parse(DLC_ArrivalTime.Text);
        deAmount = NB_Amount.Amount;
        strCurrrencyType = DL_CurrencyType.SelectedValue.Trim();
        strSupplier = TB_Supplier.Text.Trim();
        strSupplierPhone = TB_SupplierPhone.Text.Trim();
        strFax = TB_FaxNumber.Text.Trim();
        strContacts = TB_Contacts.Text.Trim();
        strClearingForm = TB_ClearingForm.Text.Trim();

        strComment = TB_Comment.Text.Trim();
        strStatus = DL_POStatus.SelectedValue.Trim();

        strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where goodsPurchaseOrder.POID = " + strPOID;
        GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
        lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);

        GoodsPurchaseOrder goodsPurchaseOrder = (GoodsPurchaseOrder)lst[0];

        goodsPurchaseOrder.GPOName = strPOName;

        goodsPurchaseOrder.PurManCode = strPurManCode;
        try
        {
            goodsPurchaseOrder.PurManName = ShareClass.GetUserName(strPurManCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWCGRDMBZCWCRJC + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            return;
        }

        goodsPurchaseOrder.PurTime = dtPurTime;
        goodsPurchaseOrder.ArrivalTime = dtArrivalTime;
        goodsPurchaseOrder.Amount = deAmount;
        goodsPurchaseOrder.CurrencyType = strCurrrencyType;
        goodsPurchaseOrder.Supplier = strSupplier;
        goodsPurchaseOrder.SupplierPhone = strSupplierPhone;
        goodsPurchaseOrder.SupplierFax = strFax;
        goodsPurchaseOrder.SupplierContacts = strContacts;
        goodsPurchaseOrder.ClearingForm = strClearingForm;

        goodsPurchaseOrder.Comment = strComment;
        goodsPurchaseOrder.Status = strStatus;

        goodsPurchaseOrder.RelatedType = DL_RelatedType.SelectedValue.Trim();
        goodsPurchaseOrder.RelatedID = int.Parse(NB_RelatedID.Amount.ToString());

        try
        {
            goodsPurchaseOrderBLL.UpdateGoodsPurchaseOrder(goodsPurchaseOrder, int.Parse(strPOID));
            LoadGoodsPurchaseOrder(strUserCode);

            //从流程中打开的业务单
            //更改工作流关联的数据文件
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料采购", "物料", strPOID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                string strCmdText = "select POID as DetailPOID, * from T_GoodsPurchaseOrder where POID = " + strPOID;
                if (strToDoWLID == null)
                {
                    strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料采购", "物料", strPOID);
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
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql5.Text;

        GoodsPurchaseOrderBLL puchaseOrderBLL = new GoodsPurchaseOrderBLL();
        IList lst = puchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void DL_VendorList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strVendorCode, strVendorPhone, strClearingForm, strContacts, strFax;
        decimal deTaxRate;

        strVendorCode = DL_VendorList.SelectedValue.Trim();
        strHQL = "Select COALESCE(Tel1,''),TaxRate,ClearingForm ,ContactName,Fax From T_Vendor Where VendorCode = " + "'" + strVendorCode + "'";

        try
        {
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Vendor");
            if (ds.Tables[0].Rows.Count == 0)
            {
                strHQL = "Select COALESCE(PhoneNum,''),1,'' ,TechnicalDirector,Fax From T_BMSupplierInfo Where Code = " + "'" + strVendorCode + "'";
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierInfo");
            }

            strVendorPhone = ds.Tables[0].Rows[0][0].ToString();
            deTaxRate = decimal.Parse(ds.Tables[0].Rows[0][1].ToString());
            strClearingForm = ds.Tables[0].Rows[0][2].ToString();
            strContacts = ds.Tables[0].Rows[0][3].ToString();
            strFax = ds.Tables[0].Rows[0][4].ToString();

            TB_SupplierPhone.Text = strVendorPhone;
            TB_Supplier.Text = DL_VendorList.SelectedItem.Text;

            NB_TaxRate.Amount = deTaxRate;
            TB_ClearingForm.Text = strClearingForm;

            TB_Contacts.Text = strContacts;
            TB_FaxNumber.Text = strFax;

        }
        catch
        {
            TB_SupplierPhone.Text = "";
            TB_Supplier.Text = "";

            NB_TaxRate.Amount = 1;
            TB_ClearingForm.Text = "";
        }

        LoadVendorRelatedGoodsList(strVendorCode);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void DL_RecordSourceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        NB_RecordSourceID.Amount = 0;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_FindGoods_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strType, strGoodsCode, strGoodsName, strModelNumber, strSpec;

        DataGrid4.CurrentPageIndex = 0;
        TabContainer2.ActiveTabIndex = 1;

        strType = DL_Type.SelectedValue.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();

        strType = "%" + strType + "%";
        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";

        strHQL = "Select * From T_Goods as goods Where goods.GoodsCode Like " + "'" + strGoodsCode + "'" + " and goods.GoodsName like " + "'" + strGoodsName + "'";
        strHQL += " and goods.Type Like " + "'" + strType + "'" + " and goods.ModelNumber Like " + "'" + strModelNumber + "'" + " and goods.Spec Like " + "'" + strSpec + "'";
        strHQL += " Order by goods.Number DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");
        DataGrid7.DataSource = ds;
        DataGrid7.DataBind();

        strHQL = "Select * From T_Item as item Where item.ItemCode Like " + "'" + strGoodsCode + "'" + " and item.ItemName like " + "'" + strGoodsName + "'";
        strHQL += " and item.Specification Like " + "'" + strSpec + "'";
        strHQL += " and item.BigType = 'Goods'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_Item");
        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_Clear_Click(object sender, EventArgs e)
    {
        TB_GoodsCode.Text = "";
        TB_GoodsName.Text = "";
        TB_ModelNumber.Text = "";
        TB_Spec.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }


    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strID, strVendorCode;
            IList lst;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();
            LB_ID.Text = strID;

            strVendorCode = DL_VendorList.SelectedValue.Trim();

            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "from VendorRelatedGoodsInfor as vendorRelatedGoodsInfor Where vendorRelatedGoodsInfor.ID = " + strID;

            VendorRelatedGoodsInforBLL vendorRelatedGoodsInforBLL = new VendorRelatedGoodsInforBLL();
            lst = vendorRelatedGoodsInforBLL.GetAllVendorRelatedGoodsInfors(strHQL);
            VendorRelatedGoodsInfor vendorRelatedGoodsInfor = (VendorRelatedGoodsInfor)lst[0];

            TB_GoodsCode.Text = vendorRelatedGoodsInfor.GoodsCode;
            TB_GoodsName.Text = vendorRelatedGoodsInfor.GoodsName;
            TB_ModelNumber.Text = vendorRelatedGoodsInfor.ModelNumber;
            TB_Spec.Text = vendorRelatedGoodsInfor.Spec;
            TB_Brand.Text = vendorRelatedGoodsInfor.Brand;

            DL_Type.SelectedValue = vendorRelatedGoodsInfor.Type;
            DL_Unit.SelectedValue = vendorRelatedGoodsInfor.Unit;

            NB_Price.Amount = vendorRelatedGoodsInfor.Price;


            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
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

                TB_GoodsCode.Text = item.ItemCode;
                TB_GoodsName.Text = item.ItemName;
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
                TB_Brand.Text = item.Brand;

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

            string strID, strGoodsCode;

            strID = e.Item.Cells[0].Text;
            strGoodsCode = ((Button)e.Item.FindControl("BT_GoodsCode")).Text.Trim();

            for (int i = 0; i < DataGrid7.Items.Count; i++)
            {
                DataGrid7.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "from Goods as goods where goods.ID = " + strID;
            GoodsBLL goodsBLL = new GoodsBLL();
            lst = goodsBLL.GetAllGoodss(strHQL);

            if (lst.Count > 0)
            {
                Goods goods = (Goods)lst[0];

                TB_GoodsCode.Text = goods.GoodsCode;
                TB_GoodsName.Text = goods.GoodsName;
                TB_ModelNumber.Text = goods.ModelNumber;
                DL_Unit.SelectedValue = goods.UnitName;
                TB_Spec.Text = goods.Spec;
                TB_Brand.Text = goods.Manufacturer;

                DL_Type.SelectedValue = goods.Type;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }


    protected void DataGrid8_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strGoodsCode;
            decimal deRequireNumber, deOrderNumber;

            strID = e.Item.Cells[0].Text;
            strGoodsCode = ((Button)e.Item.FindControl("BT_ItemCode")).Text.Trim();

            for (int i = 0; i < DataGrid8.Items.Count; i++)
            {
                DataGrid8.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            deRequireNumber = decimal.Parse(e.Item.Cells[5].Text);
            deOrderNumber = decimal.Parse(e.Item.Cells[6].Text);

            strHQL = "from Item as item where item.ItemCode = " + "'" + strGoodsCode + "'";
            ItemBLL itemBLL = new ItemBLL();
            lst = itemBLL.GetAllItems(strHQL);
            if (lst.Count > 0)
            {
                Item item = (Item)lst[0];

                TB_GoodsCode.Text = strGoodsCode;
                TB_GoodsName.Text = item.ItemName;
                TB_ModelNumber.Text = item.ModelNumber;
                TB_Spec.Text = item.Specification;
                TB_Brand.Text = item.Brand;

                NB_Number.Amount = deRequireNumber - deOrderNumber;
                DL_Unit.SelectedValue = item.Unit;
                NB_Price.Amount = item.PurchasePrice;

                try
                {
                    DL_Type.SelectedValue = item.SmallType;
                }
                catch
                {
                    DL_Type.SelectedValue = "";
                }
            }

            DL_RecordSourceType.SelectedValue = "PurchasePlan";
            NB_RecordSourceID.Amount = int.Parse(strID);

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

            for (int i = 0; i < DataGrid11.Items.Count; i++)
            {
                DataGrid11.Items[i].ForeColor = Color.Black;
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

            TB_GoodsCode.Text = strItemCode;
            TB_GoodsName.Text = strItemName;

            try
            {
                DL_Type.SelectedValue = projectRelatedItem.ItemType;
            }
            catch
            {
            }

            TB_Spec.Text = projectRelatedItem.Specification;
            TB_ModelNumber.Text = projectRelatedItem.ModelNumber;
            TB_Brand.Text = projectRelatedItem.Brand;

            NB_Number.Amount = projectRelatedItem.Number;

            DL_Unit.SelectedValue = strUnit;

            //LB_SourceRelatedID.Text = projectRelatedItem.ProjectID.ToString();
            DL_RecordSourceType.SelectedValue = "GoodsPJRecord";
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


    protected void DL_PlanVerID_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        string strPlanVerID;

        strPlanVerID = DL_PlanVerID.SelectedValue;

        strHQL = "Select * From T_ItemMainPlanMRPVersion Where Type = 'ACTIVE' and PlanVerID = " + strPlanVerID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanMRPVersion");

        DL_PlanMRPVersionID.DataSource = ds;
        DL_PlanMRPVersionID.DataBind();

        DL_PlanMRPVersionID.Items.Insert(0, new ListItem("--Select--", "0"));

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void DL_PlanMRPVersionID_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strPlanVerID, strPlanMRPVerID, strID;

        strPlanVerID = DL_PlanVerID.SelectedValue;
        strPlanMRPVerID = DL_PlanMRPVersionID.SelectedItem.Text;

        strID = DL_PlanMRPVersionID.SelectedValue;
        if (strID != "0")
        {
            LoadItemMainPlanRelatedItemPurchasePlan(strPlanVerID, strPlanMRPVerID);
        }
        else
        {
            LoadItemMainPlanRelatedItemPurchasePlan(strPlanVerID, "0");
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strPlanVerID, strPlanMRPVerID;
        string strBusinessType, strBussnessID;

        DataSet ds;

        strPlanVerID = DL_PlanVerID.SelectedValue.Trim();
        strPlanMRPVerID = DL_PlanMRPVersionID.SelectedItem.Text.Trim();

        strBusinessType = DL_BusinessType.SelectedValue.Trim();
        strBussnessID = NB_BusinessID.Amount.ToString();

        if (strBusinessType == "SaleOrder")
        {
            strHQL = "Select * From T_ItemMainPlanRelatedItemPurchasePlan Where PlanVerID = " + strPlanVerID + " and PlanMRPVerID = " + strPlanMRPVerID;
            strHQL += " and SourceType = 'GoodsSORecord' and SourceRecordID in (Select ID From T_GoodsSaleRecord Where SOID in (Select SOID From T_GoodsSaleOrder Where  SOID = " + strBussnessID + "))";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanRelatedItemPurchasePlan");

            DataGrid8.DataSource = ds;
            DataGrid8.DataBind();
        }

        if (strBusinessType == "Project")
        {
            strHQL = "Select * From T_ItemMainPlanRelatedItemPurchasePlan Where PlanVerID = " + strPlanVerID + " and PlanMRPVerID = " + strPlanMRPVerID;
            strHQL += " and SourceType = 'GoodsPJRecord' and SourceRecordID in (Select ID From T_ProjectRelatedItem Where ProjectID  = " + strBussnessID + ")";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanRelatedItemPurchasePlan");

            DataGrid8.DataSource = ds;
            DataGrid8.DataBind();
        }

        if (strBusinessType == "ApplicationOrder")
        {
            strHQL = "Select * From T_ItemMainPlanRelatedItemPurchasePlan Where PlanVerID = " + strPlanVerID + " and PlanMRPVerID = " + strPlanMRPVerID;
            strHQL += " and SourceType = 'GoodsAORecord' and SourceRecordID in (Select ID From T_GoodsApplicationDetail Where AAID in (Select AID From T_GoodsApplication Where AAID  = " + strBussnessID + "))";
            ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanRelatedItemPurchasePlan");

            DataGrid8.DataSource = ds;
            DataGrid8.DataBind();
        }

        if (strBusinessType == "Other")
        {
            LoadItemMainPlanRelatedItemPurchasePlan(strPlanVerID, strPlanMRPVerID);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strPOID;
            IList lst;

            strPOID = LB_POID.Text.Trim();

            int intWLNumber = GetRelatedWorkFlowNumber("物料采购", "物料", strPOID);
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
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料采购", "物料", strPOID, "0");
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

                strHQL = "from GoodsPurRecord as goodsPurRecord where goodsPurRecord.ID = " + strID;

                GoodsPurRecordBLL goodsPurRecordBLL = new GoodsPurRecordBLL();
                lst = goodsPurRecordBLL.GetAllGoodsPurRecords(strHQL);
                GoodsPurRecord goodsPurRecord = (GoodsPurRecord)lst[0];

                TB_GoodsCode.Text = goodsPurRecord.GoodsCode;
                TB_GoodsName.Text = goodsPurRecord.GoodsName;
                TB_ModelNumber.Text = goodsPurRecord.ModelNumber;
                TB_Spec.Text = goodsPurRecord.Spec;
                TB_Brand.Text = goodsPurRecord.Brand;

                TB_PurReason.Text = goodsPurRecord.PurReason;
                NB_Price.Amount = goodsPurRecord.Price;
                TB_ApplicantCode.Text = goodsPurRecord.ApplicantCode;

                LB_ApplicantName.Text = ShareClass.GetUserName(goodsPurRecord.ApplicantCode);
                DL_Type.SelectedValue = goodsPurRecord.Type;
                DL_Unit.SelectedValue = goodsPurRecord.Unit;
                NB_Number.Amount = goodsPurRecord.Number;

                NB_TaxRate.Amount = goodsPurRecord.TaxRate;
                TB_ClearingForm.Text = goodsPurRecord.ClearingForm;

                try
                {
                    DL_RecordSourceType.SelectedValue = goodsPurRecord.SourceType.Trim();
                }
                catch
                {
                }

                NB_RecordSourceID.Amount = goodsPurRecord.SourceID;

                TB_RecordComment.Text = goodsPurRecord.Comment;

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }

            if (e.CommandName == "Delete")
            {
                intWLNumber = GetRelatedWorkFlowNumber("物料采购", "物料", strPOID);
                if (intWLNumber > 0 & strToDoWLID == null)
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

                    return;
                }

                string strSourceType;
                int intSourceID;

                GoodsPurRecordBLL goodsPurRecordBLL = new GoodsPurRecordBLL();
                strHQL = "from GoodsPurRecord as goodsPurRecord where goodsPurRecord.ID = " + strID;
                lst = goodsPurRecordBLL.GetAllGoodsPurRecords(strHQL);
                GoodsPurRecord goodsPurRecord = (GoodsPurRecord)lst[0];

                strSourceType = goodsPurRecord.SourceType.Trim();
                intSourceID = goodsPurRecord.SourceID;

                try
                {
                    goodsPurRecordBLL.DeleteGoodsPurRecord(goodsPurRecord);

                    LoadGoodsPurchaseOrderDetail(strPOID);

                    NB_Amount.Amount = SumGoodsPurchaseOrderAmount(strPOID);
                    UpdateGoodsPurchaseOrderAmount(strPOID, NB_Amount.Amount);


                    if (strSourceType == "PurchasePlan")
                    {
                        UpdatPurchasePlanNumber(strSourceType, intSourceID.ToString());

                        RefreshPurchasePlanNumber();
                    }

                    //更改项目关联物资下单量
                    if (strSourceType == "GoodsPJRecord")
                    {
                        UpdatProjectRelatedItemNumber(strSourceType, intSourceID.ToString());

                        if (DL_RelatedType.SelectedValue.Trim() == "Project")
                        {
                            RefreshProjectRelatedItemNumber(NB_RelatedID.Amount.ToString());
                        }
                    }

                    //从流程中打开的业务单
                    //更改工作流关联的数据文件
                    strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料采购", "物料", strPOID, "0");
                    if (strToDoWLID != null | strAllowFullEdit == "YES")
                    {
                        string strCmdText;

                        strCmdText = "select POID as DetailPOID, * from T_GoodsPurchaseOrder where POID = " + strPOID;
                        if (strToDoWLID == null)
                        {
                            strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料采购", "物料", strPOID);
                        }

                        if (strToDoWLID != null)
                        {
                            if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }

                        if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                        {
                            strCmdText = "select * from T_GoodsPurRecord where POID = " + strPOID;
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

    protected void BT_CreateDetail_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popDetailWindow') ", true);
    }

    protected void BT_NewDetail_Click(object sender, EventArgs e)
    {
        string strPOID;

        strPOID = LB_POID.Text.Trim();

        if (strPOID == "")
        {
            AddMain();
        }
        else
        {
            UpdateMain();
        }

        strPOID = LB_POID.Text.Trim();
        int intWLNumber = GetRelatedWorkFlowNumber("物料采购", "物料", strPOID);
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
        string strRecordID, strPOID, strType, strGoodsCode, strGoodsName, strModelNumber, strSpec;
        string strSupplier, strSupplierPhone, strUnitName;
        decimal decNumber;
        DateTime dtBuyTime;
        decimal dePrice, deTaxRate;
        string strApplicantCode, strPurReason, strClearingForm, strSourceType, strComment;
        int intSourceID;

        strPOID = LB_POID.Text.Trim();
        strType = DL_Type.SelectedValue.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strUnitName = DL_Unit.SelectedValue.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        decNumber = NB_Number.Amount;
        strSpec = TB_Spec.Text.Trim();
        strPurReason = TB_PurReason.Text.Trim();
        dePrice = NB_Price.Amount;
        strApplicantCode = TB_ApplicantCode.Text.Trim();
        dtBuyTime = DateTime.Now;
        strSupplier = TB_Supplier.Text.Trim();
        strSupplierPhone = TB_SupplierPhone.Text.Trim();

        deTaxRate = NB_TaxRate.Amount;
        strClearingForm = TB_ClearingForm.Text.Trim();

        strSourceType = DL_RecordSourceType.SelectedValue.Trim();
        intSourceID = int.Parse(NB_RecordSourceID.Amount.ToString());

        strComment = TB_RecordComment.Text.Trim();

        if (strType == "" | strGoodsName == "" | strApplicantCode == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
        }
        else
        {
            GoodsPurRecordBLL goodsPurRecordBLL = new GoodsPurRecordBLL();
            GoodsPurRecord goodsPurRecord = new GoodsPurRecord();

            goodsPurRecord.POID = int.Parse(strPOID);
            goodsPurRecord.Type = strType;
            goodsPurRecord.GoodsCode = strGoodsCode;
            goodsPurRecord.GoodsName = strGoodsName;

            goodsPurRecord.Price = dePrice;
            goodsPurRecord.ModelNumber = strModelNumber;
            goodsPurRecord.Spec = strSpec;
            goodsPurRecord.Brand = TB_Brand.Text;

            goodsPurRecord.PurReason = strPurReason;
            goodsPurRecord.PurTime = dtBuyTime;

            goodsPurRecord.CheckInNumber = 0;
            goodsPurRecord.SupplyNumber = 0;
            goodsPurRecord.ReturnNumber = 0;

            goodsPurRecord.ClearingForm = strClearingForm;

            goodsPurRecord.Number = decNumber;
            goodsPurRecord.Unit = strUnitName;
            goodsPurRecord.Amount = dePrice * decNumber;

            goodsPurRecord.TaxRate = deTaxRate;
            goodsPurRecord.TaxPrice = dePrice * (1 + deTaxRate);
            goodsPurRecord.TaxAmount = dePrice * (1 + deTaxRate) * decNumber;

            goodsPurRecord.BomVerID = 1;

            goodsPurRecord.SourceType = strSourceType;
            goodsPurRecord.SourceID = intSourceID;

            goodsPurRecord.ApplicantCode = strApplicantCode;
            try
            {
                goodsPurRecord.ApplicantName = ShareClass.GetUserName(strApplicantCode);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWSRDMBZCWCRJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

                return;
            }


            goodsPurRecord.Comment = strComment;


            try
            {
                goodsPurRecordBLL.AddGoodsPurRecord(goodsPurRecord);

                strRecordID = ShareClass.GetMyCreatedMaxGoodsPurRecordID(strPOID);
                LB_ID.Text = strRecordID;


                LoadGoodsPurchaseOrderDetail(strPOID);

                NB_Amount.Amount = SumGoodsPurchaseOrderAmount(strPOID);
                UpdateGoodsPurchaseOrderAmount(strPOID, NB_Amount.Amount);

                //更改采购计划下单量
                if (strSourceType == "PurchasePlan")
                {
                    UpdatPurchasePlanNumber(strSourceType, intSourceID.ToString());

                    RefreshPurchasePlanNumber();
                }

                //更改项目关联物资下单量
                if (strSourceType == "GoodsPJRecord")
                {
                    UpdatProjectRelatedItemNumber(strSourceType, intSourceID.ToString());

                    if (DL_RelatedType.SelectedValue.Trim() == "Project")
                    {
                        RefreshProjectRelatedItemNumber(NB_RelatedID.Amount.ToString());
                    }

                }

                //从流程中打开的业务单
                //更改工作流关联的数据文件
                string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料采购", "物料", strPOID, "0");
                if (strToDoWLID != null | strAllowFullEdit == "YES")
                {
                    string strCmdText;

                    strCmdText = "select POID as DetailPOID, * from T_GoodsPurchaseOrder where POID = " + strPOID;
                    if (strToDoWLID == null)
                    {
                        strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料采购", "物料", strPOID);
                    }

                    if (strToDoWLID != null)
                    {
                        if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                    }

                    if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                    {
                        strCmdText = "select * from T_GoodsPurRecord where POID = " + strPOID;
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
        string strType, strGoodsCode, strGoodsName, strModelNumber, strSpec;
        string strSupplier, strSupplierPhone, strPurReason, strUnitName;
        DateTime dtBuyTime;
        decimal deNumber;
        decimal dePrice, deTaxRate;
        string strApplicantCode, strClearingForm, strComment;
        string strSourceType;
        int intSourceID;

        string strID, strPOID, strPurManCode, strPurManName;
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text;

        strID = LB_ID.Text.Trim();

        strPOID = LB_POID.Text.Trim();
        strType = DL_Type.SelectedValue.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strUnitName = DL_Unit.SelectedValue.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();
        strPurReason = TB_PurReason.Text.Trim();
        dePrice = NB_Price.Amount;
        deNumber = NB_Number.Amount;
        strApplicantCode = TB_ApplicantCode.Text.Trim();
        dtBuyTime = DateTime.Now;
        strSupplier = TB_Supplier.Text.Trim();
        strSupplierPhone = TB_SupplierPhone.Text.Trim();
        strPurManCode = TB_PurManCode.Text.Trim();
        strPurManName = LB_PurManName.Text.Trim();

        deTaxRate = NB_TaxRate.Amount;
        strClearingForm = TB_ClearingForm.Text.Trim();

        strSourceType = DL_RecordSourceType.SelectedValue.Trim();
        intSourceID = int.Parse(NB_RecordSourceID.Amount.ToString());

        strComment = TB_RecordComment.Text.Trim();

        if (strType == "" | strGoodsName == "" | strApplicantCode == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
        }
        else
        {
            GoodsPurRecordBLL goodsPurRecordBLL = new GoodsPurRecordBLL();
            strHQL = "from GoodsPurRecord as goodsPurRecord where goodsPurRecord.ID = " + strID;
            lst = goodsPurRecordBLL.GetAllGoodsPurRecords(strHQL);
            GoodsPurRecord goodsPurRecord = (GoodsPurRecord)lst[0];

            goodsPurRecord.POID = int.Parse(strPOID);
            goodsPurRecord.Type = strType;
            goodsPurRecord.GoodsCode = strGoodsCode;
            goodsPurRecord.GoodsName = strGoodsName;
            goodsPurRecord.Number = deNumber;
            goodsPurRecord.Unit = strUnitName;
            goodsPurRecord.Price = dePrice;
            goodsPurRecord.Amount = dePrice * deNumber;

            goodsPurRecord.TaxRate = deTaxRate;
            goodsPurRecord.TaxPrice = dePrice * (1 + deTaxRate);
            goodsPurRecord.TaxAmount = dePrice * (1 + deTaxRate) * deNumber;

            goodsPurRecord.ModelNumber = strModelNumber;
            goodsPurRecord.Spec = strSpec;
            goodsPurRecord.Brand = TB_Brand.Text;

            goodsPurRecord.PurReason = strPurReason;
            goodsPurRecord.PurTime = dtBuyTime;

            goodsPurRecord.ApplicantCode = strApplicantCode;
            try
            {
                goodsPurRecord.ApplicantName = ShareClass.GetUserName(strApplicantCode);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWSZDMBZCWCRJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

                return;
            }


            goodsPurRecord.ClearingForm = strClearingForm;
            goodsPurRecord.TaxRate = deTaxRate;

            goodsPurRecord.Amount = dePrice * deNumber;

            goodsPurRecord.TaxPrice = dePrice * (1 + deTaxRate);
            goodsPurRecord.TaxAmount = dePrice * (1 + deTaxRate) * deNumber;

            goodsPurRecord.SourceType = strSourceType;
            goodsPurRecord.SourceID = intSourceID;

            goodsPurRecord.Comment = strComment;

            try
            {
                goodsPurRecordBLL.UpdateGoodsPurRecord(goodsPurRecord, int.Parse(strID));

                LoadGoodsPurchaseOrderDetail(strPOID);

                NB_Amount.Amount = SumGoodsPurchaseOrderAmount(strPOID);
                UpdateGoodsPurchaseOrderAmount(strPOID, NB_Amount.Amount);

                if (strSourceType == "PurchasePlan")
                {
                    UpdatPurchasePlanNumber(strSourceType, intSourceID.ToString());

                    RefreshPurchasePlanNumber();
                }

                //更改项目关联物资下单量
                if (strSourceType == "GoodsPJRecord")
                {
                    UpdatProjectRelatedItemNumber(strSourceType, intSourceID.ToString());

                    if (DL_RelatedType.SelectedValue.Trim() == "Project")
                    {
                        RefreshProjectRelatedItemNumber(NB_RelatedID.Amount.ToString());
                    }

                }

                //从流程中打开的业务单
                //更改工作流关联的数据文件
                string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料采购", "物料", strPOID, "0");
                if (strToDoWLID != null | strAllowFullEdit == "YES")
                {
                    string strCmdText;

                    strCmdText = "select POID as DetailPOID, * from T_GoodsPurchaseOrder where POID = " + strPOID;
                    if (strToDoWLID == null)
                    {
                        strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料采购", "物料", strPOID);
                    }

                    if (strToDoWLID != null)
                    {
                        if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }  ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                    }

                    if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                    {
                        strCmdText = "select * from T_GoodsPurRecord where POID = " + strPOID;
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

    protected void BT_AllPurGoods_Click(object sender, EventArgs e)
    {
        //LB_GoodsOwner.Text = Resources.lang.SYLPLB; 
        //LB_GoodsOwner.Visible = true;

        string strUserCode = LB_UserCode.Text.Trim();

        LoadGoodsPurchaseOrder(strUserCode);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

    }

    protected string SubmitApply()
    {
        string strWLName, strWLType, strTemName, strXMLFileName, strXMLFile2;
        string strDescription, strCreatorCode, strCreatorName;
        string strCmdText, strPOID;

        string strWLID, strUserCode;

        strWLID = "0";
        strUserCode = LB_UserCode.Text.Trim();

        strPOID = LB_POID.Text.Trim();

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
        workFlow.RelatedType = "物料";
        workFlow.Status = "新建";
        workFlow.RelatedID = int.Parse(strPOID);
        workFlow.DIYNextStep = "Yes"; workFlow.IsPlanMainWorkflow = "NO";

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

            LoadRelatedWL(strWLType, "物料", int.Parse(strPOID));

            UpdateGoodsPurchaseStatus(strPOID, "处理中");
            DL_POStatus.SelectedValue = "处理中";

            strCmdText = "select * from T_GoodsPurchaseOrder where POID = " + strPOID;
            strXMLFile2 = Server.MapPath(strXMLFile2);
            xmlProcess.DbToXML(strCmdText, "T_GoodsPurchaseOrder", strXMLFile2);

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
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop11", "popShowByURL('TTMyWorkDetailMain.aspx?RelatedType=Other&WLID=" + strWLID + "','workflow','99%','99%',window.location)", true);
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

        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '物料采购'";
        strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC";
        WorkFlowTemplateBLL workFlowTemplateBLL = new WorkFlowTemplateBLL();
        lst = workFlowTemplateBLL.GetAllWorkFlowTemplates(strHQL);

        DL_TemName.DataSource = lst;
        DL_TemName.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

    }

    protected void DL_POStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strPOID, strStatus, strUserCode;

        strPOID = LB_POID.Text.Trim();
        strStatus = DL_POStatus.SelectedValue.Trim();
        strUserCode = LB_UserCode.Text.Trim();

        if (strPOID != "")
        {
            UpdateGoodsPurchaseStatus(strPOID, strStatus);
            LoadGoodsPurchaseOrder(strUserCode);
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
                string strInvoiceCode, strPOID;
                decimal deAmount, deTaxRate;

                strPOID = LB_POID.Text.Trim();
                strInvoiceCode = TB_InvoiceCode.Text.Trim();
                deAmount = NB_InvoiceAmount.Amount;
                deTaxRate = NB_InvoiceTaxRate.Amount;

                ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
                strHQL = "From ConstractRelatedInvoice as constractRelatedInvoice Where constractRelatedInvoice.ID = " + strID;
                lst = constractRelatedInvoiceBLL.GetAllConstractRelatedInvoices(strHQL);
                ConstractRelatedInvoice constractRelatedInvoice = (ConstractRelatedInvoice)lst[0];

                constractRelatedInvoice.ConstractCode = strPOID;
                constractRelatedInvoice.InvoiceCode = TB_InvoiceCode.Text.Trim();
                constractRelatedInvoice.Amount = deAmount;
                constractRelatedInvoice.TaxRate = deTaxRate;

                try
                {
                    constractRelatedInvoiceBLL.DeleteConstractRelatedInvoice(constractRelatedInvoice);
                    LoadConstractRelatedInvoice(strPOID);

                    CountInvoiceAmount(strPOID);
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
        string strInvoiceCode, strPOID, strTaxType;
        decimal deAmount, deTaxRate;
        DateTime dtOpenDate;

        strPOID = LB_POID.Text.Trim();
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
        constractRelatedInvoice.RelatedID = strPOID;

        try
        {
            constractRelatedInvoiceBLL.AddConstractRelatedInvoice(constractRelatedInvoice);

            LoadConstractRelatedInvoice(strPOID);
            CountInvoiceAmount(strPOID);

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

        string strID, strInvoiceCode, strPOID, strTaxType;
        decimal deAmount, deTaxRate;
        DateTime dtOpenDate;

        strID = LB_InvoiceID.Text.Trim();
        strPOID = LB_POID.Text.Trim();
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
        constractRelatedInvoice.RelatedID = strPOID;

        try
        {
            constractRelatedInvoiceBLL.UpdateConstractRelatedInvoice(constractRelatedInvoice, int.Parse(strID));

            LoadConstractRelatedInvoice(strPOID);
            CountInvoiceAmount(strPOID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true') ", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popInvoiceWindow','true','popInvoiceDetailWindow') ", true);
        }
    }

    protected void CountInvoiceAmount(string strPOID)
    {
        string strHQL;
        IList lst;

        decimal deOpenInvoiceAmount = 0, deReceiveInvoiceAmount = 0;
        string strType;

        strHQL = "from ConstractRelatedInvoice as constractRelatedInvoice where constractRelatedInvoice.RelatedType = 'PO' And RelatedID = " + "'" + strPOID + "'";
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

    protected void LoadConstractRelatedInvoice(string strPOID)
    {
        string strHQL;
        IList lst;

        strHQL = "from ConstractRelatedInvoice as constractRelatedInvoice where constractRelatedInvoice.RelatedType = 'PO' And RelatedID = " + "'" + strPOID + "'";
        ConstractRelatedInvoiceBLL constractRelatedInvoiceBLL = new ConstractRelatedInvoiceBLL();
        lst = constractRelatedInvoiceBLL.GetAllConstractRelatedInvoices(strHQL);

        DataGrid12.DataSource = lst;
        DataGrid12.DataBind();
    }


    protected void UpdateGoodsPurchaseStatus(string strPOID, string strStatus)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where goodsPurchaseOrder.POID = " + strPOID;
        GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
        lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);

        GoodsPurchaseOrder goodsPurchaseOrder = (GoodsPurchaseOrder)lst[0];

        goodsPurchaseOrder.Status = strStatus;

        try
        {
            goodsPurchaseOrderBLL.UpdateGoodsPurchaseOrder(goodsPurchaseOrder, int.Parse(strPOID));
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
            strHQL = "Select COALESCE(Sum(Number),0) From T_GoodsPurRecord Where SourceType = 'PurchasePlan' And SourceID=" + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurRecord");

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

    protected void RefreshPurchasePlanNumber()
    {
        string strPlanVerID, strPlanMRPVerID, strDetailID;

        try
        {
            strPlanVerID = DL_PlanVerID.SelectedValue;
            strPlanMRPVerID = DL_PlanMRPVersionID.SelectedItem.Text;

            strDetailID = DL_PlanMRPVersionID.SelectedValue;
            if (strDetailID != "0")
            {
                LoadItemMainPlanRelatedItemPurchasePlan(strPlanVerID, strPlanMRPVerID);
            }
            else
            {
                LoadItemMainPlanRelatedItemPurchasePlan(strPlanVerID, "0");
            }
        }
        catch
        {

        }
    }

    protected void UpdatProjectRelatedItemNumber(string strSourceType, string strSourceID)
    {
        string strHQL;
        decimal deSumNumber;

        if (strSourceType == "GoodsPJRecord")
        {
            strHQL = "Select COALESCE(Sum(Number),0) From T_GoodsPurRecord Where SourceType = 'GoodsPJRecord' And SourceID=" + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurRecord");

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

    protected void RefreshProjectRelatedItemNumber(string strProjectID)
    {
        LoadProjectRelatedItem(strProjectID);
    }

    protected void LoadProjectRelatedItem(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ProjectRelatedItem as projectRelatedItem where projectRelatedItem.ProjectID = " + strProjectID + " Order by projectRelatedItem.ID ASC";
        ProjectRelatedItemBLL projectRelatedItemBLL = new ProjectRelatedItemBLL();
        lst = projectRelatedItemBLL.GetAllProjectRelatedItems(strHQL);

        DataGrid11.DataSource = lst;
        DataGrid11.DataBind();
    }

    protected void LoadPurchaseRequirementPlan()
    {
        string strHQL;

        string strPlanVerID, strPlanMRPVerID;
        string strBusinessType, strBussnessID;

        DataSet ds;

        strPlanVerID = DL_PlanVerID.SelectedValue.Trim();
        strPlanMRPVerID = DL_PlanMRPVersionID.SelectedItem.Text.Trim();

        strBusinessType = DL_BusinessType.SelectedValue.Trim();
        strBussnessID = NB_BusinessID.Amount.ToString();

        if (strBussnessID != "")
        {
            if (strBusinessType == "SaleOrder")
            {
                strHQL = "Select * From T_ItemMainPlanRelatedItemPurchasePlan Where PlanVerID = " + strPlanVerID + " and PlanMRPVerID = " + strPlanMRPVerID;
                strHQL += " and SourceType = 'GoodsSORecord' and SourceRecordID in (Select ID From T_GoodsSaleRecord Where SOID in (Select SOID From T_GoodsSaleOrder Where SOID = " + strBussnessID + "))";
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanRelatedItemPurchasePlan");

                DataGrid8.DataSource = ds;
                DataGrid8.DataBind();
            }

            if (strBusinessType == "Project")
            {
                strHQL = "Select * From T_ItemMainPlanRelatedItemPurchasePlan Where PlanVerID = " + strPlanVerID + " and PlanMRPVerID = " + strPlanMRPVerID;
                strHQL += " and SourceType = 'GoodsPJRecord' and SourceRecordID in (Select ID From T_ProjectRelatedItem Where ProjectID = " + strBussnessID + ")";
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanRelatedItemPurchasePlan");

                DataGrid8.DataSource = ds;
                DataGrid8.DataBind();
            }

            if (strBusinessType == "ApplicationOrder")
            {
                strHQL = "Select * From T_ItemMainPlanRelatedItemPurchasePlan Where PlanVerID = " + strPlanVerID + " and PlanMRPVerID = " + strPlanMRPVerID;
                strHQL += " and SourceType = 'GoodsAORecord' and SourceRecordID in (Select ID From T_GoodsApplicationDetail Where AAID in (Select AID From T_GoodsApplication Where AAID = " + strBussnessID + "))";
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanRelatedItemPurchasePlan");

                DataGrid8.DataSource = ds;
                DataGrid8.DataBind();
            }
        }
        else
        {
            LoadItemMainPlanRelatedItemPurchasePlan(strPlanVerID, strPlanMRPVerID);
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

    protected void LoadGoodsPurchaseOrder(string strOperatorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where (goodsPurchaseOrder.OperatorCode = " + "'" + strOperatorCode + "'";
        strHQL += " or goodsPurchaseOrder.OperatorCode in (select  memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strOperatorCode + "'" + ")) ";
        strHQL += " Order by goodsPurchaseOrder.POID DESC";


        //从流程中打开的业务单
        if (strToDoWLID != null & strWLBusinessID != null)
        {
            strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where goodsPurchaseOrder.POID = " + strWLBusinessID;
        }

        GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
        lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }

    protected void LoadPlanVerID()
    {
        string strHQL;

        strHQL = "Select * From T_ItemMainPlan Where Status = 'UNFinished' Order By PlanVerID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanMRPVersion");

        DL_PlanVerID.DataSource = ds;
        DL_PlanVerID.DataBind();

        DL_PlanVerID.Items.Insert(0, new ListItem("--Select--", "0"));
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

    protected void LoadItemMainPlanRelatedItemPurchasePlan(string strPlanVerID, string strPlanMRPVerID)
    {
        string strHQL;

        strHQL = "Select * From T_ItemMainPlanRelatedItemPurchasePlan Where PlanVerID = " + strPlanVerID + " and PlanMRPVerID = " + strPlanMRPVerID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlanRelatedItemPurchasePlan");

        DataGrid8.DataSource = ds;
        DataGrid8.DataBind();
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

    protected void LoadGoodsPurchaseOrderDetail(string strPOID)
    {
        string strHQL = "Select * from T_GoodsPurRecord where POID = " + strPOID + " Order by ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurRecord");
      
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }


    protected void LoadGoodsSaleOrder(string strUserCode)
    {
        string strHQL;
        IList lst;

        string strDepartString;
        strDepartString = LB_DepartString.Text.Trim();

        strHQL = "from GoodsSaleOrder as goodsSaleOrder where ( goodsSaleOrder.OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " or goodsSaleOrder.OperatorCode in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ") ";
        strHQL += " or goodsSaleOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " or goodsSaleOrder.SalesCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + "))";
        strHQL += " Order by goodsSaleOrder.SOID DESC";
        GoodsSaleOrderBLL goodsSaleOrderBLL = new GoodsSaleOrderBLL();
        lst = goodsSaleOrderBLL.GetAllGoodsSaleOrders(strHQL);

        DataGrid9.DataSource = lst;
        DataGrid9.DataBind();
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

    protected decimal SumGoodsPurchaseOrderAmount(string strPOID)
    {
        string strHQL;
        IList lst;

        decimal deAmount = 0;

        strHQL = "from GoodsPurRecord as goodsPurRecord where goodsPurRecord.POID = " + strPOID;
        GoodsPurRecordBLL goodsPurRecordBLL = new GoodsPurRecordBLL();
        lst = goodsPurRecordBLL.GetAllGoodsPurRecords(strHQL);

        GoodsPurRecord goodsPurRecord = new GoodsPurRecord();

        for (int i = 0; i < lst.Count; i++)
        {
            goodsPurRecord = (GoodsPurRecord)lst[i];
            //deAmount += goodsPurRecord.Number * goodsPurRecord.Price;
            deAmount += goodsPurRecord.TaxAmount;
        }

        return deAmount;
    }

    protected void UpdateGoodsPurchaseOrderAmount(string strPOID, decimal deAmount)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where goodsPurchaseOrder.POID = " + strPOID;
        GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
        lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);

        GoodsPurchaseOrder goodsPurchaseOrder = (GoodsPurchaseOrder)lst[0];

        goodsPurchaseOrder.Amount = deAmount;

        try
        {
            goodsPurchaseOrderBLL.UpdateGoodsPurchaseOrder(goodsPurchaseOrder, int.Parse(strPOID));
        }
        catch
        {
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

    protected int GetGoodsPurchaseOrderCodeCount(string strGoodsPOCode)
    {
        string strHQL;

        if (strGoodsPOCode != "")
        {
            strHQL = "Select * From T_GoodsPurchaseOrder Where GPOName =  " + "'" + strGoodsPOCode + "'";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurchaseOrder");

            return ds.Tables[0].Rows.Count;
        }
        else
        {
            return 0;
        }
    }

    protected void LoadRelatedConstract(string strPOID)
    {
        string strHQL;
        IList lst;

        strHQL = "from Constract as constract where constract.Status <> '归档'";
        strHQL += " and constract.ConstractCode in (select constractRelatedGoodsPurchaseOrder.ConstractCode from ConstractRelatedGoodsPurchaseOrder as constractRelatedGoodsPurchaseOrder where constractRelatedGoodsPurchaseOrder.POID = " + strPOID + ")";
        strHQL += " Order by constract.SignDate DESC";
        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);
        DataGrid13.DataSource = lst;
        DataGrid13.DataBind();
    }


    protected void LoadVendorRelatedGoodsList(string strVendorCode)
    {
        string strHQL;
        IList lst;


        VendorRelatedGoodsInforBLL vendorRelatedGoodsInforBLL = new VendorRelatedGoodsInforBLL();
        strHQL = "from VendorRelatedGoodsInfor as vendorRelatedGoodsInfor where vendorRelatedGoodsInfor.VendorCode = " + "'" + strVendorCode + "'";
        lst = vendorRelatedGoodsInforBLL.GetAllVendorRelatedGoodsInfors(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void LoadUsingConstract(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Constract as constract where  constract.Status not in ('归档','删除') ";
        strHQL += " and (constract.RecorderCode = " + "'" + strUserCode + "'" + " Or constract.ConstractCode in (select constractRelatedUser.ConstractCode from ConstractRelatedUser as constractRelatedUser where constractRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " order by constract.SignDate DESC,constract.ConstractCode DESC";

        ConstractBLL constractBLL = new ConstractBLL();
        lst = constractBLL.GetAllConstracts(strHQL);

        DataGrid14.DataSource = lst;
        DataGrid14.DataBind();
    }
}

