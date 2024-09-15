using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

using TakeTopCore;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTMakeGoodsConfirm : System.Web.UI.Page
{
    bool boolUploadPhoto;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = Session["UserCode"].ToString();
        string strUserName;

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "入库单确认", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterOnSubmitStatement(this.Page, this.Page.GetType(), "SavePanelScroll", "SaveScroll();");
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);

        if (Page.IsPostBack != true)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "SetPanelScroll", "RestoreScroll();", true);

            LB_DepartString.Text = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

            ShareClass.InitialWarehouseTreeByAuthorityAsset(TreeView3, strUserCode, LB_DepartString.Text.Trim());


            DLC_BuyTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_CheckInTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_ProductionDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_ExpiryDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            strHQL = "Select * From T_GoodsCheckInType Order By SortNumber ASC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsCheckInType");
            DL_CheckInType.DataSource = ds;
            DL_CheckInType.DataBind();
            DL_CheckInType.Items.Insert(0, new ListItem("--Select--", ""));

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

            ShareClass.LoadCurrencyType(DL_CurrencyType);
            ShareClass.LoadVendorList(DL_VendorList, strUserCode);

            LoadWareHouseListByAuthority(strUserCode);

            LoadGoodsCheckInOrder(strUserCode);

            LoadGoodsSupplyOrderForPurchase(strUserCode);
            LoadGoodsProductionOrder(strUserCode);

            LoadGoodsReturnOrder("PRODUCTION", DataGrid14);
            LoadGoodsReturnOrder("SALE", DataGrid15);
            LoadGoodsReturnOrder("BORROW", DataGrid16);

            LoadGoodsPurchaseOrder(strUserCode);
            LoadGoodsSaleOrder(strUserCode);
            LoadItemMainPlan(strUserCode);

            LoadUsingConstract(strUserCode);

            ShareClass.InitialInvolvedProjectTree(TreeView1, strUserCode);
            ShareClass.InitialConstractTree(TreeView6);

            LB_OwnerCode.Text = strUserCode;
            LB_OwnerName.Text = strUserName;
        }
    }

    protected void BT_FindAll_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strWareHouse, strVendorName;
        string strUserCode = LB_UserCode.Text.Trim();

        TabContainer1.ActiveTabIndex = 0;

        strWareHouse = "%" + TB_FindWareHouse.Text.Trim() + "%";
        strVendorName = "%" + TB_FindVendorName.Text.Trim() + "%";

        strHQL = "From GoodsCheckInOrder as goodsCheckInOrder where (goodsCheckInOrder.CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " or goodsCheckInOrder.CreatorCode in (select  memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")) ";
        strHQL += " and goodsCheckInOrder.WareHouse Like '" + strWareHouse + "' And goodsCheckInOrder.VendorName Like '" + strVendorName + "'";
        strHQL += " Order By goodsCheckInOrder.CheckInID DESC";
        GoodsCheckInOrderBLL goodsCheckInOrderBLL = new GoodsCheckInOrderBLL();
        lst = goodsCheckInOrderBLL.GetAllGoodsCheckInOrders(strHQL);
        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }

    protected void DataGrid5_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strUserCode = LB_UserCode.Text;
            string strCIOID;

            DateTime dtCheckInTime, dtCurrentTime;

            strCIOID = e.Item.Cells[2].Text.Trim();
            for (int i = 0; i < DataGrid5.Items.Count; i++)
            {
                DataGrid5.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "From GoodsCheckInOrder as goodsCheckInOrder Where goodsCheckInOrder.CheckInID = " + strCIOID;
            GoodsCheckInOrderBLL goodsCheckInOrderBLL = new GoodsCheckInOrderBLL();
            lst = goodsCheckInOrderBLL.GetAllGoodsCheckInOrders(strHQL);
            GoodsCheckInOrder goodsCheckInOrder = (GoodsCheckInOrder)lst[0];
            dtCurrentTime = DateTime.Now;
            dtCheckInTime = goodsCheckInOrder.CheckInDate;
            TimeSpan ts = dtCurrentTime - dtCheckInTime;

            LB_CheckInID.Text = strCIOID;

            LoadGoodsCheckInOrderDetail(strCIOID);

            if (e.CommandName == "Update")
            {
                try
                {
                    DL_CheckInType.SelectedValue = goodsCheckInOrder.CheckInType;
                }
                catch
                {
                    DL_CheckInType.SelectedValue = "";
                }

                TB_GCIOName.Text = goodsCheckInOrder.GCIOName.Trim();
                try
                {
                    TB_WHName.Text = goodsCheckInOrder.WareHouse.Trim();
                }
                catch
                {
                }

                TB_VendorName.Text = goodsCheckInOrder.VendorName;
                NB_Amount.Amount = goodsCheckInOrder.Amount;
                DLC_CheckInTime.Text = goodsCheckInOrder.CheckInDate.ToString("yyyy-MM-dd");
                LB_CheckInTime.Text = goodsCheckInOrder.CheckInDate.ToString("yyyy-MM-dd");

                try
                {
                    DL_CurrencyType.SelectedValue = goodsCheckInOrder.CurrencyType;
                }
                catch
                {
                }

                try
                {
                    DL_RelatedType.SelectedValue = goodsCheckInOrder.RelatedType.Trim();
                }
                catch
                {
                    DL_RelatedType.SelectedValue = "Other";
                }

                NB_RelatedID.Amount = goodsCheckInOrder.RelatedID;

                try
                {
                    if (DL_RelatedType.SelectedValue == "Project")
                    {
                        LB_ProjectID.Text = NB_RelatedID.Amount.ToString();
                        LoadProjectRelatedItem(NB_RelatedID.Amount.ToString());
                        LoadProjectItemBomVersion(NB_RelatedID.Amount.ToString());
                        TakeTopBOM.InitialProjectItemBomTree(NB_RelatedID.Amount.ToString(), DL_ChangeProjectItemBomVersionID.SelectedItem.Text.Trim(), TreeView4);
                    }
                }
                catch
                {
                }

                if (ts.Days <= 3)
                {
                    BT_NewMain.Visible = true;
                    BT_CreateDetail.Visible = true;
                    BT_NewDetail.Visible = true;
                }
                else
                {
                    BT_NewMain.Visible = false;
                    BT_CreateDetail.Visible = false;
                    BT_NewDetail.Visible = false;
                }

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }

            if (e.CommandName == "Delete")
            {
                if (ts.Days > 3)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('删除失败，只能删除三天之内的记录，请检查！')", true);
                    return;
                }

                if (DataGrid1.Items.Count > 0)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCZMXJLSCSBQJC + "')", true);
                    return;
                }

                strHQL = "Delete From T_GoodsCheckInOrder Where CheckInID = " + strCIOID;
                ShareClass.RunSqlCommand(strHQL);

                LoadGoodsCheckInOrder(strUserCode);
                LoadGoodsCheckInOrderDetail(strCIOID);
            }
        }
    }


    protected void BT_CreateMain_Click(object sender, EventArgs e)
    {
        LB_CheckInID.Text = "";

        BT_NewMain.Visible = true;
        BT_NewDetail.Visible = true;
        BT_CreateDetail.Visible = true;

        string strNewCIOCode = ShareClass.GetCodeByRule("CheckInOrderCode", "CheckInOrderCode", "00");
        if (strNewCIOCode != "")
        {
            TB_GCIOName.Text = strNewCIOCode;
        }

        LoadGoodsCheckInOrderDetail("0");

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void BT_NewMain_Click(object sender, EventArgs e)
    {
        string strCIOID;

        strCIOID = LB_CheckInID.Text.Trim();

        if (strCIOID == "")
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
        string strCIOID, strSourceType, strWareHouse;
        string strCreatorCode, strCreatorName, strGCIOName, strVendorName;
        string strRelatedType, strRelatedID;
        int intSourceID;
        decimal deAmount;
        DateTime dtCheckInDate;


        strGCIOName = TB_GCIOName.Text.Trim();
        strSourceType = DL_SourceType.SelectedValue.Trim();
        intSourceID = int.Parse(NB_SourceID.Amount.ToString());
        strCreatorCode = LB_UserCode.Text.Trim();
        strCreatorName = LB_UserName.Text.Trim();
        strWareHouse = TB_WHName.Text.Trim();
        dtCheckInDate = DateTime.Parse(DLC_CheckInTime.Text);
        deAmount = NB_Amount.Amount;
        strVendorName = TB_VendorName.Text.Trim();
        strRelatedType = DL_RelatedType.SelectedValue.Trim();
        strRelatedID = NB_RelatedID.Amount.ToString();

        GoodsCheckInOrderBLL goodsCheckInOrderBLL = new GoodsCheckInOrderBLL();
        GoodsCheckInOrder goodsCheckInOrder = new GoodsCheckInOrder();

        goodsCheckInOrder.GCIOName = strGCIOName;
        goodsCheckInOrder.CheckInDate = dtCheckInDate;
        goodsCheckInOrder.CheckInType = DL_CheckInType.SelectedValue.Trim();

        goodsCheckInOrder.WareHouse = strWareHouse;
        goodsCheckInOrder.CreatorCode = strCreatorCode;
        goodsCheckInOrder.CreatorName = strCreatorName;
        goodsCheckInOrder.Amount = 0;

        goodsCheckInOrder.CurrencyType = DL_CurrencyType.SelectedValue.Trim();
        goodsCheckInOrder.VendorName = strVendorName;

        goodsCheckInOrder.RelatedType = strRelatedType;
        goodsCheckInOrder.RelatedID = int.Parse(strRelatedID);

        goodsCheckInOrder.PayStatus = "NO";

        try
        {
            goodsCheckInOrderBLL.AddGoodsCheckInOrder(goodsCheckInOrder);

            strCIOID = ShareClass.GetMyCreatedMaxGoodsCheckInID(strCreatorCode);
            LB_CheckInID.Text = strCIOID;
            LB_CheckInTime.Text = dtCheckInDate.ToString("yyyy-MM-dd");

            string strNewCIOCode = ShareClass.GetCodeByRule("CheckInOrderCode", "CheckInOrderCode", strCIOID);
            if (strNewCIOCode != "")
            {
                TB_GCIOName.Text = strNewCIOCode;
                string strHQL = "Update T_GoodsCheckInOrder Set GCIOName = " + "'" + strNewCIOCode + "'" + " Where CheckInID = " + strCIOID;
                ShareClass.RunSqlCommand(strHQL);
            }


            NB_Amount.Amount = 0;

            LoadGoodsCheckInOrder(strCreatorCode);
            LoadGoodsCheckInOrderDetail(strCIOID);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void UpdateMain()
    {
        string strHQL;
        IList lst;

        string strCIOID, strSourceType, strWareHouse, strGCIOName, strVendorName;
        string strRelatedType, strRelatedID;
        string strCreatorCode, strCreatorName;
        int intSourceID;
        decimal deAmount;
        DateTime dtCheckInDate;


        strCIOID = LB_CheckInID.Text.Trim();
        strGCIOName = TB_GCIOName.Text.Trim();
        strSourceType = DL_SourceType.SelectedValue.Trim();
        intSourceID = int.Parse(NB_SourceID.Amount.ToString());
        strCreatorCode = LB_UserCode.Text.Trim();
        strCreatorName = LB_UserName.Text.Trim();
        strWareHouse = TB_WHName.Text.Trim();
        dtCheckInDate = DateTime.Parse(DLC_CheckInTime.Text);
        deAmount = NB_Amount.Amount;
        strVendorName = TB_VendorName.Text.Trim();

        strRelatedType = DL_RelatedType.SelectedValue.Trim();
        strRelatedID = NB_RelatedID.Amount.ToString();

        strHQL = "From GoodsCheckInOrder as goodsCheckInOrder Where goodsCheckInOrder.CheckInID = " + strCIOID;
        GoodsCheckInOrderBLL goodsCheckInOrderBLL = new GoodsCheckInOrderBLL();
        lst = goodsCheckInOrderBLL.GetAllGoodsCheckInOrders(strHQL);

        GoodsCheckInOrder goodsCheckInOrder = (GoodsCheckInOrder)lst[0];

        goodsCheckInOrder.GCIOName = strGCIOName;
        goodsCheckInOrder.CheckInDate = dtCheckInDate;
        goodsCheckInOrder.CheckInType = DL_CheckInType.SelectedValue.Trim();

        goodsCheckInOrder.WareHouse = strWareHouse;
        goodsCheckInOrder.CreatorCode = strCreatorCode;
        goodsCheckInOrder.CreatorName = strCreatorName;
        goodsCheckInOrder.Amount = deAmount;
        goodsCheckInOrder.CurrencyType = DL_CurrencyType.SelectedValue.Trim();
        goodsCheckInOrder.VendorName = strVendorName;

        goodsCheckInOrder.RelatedType = strRelatedType;
        goodsCheckInOrder.RelatedID = int.Parse(strRelatedID);

        try
        {
            goodsCheckInOrderBLL.UpdateGoodsCheckInOrder(goodsCheckInOrder, int.Parse(strCIOID));

            //Liujp 2013-07-17 更新物料登记入库表时，更新物料表中仓库字段
            ShareClass.UpdateGoodsPositionByGoodsCheckInOrder(strCIOID, strWareHouse);

            LoadGoodsCheckInOrder(strCreatorCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
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

            TB_VendorName.Text = DL_VendorList.SelectedItem.Text;
            TB_Supplier.Text = DL_VendorList.SelectedItem.Text;
        }
        catch
        {
            TB_VendorName.Text = "";
            TB_Supplier.Text = "";
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode treeNode = new TreeNode();
        treeNode = TreeView3.SelectedNode;

        if (treeNode.Target != "")
        {
            TB_WHName.Text = treeNode.Target.Trim();

            //LoadAllGoodsByWareHouse(TB_WHName.Text);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void LoadAllGoodsByWareHouse(string strWareHouse)
    {
        string strHQL;
        IList lst;

        strHQL = "From Goods as goods Where goods.Number > 0 and goods.Position = " + "'" + strWareHouse + "'";
        strHQL += " Order by goods.ID ASC";
        GoodsBLL goodsBLL = new GoodsBLL();
        lst = goodsBLL.GetAllGoodss(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void DataGrid13_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strSUID;

            strSUID = ((Button)e.Item.FindControl("BT_SUID")).Text.Trim();
            LB_SUID.Text = strSUID;
            NB_SourceID.Amount = int.Parse(strSUID);

            for (int i = 0; i < DataGrid13.Items.Count; i++)
            {
                DataGrid13.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            NB_SourceID.Amount = int.Parse(strSUID);

            string strHQL = "From GoodsSupplyOrder as goodsSupplyOrder Where goodsSupplyOrder.SUID = " + strSUID;
            GoodsSupplyOrderBLL goodsSupplyOrderBLL = new GoodsSupplyOrderBLL();
            IList lst = goodsSupplyOrderBLL.GetAllGoodsSupplyOrders(strHQL);
            GoodsSupplyOrder goodsSupplyOrder = (GoodsSupplyOrder)lst[0];

            TB_VendorName.Text = goodsSupplyOrder.Supplier.Trim();
            TB_Supplier.Text = goodsSupplyOrder.Supplier.Trim();

            LoadGoodsSupplyOrderDetail(strSUID);



            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid14_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strROID;

            strROID = ((Button)e.Item.FindControl("BT_ROID")).Text.Trim();
            LB_PRID.Text = strROID;
            NB_SourceID.Amount = int.Parse(strROID);

            for (int i = 0; i < DataGrid14.Items.Count; i++)
            {
                DataGrid14.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            NB_SourceID.Amount = int.Parse(strROID);

            LoadGoodsReturnDetail(strROID, DataGrid10);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid15_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strROID;

            strROID = ((Button)e.Item.FindControl("BT_ROID")).Text.Trim();
            LB_SRID.Text = strROID;
            NB_SourceID.Amount = int.Parse(strROID);

            for (int i = 0; i < DataGrid15.Items.Count; i++)
            {
                DataGrid15.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            NB_SourceID.Amount = int.Parse(strROID);

            LoadGoodsReturnDetail(strROID, DataGrid11);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid16_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strROID;

            strROID = ((Button)e.Item.FindControl("BT_ROID")).Text.Trim();
            LB_BRID.Text = strROID;
            NB_SourceID.Amount = int.Parse(strROID);

            for (int i = 0; i < DataGrid16.Items.Count; i++)
            {
                DataGrid16.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            NB_SourceID.Amount = int.Parse(strROID);

            LoadGoodsReturnDetail(strROID, DataGrid12);



            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strPOID;

            strPOID = ((Button)e.Item.FindControl("BT_POID")).Text.Trim();
            LB_POID.Text = strPOID;
            NB_SourceID.Amount = int.Parse(strPOID);

            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            NB_SourceID.Amount = int.Parse(strPOID);

            string strHQL = "From GoodsPurchaseOrder as goodsPurchaseOrder Where goodsPurchaseOrder.POID = " + strPOID;
            GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
            IList lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);
            GoodsPurchaseOrder goodsPurchaseOrder = (GoodsPurchaseOrder)lst[0];

            TB_VendorName.Text = goodsPurchaseOrder.Supplier.Trim();
            TB_Supplier.Text = goodsPurchaseOrder.Supplier.Trim();

            LoadGoodsPurchaseOrderRecord(strPOID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid6_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strPDID;

            strPDID = ((Button)e.Item.FindControl("BT_PDID")).Text.Trim();
            NB_SourceID.Amount = int.Parse(strPDID);

            for (int i = 0; i < DataGrid6.Items.Count; i++)
            {
                DataGrid6.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            LB_PDID.Text = strPDID;

            NB_SourceID.Amount = int.Parse(strPDID);

            LoadGoodsProductionOrderDetail(strPDID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid10_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            for (int i = 0; i < DataGrid10.Items.Count; i++)
            {
                DataGrid10.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "From GoodsReturnDetail as goodsReturnDetail Where goodsReturnDetail.ID = " + strID;
            GoodsReturnDetailBLL goodsReturnDetailBLL = new GoodsReturnDetailBLL();
            lst = goodsReturnDetailBLL.GetAllGoodsReturnDetails(strHQL);

            GoodsReturnDetail goodsReturnDetail = (GoodsReturnDetail)lst[0];

            TB_GoodsCode.Text = goodsReturnDetail.GoodsCode.Trim();
            TB_GoodsName.Text = goodsReturnDetail.GoodsName.Trim();
            TB_ModelNumber.Text = goodsReturnDetail.ModelNumber.Trim();
            TB_Spec.Text = goodsReturnDetail.Spec.Trim();
            TB_Manufacturer.Text = goodsReturnDetail.Brand;

            NB_Number.Amount = goodsReturnDetail.Number;
            NB_Price.Amount = goodsReturnDetail.Price;
            DL_Unit.SelectedValue = goodsReturnDetail.UnitName;

            LB_SourceRelatedID.Text = goodsReturnDetail.ROID.ToString();
            DL_RecordSourceType.SelectedValue = "GoodsPRRecord";
            NB_RecordSourceID.Amount = goodsReturnDetail.ID;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid11_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            for (int i = 0; i < DataGrid11.Items.Count; i++)
            {
                DataGrid11.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "From GoodsReturnDetail as goodsReturnDetail Where goodsReturnDetail.ID = " + strID;
            GoodsReturnDetailBLL goodsReturnDetailBLL = new GoodsReturnDetailBLL();
            lst = goodsReturnDetailBLL.GetAllGoodsReturnDetails(strHQL);

            GoodsReturnDetail goodsReturnDetail = (GoodsReturnDetail)lst[0];

            TB_GoodsCode.Text = goodsReturnDetail.GoodsCode.Trim();
            TB_GoodsName.Text = goodsReturnDetail.GoodsName.Trim();
            TB_ModelNumber.Text = goodsReturnDetail.ModelNumber.Trim();
            TB_Spec.Text = goodsReturnDetail.Spec.Trim();
            TB_Manufacturer.Text = goodsReturnDetail.Brand;

            NB_Number.Amount = goodsReturnDetail.Number;
            NB_Price.Amount = goodsReturnDetail.Price;
            DL_Unit.SelectedValue = goodsReturnDetail.UnitName;

            LB_SourceRelatedID.Text = goodsReturnDetail.ROID.ToString();
            DL_RecordSourceType.SelectedValue = "GoodsSRRecord";
            NB_RecordSourceID.Amount = goodsReturnDetail.ID;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid12_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            for (int i = 0; i < DataGrid12.Items.Count; i++)
            {
                DataGrid12.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "From GoodsReturnDetail as goodsReturnDetail Where goodsReturnDetail.ID = " + strID;
            GoodsReturnDetailBLL goodsReturnDetailBLL = new GoodsReturnDetailBLL();
            lst = goodsReturnDetailBLL.GetAllGoodsReturnDetails(strHQL);

            GoodsReturnDetail goodsReturnDetail = (GoodsReturnDetail)lst[0];

            TB_GoodsCode.Text = goodsReturnDetail.GoodsCode.Trim();
            TB_GoodsName.Text = goodsReturnDetail.GoodsName.Trim();
            TB_ModelNumber.Text = goodsReturnDetail.ModelNumber.Trim();
            TB_Spec.Text = goodsReturnDetail.Spec.Trim();
            TB_Manufacturer.Text = goodsReturnDetail.Brand;

            NB_Number.Amount = goodsReturnDetail.Number;
            NB_Price.Amount = goodsReturnDetail.Price;
            DL_Unit.SelectedValue = goodsReturnDetail.UnitName;

            LB_SourceRelatedID.Text = goodsReturnDetail.ROID.ToString();
            DL_RecordSourceType.SelectedValue = "GoodsBRRecord";
            NB_RecordSourceID.Amount = goodsReturnDetail.ID;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strProjectID;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strProjectID = treeNode.Target.Trim();

            NB_RelatedID.Amount = int.Parse(strProjectID);

            try
            {
                if (DL_RelatedType.SelectedValue == "Project")
                {
                    LB_ProjectID.Text = NB_RelatedID.Amount.ToString();
                    LoadProjectRelatedItem(NB_RelatedID.Amount.ToString());
                    LoadProjectItemBomVersion(NB_RelatedID.Amount.ToString());
                    TakeTopBOM.InitialProjectItemBomTree(NB_RelatedID.Amount.ToString(), DL_ChangeProjectItemBomVersionID.SelectedItem.Text.Trim(), TreeView4);
                }
            }
            catch
            {
            }

            TabContainer1.ActiveTabIndex = 2;
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void LoadProjectRelatedItem(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ProjectRelatedItem as projectRelatedItem where projectRelatedItem.ProjectID = " + strProjectID + " Order by projectRelatedItem.ID ASC";
        ProjectRelatedItemBLL projectRelatedItemBLL = new ProjectRelatedItemBLL();
        lst = projectRelatedItemBLL.GetAllProjectRelatedItems(strHQL);

        DataGrid21.DataSource = lst;
        DataGrid21.DataBind();
    }


    protected void BT_MaterialBudgetFind_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strProjectID = NB_RelatedID.Amount.ToString();
        if (DL_RelatedType.SelectedValue.Trim() == "Project")
        {
            strHQL = "From ProjectRelatedItem as projectRelatedItem where projectRelatedItem.ProjectID = " + strProjectID;
            strHQL += " and ItemCode Like '%" + TB_FindItemCode.Text.Trim() + "%'";
            strHQL += " and ItemName Like '%" + TB_FindItemName.Text.Trim() + "%'";
            strHQL += " and Specification Like '%" + TB_FindItemSpec.Text.Trim() + "%'";
            strHQL += " and ModelNumber Like '%" + TB_FindModelNumber.Text.Trim() + "%'";
            strHQL += " Order by projectRelatedItem.ID ASC";
            ProjectRelatedItemBLL projectRelatedItemBLL = new ProjectRelatedItemBLL();
            lst = projectRelatedItemBLL.GetAllProjectRelatedItems(strHQL);

            DataGrid21.DataSource = lst;
            DataGrid21.DataBind();
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }


    protected void DataGrid21_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strItemCode, strItemName, strBomVerID, strUnit, strDefaultProcess;
            decimal deNumber, deReservedNumber;

            for (int i = 0; i < DataGrid21.Items.Count; i++)
            {
                DataGrid21.Items[i].ForeColor = Color.Black;
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
            TB_Manufacturer.Text = projectRelatedItem.Brand;

            TB_ModelNumber.Text = projectRelatedItem.ModelNumber;

            NB_Number.Amount = projectRelatedItem.Number - projectRelatedItem.AleadyCheckIn;

            DL_Unit.SelectedValue = strUnit;

            //LB_SourceRelatedID.Text = projectRelatedItem.ProjectID.ToString();
            DL_RecordSourceType.SelectedValue = "GoodsPJRecord";
            NB_RecordSourceID.Amount = projectRelatedItem.ID;

            //LoadItemBomVersion(strItemCode, DL_BomVerID);
            //DL_BomVerID.SelectedValue = strBomVerID;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid8_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            for (int i = 0; i < DataGrid8.Items.Count; i++)
            {
                DataGrid8.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "From GoodsSupplyOrderDetail as goodsSupplyOrderDetail Where goodsSupplyOrderDetail.ID = " + strID;
            GoodsSupplyOrderDetailBLL goodsSupplyOrderDetailBLL = new GoodsSupplyOrderDetailBLL();
            lst = goodsSupplyOrderDetailBLL.GetAllGoodsSupplyOrderDetails(strHQL);

            GoodsSupplyOrderDetail goodsSupplyOrderDetail = (GoodsSupplyOrderDetail)lst[0];

            TB_GoodsCode.Text = goodsSupplyOrderDetail.GoodsCode.Trim();
            TB_GoodsName.Text = goodsSupplyOrderDetail.GoodsName.Trim();
            DL_Type.SelectedValue = goodsSupplyOrderDetail.Type;
            TB_ModelNumber.Text = goodsSupplyOrderDetail.ModelNumber.Trim();
            TB_Spec.Text = goodsSupplyOrderDetail.Spec.Trim();
            TB_Manufacturer.Text = goodsSupplyOrderDetail.Brand;

            NB_Number.Amount = goodsSupplyOrderDetail.Number;
            NB_Price.Amount = goodsSupplyOrderDetail.Price;
            DL_Unit.SelectedValue = goodsSupplyOrderDetail.Unit;

            LB_SourceRelatedID.Text = goodsSupplyOrderDetail.SUID.ToString();
            DL_RecordSourceType.SelectedValue = "GoodsSURecord";
            NB_RecordSourceID.Amount = goodsSupplyOrderDetail.ID;


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

            strID = ((Button)e.Item.FindControl("BT_ID")).Text;

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

            TB_GoodsCode.Text = goodsPurRecord.GoodsCode;
            TB_GoodsName.Text = goodsPurRecord.GoodsName;
            TB_ModelNumber.Text = goodsPurRecord.ModelNumber;
            TB_Spec.Text = goodsPurRecord.Spec;
            TB_Manufacturer.Text = goodsPurRecord.Brand;

            DL_Type.SelectedValue = goodsPurRecord.Type;
            NB_Number.Amount = goodsPurRecord.Number - goodsPurRecord.CheckInNumber;
            NB_Price.Amount = goodsPurRecord.Price;

            DL_Type.SelectedValue = goodsPurRecord.Type;
            DL_Unit.SelectedValue = goodsPurRecord.Unit;
            DLC_BuyTime.Text = goodsPurRecord.PurTime.ToString("yyyy-MM-dd");

            LB_SourceRelatedID.Text = goodsPurRecord.POID.ToString();
            DL_RecordSourceType.SelectedValue = "GoodsPORecord";
            NB_RecordSourceID.Amount = goodsPurRecord.ID;

            IM_ItemPhoto.ImageUrl = GetGoodsPhotoURL(goodsPurRecord.GoodsCode, "0");
            HL_ItemPhoto.NavigateUrl = IM_ItemPhoto.ImageUrl;
            TB_PhotoURL.Text = IM_ItemPhoto.ImageUrl;

            TB_Memo.Text = "";

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid7_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strID, strPDID;
            IList lst;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            strPDID = LB_PDID.Text.Trim();

            for (int i = 0; i < DataGrid7.Items.Count; i++)
            {
                DataGrid7.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "from GoodsProductionOrderDetail as goodsProductionOrderDetail where goodsProductionOrderDetail.ID = " + strID;

            GoodsProductionOrderDetailBLL goodsProductionOrderDetailBLL = new GoodsProductionOrderDetailBLL();
            lst = goodsProductionOrderDetailBLL.GetAllGoodsProductionOrderDetails(strHQL);
            GoodsProductionOrderDetail goodsProductionOrderDetail = (GoodsProductionOrderDetail)lst[0];

            TB_GoodsCode.Text = goodsProductionOrderDetail.GoodsCode;
            TB_GoodsName.Text = goodsProductionOrderDetail.GoodsName;
            TB_Spec.Text = goodsProductionOrderDetail.Spec;
            TB_Manufacturer.Text = goodsProductionOrderDetail.Brand;

            DL_Type.SelectedValue = goodsProductionOrderDetail.Type;
            DL_Unit.SelectedValue = goodsProductionOrderDetail.UnitName;
            NB_Number.Amount = goodsProductionOrderDetail.Number;

            LB_SourceRelatedID.Text = goodsProductionOrderDetail.PDID.ToString();
            DL_RecordSourceType.SelectedValue = "GoodsPDRecord";
            NB_RecordSourceID.Amount = decimal.Parse(strID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid18_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strPlanVerID;

            strPlanVerID = ((Button)e.Item.FindControl("BT_PlanVerID")).Text.Trim();

            for (int i = 0; i < DataGrid18.Items.Count; i++)
            {
                DataGrid18.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            NB_RelatedID.Amount = int.Parse(strPlanVerID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid9_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strItemCode;

            strID = e.Item.Cells[0].Text;
            strItemCode = ((Button)e.Item.FindControl("BT_ItemCode")).Text.Trim();

            for (int i = 0; i < DataGrid9.Items.Count; i++)
            {
                DataGrid9.Items[i].ForeColor = Color.Black;
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
                DL_Unit.SelectedValue = item.Unit;
                TB_ModelNumber.Text = item.ModelNumber.Trim();
                TB_Spec.Text = item.Specification;
                TB_Manufacturer.Text = item.Brand;

                NB_Price.Amount = item.SalePrice;
                NB_WarrantyPeriod.Amount = item.WarrantyPeriod;

                IM_ItemPhoto.ImageUrl = item.PhotoURL;
                HL_ItemPhoto.NavigateUrl = item.PhotoURL;
                TB_PhotoURL.Text = item.PhotoURL;

                if (LB_SourceRelatedID.Text.Trim() == "0")
                {
                    DL_RecordSourceType.SelectedValue = "Other";
                    NB_RecordSourceID.Amount = 0;
                    NB_Price.Amount = item.PurchasePrice;
                }
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strGoodsCode;

            strID = e.Item.Cells[0].Text;
            strGoodsCode = ((Button)e.Item.FindControl("BT_GoodsCode")).Text.Trim();

            for (int i = 0; i < DataGrid4.Items.Count; i++)
            {
                DataGrid4.Items[i].ForeColor = Color.Black;
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
                TB_SN.Text = goods.SN;
                TB_ModelNumber.Text = goods.ModelNumber;
                DL_Unit.SelectedValue = goods.UnitName;
                TB_Spec.Text = goods.Spec.Trim();

                DL_Type.SelectedValue = goods.Type;
                TB_Manufacturer.Text = goods.Manufacturer;

                NB_WarrantyPeriod.Amount = goods.WarrantyPeriod;

                IM_ItemPhoto.ImageUrl = goods.PhotoURL;
                HL_ItemPhoto.NavigateUrl = goods.PhotoURL;
                TB_PhotoURL.Text = goods.PhotoURL;

                if (LB_SourceRelatedID.Text.Trim() == "0")
                {
                    DL_RecordSourceType.SelectedValue = "Other";
                    NB_RecordSourceID.Amount = 0;
                    NB_Price.Amount = goods.Price;
                }
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strID;
        string strUserCode;

        strUserCode = LB_UserCode.Text;

        if (e.CommandName != "Page")
        {
            strID = e.Item.Cells[3].Text.Trim();

            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {
                DataGrid1.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            DateTime dtCurrentTime, dtCheckInTime;
            string strCIOID;
            strCIOID = LB_CheckInID.Text.Trim();
            strHQL = "From GoodsCheckInOrder as goodsCheckInOrder Where goodsCheckInOrder.CheckInID = " + strCIOID;
            GoodsCheckInOrderBLL goodsCheckInOrderBLL = new GoodsCheckInOrderBLL();
            lst = goodsCheckInOrderBLL.GetAllGoodsCheckInOrders(strHQL);
            GoodsCheckInOrder goodsCheckInOrder = (GoodsCheckInOrder)lst[0];
            dtCurrentTime = DateTime.Now;
            dtCheckInTime = goodsCheckInOrder.CheckInDate;
            TimeSpan ts = dtCurrentTime - dtCheckInTime;

            if (e.CommandName == "Update")
            {
                strHQL = "from GoodsCheckInOrderDetail as goodsCheckInOrderDetail where goodsCheckInOrderDetail.ID = " + "'" + strID + "'";
                GoodsCheckInOrderDetailBLL goodsCheckInOrderDetailBLL = new GoodsCheckInOrderDetailBLL();
                lst = goodsCheckInOrderDetailBLL.GetAllGoodsCheckInOrderDetails(strHQL);
                GoodsCheckInOrderDetail goodsCheckInOrderDetail = (GoodsCheckInOrderDetail)lst[0];

                try
                {
                    DL_Type.SelectedValue = goodsCheckInOrderDetail.Type;
                }
                catch
                {
                }
                try
                {
                    DL_RecordSourceType.SelectedValue = goodsCheckInOrderDetail.SourceType.Trim();
                }
                catch
                {
                }

                try
                {
                    DL_Unit.SelectedValue = goodsCheckInOrderDetail.UnitName;
                }
                catch
                {
                }

                try
                {
                    ShareClass.LoadWareHousePositions(TB_WHName.Text.Trim(), DL_WHPosition);
                }
                catch
                {
                }

                LB_ID.Text = goodsCheckInOrderDetail.ID.ToString();
                TB_GoodsCode.Text = goodsCheckInOrderDetail.GoodsCode.Trim();
                LB_OwnerCode.Text = goodsCheckInOrderDetail.OwnerCode;
                LB_OwnerName.Visible = true;
                LB_OwnerName.Text = ShareClass.GetUserName(goodsCheckInOrderDetail.OwnerCode);
                TB_GoodsCode.Text = goodsCheckInOrderDetail.GoodsCode;
                TB_GoodsName.Text = goodsCheckInOrderDetail.GoodsName;
                TB_SN.Text = goodsCheckInOrderDetail.SN;
                NB_Number.Amount = goodsCheckInOrderDetail.CheckInNumber;
                NB_Price.Amount = goodsCheckInOrderDetail.Price;
                TB_Spec.Text = goodsCheckInOrderDetail.Spec;
                NB_Price.Amount = goodsCheckInOrderDetail.Price;
                if (goodsCheckInOrderDetail.IsTaxPrice.Trim() == "YES")
                {
                    CB_IsTaxPrice.Checked = true;
                }
                else
                {
                    CB_IsTaxPrice.Checked = false;
                }
                DLC_BuyTime.Text = goodsCheckInOrderDetail.BuyTime.ToString("yyyy-MM-dd");
                TB_ModelNumber.Text = goodsCheckInOrderDetail.ModelNumber;
                TB_Supplier.Text = goodsCheckInOrderDetail.Supplier.Trim();
                TB_Manufacturer.Text = goodsCheckInOrderDetail.Manufacturer;
                TB_Memo.Text = goodsCheckInOrderDetail.Memo.Trim();

                LB_SourceRelatedID.Text = goodsCheckInOrderDetail.RelatedID.ToString();
                NB_RecordSourceID.Amount = goodsCheckInOrderDetail.SourceID;
                NB_WarrantyPeriod.Amount = goodsCheckInOrderDetail.WarrantyPeriod;

                try
                {
                    DL_WHPosition.SelectedValue = goodsCheckInOrderDetail.WHPosition;
                }
                catch
                {
                }

                //取得入库单明细的其它属性
                LoadGoodsCheckInDetailOtherColumn(strID);

                IM_ItemPhoto.ImageUrl = GetGoodsPhotoURL(goodsCheckInOrderDetail.GoodsCode.Trim(), goodsCheckInOrderDetail.ToGoodsID.ToString());

                HL_ItemPhoto.NavigateUrl = IM_ItemPhoto.ImageUrl;
                TB_PhotoURL.Text = IM_ItemPhoto.ImageUrl;

                BT_TakePhoto.Enabled = true;
                BT_DeletePhoto.Enabled = true;

                if (ts.Days <= 3)
                {
                    BT_NewMain.Visible = true;
                    BT_CreateDetail.Visible = true;
                    BT_NewDetail.Visible = true;
                }
                else
                {
                    BT_NewMain.Visible = false;
                    BT_CreateDetail.Visible = false;
                    BT_NewDetail.Visible = false;
                }

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }


            if (e.CommandName == "Delete")
            {
                string strSourceType, strSourceID, strGoodsID;
                decimal dePrice, deNumber;

                if (ts.Days > 3)
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('删除失败，只能删除三天之内的记录，请检查！')", true);
                    return;
                }

                GoodsCheckInOrderDetailBLL goodsCheckInOrderDetailBLL = new GoodsCheckInOrderDetailBLL();
                strHQL = "from GoodsCheckInOrderDetail as goodsCheckInOrderDetail where goodsCheckInOrderDetail.ID = " + strID;
                lst = goodsCheckInOrderDetailBLL.GetAllGoodsCheckInOrderDetails(strHQL);
                GoodsCheckInOrderDetail goodsCheckInOrderDetail = (GoodsCheckInOrderDetail)lst[0];

                strGoodsID = goodsCheckInOrderDetail.ToGoodsID.ToString();
                deNumber = goodsCheckInOrderDetail.Number;
                dePrice = goodsCheckInOrderDetail.Price;

                strSourceType = goodsCheckInOrderDetail.SourceType.Trim();
                strSourceID = goodsCheckInOrderDetail.SourceID.ToString();

                try
                {
                    goodsCheckInOrderDetailBLL.DeleteGoodsCheckInOrderDetail(goodsCheckInOrderDetail);

                    BT_TakePhoto.Enabled = false;
                    BT_DeletePhoto.Enabled = false;

                    //更新相关单据入库数量
                    ShareClass.UpdateGoodsRelatedBusinessNubmer(DL_RelatedType.SelectedValue.Trim(), NB_RelatedID.Amount.ToString(), goodsCheckInOrderDetail.GoodsCode.Trim(), strSourceType, strSourceID, DataGrid21);

                    LoadGoodsPurchaseOrderRecord(LB_POID.Text.Trim());
                    LoadGoodsCheckInOrderDetail(strCIOID);

                    if (strSourceType == "GoodsCSRecord")
                    {
                        string strConstractCode = LB_ConstractCode.Text.Trim();
                        if (strConstractCode != "")
                        {
                            LoadConstractRelatedGoodsList(strConstractCode);
                        }
                    }

                    HL_ItemPhoto.NavigateUrl = "";
                    TB_PhotoURL.Text = "";

                    if (ShareClass.GetGoodsStockCountMethod(TB_WHName.Text.Trim()) == "FIFO")
                    {
                        //删除物料明细表相同记录
                        strHQL = "Delete From T_Goods Where ID =" + strGoodsID;
                        ShareClass.RunSqlCommand(strHQL);
                    }
                    else
                    {
                        //按移动加权平均方法计算
                        ShareClass.CountGoodsStockByMWAM(strGoodsID, 0 - deNumber, dePrice, 0, 0);
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

    //取得入库单明细的其它属性
    protected void LoadGoodsCheckInDetailOtherColumn(string strCIODetailID)
    {
        string strHQL;

        strHQL = "Select * From T_GoodsCheckInOrderDetail Where ID = " + strCIODetailID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsCheckInOrderDetail");

        TB_BatchNumber.Text = ds.Tables[0].Rows[0]["BatchNumber"].ToString();
        DLC_ProductionDate.Text = DateTime.Parse(ds.Tables[0].Rows[0]["ProductDate"].ToString()).ToString("yyyy-MM-dd");
        DLC_ExpiryDate.Text = DateTime.Parse(ds.Tables[0].Rows[0]["ExpiryDate"].ToString()).ToString("yyyy-MM-dd");
        TB_ProductionEquipmentNumber.Text = ds.Tables[0].Rows[0]["ProductionEquipmentNumber"].ToString();
        TB_MaterialFormNumber.Text = ds.Tables[0].Rows[0]["MaterialFormNumber"].ToString();
    }

    protected void TreeView4_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strID;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView4.SelectedNode;

        if (treeNode.Target != "0")
        {
            strID = treeNode.Target;

            strHQL = "From ProjectRelatedItemBom as projectRelatedItemBom Where projectRelatedItemBom.ID = " + strID;
            ProjectRelatedItemBomBLL projectRelatedItemBomBLL = new ProjectRelatedItemBomBLL();
            lst = projectRelatedItemBomBLL.GetAllProjectRelatedItemBoms(strHQL);

            if (lst.Count > 0)
            {
                ProjectRelatedItemBom projectRelatedItemBom = (ProjectRelatedItemBom)lst[0];

                TB_GoodsCode.Text = projectRelatedItemBom.ItemCode.Trim();
                TB_GoodsName.Text = projectRelatedItemBom.ItemName.Trim();

                try
                {
                    DL_Type.SelectedValue = projectRelatedItemBom.ItemType;
                }
                catch
                {
                }
                TB_ModelNumber.Text = projectRelatedItemBom.ModelNumber;
                TB_Spec.Text = projectRelatedItemBom.Specification.Trim();
                TB_Manufacturer.Text = projectRelatedItemBom.Brand;

                NB_Number.Amount = projectRelatedItemBom.Number - projectRelatedItemBom.AleadyCheckIn;

                try
                {
                    DL_Unit.SelectedValue = projectRelatedItemBom.Unit;
                }
                catch
                {
                }
            }

            DL_RecordSourceType.SelectedValue = "ProjectBOMRecord";
            NB_RecordSourceID.Amount = int.Parse(strID);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void DL_ChangeProjecrItemBomVersionID_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strID, strVerID;

        string strProjectID = int.Parse(NB_RelatedID.Amount.ToString()).ToString();

        strID = DL_ChangeProjectItemBomVersionID.SelectedValue.Trim();
        strVerID = DL_ChangeProjectItemBomVersionID.SelectedItem.Text.Trim();


        try
        {
            TakeTopBOM.InitialProjectItemBomTree(strProjectID, strVerID, TreeView4);
        }
        catch (Exception err)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

    }


    protected void LoadProjectItemBomVersion(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ProjectItemBomVersion as projectItemBomVersion Where projectItemBomVersion.ProjectID = " + strProjectID + " Order by projectItemBomVersion.VerID DESC";
        ProjectItemBomVersionBLL projectItemBomVersionBLL = new ProjectItemBomVersionBLL();
        lst = projectItemBomVersionBLL.GetAllProjectItemBomVersions(strHQL);

        DL_ChangeProjectItemBomVersionID.DataSource = lst;
        DL_ChangeProjectItemBomVersionID.DataBind();
    }

    protected void DataGrid20_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strConstractCode;

            TabContainer1.ActiveTabIndex = 10;

            for (int i = 0; i < DataGrid20.Items.Count; i++)
            {
                DataGrid20.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strConstractCode = ((Button)e.Item.FindControl("BT_ConstractCode")).Text.Trim();

            LB_ConstractCode.Text = strConstractCode;

            LoadConstractRelatedGoodsList(strConstractCode);


            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DL_RelatedType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strRelatedType;

        strRelatedType = DL_RelatedType.SelectedValue.Trim();

        if (strRelatedType == "Other")
        {
            NB_RelatedID.Amount = 0;
        }

        if (strRelatedType == "MRPPlan")
        {
            BT_RelatedMRPPlan.Visible = true;
            NB_RelatedID.Visible = true;
            NB_RelatedID.Amount = 0;
        }
        else
        {
            BT_RelatedMRPPlan.Visible = false;

        }

        if (strRelatedType == "SaleOrder")
        {
            BT_RelatedSaleOrder.Visible = true;
            NB_RelatedID.Visible = true;
            NB_RelatedID.Amount = 0;
        }
        else
        {
            BT_RelatedSaleOrder.Visible = false;
        }

        if (strRelatedType == "Project")
        {
            BT_RelatedProject.Visible = true;
            NB_RelatedID.Visible = true;
            NB_RelatedID.Amount = 0;
        }
        else
        {
            BT_RelatedProject.Visible = false;
        }

        if (strRelatedType == "Constract")
        {
            BT_SelectConstract.Visible = true;
            NB_RelatedID.Visible = true;
            NB_RelatedID.Amount = 0;
        }
        else
        {
            BT_SelectConstract.Visible = false;
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid17_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strSOID;

        if (e.CommandName != "Page")
        {
            strSOID = ((Button)e.Item.FindControl("BT_SOID")).Text.Trim();

            for (int i = 0; i < DataGrid17.Items.Count; i++)
            {
                DataGrid17.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            NB_RelatedID.Amount = int.Parse(strSOID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void DataGrid19_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strID, strConstractCode;
            IList lst;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            strConstractCode = LB_ConstractCode.Text.Trim();

            for (int i = 0; i < DataGrid19.Items.Count; i++)
            {
                DataGrid19.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "from ConstractRelatedGoods as constractRelatedGoods Where constractRelatedGoods.ConstractCode = " + "'" + strConstractCode + "'";
            strHQL += " and constractRelatedGoods.ID = " + strID;

            ConstractRelatedGoodsBLL constractRelatedGoodsBLL = new ConstractRelatedGoodsBLL();
            lst = constractRelatedGoodsBLL.GetAllConstractRelatedGoodss(strHQL);
            ConstractRelatedGoods constractRelatedGoods = (ConstractRelatedGoods)lst[0];

            TB_GoodsCode.Text = constractRelatedGoods.GoodsCode;
            TB_GoodsName.Text = constractRelatedGoods.GoodsName;
            TB_ModelNumber.Text = constractRelatedGoods.ModelNumber;
            TB_Spec.Text = constractRelatedGoods.Spec;
            TB_Manufacturer.Text = constractRelatedGoods.Brand;

            DL_Type.SelectedValue = constractRelatedGoods.Type;
            DL_Unit.SelectedValue = constractRelatedGoods.Unit;
            NB_Number.Amount = constractRelatedGoods.Number;
            NB_Price.Amount = constractRelatedGoods.Price;

            DL_Unit.SelectedValue = constractRelatedGoods.Unit;

            LB_SourceRelatedID.Text = constractRelatedGoods.ID.ToString();
            DL_RecordSourceType.SelectedValue = "GoodsCSRecord";
            NB_RecordSourceID.Amount = constractRelatedGoods.ID;

            LB_OwnerCode.Text = strUserCode;

            LB_OwnerName.Visible = true;
            LB_OwnerName.Text = ShareClass.GetUserName(strUserCode);

            //TB_SN.Text = constractRelatedGoods.SN;

            DLC_BuyTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            BT_TakePhoto.Enabled = true;
            BT_DeletePhoto.Enabled = true;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DL_SourceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strSourceType;

        strSourceType = DL_SourceType.SelectedValue.Trim();

        if (strSourceType == "Other")
        {
            NB_SourceID.Amount = 0;
            TabContainer1.ActiveTabIndex = 0;
        }

        if (strSourceType == "GoodsSU")
        {
            NB_SourceID.Amount = 0;
            BT_SelectSU.Visible = true;

            TabContainer1.ActiveTabIndex = 4;

        }
        else
        {
            BT_SelectSU.Visible = false;
        }

        if (strSourceType == "GoodsPD")
        {
            NB_SourceID.Amount = 0;
            BT_SelectPD.Visible = true;

            TabContainer1.ActiveTabIndex = 5;

        }
        else
        {
            NB_SourceID.Amount = 0;
            BT_SelectPD.Visible = false;
        }

        if (strSourceType == "GoodsPR")
        {
            NB_SourceID.Amount = 0;
            BT_SelectPR.Visible = true;

            TabContainer1.ActiveTabIndex = 6;

        }
        else
        {
            NB_SourceID.Amount = 0;
            BT_SelectPR.Visible = false;
        }

        if (strSourceType == "GoodsSR")
        {
            NB_SourceID.Amount = 0;
            BT_SelectSR.Visible = true;

            TabContainer1.ActiveTabIndex = 7;

        }
        else
        {
            BT_SelectSR.Visible = false;
        }

        if (strSourceType == "GoodsBR")
        {
            NB_SourceID.Amount = 0;
            BT_SelectBR.Visible = true;

            TabContainer1.ActiveTabIndex = 8;

        }
        else
        {
            BT_SelectBR.Visible = false;
        }

        if (strSourceType == "GoodsPO")
        {
            NB_SourceID.Amount = 0;
            BT_SelectPO.Visible = true;

            TabContainer1.ActiveTabIndex = 9;

        }
        else
        {
            BT_SelectPO.Visible = false;
        }

        if (strSourceType == "Contract")
        {
            NB_SourceID.Amount = 0;
            BT_SelectCS.Visible = true;

            TabContainer1.ActiveTabIndex = 10;

        }
        else
        {
            BT_SelectCS.Visible = false;
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }




    protected void DL_RecordSourceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        NB_RecordSourceID.Amount = 0;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_FindGoods_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strType, strGoodsCode, strGoodsName, strModelNumber, strSpec, strBrand;
        string strWareHouse;

        DataGrid4.CurrentPageIndex = 0;
        TabContainer1.ActiveTabIndex = 0;

        strType = DL_Type.SelectedValue.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();
        strBrand = TB_Manufacturer.Text.Trim();

        strType = "%" + strType + "%";
        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";
        strBrand = "%" + strBrand + "%";

        strWareHouse = TB_WHName.Text.Trim();

        strHQL = "Select * From T_Goods as goods Where goods.GoodsCode Like " + "'" + strGoodsCode + "'" + " and goods.GoodsName like " + "'" + strGoodsName + "'";
        strHQL += " and goods.Type Like " + "'" + strType + "'" + " and goods.ModelNumber Like " + "'" + strModelNumber + "'" + " and goods.Spec Like " + "'" + strSpec + "'";
        strHQL += " and goods.Manufacturer Like " + "'" + strBrand + "'";
        strHQL += " and Position = " + "'" + strWareHouse + "'";
        strHQL += " Order by goods.Number DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");
        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();

        LB_Sql4.Text = strHQL;

        strHQL = "Select * From T_Item as item Where item.ItemCode Like " + "'" + strGoodsCode + "'" + " and item.ItemName like " + "'" + strGoodsName + "'";
        strHQL += " and item.Specification Like " + "'" + strSpec + "'";
        strHQL += " and item.BigType = 'Goods'";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_Item");
        DataGrid9.DataSource = ds;
        DataGrid9.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_Clear_Click(object sender, EventArgs e)
    {
        TB_GoodsCode.Text = "";
        TB_GoodsName.Text = "";
        TB_ModelNumber.Text = "";
        TB_Spec.Text = "";

        IM_ItemPhoto.ImageUrl = "";
        HL_ItemPhoto.NavigateUrl = "";
        TB_PhotoURL.Text = "";

        NB_Number.Amount = 0;
        NB_Price.Amount = 0;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }


    protected void BT_TakePhoto_Click(object sender, EventArgs e)
    {
        Panel2.Visible = true;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_DeletePhoto_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strGoodsCode = TB_GoodsCode.Text.Trim();

        try
        {
            strHQL = "Update T_Goods Set PhotoURL = '' Where GoodsCode = " + "'" + strGoodsCode + "'";
            ShareClass.RunSqlCommand(strHQL);

            IM_ItemPhoto.ImageUrl = "";
            HL_ItemPhoto.NavigateUrl = "";


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_SavePhoto_Click(object sender, EventArgs e)
    {
        string strGoodsCode;
        string strGoodsPhotoString;

        strGoodsCode = TB_GoodsCode.Text.Trim();

        strGoodsPhotoString = TB_PhotoString1.Text.Trim();
        strGoodsPhotoString += TB_PhotoString2.Text.Trim();
        strGoodsPhotoString += TB_PhotoString3.Text.Trim();
        strGoodsPhotoString += TB_PhotoString4.Text.Trim();

        if (strGoodsPhotoString != "")
        {
            var binaryData = Convert.FromBase64String(strGoodsPhotoString);

            string strDateTime = DateTime.Now.ToString("yyyyMMddHHMMssff");
            string strGoodsPhotoURL = "Doc\\" + "UserPhoto\\" + strGoodsCode + strDateTime + ".jpg";
            var imageFilePath = Server.MapPath("Doc") + "\\UserPhoto\\" + strGoodsCode + strDateTime + ".jpg";

            if (File.Exists(imageFilePath))
            { File.Delete(imageFilePath); }
            var stream = new System.IO.FileStream(imageFilePath, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            stream.Write(binaryData, 0, binaryData.Length);
            stream.Close();

            string strHQL = "Update T_Goods Set PhotoURL = " + "'" + strGoodsPhotoURL + "'" + " Where GoodsCode = " + "'" + strGoodsCode + "'";
            ShareClass.RunSqlCommand(strHQL);

            IM_ItemPhoto.ImageUrl = strGoodsPhotoURL;
            HL_ItemPhoto.NavigateUrl = strGoodsPhotoURL;
            TB_PhotoURL.Text = strGoodsPhotoURL;
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_UploadPhoto_Click(object sender, EventArgs e)
    {
        //string strHQL;
        //string strPhotoURL = IM_ItemPhoto.ImageUrl;
        //string strGoodsCode = TB_GoodsCode.Text.Trim();

        //if (strPhotoURL != "" & strGoodsCode != "")
        //{
        //    strHQL = "Update T_Goods Set PhotoURL = " + "'" + strPhotoURL + "'" + " Where GoodsCode = " + "'" + strGoodsCode + "'";
        //    ShareClass.RunSqlCommand(strHQL);
        //}

        //if (this.FUP_File.PostedFile != null)
        //{
        //    string strFileName1 = FUP_File.PostedFile.FileName.Trim();
        //    string strLoginUserCode = Session["UserCode"].ToString().Trim();
        //    string strGoodsCode = TB_GoodsCode.Text.Trim();
        //    string strHQL;
        //    int i;

        //    if (strFileName1 != "")
        //    {
        //        //获取初始文件名
        //        i = strFileName1.LastIndexOf("."); //取得文件名中最后一个"."的索引
        //        string strNewExt = strFileName1.Substring(i); //获取文件扩展名

        //        DateTime dtUploadNow = DateTime.Now; //获取系统时间

        //        string strFileName2 = System.IO.Path.GetFileName(strFileName1);
        //        string strExtName = Path.GetExtension(strFileName2);
        //        strFileName2 = Path.GetFileNameWithoutExtension(strFileName2) + DateTime.Now.ToString("yyyyMMddHHMMssff") + strExtName;


        //        string strDocSavePath = Server.MapPath("Doc") + "\\UserPhoto\\";
        //        string strFileName3 = "Doc\\UserPhoto\\" + strFileName2;
        //        string strFileName4 = strDocSavePath + strFileName2;

        //        FileInfo fi = new FileInfo(strFileName4);

        //        if (fi.Exists)
        //        {
        //            fi.Delete();
        //        }

        //        try
        //        {
        //            FUP_File.PostedFile.SaveAs(strFileName4);

        //            strHQL = "Update T_Goods Set PhotoURL = " + "'" + strFileName3 + "'" + " Where GoodsCode = " + "'" + strGoodsCode + "'";
        //            ShareClass.RunSqlCommand(strHQL);

        //            IM_ItemPhoto.ImageUrl = strFileName3;
        //            HL_ItemPhoto.NavigateUrl = strFileName3;

        //            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        //        }
        //        catch
        //        {
        //            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        //        }
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZYSCDWJ + "')", true);
        //    }
        //}
        //else
        //{
        //    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZYSCDWJ + "')", true);
        //}


        // ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

    }

    protected string GetGoodsPhotoURL(string strGoodsCode, string strGoodsID)
    {
        string strHQL = " from Goods as goods where goods.GoodsCode = " + "'" + strGoodsCode + "'";
        if (strGoodsID != "0")
        {
            strHQL += " and goods.ID = " + strGoodsID;
        }

        GoodsBLL goodsBLL = new GoodsBLL();
        IList lst = goodsBLL.GetAllGoodss(strHQL);

        if (lst.Count > 0)
        {
            try
            {
                Goods goods = (Goods)lst[0];
                return goods.PhotoURL.Trim();
            }
            catch
            {
                return "";
            }
        }
        else
        {
            return "";
        }
    }


    protected void TreeView6_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strConstractID, strConstractCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView6.SelectedNode;

        if (treeNode.Target != "0")
        {
            strConstractCode = treeNode.Target.Trim();

            strConstractID = ShareClass.GetConstractID(strConstractCode).ToString();

            NB_RelatedID.Amount = int.Parse(strConstractID);
        }

        TreeView6.SelectedNode.Selected = false;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }


    protected void BT_CreateDetail_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        ShareClass.LoadWareHousePositions(TB_WHName.Text.Trim(), DL_WHPosition);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popDetailWindow') ", true);
    }


    protected void BT_NewDetail_Click(object sender, EventArgs e)
    {
        string strCIOID;

        strCIOID = LB_CheckInID.Text.Trim();

        if (strCIOID == "")
        {
            AddMain();
        }
        else
        {
            UpdateMain();
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
        string strHQL;

        string strCIOID, strOwnerCode, strType, strGoodsCode, strGoodsName, strSN, strModelNumber, strSpec, strManufacturer, strIP, strPosition, strMemo;
        string strSourceType, strSourceID, strSourceRelatedID, strCurrencyType, strIsTaxPrice;
        DateTime dtBuyTime;
        decimal dePrice;
        int intWarrantyPeriod;

        string strUserCode = LB_UserCode.Text;

        string strUnitName;
        decimal deNumber;

        strCIOID = LB_CheckInID.Text.Trim();
        strOwnerCode = LB_OwnerCode.Text.Trim();
        strType = DL_Type.SelectedValue.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strSN = TB_SN.Text.Trim();
        deNumber = NB_Number.Amount;
        strUnitName = DL_Unit.SelectedValue.Trim();
        strSpec = TB_Spec.Text.Trim();
        strManufacturer = TB_Manufacturer.Text.Trim();
        strPosition = TB_WHName.Text.Trim();

        dePrice = NB_Price.Amount;

        if (CB_IsTaxPrice.Checked)
        {
            strIsTaxPrice = "YES";
        }
        else
        {
            strIsTaxPrice = "NO";
        }

        strCurrencyType = DL_CurrencyType.SelectedValue.Trim();
        intWarrantyPeriod = int.Parse(NB_WarrantyPeriod.Amount.ToString());

        dtBuyTime = DateTime.Parse(DLC_BuyTime.Text);
        strMemo = TB_Memo.Text.Trim();


        strSourceRelatedID = LB_SourceRelatedID.Text.Trim();
        strSourceType = DL_RecordSourceType.SelectedValue.Trim();
        strSourceID = NB_RecordSourceID.Amount.ToString();

        if (strSourceType == "GoodsPJRecord")
        {
            if (!ShareClass.checkRequireNumberIsMoreHaveNumberForProjectRelatedItemNumber(strSourceID, "AleadyCheckIn", deNumber))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click2333", "alert('提示，入库量超出需求量，请检查！')", true);
            }
        }

        if (strOwnerCode == "" | strType == "" | strGoodsCode == "" | strSpec == "" | strPosition == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click3432424234", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

        }
        else
        {
            GoodsCheckInOrderDetailBLL goodsCheckInOrderDetailBLL = new GoodsCheckInOrderDetailBLL();
            GoodsCheckInOrderDetail goodsCheckInOrderDetail = new GoodsCheckInOrderDetail();

            goodsCheckInOrderDetail.CheckInID = int.Parse(strCIOID);
            goodsCheckInOrderDetail.GoodsCode = strGoodsCode;
            goodsCheckInOrderDetail.GoodsName = strGoodsName;

            if (strSN == "")
            {
                //strSN = strGoodsCode;
            }

            goodsCheckInOrderDetail.SN = strSN;

            goodsCheckInOrderDetail.Number = deNumber;
            goodsCheckInOrderDetail.CheckInNumber = deNumber;
            goodsCheckInOrderDetail.UnitName = strUnitName;
            goodsCheckInOrderDetail.OwnerCode = strOwnerCode;


            try
            {
                goodsCheckInOrderDetail.OwnerName = ShareClass.GetUserName(strOwnerCode);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBGRDMCCCWCRJC + "')", true);
                return;
            }
            goodsCheckInOrderDetail.Type = strType;
            goodsCheckInOrderDetail.Spec = strSpec;
            goodsCheckInOrderDetail.ModelNumber = strModelNumber;
            goodsCheckInOrderDetail.Position = strPosition;
            goodsCheckInOrderDetail.WHPosition = DL_WHPosition.SelectedValue.Trim();

            goodsCheckInOrderDetail.Price = dePrice;
            goodsCheckInOrderDetail.IsTaxPrice = strIsTaxPrice;
            goodsCheckInOrderDetail.Amount = deNumber * dePrice;
            goodsCheckInOrderDetail.CurrencyType = DL_CurrencyType.SelectedValue.Trim();
            goodsCheckInOrderDetail.WarrantyPeriod = intWarrantyPeriod;

            goodsCheckInOrderDetail.BuyTime = dtBuyTime;
            goodsCheckInOrderDetail.Supplier = TB_Supplier.Text.Trim();
            goodsCheckInOrderDetail.Manufacturer = strManufacturer;

            goodsCheckInOrderDetail.Memo = strMemo;
            goodsCheckInOrderDetail.Status = "在用";

            if (strSourceRelatedID == "")
            {
                goodsCheckInOrderDetail.RelatedID = 0;
                strSourceRelatedID = "0";
            }
            else
            {
                goodsCheckInOrderDetail.RelatedID = int.Parse(strSourceRelatedID);
            }
            if (strSourceType == "")
            {
                goodsCheckInOrderDetail.SourceType = "Other";
            }
            else
            {
                goodsCheckInOrderDetail.SourceType = strSourceType;
            }
            if (strSourceID == "")
            {
                goodsCheckInOrderDetail.SourceID = 0;
                strSourceID = "0";
            }
            else
            {
                goodsCheckInOrderDetail.SourceID = int.Parse(strSourceID);
            }

            goodsCheckInOrderDetail.ToGoodsID = 0;

            try
            {
                goodsCheckInOrderDetailBLL.AddGoodsCheckInOrderDetail(goodsCheckInOrderDetail);

                LB_ID.Text = ShareClass.GetMyCreatedMaxGoodsCheckInDetailID(strCIOID).ToString();

                BT_TakePhoto.Enabled = true;
                BT_DeletePhoto.Enabled = true;

                NB_Amount.Amount = SumGoodsCheckInOrderAmount(strCIOID);
                strHQL = "Update T_GoodsCheckInOrder Set Amount = " + NB_Amount.Amount.ToString();
                strHQL += " Where CheckInID = " + strCIOID;
                ShareClass.RunSqlCommand(strHQL);

                //更新入库单明细的其它属性
                UpdateGoodsCheckInDetailForOtherColumn(LB_ID.Text);

                //更新相关单据入库数量
                ShareClass.UpdateGoodsRelatedBusinessNubmer(DL_RelatedType.SelectedValue.Trim(), NB_RelatedID.Amount.ToString(), goodsCheckInOrderDetail.GoodsCode.Trim(), strSourceType, strSourceID, DataGrid21);

                LoadGoodsCheckInOrderDetail(strCIOID);
                LoadGoodsPurchaseOrderRecord(LB_POID.Text.Trim());

                string strConstractCode = LB_ConstractCode.Text.Trim();
                if (strConstractCode != "")
                {
                    LoadConstractRelatedGoodsList(strConstractCode);
                }

                string strCountMethod = ShareClass.GetGoodsStockCountMethod(TB_WHName.Text.Trim());
                string strPhotoURL = HL_ItemPhoto.NavigateUrl.Trim();

                string strBatchNumber, strProductDate, strExpiryDate, strProductionEquipmentNumber, strMaterialFormNumber;
                strBatchNumber = TB_BatchNumber.Text.Trim();
                strProductDate = DLC_ProductionDate.Text;
                strExpiryDate = DLC_ExpiryDate.Text;
                strProductionEquipmentNumber = TB_ProductionEquipmentNumber.Text.Trim();
                strMaterialFormNumber = TB_MaterialFormNumber.Text.Trim();

                //添加相同记录到物料表
                ShareClass.addOrUpdateGoods(strCountMethod, "0", strCIOID, strGoodsCode, strGoodsName, strSN, deNumber, strUnitName,
                    strOwnerCode, strType, strSpec, strModelNumber, strPosition, DL_WHPosition.SelectedValue.Trim(), dePrice, strIsTaxPrice,  strCurrencyType, dtBuyTime, intWarrantyPeriod,
                    strManufacturer, strMemo, LB_ID.Text, strPhotoURL, 0, 0,
                    strBatchNumber, DateTime.Parse(strProductDate), DateTime.Parse(strExpiryDate), strProductionEquipmentNumber, strMaterialFormNumber);

                //保存产品图片
                UpdateGoodsPhoto(LB_ID.Text);


                IM_ItemPhoto.ImageUrl = "";
                HL_ItemPhoto.NavigateUrl = "";
                TB_PhotoURL.Text = "";

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
            catch (Exception err)
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }
        }
    }

    protected void UpdateDetail()
    {
        string strCIOID, strID, strOwnerCode, strType, strGoodsCode, strGoodsName, strModelNumber, strSpec, strSN, strManufacturer, strPosition, strMemo;
        string strSourceType, strSourceID, strSourceRelatedID, strCurrencyType, strIsTaxPrice;
        DateTime dtBuyTime;
        decimal dePrice;

        string strUserCode = LB_UserCode.Text;
        string strHQL;
        string strUnitName;
        decimal deNumber;
        int intWarrantyPeriod;

        IList lst;

        strCIOID = LB_CheckInID.Text.Trim();
        strID = LB_ID.Text.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strOwnerCode = LB_OwnerCode.Text.Trim();
        strSN = TB_SN.Text.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strType = DL_Type.SelectedValue.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        deNumber = NB_Number.Amount;
        strUnitName = DL_Unit.SelectedValue.Trim();
        strSpec = TB_Spec.Text.Trim();
        strManufacturer = TB_Manufacturer.Text.Trim();
        strPosition = TB_WHName.Text.Trim();

        dePrice = NB_Price.Amount;

        if (CB_IsTaxPrice.Checked)
        {
            strIsTaxPrice = "YES";
        }
        else
        {
            strIsTaxPrice = "NO";
        }

        strCurrencyType = DL_CurrencyType.SelectedValue.Trim();

        dtBuyTime = DateTime.Parse(DLC_BuyTime.Text);
        strMemo = TB_Memo.Text.Trim();
        intWarrantyPeriod = int.Parse(NB_WarrantyPeriod.Amount.ToString());

        strSourceRelatedID = LB_SourceRelatedID.Text.Trim();
        strSourceType = DL_RecordSourceType.SelectedValue.Trim();
        strSourceID = NB_RecordSourceID.Amount.ToString();

        if (strSourceType == "GoodsPJRecord")
        {
            if (!ShareClass.checkRequireNumberIsMoreHaveNumberForProjectRelatedItemNumber(strSourceID, "AleadyCheckIn", deNumber))
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click2333", "alert('提示，入库量超出需求量，请检查！')", true);
            }
        }

        if (strOwnerCode == "" | strType == "" | strGoodsCode == "" | strSpec == "" | strPosition == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickDFFASDDFASF", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

        }
        else
        {
            GoodsCheckInOrderDetailBLL goodsCheckInOrderDetailBLL = new GoodsCheckInOrderDetailBLL();
            strHQL = "from GoodsCheckInOrderDetail as goodsCheckInOrderDetail where goodsCheckInOrderDetail.ID = " + strID;
            lst = goodsCheckInOrderDetailBLL.GetAllGoodsCheckInOrderDetails(strHQL);
            GoodsCheckInOrderDetail goodsCheckInOrderDetail = (GoodsCheckInOrderDetail)lst[0];

            goodsCheckInOrderDetail.ID = int.Parse(strID);
            goodsCheckInOrderDetail.CheckInID = int.Parse(strCIOID);
            goodsCheckInOrderDetail.GoodsCode = strGoodsCode;
            goodsCheckInOrderDetail.GoodsName = strGoodsName;
            if (strSN == "")
            {
                //strSN = strGoodsCode;
            }
            goodsCheckInOrderDetail.SN = strSN;
            goodsCheckInOrderDetail.Number = deNumber;
            goodsCheckInOrderDetail.CheckInNumber = deNumber;
            goodsCheckInOrderDetail.UnitName = strUnitName;
            goodsCheckInOrderDetail.OwnerCode = strOwnerCode;
            try
            {
                goodsCheckInOrderDetail.OwnerName = ShareClass.GetUserName(strOwnerCode);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBGRDMCCCWCRJC + "')", true);
                return;
            }

            goodsCheckInOrderDetail.Type = strType;
            goodsCheckInOrderDetail.ModelNumber = strModelNumber;
            goodsCheckInOrderDetail.Spec = strSpec;
            goodsCheckInOrderDetail.Position = strPosition;
            goodsCheckInOrderDetail.WHPosition = DL_WHPosition.SelectedValue.Trim();


            goodsCheckInOrderDetail.Price = dePrice;
            goodsCheckInOrderDetail.IsTaxPrice = strIsTaxPrice;
            goodsCheckInOrderDetail.Amount = deNumber * dePrice;

            goodsCheckInOrderDetail.CurrencyType = DL_CurrencyType.SelectedValue.Trim();

            goodsCheckInOrderDetail.Supplier = TB_Supplier.Text.Trim();
            goodsCheckInOrderDetail.Manufacturer = strManufacturer;
            goodsCheckInOrderDetail.WarrantyPeriod = intWarrantyPeriod;

            goodsCheckInOrderDetail.Memo = strMemo;
            goodsCheckInOrderDetail.BuyTime = dtBuyTime;

            if (strSourceRelatedID == "")
            {
                goodsCheckInOrderDetail.RelatedID = 0;
                strSourceRelatedID = "0";
            }
            else
            {
                goodsCheckInOrderDetail.RelatedID = int.Parse(strSourceRelatedID);
            }

            if (strSourceType == "")
            {
                goodsCheckInOrderDetail.SourceType = "Other";
            }
            else
            {
                goodsCheckInOrderDetail.SourceType = strSourceType;
            }
            if (strSourceID == "")
            {
                goodsCheckInOrderDetail.SourceID = 0;
                strSourceID = "0";
            }
            else
            {
                goodsCheckInOrderDetail.SourceID = int.Parse(strSourceID);
            }


            try
            {
                goodsCheckInOrderDetailBLL.UpdateGoodsCheckInOrderDetail(goodsCheckInOrderDetail, int.Parse(strID));

                NB_Amount.Amount = SumGoodsCheckInOrderAmount(strCIOID);
                strHQL = "Update T_GoodsCheckInOrder Set Amount = " + NB_Amount.Amount.ToString();
                strHQL += " Where CheckInID = " + strCIOID;
                ShareClass.RunSqlCommand(strHQL);

                //更新入库单明细的其它属性
                UpdateGoodsCheckInDetailForOtherColumn(strID);

                //更新相关单据入库数量
                ShareClass.UpdateGoodsRelatedBusinessNubmer(DL_RelatedType.SelectedValue.Trim(), NB_RelatedID.Amount.ToString(), goodsCheckInOrderDetail.GoodsCode.Trim(), strSourceType, strSourceID, DataGrid21);

                LoadGoodsPurchaseOrderRecord(LB_POID.Text.Trim());
                LoadGoodsCheckInOrderDetail(strCIOID);

                if (strSourceType == "GoodsCSRecord")
                {
                    string strConstractCode = LB_ConstractCode.Text.Trim();
                    if (strConstractCode != "")
                    {
                        LoadConstractRelatedGoodsList(strConstractCode);
                    }
                }


                //添加相同记录到物料明细表
                string strGoodsID = goodsCheckInOrderDetail.ToGoodsID.ToString();
                string strCountMethod = ShareClass.GetGoodsStockCountMethod(TB_WHName.Text.Trim());
                string strPhotoURL = HL_ItemPhoto.NavigateUrl.Trim();
                //取得原来的数量和价格
                decimal deOldCheckInNumber = goodsCheckInOrderDetail.Number;
                decimal deOldCheckInPrice = goodsCheckInOrderDetail.Price;

                string strBatchNumber, strProductDate, strExpiryDate, strProductionEquipmentNumber, strMaterialFormNumber;
                strBatchNumber = TB_BatchNumber.Text.Trim();
                strProductDate = DLC_ProductionDate.Text;
                strExpiryDate = DLC_ExpiryDate.Text;
                strProductionEquipmentNumber = TB_ProductionEquipmentNumber.Text.Trim();
                strMaterialFormNumber = TB_MaterialFormNumber.Text.Trim();

                ShareClass.addOrUpdateGoods(strCountMethod, strGoodsID, strCIOID, strGoodsCode, strGoodsName, strSN, deNumber, strUnitName,
                   strOwnerCode, strType, strSpec, strModelNumber, strPosition, DL_WHPosition.SelectedValue.Trim(), dePrice, strIsTaxPrice, strCurrencyType, dtBuyTime, intWarrantyPeriod,
                   strManufacturer, strMemo, strID, strPhotoURL, deOldCheckInNumber, deOldCheckInPrice,
                    strBatchNumber, DateTime.Parse(strProductDate), DateTime.Parse(strExpiryDate), strProductionEquipmentNumber, strMaterialFormNumber);

                //保存产品图片
                UpdateGoodsPhoto(LB_ID.Text);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
            catch (Exception err)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click3444", "alert('" + err.Message.ToString() + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }
        }
    }

    //更新入库单明细的其它属性
    protected void UpdateGoodsCheckInDetailForOtherColumn(string strCIODetailID)
    {
        string strHQL;

        string strBatchNumber, strProductDate, strExpiryDate, strProductionEquipmentNumber, strMaterialFormNumber;

        strBatchNumber = TB_BatchNumber.Text.Trim();
        strProductDate = DLC_ProductionDate.Text;
        strExpiryDate = DLC_ExpiryDate.Text;
        strProductionEquipmentNumber = TB_ProductionEquipmentNumber.Text.Trim();
        strMaterialFormNumber = TB_MaterialFormNumber.Text.Trim();

        strHQL = String.Format(@"Update T_GoodsCheckInOrderDetail Set BatchNumber = '{0}',ProductDate = cast('{1}' as date),ExpiryDate = cast('{2}' as date),ProductionEquipmentNumber = '{3}',MaterialFormNumber = '{4}' Where ID = {5}", strBatchNumber, strProductDate, strExpiryDate, strProductionEquipmentNumber, strMaterialFormNumber, strCIODetailID);
        ShareClass.RunSqlCommand(strHQL);
    }


    protected void UpdateGoodsPhoto(string strCheckInDetailID)
    {
        string strHQL;
        string strPhotoURL = TB_PhotoURL.Text.Trim();
        string strGoodsCode = TB_GoodsCode.Text.Trim();

        if (strPhotoURL != "" & strGoodsCode != "")
        {
            strHQL = "Update T_Goods Set PhotoURL = " + "'" + strPhotoURL + "'" + " Where GoodsCode = " + "'" + strGoodsCode + "'";
            strHQL += " and CheckInDetailID = " + strCheckInDetailID;

            ShareClass.RunSqlCommand(strHQL);
        }
    }

    public void addGoodsCheckInOrderDetail(string strCIOID, string strGoodsCode, string strGoodsName, string strSN, decimal deNumber, string strUnitName,
          string strOwnerCode, string strType, string strSpec, string strModelNumber, string strPosition, string strIP, decimal dePrice, string strIsTaxPrice, DateTime dtBuyTime, int intWarrantyPeriod,
          string strManufacturer, string strMemo, string strGoodsID)
    {
        GoodsCheckInOrderDetailBLL goodsCheckInOrderDetailBLL = new GoodsCheckInOrderDetailBLL();
        GoodsCheckInOrderDetail goodsCheckInOrderDetail = new GoodsCheckInOrderDetail();

        goodsCheckInOrderDetail.CheckInID = int.Parse(strCIOID);
        goodsCheckInOrderDetail.GoodsCode = strGoodsCode;
        goodsCheckInOrderDetail.GoodsName = strGoodsName;
        goodsCheckInOrderDetail.SN = strSN;
        goodsCheckInOrderDetail.Number = deNumber;
        goodsCheckInOrderDetail.CheckInNumber = deNumber;
        goodsCheckInOrderDetail.UnitName = strUnitName;
        goodsCheckInOrderDetail.OwnerCode = strOwnerCode;
        try
        {
            goodsCheckInOrderDetail.OwnerName = ShareClass.GetUserName(strOwnerCode);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBGRDMCCCWCRJC + "')", true);
            return;
        }
        goodsCheckInOrderDetail.Type = strType;
        goodsCheckInOrderDetail.Spec = strSpec;
        goodsCheckInOrderDetail.ModelNumber = strModelNumber;
        goodsCheckInOrderDetail.Position = strPosition;
        goodsCheckInOrderDetail.IP = strIP;
        goodsCheckInOrderDetail.Price = dePrice;
        goodsCheckInOrderDetail.IsTaxPrice = strIsTaxPrice;
        goodsCheckInOrderDetail.BuyTime = dtBuyTime;
        goodsCheckInOrderDetail.Manufacturer = strManufacturer;
        goodsCheckInOrderDetail.WarrantyPeriod = intWarrantyPeriod;
        goodsCheckInOrderDetail.Memo = strMemo;
        goodsCheckInOrderDetail.Status = "在用";

        try
        {
            goodsCheckInOrderDetailBLL.AddGoodsCheckInOrderDetail(goodsCheckInOrderDetail);
        }
        catch
        {
        }
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql2.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurchaseOrder");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }


    protected void DataGrid4_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid4.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql4.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");
        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql5.Text;

        GoodsCheckInOrderBLL goodsCheckInOrderBLL = new GoodsCheckInOrderBLL();
        IList lst = goodsCheckInOrderBLL.GetAllGoodsCheckInOrders(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected decimal SumGoodsCheckInOrderAmount(string strCIOID)
    {
        string strHQL;

        decimal deAmount = 0;

        strHQL = "Select Sum(CheckInNumber * Price) From T_GoodsCheckInOrderDetail Where CheckInID = " + strCIOID;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsCheckInOrderDetail");

        deAmount = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());

        return deAmount;
    }

    protected void LoadGoodsSupplyOrderForPurchase(string strOperatorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsSupplyOrder as goodsSupplyOrder where goodsSupplyOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
        strHQL += " Order by goodsSupplyOrder.SUID DESC";
        GoodsSupplyOrderBLL goodsSupplyOrderBLL = new GoodsSupplyOrderBLL();
        lst = goodsSupplyOrderBLL.GetAllGoodsSupplyOrders(strHQL);

        DataGrid13.DataSource = lst;
        DataGrid13.DataBind();
    }

    protected void LoadGoodsReturnOrder(string strFormType, DataGrid dataGrid)
    {
        string strHQL;
        IList lst;

        strHQL = "From GoodsReturnOrder as goodsReturnOrder Where goodsReturnOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
        strHQL += " and Type = " + "'" + strFormType + "'";
        strHQL += " Order By goodsReturnOrder.ROID DESC";
        GoodsReturnOrderBLL goodsReturnOrderBLL = new GoodsReturnOrderBLL();
        lst = goodsReturnOrderBLL.GetAllGoodsReturnOrders(strHQL);

        dataGrid.DataSource = lst;
        dataGrid.DataBind();
    }


    protected void LoadGoodsReturnDetail(string strROID, DataGrid dataGrid)
    {
        string strHQL;
        IList lst;

        strHQL = "From GoodsReturnDetail as goodsReturnDetail Where goodsReturnDetail.ROID = " + strROID + " Order By goodsReturnDetail.ID ASC";
        GoodsReturnDetailBLL goodsReturnDetailBLL = new GoodsReturnDetailBLL();
        lst = goodsReturnDetailBLL.GetAllGoodsReturnDetails(strHQL);

        dataGrid.DataSource = lst;
        dataGrid.DataBind();
    }

    protected void LoadGoodsCheckInOrderDetail(string strCheckInID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsCheckInOrderDetail as goodsCheckInOrderDetail where goodsCheckInOrderDetail.CheckInID = " + strCheckInID;
        strHQL += " Order by goodsCheckInOrderDetail.Number DESC,goodsCheckInOrderDetail.ID DESC";
        GoodsCheckInOrderDetailBLL goodsCheckInOrderDetailBLL = new GoodsCheckInOrderDetailBLL();
        lst = goodsCheckInOrderDetailBLL.GetAllGoodsCheckInOrderDetails(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }


    protected void LoadGoodsCheckInOrder(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From GoodsCheckInOrder as goodsCheckInOrder where (goodsCheckInOrder.CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " or goodsCheckInOrder.CreatorCode in (select  memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")) ";
        strHQL += " Order By goodsCheckInOrder.CheckInID DESC";
        GoodsCheckInOrderBLL goodsCheckInOrderBLL = new GoodsCheckInOrderBLL();
        lst = goodsCheckInOrderBLL.GetAllGoodsCheckInOrders(strHQL);
        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }

    protected void LoadGoodsPurchaseOrder(string strOperatorCode)
    {
        string strHQL;

        strHQL = "Select * from T_GoodsPurchaseOrder where OperatorCode in ( Select UserCode From T_ProjectMember Where DepartCode in " + LB_DepartString.Text.Trim() + ")";
        strHQL += " Order by POID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurchaseOrder");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void LoadGoodsProductionOrder(string strOperatorCode)
    {
        string strHQL;

        strHQL = " Select * From T_GoodsProductionOrder Where CreatorCode in ( Select UserCode From T_ProjectMember Where DepartCode in " + LB_DepartString.Text.Trim() + ")";
        strHQL += " Order By PDID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsProductionOrder");

        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();
    }

    protected void LoadGoodsProductionOrderDetail(string strPDID)
    {
        LB_PDID.Text = strPDID;

        string strHQL = "Select * from T_GoodsProductionOrderDetail where PDID = " + strPDID + " Order by ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsProductionOrderDetail");

        DataGrid7.DataSource = ds;
        DataGrid7.DataBind();
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
    }

    protected void LoadGoodsSupplyOrderDetail(string strSUID)
    {
        string strHQL = "Select * from T_GoodsSupplyOrderDetail where SUID = " + strSUID + " Order by ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSupplyOrderDetail");

        DataGrid8.DataSource = ds;
        DataGrid8.DataBind();
    }


    protected void LoadWareHouseListByAuthority(string strUserCode)
    {
        string strHQL;
        string strDepartCode, strDepartString;

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strHQL = " Select WHName From T_WareHouse Where ";
        strHQL += " BelongDepartCode in " + strDepartString;
        strHQL += " Order By SortNumber DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WareHouse");

        //DL_WareHouse.DataSource = ds;
        //DL_WareHouse.DataBind();
    }
    protected void LoadItemMainPlan(string strUserCode)
    {
        string strHQL;

        strHQL = "Select * From T_ItemMainPlan Where CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " Or CreatorCode in (Select UserCode From T_ProjectMember Where DepartCode in  " + LB_DepartString.Text.Trim() + ")";
        strHQL += " Order By PlanVerID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlan");

        DataGrid18.DataSource = ds;
        DataGrid18.DataBind();
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

        DataGrid17.DataSource = lst;
        DataGrid17.DataBind();
    }

    protected void LoadConstractRelatedGoodsList(string strConstractCode)
    {
        string strHQL;
        IList lst;

        ConstractRelatedGoodsBLL constractRelatedGoodsBLL = new ConstractRelatedGoodsBLL();
        strHQL = "from ConstractRelatedGoods as constractRelatedGoods where constractRelatedGoods.ConstractCode = " + "'" + strConstractCode + "'";
        lst = constractRelatedGoodsBLL.GetAllConstractRelatedGoodss(strHQL);

        DataGrid19.DataSource = lst;
        DataGrid19.DataBind();
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

        DataGrid20.DataSource = lst;
        DataGrid20.DataBind();
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

}
