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

public partial class TTGoodsSupplyOrderQualityCheck : System.Web.UI.Page
{
    string strToDoWLID, strToDoWLDetailID, strWLBusinessID;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserName;
        string strUserCode = Session["UserCode"].ToString();

        //从流程中打开的业务单
        strToDoWLID = Request.QueryString["WLID"]; strToDoWLDetailID = Request.QueryString["WLStepDetailID"];
        strWLBusinessID = Request.QueryString["BusinessID"];

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_SupplyTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_PurTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
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

            ShareClass.LoadWFTemplate(strUserCode, "物料质检", DL_TemName);

            ShareClass.LoadCurrencyType(DL_CurrencyType);
            ShareClass.LoadVendorList(DL_VendorList, strUserCode);

            TB_PurManCode.Text = strUserCode;
            LB_PurManName.Text = strUserName;

            TB_ApplicantCode.Text = strUserCode;
            LB_ApplicantName.Text = ShareClass.GetUserName(strUserCode);

            LoadGoodsSupplyOrder(strUserCode);
            LoadGoodsPurchaseOrder(strUserCode);
        }
    }

    protected void DataGrid5_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strSUID, strSUSourceType;
            IList lst;
            int intWLNumber;

            strSUID = e.Item.Cells[3].Text.Trim();

            intWLNumber = intWLNumber = GetRelatedWorkFlowNumber("物料质检", "物料", strSUID);
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
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料质检", "物料", strSUID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                BT_NewMain.Visible = true;
                BT_NewDetail.Visible = true;
            }

            if (e.CommandName == "Update" | e.CommandName == "Assign")
            {
                for (int i = 0; i < DataGrid5.Items.Count; i++)
                {
                    DataGrid5.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "from GoodsSupplyOrder as goodsSupplyOrder where goodsSupplyOrder.SUID = " + strSUID;
                GoodsSupplyOrderBLL goodsSupplyOrderBLL = new GoodsSupplyOrderBLL();
                lst = goodsSupplyOrderBLL.GetAllGoodsSupplyOrders(strHQL);
                GoodsSupplyOrder goodsSupplyOrder = (GoodsSupplyOrder)lst[0];

                LB_SUID.Text = goodsSupplyOrder.SUID.ToString();
                TB_SUName.Text = goodsSupplyOrder.SUName.Trim();
                TB_Supplier.Text = goodsSupplyOrder.Supplier;
                TB_SupplierPhone.Text = goodsSupplyOrder.SupplierPhone;
                DLC_SupplyTime.Text = goodsSupplyOrder.SupplyTime.ToString("yyyy-MM-dd");
                NB_Amount.Amount = goodsSupplyOrder.Amount;
                DL_CurrencyType.SelectedValue = goodsSupplyOrder.CurrencyType;
                TB_Comment.Text = goodsSupplyOrder.Comment.Trim();
                DL_SUStatus.SelectedValue = goodsSupplyOrder.Status.Trim();

                DL_SourceType.SelectedValue = goodsSupplyOrder.SourceType.Trim();
                NB_SourceID.Amount = goodsSupplyOrder.SourceID;

                strSUSourceType = goodsSupplyOrder.SourceType.Trim();

                LoadGoodsSupplyOrderDetail(strSUID);

                if (strSUSourceType == "Other")
                {
                    BT_SelectPO.Visible = false;
                }
                else
                {
                    BT_SelectPO.Visible = true;
                }

                TB_WLName.Text = Resources.lang.GongHuoDan + goodsSupplyOrder.SUName.Trim() + Resources.lang.ShenQing;

                LoadRelatedWL("物料质检", "物料", goodsSupplyOrder.SUID);

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
                strUserCode = LB_UserCode.Text.Trim();

                strHQL = "Delete From T_GoodsSupplyorder Where SUID = " + strSUID;

                try
                {
                    ShareClass.RunSqlCommand(strHQL);

                    LoadGoodsSupplyOrder(strUserCode);
                    LoadGoodsSupplyOrderDetail(strSUID);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCCJC + "')", true);
                }
            }
        }
    }

    protected void DL_SourceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strSourceType;

        strSourceType = DL_SourceType.SelectedValue.Trim();

        if (strSourceType == "其它")
        {
            NB_SourceID.Amount = 0;
        }

        if (strSourceType == "采购单")
        {
            BT_SelectPO.Visible = true;
        }
        else
        {
            BT_SelectPO.Visible = false;
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_CreateMain_Click(object sender, EventArgs e)
    {
        LB_SUID.Text = "";

        BT_NewMain.Visible = true;
        BT_NewDetail.Visible = true;

        string strNewSUCode = ShareClass.GetCodeByRule("SupplyOrderCode", "SupplyOrderCode", "00");
        if (strNewSUCode != "")
        {
            TB_SUName.Text = strNewSUCode;
        }

        LoadGoodsSupplyOrderDetail("0");

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_NewMain_Click(object sender, EventArgs e)
    {
        string strSUID;

        strSUID = LB_SUID.Text.Trim();

        if (strSUID == "")
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
        string strSUID, strSUName, strOperatorCode, strOperatorName, strCurrencyType, strComment;
        DateTime dtSupplyTime;
        decimal deAmount;
        string strStatus;

        strSUName = TB_SUName.Text.Trim();

        strOperatorCode = LB_UserCode.Text.Trim();
        strOperatorName = LB_UserName.Text.Trim();
        strComment = TB_Comment.Text.Trim();

        dtSupplyTime = DateTime.Parse(DLC_SupplyTime.Text);
        deAmount = NB_Amount.Amount;
        strCurrencyType = DL_CurrencyType.SelectedValue.Trim();
        strStatus = DL_SUStatus.SelectedValue.Trim();
        strComment = TB_Comment.Text.Trim();

        GoodsSupplyOrderBLL goodsSupplyOrderBLL = new GoodsSupplyOrderBLL();
        GoodsSupplyOrder goodsSupplyOrder = new GoodsSupplyOrder();

        goodsSupplyOrder.SUName = strSUName;
        goodsSupplyOrder.OperatorCode = strOperatorCode;
        goodsSupplyOrder.OperatorName = strOperatorName;
        goodsSupplyOrder.SupplyTime = dtSupplyTime;
        goodsSupplyOrder.Amount = 0;
        goodsSupplyOrder.CurrencyType = strCurrencyType;
        goodsSupplyOrder.Comment = strComment;
        goodsSupplyOrder.Status = "新建";

        goodsSupplyOrder.SourceType = DL_SourceType.SelectedValue.Trim();
        goodsSupplyOrder.SourceID = int.Parse(NB_SourceID.Amount.ToString());

        goodsSupplyOrder.Supplier = TB_Supplier.Text.Trim();
        goodsSupplyOrder.SupplierPhone = TB_SupplierPhone.Text.Trim();

        try
        {
            goodsSupplyOrderBLL.AddGoodsSupplyOrder(goodsSupplyOrder);

            strSUID = ShareClass.GetMyCreatedMaxGoodsSupplyOrderID(strOperatorCode);
            LB_SUID.Text = strSUID;

            string strNewSUCode = ShareClass.GetCodeByRule("SupplyOrderCode", "SupplyOrderCode", strSUID);
            if (strNewSUCode != "")
            {
                TB_SUName.Text = strNewSUCode;
                string strHQL = "Update T_GoodsSupplyOrder Set SUName = " + "'" + strNewSUCode + "'" + " Where SUID = " + strSUID;
                ShareClass.RunSqlCommand(strHQL);
            }

            NB_Amount.Amount = 0;

            TB_WLName.Text = Resources.lang.GongHuoDan + strSUName + Resources.lang.ShenQing;

            BT_SubmitApply.Enabled = true;

            LoadGoodsSupplyOrder(strOperatorCode);
            LoadGoodsSupplyOrderDetail(strSUID);
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

        string strSUID, strUserCode, strSUName, strPurManCode, strPurManName, strCurrrencyType, strComment;
        DateTime dtPurTime, dtSupplyTime;
        decimal deAmount;
        string strStatus;

        strUserCode = LB_UserCode.Text.Trim();

        strSUID = LB_SUID.Text.Trim();
        strSUName = TB_SUName.Text.Trim();
        strPurManCode = TB_PurManCode.Text.Trim();
        strPurManName = LB_PurManName.Text.Trim();
        dtPurTime = DateTime.Parse(DLC_PurTime.Text);
        dtSupplyTime = DateTime.Parse(DLC_SupplyTime.Text);
        deAmount = NB_Amount.Amount;
        strCurrrencyType = DL_CurrencyType.SelectedValue.Trim();
        strComment = TB_Comment.Text.Trim();
        strStatus = DL_SUStatus.SelectedValue.Trim();

        strHQL = "from GoodsSupplyOrder as goodsSupplyOrder where goodsSupplyOrder.SUID = " + strSUID;
        GoodsSupplyOrderBLL goodsSupplyOrderBLL = new GoodsSupplyOrderBLL();
        lst = goodsSupplyOrderBLL.GetAllGoodsSupplyOrders(strHQL);

        GoodsSupplyOrder goodsSupplyOrder = (GoodsSupplyOrder)lst[0];

        goodsSupplyOrder.SUName = strSUName;
        goodsSupplyOrder.SupplyTime = dtSupplyTime;
        goodsSupplyOrder.Amount = deAmount;
        goodsSupplyOrder.CurrencyType = strCurrrencyType;
        goodsSupplyOrder.Comment = strComment;
        goodsSupplyOrder.Status = strStatus;
        goodsSupplyOrder.SourceType = DL_SourceType.SelectedValue.Trim();
        goodsSupplyOrder.SourceID = int.Parse(NB_SourceID.Amount.ToString());
        goodsSupplyOrder.Supplier = TB_Supplier.Text.Trim();
        goodsSupplyOrder.SupplierPhone = TB_SupplierPhone.Text.Trim();

        try
        {
            goodsSupplyOrderBLL.UpdateGoodsSupplyOrder(goodsSupplyOrder, int.Parse(strSUID));
            LoadGoodsSupplyOrder(strUserCode);

            //从流程中打开的业务单
            //更改工作流关联的数据文件
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料质检", "物料", strSUID, "0");
            if (strToDoWLID != null | strAllowFullEdit == "YES")
            {
                string strCmdText = "select SUID as DetailSUID, * from T_GoodsSupplyOrder where SUID = " + strSUID;
                if (strToDoWLID == null)
                {
                    strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料质检", "物料", strSUID);
                }

                if (strToDoWLID != null)
                {
                    if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }
                    ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                }
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);

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
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql5.Text;

        GoodsSupplyOrderBLL puchaseOrderBLL = new GoodsSupplyOrderBLL();
        IList lst = puchaseOrderBLL.GetAllGoodsSupplyOrders(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void DL_VendorList_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strVendorCode, strVendorPhone;

        strVendorCode = DL_VendorList.SelectedValue.Trim();
        strHQL = "Select COALESCE(Tel1,'') From T_Vendor Where VendorCode = " + "'" + strVendorCode + "'";

        try
        {
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Vendor");
            if (ds.Tables[0].Rows.Count == 0)
            {
                strHQL = "Select COALESCE(PhoneNum,'') From T_BMSupplierInfo Where Code = " + "'" + strVendorCode + "'";
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_BMSupplierInfo");
            }


            strVendorPhone = ds.Tables[0].Rows[0][0].ToString();

            TB_SupplierPhone.Text = strVendorPhone;
            TB_Supplier.Text = DL_VendorList.SelectedItem.Text;
        }
        catch
        {
            TB_SupplierPhone.Text = "";
            TB_Supplier.Text = "";
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid8_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strPOID;

            strPOID = ((Button)e.Item.FindControl("BT_POID")).Text.Trim();

            for (int i = 0; i < DataGrid8.Items.Count; i++)
            {
                DataGrid8.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            NB_SourceID.Amount = int.Parse(strPOID);

            LB_POID.Text = strPOID;

            string strHQL = "From GoodsPurchaseOrder as goodsPurchaseOrder Where goodsPurchaseOrder.POID = " + strPOID;
            GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
            IList lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);
            GoodsPurchaseOrder goodsPurchaseOrder = (GoodsPurchaseOrder)lst[0];

            TB_Supplier.Text = goodsPurchaseOrder.Supplier.Trim();
            TB_SupplierPhone.Text = goodsPurchaseOrder.SupplierPhone.Trim();

            LoadGoodsPurchaseOrderRecord(strPOID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strID, strPOID;
            IList lst;

            strID = e.Item.Cells[0].Text.Trim();

            strPOID = LB_POID.Text.Trim();

            for (int i = 0; i < DataGrid3.Items.Count; i++)
            {
                DataGrid3.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "from GoodsPurRecord as goodsPurRecord where goodsPurRecord.ID = " + strID;

            GoodsPurRecordBLL goodsPurRecordBLL = new GoodsPurRecordBLL();
            lst = goodsPurRecordBLL.GetAllGoodsPurRecords(strHQL);
            GoodsPurRecord goodsPurRecord = (GoodsPurRecord)lst[0];


            DL_RecordSourceType.SelectedValue = "GoodsPORecord";
            NB_RecordSourceID.Amount = int.Parse(strID);

            TB_GoodsCode.Text = goodsPurRecord.GoodsCode;
            TB_GoodsName.Text = goodsPurRecord.GoodsName;
            TB_ModelNumber.Text = goodsPurRecord.ModelNumber;
            TB_Spec.Text = goodsPurRecord.Spec;
            TB_Brand.Text = goodsPurRecord.Brand;

            NB_Number.Amount = goodsPurRecord.Number - goodsPurRecord.SupplyNumber;
            NB_Price.Amount = goodsPurRecord.Price;

            try
            {
                DL_Type.SelectedValue = goodsPurRecord.Type;
            }
            catch
            {
            }
            DL_Unit.SelectedValue = goodsPurRecord.Unit;

            TB_ApplicantCode.Text = goodsPurRecord.ApplicantCode;
            LB_ApplicantName.Text = goodsPurRecord.ApplicantName;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
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
                TB_Spec.Text = item.Specification;
                TB_ModelNumber.Text = item.ModelNumber;
                TB_Brand.Text = item.Brand;

                NB_Price.Amount = item.PurchasePrice;
                DL_Unit.SelectedValue = item.Unit;
                try
                {
                    DL_Type.SelectedValue = item.SmallType;
                }
                catch
                {
                    DL_Type.SelectedValue = "";
                }
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
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
                TB_Spec.Text = goods.Spec;
                TB_Brand.Text = goods.Manufacturer;

                DL_Unit.SelectedValue = goods.UnitName;
                try
                {
                    DL_Type.SelectedValue = goods.Type;
                }
                catch
                {
                }
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strSUID;
            IList lst;

            strSUID = LB_SUID.Text.Trim();

            int intWLNumber = GetRelatedWorkFlowNumber("物料质检", "物料", strSUID);
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
            string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料质检", "物料", strSUID, "0");
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

                strHQL = "from GoodsSupplyOrderDetail as goodsSupplyOrderDetail where goodsSupplyOrderDetail.ID = " + strID;

                GoodsSupplyOrderDetailBLL goodsSupplyOrderDetailBLL = new GoodsSupplyOrderDetailBLL();
                lst = goodsSupplyOrderDetailBLL.GetAllGoodsSupplyOrderDetails(strHQL);
                GoodsSupplyOrderDetail goodsSupplyOrderDetail = (GoodsSupplyOrderDetail)lst[0];

                TB_GoodsCode.Text = goodsSupplyOrderDetail.GoodsCode;
                TB_GoodsName.Text = goodsSupplyOrderDetail.GoodsName;
                TB_ModelNumber.Text = goodsSupplyOrderDetail.ModelNumber;
                TB_Spec.Text = goodsSupplyOrderDetail.Spec;
                TB_Brand.Text = goodsSupplyOrderDetail.Brand;

                TB_QCResult.Text = goodsSupplyOrderDetail.QCResult;
                NB_Price.Amount = goodsSupplyOrderDetail.Price;
                TB_ApplicantCode.Text = goodsSupplyOrderDetail.ApplicantCode;

                LB_ApplicantName.Text = ShareClass.GetUserName(goodsSupplyOrderDetail.ApplicantCode);
                DL_Type.SelectedValue = goodsSupplyOrderDetail.Type;
                DL_Unit.SelectedValue = goodsSupplyOrderDetail.Unit;
                NB_Number.Amount = goodsSupplyOrderDetail.Number;
                NB_Price.Amount = goodsSupplyOrderDetail.Price;
                TB_DefectiveNumber.Amount = goodsSupplyOrderDetail.DefectiveNumber;

                DL_RecordSourceType.SelectedValue = "GoodsPORecord";
                DL_RecordSourceType.SelectedValue = goodsSupplyOrderDetail.SourceType.Trim();
                NB_RecordSourceID.Amount = goodsSupplyOrderDetail.SourceID;

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }

            if (e.CommandName == "Delete")
            {
                strSUID = LB_SUID.Text.Trim();
                intWLNumber = GetRelatedWorkFlowNumber("物料质检", "物料", strSUID);
                if (intWLNumber > 0 & strToDoWLID == null)
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
                    return;
                }

                string strSourceType = DL_RecordSourceType.SelectedValue.Trim();
                int intSourceID = int.Parse(NB_RecordSourceID.Amount.ToString());

                GoodsSupplyOrderDetailBLL goodsSupplyOrderDetailBLL = new GoodsSupplyOrderDetailBLL();
                strHQL = "from GoodsSupplyOrderDetail as goodsSupplyOrderDetail where goodsSupplyOrderDetail.ID = " + strID;
                lst = goodsSupplyOrderDetailBLL.GetAllGoodsSupplyOrderDetails(strHQL);
                GoodsSupplyOrderDetail goodsSupplyOrderDetail = (GoodsSupplyOrderDetail)lst[0];

                try
                {
                    goodsSupplyOrderDetailBLL.DeleteGoodsSupplyOrderDetail(goodsSupplyOrderDetail);

                    LoadGoodsSupplyOrderDetail(strSUID);

                    NB_Amount.Amount = SumGoodsSupplyOrderAmount(strSUID);
                    UpdateGoodsSupplyOrderAmount(strSUID, NB_Amount.Amount);

                    //更改送货单相应送货数量
                    if (strSourceType == "GoodsPORecord")
                    {
                        UpdateGoodsPurchaseOrderAlreadySupplyNumber(strSourceType, intSourceID.ToString());
                    }

                    //从流程中打开的业务单
                    //更改工作流关联的数据文件
                    strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料质检", "物料", strSUID, "0");
                    if (strToDoWLID != null | strAllowFullEdit == "YES")
                    {
                        string strCmdText;

                        strCmdText = "select SUID as DetailSUID, * from T_GoodsSupplyOrder where SUID = " + strSUID;
                        if (strToDoWLID == null)
                        {
                            strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料质检", "物料", strSUID);
                        }

                        if (strToDoWLID != null)
                        {
                            if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }
                            ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                        }

                        if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                        {
                            strCmdText = "select * from T_GoodsSupplyOrderDetail where SUID = " + strSUID;
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
        string strSUID;

        strSUID = LB_SUID.Text.Trim();

        if (strSUID == "")
        {
            AddMain();
        }
        else
        {
            UpdateMain();
        }

        strSUID = LB_SUID.Text.Trim();
        int intWLNumber = GetRelatedWorkFlowNumber("物料质检", "物料", strSUID);
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
        string strRecordID, strSUID, strType, strPurManCode, strPurManName, strGoodsCode, strGoodsName, strModelNumber, strSpec, strSourceType;
        string strSupplier, strSupplierPhone, strUnitName;
        decimal decNumber;
        DateTime dtBuyTime;
        decimal dePrice;
        string strApplicantCode, strPurReason;
        int intSourceID;


        strSUID = LB_SUID.Text.Trim();
        strType = DL_Type.SelectedValue.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strUnitName = DL_Unit.SelectedValue.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        decNumber = NB_Number.Amount;
        strSpec = TB_Spec.Text.Trim();
        strPurReason = "";
        dePrice = NB_Price.Amount;

        strApplicantCode = TB_ApplicantCode.Text.Trim();

        dtBuyTime = DateTime.Now;
        strSupplier = TB_Supplier.Text.Trim();
        strSupplierPhone = TB_SupplierPhone.Text.Trim();

        strSourceType = DL_RecordSourceType.SelectedValue.Trim();
        intSourceID = int.Parse(NB_RecordSourceID.Amount.ToString());

        strPurManCode = TB_PurManCode.Text.Trim();
        strPurManName = LB_PurManName.Text.Trim();

        if (strType == "" | strGoodsName == "" | strApplicantCode == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
        }
        else
        {
            GoodsSupplyOrderDetailBLL goodsSupplyOrderDetailBLL = new GoodsSupplyOrderDetailBLL();
            GoodsSupplyOrderDetail goodsSupplyOrderDetail = new GoodsSupplyOrderDetail();

            goodsSupplyOrderDetail.SUID = int.Parse(strSUID);
            goodsSupplyOrderDetail.Type = strType;
            goodsSupplyOrderDetail.GoodsCode = strGoodsCode;
            goodsSupplyOrderDetail.GoodsName = strGoodsName;
            goodsSupplyOrderDetail.Number = decNumber;
            goodsSupplyOrderDetail.Unit = strUnitName;
            goodsSupplyOrderDetail.Number = decNumber;
            goodsSupplyOrderDetail.Price = dePrice;
            goodsSupplyOrderDetail.ModelNumber = strModelNumber;
            goodsSupplyOrderDetail.Spec = strSpec;
            goodsSupplyOrderDetail.Brand = TB_Brand.Text;

            goodsSupplyOrderDetail.PurReason = strPurReason;
            goodsSupplyOrderDetail.PurTime = dtBuyTime;
            goodsSupplyOrderDetail.PurManCode = strPurManCode;

            goodsSupplyOrderDetail.SourceType = strSourceType;
            goodsSupplyOrderDetail.SourceID = intSourceID;

            try
            {
                goodsSupplyOrderDetail.PurManName = ShareClass.GetUserName(strPurManCode);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWCGRDMBZCWCRJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

                return;
            }

            goodsSupplyOrderDetail.ApplicantCode = strApplicantCode;
            try
            {
                goodsSupplyOrderDetail.ApplicantName = ShareClass.GetUserName(strApplicantCode);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWSRDMBZCWCRJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

                return;
            }

            goodsSupplyOrderDetail.QCResult = TB_QCResult.Text.Trim();
            goodsSupplyOrderDetail.DefectiveNumber = TB_DefectiveNumber.Amount;

            try
            {
                goodsSupplyOrderDetailBLL.AddGoodsSupplyOrderDetail(goodsSupplyOrderDetail);

                strRecordID = ShareClass.GetMyCreatedMaxGoodsSupplyOrderDetailID(strSUID);
                LB_ID.Text = strRecordID;

                LoadGoodsSupplyOrderDetail(strSUID);

                NB_Amount.Amount = SumGoodsSupplyOrderAmount(strSUID);
                UpdateGoodsSupplyOrderAmount(strSUID, NB_Amount.Amount);

                //更改送货单相应送货数量
                if (strSourceType == "GoodsPORecord")
                {
                    UpdateGoodsPurchaseOrderAlreadySupplyNumber(strSourceType, intSourceID.ToString());
                }

                //从流程中打开的业务单
                //更改工作流关联的数据文件
                string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料质检", "物料", strSUID, "0");
                if (strToDoWLID != null | strAllowFullEdit == "YES")
                {
                    string strCmdText;

                    strCmdText = "select SUID as DetailSUID, * from T_GoodsSupplyOrder where SUID = " + strSUID;
                    if (strToDoWLID == null)
                    {
                        strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料质检", "物料", strSUID);
                    }

                    if (strToDoWLID != null)
                    {
                        if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }
                        ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                    }

                    if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                    {
                        strCmdText = "select * from T_GoodsSupplyOrderDetail where SUID = " + strSUID;
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

    protected void UpdateGoodsPurchaseOrderAlreadySupplyNumber(string strSourceRecordType, string strSourceRecordID)
    {
        string strHQL;

        decimal deSupplyNumber;

        strHQL = "Select COALESCE(Sum(Number),0) From T_goodsSupplyOrderDetail Where SourceType = " + "'" + strSourceRecordType + "'" + " and SourceID = " + strSourceRecordID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_goodsSupplyOrderDetail");
        if (ds.Tables[0].Rows.Count > 0)
        {
            deSupplyNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        }
        else
        {
            deSupplyNumber = 0;
        }

        strHQL = "Update T_GoodsPurRecord Set SupplyNumber = " + deSupplyNumber.ToString() + " Where ID = " + strSourceRecordID;
        ShareClass.RunSqlCommand(strHQL);

    }

    protected void UpdateDetail()
    {
        string strType, strGoodsCode, strGoodsName, strModelNumber, strSpec, strSourceType;
        string strSupplier, strSupplierPhone, strPurReason, strUnitName;
        DateTime dtBuyTime;
        decimal dePrice, deNumber;
        string strApplicantCode;
        int intSourceID;

        string strID, strSUID, strPurManCode, strPurManName;
        string strHQL;
        IList lst;

        string strUserCode = LB_UserCode.Text;

        strID = LB_ID.Text.Trim();

        strSUID = LB_SUID.Text.Trim();
        strType = DL_Type.SelectedValue.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strUnitName = DL_Unit.SelectedValue.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();
        strPurReason = "";
        dePrice = NB_Price.Amount;
        deNumber = NB_Number.Amount;
        strApplicantCode = TB_ApplicantCode.Text.Trim();
        dtBuyTime = DateTime.Now;
        strSupplier = TB_Supplier.Text.Trim();
        strSupplierPhone = TB_SupplierPhone.Text.Trim();
        strPurManCode = TB_PurManCode.Text.Trim();
        strPurManName = LB_PurManName.Text.Trim();

        strSourceType = DL_RecordSourceType.SelectedValue.Trim();
        intSourceID = int.Parse(NB_RecordSourceID.Amount.ToString());


        if (strType == "" | strGoodsName == "" | strSpec == "" | strApplicantCode == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
        }
        else
        {
            GoodsSupplyOrderDetailBLL goodsSupplyOrderDetailBLL = new GoodsSupplyOrderDetailBLL();
            strHQL = "from GoodsSupplyOrderDetail as goodsSupplyOrderDetail where goodsSupplyOrderDetail.ID = " + strID;
            lst = goodsSupplyOrderDetailBLL.GetAllGoodsSupplyOrderDetails(strHQL);
            GoodsSupplyOrderDetail goodsSupplyOrderDetail = (GoodsSupplyOrderDetail)lst[0];

            goodsSupplyOrderDetail.SUID = int.Parse(strSUID);
            goodsSupplyOrderDetail.Type = strType;
            goodsSupplyOrderDetail.GoodsCode = strGoodsCode;
            goodsSupplyOrderDetail.GoodsName = strGoodsName;
            goodsSupplyOrderDetail.Number = deNumber;
            goodsSupplyOrderDetail.Unit = strUnitName;
            goodsSupplyOrderDetail.Price = dePrice;
            goodsSupplyOrderDetail.ModelNumber = strModelNumber;
            goodsSupplyOrderDetail.Spec = strSpec;
            goodsSupplyOrderDetail.Brand = TB_Brand.Text;

            goodsSupplyOrderDetail.PurReason = strPurReason;
            goodsSupplyOrderDetail.PurTime = dtBuyTime;

            goodsSupplyOrderDetail.SourceType = strSourceType;
            goodsSupplyOrderDetail.SourceID = intSourceID;

            goodsSupplyOrderDetail.ApplicantCode = strApplicantCode;
            try
            {
                goodsSupplyOrderDetail.ApplicantName = ShareClass.GetUserName(strApplicantCode);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWSZDMBZCWCRJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

                return;
            }


            goodsSupplyOrderDetail.PurManCode = strPurManCode;
            try
            {
                goodsSupplyOrderDetail.PurManName = ShareClass.GetUserName(strPurManCode);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWCGRDMBZCWCRJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

                return;
            }

            goodsSupplyOrderDetail.QCResult = TB_QCResult.Text.Trim();
            goodsSupplyOrderDetail.DefectiveNumber = TB_DefectiveNumber.Amount;

            try
            {
                goodsSupplyOrderDetailBLL.UpdateGoodsSupplyOrderDetail(goodsSupplyOrderDetail, int.Parse(strID));

                LoadGoodsSupplyOrderDetail(strSUID);

                NB_Amount.Amount = SumGoodsSupplyOrderAmount(strSUID);
                UpdateGoodsSupplyOrderAmount(strSUID, NB_Amount.Amount);

                //更改送货单相应送货数量
                if (strSourceType == "GoodsPORecord")
                {
                    UpdateGoodsPurchaseOrderAlreadySupplyNumber(strSourceType, intSourceID.ToString());
                }

                //从流程中打开的业务单
                //更改工作流关联的数据文件
                string strAllowFullEdit = ShareClass.GetWorkflowTemplateStepFullAllowEditValue("物料质检", "物料", strSUID, "0");
                if (strToDoWLID != null | strAllowFullEdit == "YES")
                {
                    string strCmdText;

                    strCmdText = "select SUID as DetailSUID, * from T_GoodsSupplyOrder where SUID = " + strSUID;
                    if (strToDoWLID == null)
                    {
                        strToDoWLID = ShareClass.GetBusinessRelatedWorkFlowID("物料质检", "物料", strSUID);
                    }

                    if (strToDoWLID != null)
                    {
                        if (strToDoWLDetailID == null) { strToDoWLDetailID = "0"; }
                        ShareClass.UpdateWokflowRelatedXMLFile("MainTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                    }

                    if (strToDoWLDetailID != null & strToDoWLDetailID != "0")
                    {
                        strCmdText = "select * from T_GoodsSupplyOrderDetail where SUID = " + strSUID;
                        ShareClass.UpdateWokflowRelatedXMLFile("DetailTable", strToDoWLID, strToDoWLDetailID, strCmdText);
                    }
                }

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }
        }
    }

    protected void BT_AllPurGoods_Click(object sender, EventArgs e)
    {
        string strUserCode = LB_UserCode.Text.Trim();

        LoadGoodsSupplyOrder(strUserCode);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected string SubmitApply()
    {
        string strWLName, strWLType, strTemName, strXMLFileName, strXMLFile2;
        string strDescription, strCreatorCode, strCreatorName;
        string strCmdText, strSUID;

        string strWLID, strUserCode;

        strWLID = "0";
        strUserCode = LB_UserCode.Text.Trim();

        strSUID = LB_SUID.Text.Trim();

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
        workFlow.RelatedID = int.Parse(strSUID);
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

            LoadRelatedWL(strWLType, "物料", int.Parse(strSUID));

            UpdateGoodsSupplyStatus(strSUID, "处理中");
            DL_SUStatus.SelectedValue = "处理中";

            strCmdText = "select SUID as DetailSUID, * from T_GoodsSupplyOrder where SUID = " + strSUID;
            strXMLFile2 = Server.MapPath(strXMLFile2);
            xmlProcess.DbToXML(strCmdText, "T_GoodsSupplyOrder", strXMLFile2);

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

        strHQL = "from WorkFlowTemplate as workFlowTemplate where workFlowTemplate.Type = '物料采购'";
        strHQL += " and workFlowTemplate.Visible = 'YES' Order By workFlowTemplate.SortNumber ASC";
        WorkFlowTemplateBLL workFlowTemplateBLL = new WorkFlowTemplateBLL();
        lst = workFlowTemplateBLL.GetAllWorkFlowTemplates(strHQL);

        DL_TemName.DataSource = lst;
        DL_TemName.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popAssignWindow','true') ", true);

    }

    protected void DL_SUStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strSUID, strStatus, strUserCode;

        strSUID = LB_SUID.Text.Trim();
        strStatus = DL_SUStatus.SelectedValue.Trim();
        strUserCode = LB_UserCode.Text.Trim();

        if (strSUID != "")
        {
            UpdateGoodsSupplyStatus(strSUID, strStatus);
            LoadGoodsSupplyOrder(strUserCode);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

    }

    protected void UpdateGoodsSupplyStatus(string strSUID, string strStatus)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsSupplyOrder as goodsSupplyOrder where goodsSupplyOrder.SUID = " + strSUID;
        GoodsSupplyOrderBLL goodsSupplyOrderBLL = new GoodsSupplyOrderBLL();
        lst = goodsSupplyOrderBLL.GetAllGoodsSupplyOrders(strHQL);

        GoodsSupplyOrder goodsSupplyOrder = (GoodsSupplyOrder)lst[0];

        goodsSupplyOrder.Status = strStatus;

        try
        {
            goodsSupplyOrderBLL.UpdateGoodsSupplyOrder(goodsSupplyOrder, int.Parse(strSUID));
        }
        catch
        {
        }
    }

    protected void LoadRelatedWL(string strWLType, string strSourceType, int intSourceID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType=" + "'" + strSourceType + "'" + " and workFlow.RelatedID = " + intSourceID.ToString() + " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void LoadGoodsSupplyOrder(string strOperatorCode)
    {
        string strHQL;
        IList lst;

        string strDepartString = LB_DepartString.Text;

        strHQL = "from GoodsSupplyOrder as goodsSupplyOrder where (goodsSupplyOrder.OperatorCode in " + strDepartString  + ")";
        strHQL += " or (goodsSupplyOrder.OperatorCode = '" + strOperatorCode + "')";
        strHQL += " Order by goodsSupplyOrder.SUID DESC";
        //从流程中打开的业务单
        if (strToDoWLID != null & strWLBusinessID != null)
        {
            strHQL = "from GoodsSupplyOrder as goodsSupplyOrder where goodsSupplyOrder.SUID = " + strWLBusinessID;
        }
        GoodsSupplyOrderBLL goodsSupplyOrderBLL = new GoodsSupplyOrderBLL();
        lst = goodsSupplyOrderBLL.GetAllGoodsSupplyOrders(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }

    protected void LoadGoodsPurchaseOrder(string strOperatorCode)
    {
        string strHQL;

        strHQL = "Select * from T_GoodsPurchaseOrder where OperatorCode in ( Select UserCode From T_ProjectMember Where DepartCode in " + LB_DepartString.Text.Trim() + ")";
        strHQL += " Or POID in (Select RelatedID From T_Collaboration Where CoID In (Select CoID From T_CollaborationMember Where UserCode = '" + strOperatorCode + "'))";
        strHQL += " Order by POID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurchaseOrder");

        DataGrid8.DataSource = ds;
        DataGrid8.DataBind();
    }


    protected void LoadGoodsPurchaseOrderRecord(string strPOID)
    {
        string strHQL;

        if (strPOID == "")
        {
            strPOID = "0";
        }

        strHQL = "Select * from T_GoodsPurRecord where POID = " + strPOID;
        strHQL += " Order by ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurRecord");

        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();

        LB_POID.Text = strPOID;
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

    protected void LoadGoodsSupplyOrderDetail(string strSUID)
    {
        string strHQL = "Select * from T_GoodsSupplyOrderDetail where SUID = " + strSUID + " Order by ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSupplyOrderDetail");

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

    protected decimal SumGoodsSupplyOrderAmount(string strSUID)
    {
        string strHQL;
        IList lst;

        decimal deAmount = 0;

        strHQL = "from GoodsSupplyOrderDetail as goodsSupplyOrderDetail where goodsSupplyOrderDetail.SUID = " + strSUID;
        GoodsSupplyOrderDetailBLL goodsSupplyOrderDetailBLL = new GoodsSupplyOrderDetailBLL();
        lst = goodsSupplyOrderDetailBLL.GetAllGoodsSupplyOrderDetails(strHQL);

        GoodsSupplyOrderDetail goodsSupplyOrderDetail = new GoodsSupplyOrderDetail();

        for (int i = 0; i < lst.Count; i++)
        {
            goodsSupplyOrderDetail = (GoodsSupplyOrderDetail)lst[i];
            deAmount += goodsSupplyOrderDetail.Number * goodsSupplyOrderDetail.Price;
        }

        return deAmount;
    }

    protected void UpdateGoodsSupplyOrderAmount(string strSUID, decimal deAmount)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsSupplyOrder as goodsSupplyOrder where goodsSupplyOrder.SUID = " + strSUID;
        GoodsSupplyOrderBLL goodsSupplyOrderBLL = new GoodsSupplyOrderBLL();
        lst = goodsSupplyOrderBLL.GetAllGoodsSupplyOrders(strHQL);

        GoodsSupplyOrder goodsSupplyOrder = (GoodsSupplyOrder)lst[0];
        goodsSupplyOrder.Amount = deAmount;

        try
        {
            goodsSupplyOrderBLL.UpdateGoodsSupplyOrder(goodsSupplyOrder, int.Parse(strSUID));
        }
        catch
        {
        }
    }

    protected int GetRelatedWorkFlowNumber(string strWLType, string strSourceType, string strSourceID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType = " + "'" + strSourceType + "'" + " and workFlow.RelatedID = " + strSourceID;
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        return lst.Count;
    }


}
