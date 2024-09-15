

using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using TakeTopCore;

public partial class TTGoodsTransferOrder : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserName;

        strUserCode = Session["UserCode"].ToString();

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "资产登记入库", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_ShipTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
            LB_DepartString.Text = strDepartString;

            ShareClass.InitialWarehouseTreeByAuthorityAsset(TreeView3, strUserCode, strDepartString);
            ShareClass.InitialWarehouseTreeByAuthorityAsset(TreeView2, strUserCode, strDepartString);

            strHQL = "from JNUnit as jnUnit order by jnUnit.SortNumber ASC";
            JNUnitBLL jnUnitBLL = new JNUnitBLL();
            lst = jnUnitBLL.GetAllJNUnits(strHQL);
            DL_Unit.DataSource = lst;
            DL_Unit.DataBind();

            strHQL = "from GoodsType as goodsType Order by goodsType.SortNumber ASC";
            GoodsTypeBLL goodsTypeBLL = new GoodsTypeBLL();
            lst = goodsTypeBLL.GetAllGoodsTypes(strHQL);
            DL_GoodsType.DataSource = lst;
            DL_GoodsType.DataBind();
            DL_GoodsType.Items.Insert(0, new ListItem("--Select--", ""));

            ShareClass.LoadCurrencyType(DL_CurrencyType);
            LoadGoodsShipmentOrder(strUserCode);
            LoadGoodsProductionOrder(strUserCode);

            ShareClass.InitialInvolvedProjectTree(TreeView1, strUserCode);
            ShareClass.LoadCustomer(DL_Customer, strUserCode);
        }
    }

    protected void BT_FindAll_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strWareHouse, strCustomerName;


        strWareHouse = "%" + TB_FindWareHouse.Text.Trim() + "%";
        strCustomerName = "%" + TB_CustomerName.Text.Trim() + "%";

        strHQL = "Select * From T_GoodsShipmentOrder Where (OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " or OperatorCode in (select UnderCode from T_MemberLevel where UserCode = " + "'" + strUserCode + "'" + ")) ";
        strHQL += " and ShipmentType = 'Transfer'";
        strHQL += " and WareHouse Like '" + strWareHouse + "' And CustomerName Like '" + strCustomerName + "'";
        strHQL += " Order By ShipmentNO DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentOrder");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }

    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode treeNode = new TreeNode();
        treeNode = TreeView3.SelectedNode;

        if (treeNode.Target != "")
        {
            TB_WHName.Text = treeNode.Target.Trim();

            LoadAllGoodsByWareHouse(TB_WHName.Text);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "")
        {
            try
            {
                DL_InWareHouse.SelectedValue = treeNode.Target.Trim();
            }
            catch
            {

            }

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

        if (strSourceType == "GoodsPD")
        {
            NB_SourceID.Amount = 0;
            BT_SelectPD.Visible = true;
            TabContainer1.ActiveTabIndex = 7;
        }
        else
        {
            BT_SelectPD.Visible = false;
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void DL_RelatedType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strRelatedType;

        strRelatedType = DL_RelatedType.SelectedValue.Trim();

        if (strRelatedType == "Other")
        {
            NB_RelatedID.Amount = 0;
        }

        if (strRelatedType == "Project")
        {
            BT_RelatedProject.Visible = true;
            NB_RelatedID.Visible = true;
        }
        else
        {
            BT_RelatedProject.Visible = false;
            NB_RelatedID.Visible = false;
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid18_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strPDID;

            TabContainer1.ActiveTabIndex = 7;

            strPDID = ((Button)e.Item.FindControl("BT_PDID")).Text.Trim();

            for (int i = 0; i < DataGrid18.Items.Count; i++)
            {
                DataGrid18.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            LoadGoodsProductionOrderDetail(strPDID);

            LB_PDID.Text = strPDID;
            NB_SourceID.Amount = int.Parse(strPDID);

            HL_GoodsMaterialIssueOrder.NavigateUrl = "TTGoodsIssueOrderViewForProduction.aspx?PDID=" + strPDID;

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
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DataGrid5_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strShipmentNO, strRelatedType;

            strShipmentNO = e.Item.Cells[2].Text.Trim();
            LB_ShipmentNO.Text = strShipmentNO;

            if (e.CommandName == "Update")
            {
                for (int i = 0; i < DataGrid5.Items.Count; i++)
                {
                    DataGrid5.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "From GoodsShipmentOrder as goodsShipmentOrder Where goodsShipmentOrder.ShipmentNO = " + strShipmentNO;
                GoodsShipmentOrderBLL goodsShipmentOrderBLL = new GoodsShipmentOrderBLL();
                lst = goodsShipmentOrderBLL.GetAllGoodsShipmentOrders(strHQL);

                GoodsShipmentOrder goodsShipmentOrder = (GoodsShipmentOrder)lst[0];

                LB_ShipmentNO.Text = strShipmentNO;

                if (goodsShipmentOrder.ShipmentType.Trim() == "")
                {
                    DL_ShipmentType.SelectedValue = goodsShipmentOrder.ShipmentType.Trim();
                }
                else
                {
                    DL_ShipmentType.SelectedValue = goodsShipmentOrder.ShipmentType;
                }

                TB_GSHOName.Text = goodsShipmentOrder.GSHOName.Trim();
                TB_WHName.Text = goodsShipmentOrder.WareHouse.Trim();
                DLC_ShipTime.Text = goodsShipmentOrder.ShipTime.ToString("yyyy-MM-dd");
                TB_ShipmentReason.Text = goodsShipmentOrder.ApplicationReason.Trim();
                TB_Applicant.Text = goodsShipmentOrder.Applicant.Trim();
                DL_RelatedType.SelectedValue = goodsShipmentOrder.RelatedType.Trim();
                NB_RelatedID.Amount = goodsShipmentOrder.RelatedID;
                TB_RelatedCode.Text = goodsShipmentOrder.RelatedCode;

                try
                {
                    DL_Customer.SelectedValue = goodsShipmentOrder.CustomerCode;
                }
                catch
                {
                }

                DL_CurrencyType.SelectedValue = goodsShipmentOrder.CurrencyType;

                LoadGoodsShipmentDetail(strShipmentNO);

                strRelatedType = goodsShipmentOrder.RelatedType.Trim();
                if (strRelatedType == "项目")
                {
                    BT_RelatedProject.Visible = true;
                }
                else
                {
                    BT_RelatedProject.Visible = false;
                }

                if (e.CommandName == "Update")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }
            }

            if (e.CommandName == "Delete")
            {
                string strFromGoodsID;
                decimal deOldNumber;

                try
                {
                    strHQL = "Delete From T_GoodsShipmentOrder Where ShipmentNO = " + strShipmentNO;
                    ShareClass.RunSqlCommand(strHQL);

                    strHQL = "Select Number,FromGoodsID From T_GoodsShipmentDetail Where ShipmentNO = " + strShipmentNO;
                    DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentDetail");

                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        strFromGoodsID = ds.Tables[0].Rows[i][1].ToString();
                        deOldNumber = decimal.Parse(ds.Tables[0].Rows[i][0].ToString());

                        ShareClass.UpdateGoodsNumberForDelete(strFromGoodsID, deOldNumber);
                    }

                    strHQL = "Delete From T_GoodsShipmentDetail Where ShipmentNO = " + strShipmentNO;
                    ShareClass.RunSqlCommand(strHQL);

                    LoadGoodsShipmentOrder(strUserCode);
                    LoadGoodsShipmentDetail(strShipmentNO);

                    LB_ShipmentNO.Text = "0";
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCCKNCZMXJLJC + "')", true);
                }
            }
        }
    }

    protected void DL_WareHouse_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strWareHouse;

        strWareHouse = TB_WHName.Text.Trim();
        LoadAllGoodsByWareHouse(strWareHouse);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
    }

    protected void DL_InWareHouse_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShareClass.LoadWareHousePositions(DL_InWareHouse.SelectedValue.Trim(),DL_WHPosition);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }


    protected void BT_CreateMain_Click(object sender, EventArgs e)
    {
        LB_ShipmentNO.Text = "";

        BT_NewMain.Visible = true;
        BT_NewDetail.Visible = true;

        DLC_ShipTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

        string strNewCOOCode = ShareClass.GetCodeByRule("TransferOrderCode", "TransferOrderCode", "00");
        if (strNewCOOCode != "")
        {
            TB_GSHOName.Text = strNewCOOCode;
        }


        LoadGoodsShipmentDetail("0");

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void BT_NewMain_Click(object sender, EventArgs e)
    {
        string strShipmentNO;

        strShipmentNO = LB_ShipmentNO.Text.Trim();

        if (strShipmentNO == "")
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
        string strShipmentNO, strWareHouse, strApplicant, strShipReason, strRelatedType, strSourceType, strSourceID, strCurrencyType, strRelatedCode, strCustomerCode, strCustomerName, strGSHOName;
        DateTime dtShipTime;
        int intRelatedID;

        strGSHOName = TB_GSHOName.Text.Trim();
        strWareHouse = TB_WHName.Text.Trim();
        dtShipTime = DateTime.Parse(DLC_ShipTime.Text);
        strApplicant = TB_Applicant.Text.Trim();
        strShipReason = TB_ShipmentReason.Text.Trim();

        strRelatedType = DL_RelatedType.SelectedValue.Trim();
        intRelatedID = int.Parse(NB_RelatedID.Amount.ToString());
        strRelatedCode = TB_RelatedCode.Text.Trim();

        strSourceType = DL_SourceType.SelectedValue.Trim();
        strSourceID = NB_SourceID.Amount.ToString();

        strCustomerCode = DL_Customer.SelectedValue;
        if (strCustomerCode != "")
        {
            strCustomerName = DL_Customer.SelectedItem.Text;
        }
        else
        {
            strCustomerName = "";
        }

        strCurrencyType = DL_CurrencyType.SelectedValue.Trim();

        try
        {
            GoodsShipmentOrderBLL goodsShipmentOrderBLL = new GoodsShipmentOrderBLL();
            GoodsShipmentOrder goodsShipmentOrder = new GoodsShipmentOrder();

            goodsShipmentOrder.GSHOName = strGSHOName;
            goodsShipmentOrder.ShipmentType = DL_ShipmentType.SelectedValue.Trim();
            goodsShipmentOrder.WareHouse = strWareHouse;
            goodsShipmentOrder.Applicant = strApplicant;
            goodsShipmentOrder.ShipTime = dtShipTime;
            goodsShipmentOrder.ApplicationReason = strShipReason;
            goodsShipmentOrder.RelatedType = strRelatedType;
            goodsShipmentOrder.RelatedID = intRelatedID;
            goodsShipmentOrder.RelatedCode = strRelatedCode;

            goodsShipmentOrder.CustomerCode = strCustomerCode;
            goodsShipmentOrder.CustomerName = strCustomerName;

            goodsShipmentOrder.OperatorCode = strUserCode;
            goodsShipmentOrder.OperatorName = ShareClass.GetUserName(strUserCode);
            goodsShipmentOrder.CurrencyType = strCurrencyType;

            goodsShipmentOrderBLL.AddGoodsShipmentOrder(goodsShipmentOrder);

            strShipmentNO = ShareClass.GetMyCreatedMaxGoodsShipmentNO(strUserCode).ToString();

            LB_ShipmentNO.Text = strShipmentNO;

            string strNewCOOCode = ShareClass.GetCodeByRule("TransferOrderCode", "TransferOrderCode", strShipmentNO);
            if (strNewCOOCode != "")
            {
                TB_GSHOName.Text = strNewCOOCode;
                string strHQL = "Update T_GoodsShipmentOrder Set GSHOName = " + "'" + strNewCOOCode + "'" + " Where ShipmentNO = " + strShipmentNO;
                ShareClass.RunSqlCommand(strHQL);
            }

            LoadGoodsShipmentOrder(strUserCode);
            LoadGoodsShipmentDetail(strShipmentNO);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch (Exception err)
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void UpdateMain()
    {
        string strHQL;
        IList lst;

        string strShipmentNO, strWareHouse, strApplicant, strShipReason, strRelatedType, strSourceType, strSourceID, strCurrencyType, strRelatedCode, strCustomerCode, strCustomerName, strGSHOName;
        DateTime dtShipTime;
        int intRelatedID;

        strShipmentNO = LB_ShipmentNO.Text.Trim();
        strGSHOName = TB_GSHOName.Text.Trim();
        strWareHouse = TB_WHName.Text.Trim();
        dtShipTime = DateTime.Parse(DLC_ShipTime.Text);
        strApplicant = TB_Applicant.Text.Trim();
        strShipReason = TB_ShipmentReason.Text.Trim();
        strRelatedType = DL_RelatedType.SelectedValue.Trim();
        intRelatedID = int.Parse(NB_RelatedID.Amount.ToString());
        strRelatedCode = TB_RelatedCode.Text.Trim();

        strCustomerCode = DL_Customer.SelectedValue;
        if (strCustomerCode != "")
        {
            strCustomerName = DL_Customer.SelectedItem.Text;
        }
        else
        {
            strCustomerName = "";
        }

        strSourceType = DL_SourceType.SelectedValue.Trim();
        strSourceID = NB_SourceID.Amount.ToString();

        strCurrencyType = DL_CurrencyType.SelectedValue.Trim();

        try
        {
            strHQL = "From GoodsShipmentOrder as goodsShipmentOrder Where goodsShipmentOrder.ShipmentNO = " + strShipmentNO;
            GoodsShipmentOrderBLL goodsShipmentOrderBLL = new GoodsShipmentOrderBLL();
            lst = goodsShipmentOrderBLL.GetAllGoodsShipmentOrders(strHQL);
            GoodsShipmentOrder goodsShipmentOrder = (GoodsShipmentOrder)lst[0];

            goodsShipmentOrder.GSHOName = strGSHOName;
            goodsShipmentOrder.ShipmentType = DL_ShipmentType.SelectedValue.Trim();
            goodsShipmentOrder.WareHouse = strWareHouse;
            goodsShipmentOrder.Applicant = strApplicant;
            goodsShipmentOrder.ShipTime = dtShipTime;
            goodsShipmentOrder.ApplicationReason = strShipReason;
            goodsShipmentOrder.RelatedType = strRelatedType;
            goodsShipmentOrder.RelatedID = intRelatedID;
            goodsShipmentOrder.RelatedCode = strRelatedCode;

            goodsShipmentOrder.CustomerCode = strCustomerCode;
            goodsShipmentOrder.CustomerName = strCustomerName;


            goodsShipmentOrder.OperatorCode = strUserCode;
            goodsShipmentOrder.OperatorName = ShareClass.GetUserName(strUserCode);

            goodsShipmentOrder.CurrencyType = strCurrencyType;

            goodsShipmentOrderBLL.UpdateGoodsShipmentOrder(goodsShipmentOrder, int.Parse(strShipmentNO));

            LoadGoodsShipmentOrder(strUserCode);
            LoadGoodsShipmentDetail(strShipmentNO);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch (Exception err)
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void DL_RecordSourceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        NB_RecordSourceID.Amount = 0;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_PDMRPExpend_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strRelatedType, strRelatedID;

        strRelatedType = "PD";
        strRelatedID = LB_PDID.Text.Trim();


        strHQL = "Delete From T_ItemRelatedOrderBomToExpendDetailData Where RelatedType = " + "'" + strRelatedType + "'" + " and RelatedID = " + strRelatedID;
        ShareClass.RunSqlCommand(strHQL);

        TakeTopPlan.RelatedOrderItemMRPPExtendDetail(strRelatedType, strRelatedID);

        strHQL = "Select * From T_ItemRelatedOrderBomToExpendDetailData Where RelatedType = " + "'" + strRelatedType + "'" + " and RelatedID = " + strRelatedID;
        strHQL += " Order By OrderTime ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemRelatedOrderBomToExpendDetailData");

        DataGrid17.DataSource = ds;
        DataGrid17.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_FindGoods_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strGoodsCode, strGoodsName, strType, strModelNumber, strSpec;
        string strWareHouse, strDepartString;

        TabContainer1.ActiveTabIndex = 0;

        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strType = DL_GoodsType.SelectedValue.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();

        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strType = "%" + strType + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";

        strDepartString = LB_DepartString.Text.Trim();
        strWareHouse = TB_WHName.Text.Trim();

        strHQL = "Select * From T_Goods  Where GoodsCode Like " + "'" + strGoodsCode + "'" + " and GoodsName like " + "'" + strGoodsName + "'";
        strHQL += " and type Like " + "'" + strType + "'" + " and ModelNumber Like " + "'" + strModelNumber + "'" + " and Spec Like " + "'" + strSpec + "'";
        strHQL += " and Number > 0";
        strHQL += " and Position = " + "'" + strWareHouse + "'";
        strHQL += " and Position in (Select WHName From T_WareHouse Where BelongDepartCode in " + strDepartString + ")";
        strHQL += " Order by Number DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();


        strHQL = "Select * From T_Item as item Where item.ItemCode Like " + "'" + strGoodsCode + "'" + " and item.ItemName like " + "'" + strGoodsName + "'";
        strHQL += " and item.Specification Like " + "'" + strSpec + "'";
        strHQL += " and item.BigType Like 'Goods'";

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

        NB_Number.Amount = 0;
        NB_Price.Amount = 0;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
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
                    DL_GoodsType.SelectedValue = item.SmallType;
                }
                catch
                {
                    DL_GoodsType.SelectedValue = "";
                }

                DL_Unit.SelectedValue = item.Unit;
                TB_ModelNumber.Text = item.ModelNumber.Trim();
                TB_Spec.Text = item.Specification;
                TB_Manufacturer.Text = item.Brand;

                NB_WarrantyPeriod.Amount = item.WarrantyPeriod;

                if (LB_SourceRelatedID.Text.Trim() == "0")
                {
                    DL_RecordSourceType.SelectedValue = "Other";
                    NB_RecordSourceID.Amount = 0;
                    NB_Price.Amount = item.SalePrice;
                }
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID;

            strID = e.Item.Cells[0].Text.Trim();

            for (int i = 0; i < DataGrid2.Items.Count; i++)
            {
                DataGrid2.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "From Goods as goods where goods.ID = " + strID;
            GoodsBLL goodsBLL = new GoodsBLL();
            lst = goodsBLL.GetAllGoodss(strHQL);

            Goods goods = (Goods)lst[0];

            TB_GoodsCode.Text = goods.GoodsCode.Trim();
            TB_GoodsName.Text = goods.GoodsName.Trim();

            try
            {
                DL_GoodsType.SelectedValue = goods.Type;
            }
            catch
            {
                DL_GoodsType.SelectedValue = "";
            }

            TB_ModelNumber.Text = goods.ModelNumber.Trim();
            TB_Spec.Text = goods.Spec.Trim();

            DL_Unit.SelectedValue = goods.UnitName;
            TB_Manufacturer.Text = goods.Manufacturer.Trim();

            TB_FromPosition.Text = goods.Position.Trim();
            LB_FromGoodsID.Text = goods.ID.ToString();

            TB_SN.Text = goods.SN;

            NB_WarrantyPeriod.Amount = goods.WarrantyPeriod;

            if (LB_SourceRelatedID.Text.Trim() == "0")
            {
                DL_RecordSourceType.SelectedValue = "Other";
                NB_RecordSourceID.Amount = 0;
                NB_Price.Amount = goods.Price;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid16_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strID, strPDID;
            IList lst;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();
            LB_ID.Text = strID;

            strPDID = LB_PDID.Text.Trim();

            for (int i = 0; i < DataGrid16.Items.Count; i++)
            {
                DataGrid16.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "from GoodsProductionOrderDetail as goodsProductionOrderDetail where goodsProductionOrderDetail.ID = " + strID;

            GoodsProductionOrderDetailBLL goodsProductionOrderDetailBLL = new GoodsProductionOrderDetailBLL();
            lst = goodsProductionOrderDetailBLL.GetAllGoodsProductionOrderDetails(strHQL);
            GoodsProductionOrderDetail goodsProductionOrderDetail = (GoodsProductionOrderDetail)lst[0];

            TB_GoodsCode.Text = goodsProductionOrderDetail.GoodsCode;
            TB_GoodsName.Text = goodsProductionOrderDetail.GoodsName;

            try
            {
                DL_GoodsType.SelectedValue = goodsProductionOrderDetail.Type;
            }
            catch
            {
                DL_GoodsType.SelectedValue = "";
            }

            TB_ModelNumber.Text = goodsProductionOrderDetail.ModelNumber;

            TB_Spec.Text = goodsProductionOrderDetail.Spec;
            TB_Manufacturer.Text = goodsProductionOrderDetail.Brand;

            DL_Unit.SelectedValue = goodsProductionOrderDetail.UnitName;
            NB_Number.Amount = goodsProductionOrderDetail.Number;

            LB_SourceRelatedID.Text = strPDID;
            DL_RecordSourceType.SelectedValue = "GoodsPDRecord";
            NB_RecordSourceID.Amount = decimal.Parse(strID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid17_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strHQL, strID, strPDID;


            strID = e.Item.Cells[0].Text;
            LB_ID.Text = strID;

            strPDID = LB_PDID.Text.Trim();

            for (int i = 0; i < DataGrid17.Items.Count; i++)
            {
                DataGrid17.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "Select ItemCode,ItemName,Type,ModelNumber,Specification,Brand, Unit,Number From T_ItemRelatedOrderBomToExpendDetailData Where ID = " + strID;
            strHQL += " Order By ID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemRelatedOrderBomToExpendDetailData");

            TB_GoodsCode.Text = ds.Tables[0].Rows[0]["ItemCode"].ToString();
            TB_GoodsName.Text = ds.Tables[0].Rows[0]["ItemName"].ToString();

            try
            {
                DL_GoodsType.SelectedValue = ShareClass.GetItemSmallType(ds.Tables[0].Rows[0]["Type"].ToString());
            }
            catch
            {
                DL_GoodsType.SelectedValue = "";
            }

            TB_ModelNumber.Text = ds.Tables[0].Rows[0]["ModelNumber"].ToString();

            TB_Spec.Text = ds.Tables[0].Rows[0]["Specification"].ToString();
            TB_Manufacturer.Text = ds.Tables[0].Rows[0]["Brand"].ToString();

            DL_Unit.SelectedValue = ds.Tables[0].Rows[0]["Unit"].ToString();
            NB_Number.Amount = decimal.Parse(ds.Tables[0].Rows[0]["Number"].ToString());

            LB_SourceRelatedID.Text = strPDID;
            DL_RecordSourceType.SelectedValue = "GoodsBOMRecord";
            NB_RecordSourceID.Amount = decimal.Parse(strID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid8_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strConstractCode;

            strConstractCode = ((Button)e.Item.FindControl("BT_ConstractCode")).Text.Trim();
            TB_RelatedCode.Text = strConstractCode;
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID = e.Item.Cells[2].Text.Trim();
            LB_ID.Text = strID;

            if (e.CommandName == "Update")
            {
                for (int i = 0; i < DataGrid1.Items.Count; i++)
                {
                    DataGrid1.Items[i].ForeColor = Color.Black;
                }

                e.Item.ForeColor = Color.Red;

                strHQL = "From GoodsShipmentDetail as goodsShipmentDetail Where goodsShipmentDetail.ID = " + strID;
                GoodsShipmentDetailBLL goodsShipmentDetailBLL = new GoodsShipmentDetailBLL();
                lst = goodsShipmentDetailBLL.GetAllGoodsShipmentDetails(strHQL);

                GoodsShipmentDetail goodsShipmentDetail = (GoodsShipmentDetail)lst[0];

                LB_ID.Text = strID;
                TB_GoodsCode.Text = goodsShipmentDetail.GoodsCode.Trim();
                TB_GoodsName.Text = goodsShipmentDetail.GoodsName.Trim();

                try
                {
                    DL_GoodsType.SelectedValue = goodsShipmentDetail.Type;
                }
                catch
                {
                    DL_GoodsType.SelectedValue = "";
                }

                TB_SN.Text = goodsShipmentDetail.SN.Trim();
                TB_ModelNumber.Text = goodsShipmentDetail.ModelNumber.Trim();
                TB_Spec.Text = goodsShipmentDetail.Spec.Trim();
                TB_Manufacturer.Text = goodsShipmentDetail.Manufacturer;

                NB_Number.Amount = goodsShipmentDetail.Number;
                NB_Price.Amount = goodsShipmentDetail.Price;
                DL_Unit.SelectedValue = goodsShipmentDetail.UnitName;
                TB_Manufacturer.Text = goodsShipmentDetail.Manufacturer.Trim();
                NB_WarrantyPeriod.Amount = goodsShipmentDetail.WarrantyPeriod;

                ShareClass.LoadWareHouseListByAuthorityForDropDownList(strUserCode, DL_InWareHouse);

                try
                {
                    DL_InWareHouse.SelectedValue = goodsShipmentDetail.ToPosition;
                }
                catch
                {
                    DL_InWareHouse.SelectedValue = "";
                }
                try
                {
                    ShareClass.LoadWareHousePositions(DL_InWareHouse.SelectedValue.Trim(), DL_WHPosition);
                }
                catch
                {
                }


                try
                {
                    DL_WHPosition.SelectedValue = goodsShipmentDetail.WHPosition.Trim();
                }
                catch
                {
                }

                LB_FromGoodsID.Text = goodsShipmentDetail.FromGoodsID.ToString();
                TB_Comment.Text = goodsShipmentDetail.Comment.Trim();

                LB_SourceRelatedID.Text = goodsShipmentDetail.RelatedID.ToString();
                TB_FromPosition.Text = goodsShipmentDetail.FromPosition.Trim();
                TB_FromWHPosition.Text = goodsShipmentDetail.FromWHPosition.Trim();

                DL_RecordSourceType.SelectedValue = goodsShipmentDetail.SourceType.Trim();
                NB_RecordSourceID.Amount = goodsShipmentDetail.SourceID;

                BT_NewDetail.Visible = false;

                int intCount = GetRelatedWL("物料出货", "物料", goodsShipmentDetail.ShipmentNO);
                if (intCount > 0)
                {
                    //BT_New.Enabled = false;
                    //BT_Update.Enabled = false;
                    //BT_Delete.Enabled = false;
                }
                else
                {
                    //BT_New.Enabled = true;
                    //BT_Update.Enabled = true;
                    //BT_Delete.Enabled = true;
                }

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }

            if (e.CommandName == "Delete")
            {
                string strShipmentNO, strFromGoodsID, strGoodsCode, strWareHouse;
                string strSourceType, strSourceID;
                decimal deOldNumber;

                strSourceType = DL_RecordSourceType.SelectedValue.Trim();
                strSourceID = NB_RecordSourceID.Amount.ToString();

                strShipmentNO = LB_ShipmentNO.Text.Trim();
                strWareHouse = TB_WHName.Text.Trim();

                GoodsShipmentDetailBLL goodsShipmentDetailBLL = new GoodsShipmentDetailBLL();
                strHQL = "From GoodsShipmentDetail as goodsShipmentDetail Where goodsShipmentDetail.ID =" + strID;
                lst = goodsShipmentDetailBLL.GetAllGoodsShipmentDetails(strHQL);
                GoodsShipmentDetail goodsShipmentDetail = (GoodsShipmentDetail)lst[0];

                strSourceType = goodsShipmentDetail.SourceType.Trim();
                strSourceID = goodsShipmentDetail.SourceID.ToString();

                strGoodsCode = goodsShipmentDetail.GoodsCode.Trim();

                strFromGoodsID = goodsShipmentDetail.FromGoodsID.ToString();
                deOldNumber = goodsShipmentDetail.Number;

                try
                {
                    goodsShipmentDetailBLL.DeleteGoodsShipmentDetail(goodsShipmentDetail);

                    //更改物料库存原位置数量
                    ShareClass.UpdateGoodsNumberForDelete(strFromGoodsID, deOldNumber);

                    LoadGoodsShipmentDetail(strShipmentNO);

                    LoadGoods(strGoodsCode, strWareHouse);

                    //BT_Update.Enabled = false;
                    //BT_Delete.Enabled = false;

                    LB_ID.Text = "0";

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

        BT_NewDetail.Visible = true;

        ShareClass.LoadWareHouseListByAuthorityForDropDownList(strUserCode, DL_InWareHouse);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false','popDetailWindow') ", true);
    }

    protected void BT_NewDetail_Click(object sender, EventArgs e)
    {
        string strShipmentNO;

        strShipmentNO = LB_ShipmentNO.Text.Trim();

        if (strShipmentNO == "")
        {
            AddMain();
        }
        else
        {
            UpdateMain();
        }

        strShipmentNO = LB_ShipmentNO.Text.Trim();


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
        string strShipmentNO, strGoodsCode, strGoodsName, strSN, strType, strModelNumber, strSpec, strUnitName, strManufacturer, strFromPosition, strToPosition, strComment;
        string strSourceType, strSourceID, strSourceRelatedID;
        decimal deNumber, dePrice;
        string strFromGoodsID, strWareHouse;
        int intWarrantyPeriod;

        strWareHouse = TB_WHName.Text.Trim();
        strFromGoodsID = LB_FromGoodsID.Text;
        strShipmentNO = LB_ShipmentNO.Text.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strType = DL_GoodsType.SelectedValue.Trim();
        strSN = TB_SN.Text.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();
        deNumber = NB_Number.Amount;
        dePrice = NB_Price.Amount;
        strUnitName = DL_Unit.SelectedValue.Trim();
        intWarrantyPeriod = int.Parse(NB_WarrantyPeriod.Amount.ToString());
        strManufacturer = TB_Manufacturer.Text.Trim();
        strFromPosition = TB_FromPosition.Text.Trim();
        strToPosition = DL_InWareHouse.SelectedValue.Trim();

        strComment = TB_Comment.Text.Trim();

        if (strFromGoodsID == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWZYCKDZCJC + "')", true);
            return;
        }

        if (CheckShipNumber(strFromGoodsID, deNumber) == false)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWCKSLBNDYCLPKCSLJC + "')", true);
            return;
        }

        strSourceRelatedID = LB_SourceRelatedID.Text.Trim();
        strSourceType = DL_RecordSourceType.SelectedValue.Trim();
        strSourceID = NB_RecordSourceID.Amount.ToString();


        if (strFromGoodsID == "" | strGoodsCode == "" | strGoodsName == "" | strSpec == "" | strFromPosition == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
        }
        else
        {
            GoodsShipmentDetailBLL goodsShipmentDetailBLL = new GoodsShipmentDetailBLL();
            GoodsShipmentDetail goodsShipmentDetail = new GoodsShipmentDetail();

            goodsShipmentDetail.ShipmentNO = int.Parse(strShipmentNO);
            goodsShipmentDetail.GoodsCode = strGoodsCode;
            goodsShipmentDetail.GoodsName = strGoodsName;
            goodsShipmentDetail.Type = strType;

            if (strSN == "")
            {
                //strSN = strGoodsCode;
            }

            goodsShipmentDetail.SN = strSN;
            goodsShipmentDetail.ModelNumber = strModelNumber;
            goodsShipmentDetail.Manufacturer = strManufacturer;
            goodsShipmentDetail.Spec = strSpec;
            goodsShipmentDetail.Manufacturer = TB_Manufacturer.Text;

            goodsShipmentDetail.Number = deNumber;
            goodsShipmentDetail.AleadyOutNumber = deNumber;
            goodsShipmentDetail.DeliveryNumber = 0;
            goodsShipmentDetail.Price = dePrice;
            goodsShipmentDetail.Amount = deNumber * dePrice;
            goodsShipmentDetail.CurrencyType = DL_CurrencyType.SelectedValue.Trim();

            goodsShipmentDetail.UnitName = strUnitName;
            goodsShipmentDetail.WarrantyPeriod = intWarrantyPeriod;

            goodsShipmentDetail.FromPosition = strFromPosition;
            goodsShipmentDetail.FromWHPosition = TB_FromWHPosition.Text.Trim();

            goodsShipmentDetail.FromGoodsID = int.Parse(strFromGoodsID);

            goodsShipmentDetail.ToPosition = strToPosition;
            goodsShipmentDetail.WHPosition = DL_WHPosition.SelectedValue.Trim();

            goodsShipmentDetail.Comment = strComment;

            if (strSourceRelatedID == "")
            {
                goodsShipmentDetail.RelatedID = 0;
                strSourceRelatedID = "0";
            }
            else
            {
                goodsShipmentDetail.RelatedID = int.Parse(strSourceRelatedID);
            }

            if (strSourceType == "")
            {
                goodsShipmentDetail.SourceType = "Other";
            }
            else
            {
                goodsShipmentDetail.SourceType = strSourceType;
            }
            if (strSourceID == "")
            {
                goodsShipmentDetail.SourceID = 0;
                strSourceID = "0";
            }
            else
            {
                goodsShipmentDetail.SourceID = int.Parse(strSourceID);
            }

            try
            {
                goodsShipmentDetailBLL.AddGoodsShipmentDetail(goodsShipmentDetail);

                LB_ID.Text = ShareClass.GetMyCreatedMaxGoodsShipmentDetailID().ToString();


                //更新对应物料记录数量
                ShareClass.UpdateGoodsNumberForAdd(strFromGoodsID, deNumber);

                string strCountMethod = ShareClass.GetGoodsStockCountMethod(strToPosition);

                string strBatchNumber, strProductDate, strExpiryDate, strProductionEquipmentNumber, strMaterialFormNumber;
                string strHQL;
                strHQL = "Select * From T_Goods Where ID = " + strFromGoodsID;
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");
                strBatchNumber = ds.Tables[0].Rows[0]["BatchNumber"].ToString();
                strProductDate = DateTime.Parse(ds.Tables[0].Rows[0]["ProductDate"].ToString()).ToString("yyyy-MM-dd");
                strExpiryDate = DateTime.Parse(ds.Tables[0].Rows[0]["ExpiryDate"].ToString()).ToString("yyyy-MM-dd");
                strProductionEquipmentNumber = ds.Tables[0].Rows[0]["ProductionEquipmentNumber"].ToString();
                strMaterialFormNumber = ds.Tables[0].Rows[0]["MaterialFormNumber"].ToString();

                //添加相同记录到物料表
                ShareClass.addOrUpdateGoods(strCountMethod, "0", strShipmentNO, strGoodsCode, strGoodsName, strSN, deNumber, strUnitName,
                    strUserCode, strType, strSpec, strModelNumber, strToPosition, DL_WHPosition.SelectedValue.Trim(), dePrice, "YES", DL_CurrencyType.SelectedValue.Trim(), DateTime.Now, intWarrantyPeriod,
                    strManufacturer, "", LB_ID.Text, "", 0, 0,
                    strBatchNumber, DateTime.Parse(strProductDate), DateTime.Parse(strExpiryDate), strProductionEquipmentNumber, strMaterialFormNumber);

                LoadGoodsShipmentDetail(strShipmentNO);
                LoadGoods(strGoodsCode, strWareHouse);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);

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
        string strShipmentNO, strGoodsCode, strGoodsName, strType, strSN, strModelNumber, strSpec, strUnitName, strManufacturer, strFromPosition, strToPosition, strComment;
        string strSourceType, strSourceID, strSourceRelatedID;
        decimal deNumber, deOldNumber, dePrice;
        int intID, intWarrantyPeriod;
        string strFromGoodsID, strWareHouse;
        string strHQL;

        strFromGoodsID = LB_FromGoodsID.Text.Trim();

        intID = int.Parse(LB_ID.Text);
        strShipmentNO = LB_ShipmentNO.Text.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strType = DL_GoodsType.SelectedValue.Trim();
        strSN = TB_SN.Text.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();
        deNumber = NB_Number.Amount;
        dePrice = NB_Price.Amount;
        strUnitName = DL_Unit.SelectedValue.Trim();
        strManufacturer = TB_Manufacturer.Text.Trim();

        strFromPosition = TB_FromPosition.Text.Trim();

        strToPosition = DL_InWareHouse.SelectedValue.Trim();


        strComment = TB_Comment.Text.Trim();
        strWareHouse = TB_WHName.Text.Trim();
        intWarrantyPeriod = int.Parse(NB_WarrantyPeriod.Amount.ToString());

        strSourceRelatedID = LB_SourceRelatedID.Text.Trim();
        strSourceType = DL_RecordSourceType.SelectedValue.Trim();
        strSourceID = NB_RecordSourceID.Amount.ToString();

        if (strFromGoodsID == "" | strGoodsCode == "" | strGoodsName == "" | strSpec == "" | strFromPosition == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZYSRHYXDBNWKJC + "')", true);
        }
        else
        {
            GoodsShipmentDetailBLL goodsShipmentDetailBLL = new GoodsShipmentDetailBLL();
            strHQL = "From GoodsShipmentDetail as goodsShipmentDetail Where goodsShipmentDetail.ID = " + intID.ToString();
            IList lst = goodsShipmentDetailBLL.GetAllGoodsShipmentDetails(strHQL);
            GoodsShipmentDetail goodsShipmentDetail = (GoodsShipmentDetail)lst[0];

            deOldNumber = goodsShipmentDetail.Number;

            goodsShipmentDetail.ShipmentNO = int.Parse(strShipmentNO);
            goodsShipmentDetail.GoodsCode = strGoodsCode;
            goodsShipmentDetail.GoodsName = strGoodsName;
            goodsShipmentDetail.Type = strType;
            if (strSN == "")
            {
                //strSN = strGoodsCode;
            }
            goodsShipmentDetail.SN = strSN;
            goodsShipmentDetail.ModelNumber = strModelNumber;
            goodsShipmentDetail.Spec = strSpec;
            goodsShipmentDetail.Manufacturer = TB_Manufacturer.Text;

            goodsShipmentDetail.Number = deNumber;
            goodsShipmentDetail.AleadyOutNumber = deNumber;
            goodsShipmentDetail.Price = dePrice;
            goodsShipmentDetail.Amount = deNumber * dePrice;
            goodsShipmentDetail.CurrencyType = DL_CurrencyType.SelectedValue.Trim();

            goodsShipmentDetail.UnitName = strUnitName;
            goodsShipmentDetail.Manufacturer = strManufacturer;

            goodsShipmentDetail.FromPosition = strFromPosition;
            goodsShipmentDetail.FromWHPosition = TB_FromWHPosition.Text.Trim();

            goodsShipmentDetail.FromGoodsID = int.Parse(strFromGoodsID);

            goodsShipmentDetail.ToPosition = strToPosition;
            goodsShipmentDetail.WHPosition = DL_WHPosition.SelectedValue.Trim();

            goodsShipmentDetail.Comment = strComment;

            goodsShipmentDetail.WarrantyPeriod = intWarrantyPeriod;

            if (strSourceRelatedID == "")
            {
                goodsShipmentDetail.RelatedID = 0;
                strSourceRelatedID = "0";
            }
            else
            {
                goodsShipmentDetail.RelatedID = int.Parse(strSourceRelatedID);
            }

            if (strSourceType == "")
            {
                goodsShipmentDetail.SourceType = "Other";
            }
            else
            {
                goodsShipmentDetail.SourceType = strSourceType;
            }
            if (strSourceID == "")
            {
                goodsShipmentDetail.SourceID = 0;
                strSourceID = "0";
            }
            else
            {
                goodsShipmentDetail.SourceID = int.Parse(strSourceID);
            }

            try
            {
                goodsShipmentDetailBLL.UpdateGoodsShipmentDetail(goodsShipmentDetail, intID);

                //更改物料原位置库存数量
                ShareClass.UpdateGoodsNumberForUpdate(strFromGoodsID, deNumber, deOldNumber);

                //添加相同记录到物料明细表
                string strGoodsID = goodsShipmentDetail.FromGoodsID.ToString();
                string strCountMethod = ShareClass.GetGoodsStockCountMethod(strToPosition);
                string strPhotoURL = "";

                //取得原来的数量和价格
                decimal deOldCheckInNumber = goodsShipmentDetail.Number;
                decimal deOldCheckInPrice = goodsShipmentDetail.Price;

                string strBatchNumber, strProductDate, strExpiryDate, strProductionEquipmentNumber, strMaterialFormNumber;
                strHQL = "Select * From T_Goods Where ID = " + strFromGoodsID;
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");
                strBatchNumber = ds.Tables[0].Rows[0]["BatchNumber"].ToString();
                strProductDate = DateTime.Parse(ds.Tables[0].Rows[0]["ProductDate"].ToString()).ToString("yyyy-MM-dd");
                strExpiryDate = DateTime.Parse(ds.Tables[0].Rows[0]["ExpiryDate"].ToString()).ToString("yyyy-MM-dd");
                strProductionEquipmentNumber = ds.Tables[0].Rows[0]["ProductionEquipmentNumber"].ToString();
                strMaterialFormNumber = ds.Tables[0].Rows[0]["MaterialFormNumber"].ToString();

                ShareClass.addOrUpdateGoods(strCountMethod, strGoodsID, "0", strGoodsCode, strGoodsName, strSN, deNumber, strUnitName,
                   strUserCode, strType, strSpec, strModelNumber, strToPosition, DL_WHPosition.SelectedValue.Trim(), dePrice, "YES", DL_CurrencyType.SelectedValue.Trim(), DateTime.Now, intWarrantyPeriod,
                   strManufacturer, "", "0", strPhotoURL, deOldCheckInNumber, deOldCheckInPrice,
                    strBatchNumber, DateTime.Parse(strProductDate), DateTime.Parse(strExpiryDate), strProductionEquipmentNumber, strMaterialFormNumber);

                LoadGoodsShipmentDetail(strShipmentNO);
                LoadGoods(strGoodsCode, strWareHouse);

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


    protected void UpdateGoodsSOOrSANumber(string strSourceType, string strSourceID)
    {
        string strHQL;
        string strFromSourceID = "0";
        decimal deSumNumber;

        if (strSourceType == "GoodsSORecord" | strSourceType == "GoodsCONRecord")
        {
            strHQL = "Select  COALESCE(Sum(Number),0) From T_GoodsShipmentDetail Where (SourceType = 'GoodsSORecord' Or SourceType = 'GoodsCONRecord') And SourceID=" + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentDetail");

            try
            {
                deSumNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            catch
            {
                deSumNumber = 0;
            }

            if (strSourceType == "GoodsCONRecord")
            {
                strHQL = "Select SourceID From T_GoodsCheckOutNoticeOrderDetail Where ID = " + strSourceID;
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsCheckOutNoticeOrderDetail");
                strFromSourceID = ds.Tables[0].Rows[0][0].ToString();
            }

            if (strSourceType == "GoodsSORecord")
            {
                strHQL = "Select SourceID From T_GoodsSaleRecord Where ID = " + strSourceID;
                ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSaleRecord");
                strFromSourceID = ds.Tables[0].Rows[0][0].ToString();
            }


            strHQL = "Update T_GoodsSaleRecord Set CheckOutNumber = " + deSumNumber.ToString() + " Where ID = " + strFromSourceID;
            ShareClass.RunSqlCommand(strHQL);
        }

        if (strSourceType == "GoodsCONRecord")
        {
            strHQL = "Select  COALESCE(Sum(Number),0) From T_GoodsShipmentDetail Where  SourceType = 'GoodsCONRecord'  And SourceID=" + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentDetail");

            try
            {
                deSumNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            catch
            {
                deSumNumber = 0;
            }

            strHQL = "Update T_GoodsCheckOutNoticeOrderDetail Set CheckOutNumber = " + deSumNumber.ToString() + " Where ID = " + strSourceID;
            ShareClass.RunSqlCommand(strHQL);
        }


        if (strSourceType == "GoodsSARecord")
        {
            strHQL = "Select  COALESCE(Sum(Number),0) From T_GoodsShipmentDetail Where SourceType = 'GoodsSARecord' And SourceID=" + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentDetail");

            try
            {
                deSumNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            catch
            {
                deSumNumber = 0;
            }

            strHQL = "Update T_GoodsSaleRecord Set CheckOutNumber = " + deSumNumber.ToString() + " Where ID in (Select SourceID From T_GoodsApplicationDetail Where SourceType = 'GoodsSORecord' and ID = " + strSourceID + ")";
            ShareClass.RunSqlCommand(strHQL);
        }

        //if (strSourceType == "GoodsSARecord")
        //{
        //    strHQL = "Select COALESCE(Sum(Number),0) From T_GoodsShipmentDetail Where SourceType = 'GoodsSARecord' And SourceID=" + strSourceID;
        //    DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentDetail");

        //    try
        //    {
        //        deSumNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
        //    }
        //    catch
        //    {
        //        deSumNumber = 0;
        //    }

        //    strHQL = "Update T_GoodsApplicationDetail Set CheckOutNumber = " + deSumNumber.ToString() + " Where AAID = " + strSourceID;
        //    ShareClass.RunSqlCommand(strHQL);
        //}
    }

    protected bool CheckShipNumber(string strFromGoodsID, decimal deShipNumber)
    {
        string strHQL;
        IList lst;

        decimal deGoodsNumber;

        strHQL = "From Goods as goods where goods.ID = " + strFromGoodsID;
        GoodsBLL goodsBLL = new GoodsBLL();
        lst = goodsBLL.GetAllGoodss(strHQL);

        Goods goods = (Goods)lst[0];

        deGoodsNumber = goods.Number;

        if (deGoodsNumber < deShipNumber)
        {
            return false;
        }
        else
        {
            return true;
        }
    }

    protected void DataGrid5_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql5.Text;

        GoodsShipmentOrderBLL goodsShipmentOrderBLL = new GoodsShipmentOrderBLL();
        IList lst = goodsShipmentOrderBLL.GetAllGoodsShipmentOrders(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();
    }

    protected void LoadGoodsShipmentOrder(string strUserCode)
    {
        string strHQL;

        strHQL = "Select * From T_GoodsShipmentOrder Where (OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " Or OperatorCode in (Select UserCode From T_ProjectMember Where DepartCode in  " + LB_DepartString.Text.Trim() + "))";
        strHQL += " and ShipmentType = 'Transfer'";
        strHQL += " Order By ShipmentNO DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentOrder");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }

    protected void LoadGoodsShipmentDetail(string strShipmentNO)
    {
        string strHQL;
        IList lst;

        strHQL = "From GoodsShipmentDetail as goodsShipmentDetail Where goodsShipmentDetail.ShipmentNO = " + strShipmentNO;
        strHQL += " Order By goodsShipmentDetail.ID ASC";
        GoodsShipmentDetailBLL goodsShipmentDetailBLL = new GoodsShipmentDetailBLL();
        lst = goodsShipmentDetailBLL.GetAllGoodsShipmentDetails(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void LoadGoods(string strGoodsCode, string strWareHouse)
    {
        string strHQL;
        IList lst;

        strHQL = "From Goods as goods Where goods.Number > 0 and goods.GoodsCode = " + "'" + strGoodsCode + "'";
        strHQL += " and goods.Position = " + "'" + strWareHouse + "'";
        strHQL += " Order by goods.ID ASC";
        GoodsBLL goodsBLL = new GoodsBLL();
        lst = goodsBLL.GetAllGoodss(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        TB_GoodsName.Focus();
    }

    protected void LoadCustomer(string strUserCode)
    {
        string strHQL;
        IList lst;

        string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);

        strHQL = "from Customer as customer ";
        strHQL += " Where (customer.CreatorCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " or (customer.CustomerCode in (Select customerRelatedUser.CustomerCode from CustomerRelatedUser as customerRelatedUser where customerRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " Or customer.CreatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode In  " + strDepartString + ")";
        strHQL += " Order by customer.CreateDate DESC";

        CustomerBLL customerBLL = new CustomerBLL();
        lst = customerBLL.GetAllCustomers(strHQL);

        DL_Customer.DataSource = lst;
        DL_Customer.DataBind();

        DL_Customer.Items.Insert(0, new ListItem("--Select--", ""));
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

    protected void LoadWareHouseListByAuthority(string strDepartString, DropDownList DL_WareHouse)
    {
        string strHQL;

        strHQL = " Select WHName From T_WareHouse Where ";
        strHQL += " BelongDepartCode in " + strDepartString;
        strHQL += " Order By SortNumber DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WareHouse");

        DL_WareHouse.DataSource = ds;
        DL_WareHouse.DataBind();

        DL_WareHouse.Items.Insert(0, new ListItem("--Select--", ""));
    }

    protected void LoadGoodsProductionOrderDetail(string strPDID)
    {
        LB_GoodsOwner.Text = Resources.lang.ShengChanDan + ": " + strPDID + Resources.lang.MingXi;

        string strHQL = "Select * from T_GoodsProductionOrderDetail where PDID = " + strPDID + " Order by ID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsProductionOrderDetail");

        DataGrid16.DataSource = ds;
        DataGrid16.DataBind();
    }

    protected void LoadGoodsProductionOrder(string strOperatorCode)
    {
        string strHQL;

        strHQL = " Select * From T_GoodsProductionOrder Where CreatorCode in ( Select UserCode From T_ProjectMember Where DepartCode in " + LB_DepartString.Text.Trim() + ")";
        strHQL += " Order By PDID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsProductionOrder");

        DataGrid18.DataSource = ds;
        DataGrid18.DataBind();
    }


    protected int GetRelatedWL(string strWLType, string strRelatedType, int intRelatedID)
    {
        string strHQL;
        IList lst;

        strHQL = "from WorkFlow as workFlow where workFlow.WLType = " + "'" + strWLType + "'" + " and workFlow.RelatedType=" + "'" + strRelatedType + "'" + " and workFlow.RelatedID = " + intRelatedID.ToString();
        strHQL += " Order by workFlow.WLID DESC";
        WorkFlowBLL workFlowBLL = new WorkFlowBLL();
        lst = workFlowBLL.GetAllWorkFlows(strHQL);

        return lst.Count;
    }

}
