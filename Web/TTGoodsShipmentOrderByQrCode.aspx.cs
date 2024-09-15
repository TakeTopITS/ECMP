using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using TakeTopCore;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTGoodsShipmentOrderByQrCode : System.Web.UI.Page
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
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "出库单", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_ShipTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_ProductionDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_ExpiryDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthorityAsset(strUserCode);
            LB_DepartString.Text = strDepartString;

            ShareClass.InitialWarehouseTreeByAuthorityAsset(TreeView3, strUserCode, strDepartString);

            strHQL = "Select * From T_GoodsShipmentType Order By SortNumber ASC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentType");
            DL_ShipmentType.DataSource = ds;
            DL_ShipmentType.DataBind();
            DL_ShipmentType.Items.Insert(0, new ListItem("--Select--", ""));

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
            ShareClass.InitialWarehouseTreeByAuthorityAsset(TreeView3, strUserCode, LB_DepartString.Text.Trim());

            LoadWareHouseListByAuthority(strDepartString, DL_InWareHouse);
            LoadGoodsShipmentOrder(strUserCode);
            LoadGoodsCheckInOrder(strUserCode);

            LoadGoodsApplicationForOther(DataGrid11);
            LoadGoodsApplication("SALE", DataGrid3);
            LoadGoodsApplication("PDFILLING", DataGrid13);
            LoadGoodsReturnOrderForPurchase("PURCHASE", DataGrid15);
            LoadGoodsProductionOrder(strUserCode);
            LoadGoodsBorrowOrder(strUserCode);
            LoadGoodsCheckOutNoticeOrder(strUserCode, "SALE");

            ShareClass.InitialInvolvedProjectTree(TreeView1, strUserCode);
            ShareClass.LoadCustomer(DL_Customer, strUserCode);

            ShareClass.InitialConstractTree(TreeView6);

            LoadItemMainPlan(strUserCode);
            LoadGoodsSaleOrder(strUserCode);
            LoadUsingConstract(strUserCode);
        }
    }

    protected void BT_FindAll_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strWareHouse, strCustomerName;

        TabContainer1.ActiveTabIndex = 0;

        strWareHouse = "%" + TB_FindWareHouse.Text.Trim() + "%";
        strCustomerName = "%" + TB_CustomerName.Text.Trim() + "%";

        strHQL = "Select * From T_GoodsShipmentOrder Where (OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " or OperatorCode in (select UnderCode from T_MemberLevel where UserCode = " + "'" + strUserCode + "'" + ")) ";
        strHQL += " and ShipmentType <> 'Transfer'";
        strHQL += " and WareHouse Like '" + strWareHouse + "' And CustomerName Like '" + strCustomerName + "'";
        strHQL += " Order By ShipmentNO DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentOrder");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }

    protected void DataGrid5_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strShipmentNO;

            strShipmentNO = e.Item.Cells[2].Text.Trim();
            LB_ShipmentNO.Text = strShipmentNO;

            for (int i = 0; i < DataGrid5.Items.Count; i++)
            {
                DataGrid5.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            DateTime dtCheckOutTime, dtCurrentTime;
            strHQL = "From GoodsShipmentOrder as goodsShipmentOrder Where goodsShipmentOrder.ShipmentNO = " + strShipmentNO;
            GoodsShipmentOrderBLL goodsShipmentOrderBLL = new GoodsShipmentOrderBLL();
            lst = goodsShipmentOrderBLL.GetAllGoodsShipmentOrders(strHQL);
            GoodsShipmentOrder goodsShipmentOrder = (GoodsShipmentOrder)lst[0];
            LB_ShipmentNO.Text = strShipmentNO;

            dtCurrentTime = DateTime.Now;
            dtCheckOutTime = goodsShipmentOrder.ShipTime;
            TimeSpan ts = dtCurrentTime - dtCheckOutTime;

            LoadGoodsShipmentDetail(strShipmentNO);

            if (e.CommandName == "Update")
            {
                try
                {
                    DL_ShipmentType.SelectedValue = goodsShipmentOrder.ShipmentType;
                }
                catch
                {
                }

                try
                {
                    DL_RelatedType.SelectedValue = goodsShipmentOrder.RelatedType.Trim();
                }
                catch
                {
                }
                NB_RelatedID.Amount = goodsShipmentOrder.RelatedID;


                try
                {
                    DL_Customer.SelectedValue = goodsShipmentOrder.CustomerCode;
                }
                catch
                {
                }

                try
                {
                    DL_CurrencyType.SelectedValue = goodsShipmentOrder.CurrencyType;
                }
                catch
                {
                }

                TB_GSHOName.Text = goodsShipmentOrder.GSHOName.Trim();
                TB_WHName.Text = goodsShipmentOrder.WareHouse.Trim();
                DLC_ShipTime.Text = goodsShipmentOrder.ShipTime.ToString("yyyy-MM-dd");
                TB_ShipmentReason.Text = goodsShipmentOrder.ApplicationReason.Trim();
                TB_Applicant.Text = goodsShipmentOrder.Applicant.Trim();



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

                if (ts.Days == 0)
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
                if (ts.Days > 0)
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('删除失败，只能删除当天的记录，请检查！')", true);
                    return;
                }

                try
                {
                    if (DataGrid1.Items.Count > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCZMXJLSCSBQJC + "')", true);
                        return;
                    }

                    strHQL = "Delete From T_GoodsShipmentOrder Where ShipmentNO = " + strShipmentNO;
                    ShareClass.RunSqlCommand(strHQL);

                    LoadGoodsShipmentOrder(strUserCode);
                    LoadGoodsShipmentDetail(strShipmentNO);

                    LB_ShipmentNO.Text = "";
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCCKNCZMXJLJC + "')", true);
                }
            }
        }
    }


    protected void BT_CreateMain_Click(object sender, EventArgs e)
    {
        LB_ShipmentNO.Text = "";

        BT_NewMain.Visible = true;
        BT_NewDetail.Visible = true;
        BT_CreateDetail.Visible = true;

        DLC_ShipTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

        string strNewCOOCode = ShareClass.GetCodeByRule("CheckOutOrderCode", "CheckOutOrderCode", "00");
        if (strNewCOOCode != "")
        {
            TB_GSHOName.Text = strNewCOOCode;
        }

        LoadGoodsShipmentDetail("0");

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
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
        strRelatedCode = "";

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

            string strNewCOOCode = ShareClass.GetCodeByRule("CheckOutOrderCode", "CheckOutOrderCode", strShipmentNO);
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
        strRelatedCode = "";

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
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode treeNode = new TreeNode();
        treeNode = TreeView3.SelectedNode;

        if (treeNode.Target != "")
        {
            TB_WHName.Text = treeNode.Target.Trim();

            LoadAllGoodsByWareHouse(TB_WHName.Text);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
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

        if (strSourceType == "GoodsCON")
        {
            NB_SourceID.Amount = 0;
            BT_SelectCON.Visible = true;
            TabContainer1.ActiveTabIndex = 4;
        }
        else
        {
            BT_SelectCON.Visible = false;
        }

        if (strSourceType == "GoodsSA")
        {
            NB_SourceID.Amount = 0;
            BT_SelectSA.Visible = true;
            TabContainer1.ActiveTabIndex = 5;
        }
        else
        {
            BT_SelectSA.Visible = false;
        }

        if (strSourceType == "GoodsSO")
        {
            NB_SourceID.Amount = 0;
            BT_SelectSO.Visible = true;
            TabContainer1.ActiveTabIndex = 6;
        }
        else
        {
            BT_SelectSO.Visible = false;
        }

        if (strSourceType == "GoodsOA")
        {
            NB_SourceID.Amount = 0;
            BT_SelectPA.Visible = true;
            TabContainer1.ActiveTabIndex = 7;
        }
        else
        {
            BT_SelectPA.Visible = false;
        }

        if (strSourceType == "GoodsPF")
        {
            NB_SourceID.Amount = 0;
            BT_SelectPF.Visible = true;
            TabContainer1.ActiveTabIndex = 8;
        }
        else
        {
            BT_SelectPF.Visible = false;
        }

        if (strSourceType == "GoodsPUR")
        {
            NB_SourceID.Amount = 0;
            BT_SelectPUR.Visible = true;
            TabContainer1.ActiveTabIndex = 9;
        }
        else
        {
            BT_SelectPUR.Visible = false;
        }

        if (strSourceType == "GoodsPD")
        {
            NB_SourceID.Amount = 0;
            BT_SelectPD.Visible = true;
            TabContainer1.ActiveTabIndex = 10;
        }
        else
        {
            BT_SelectPD.Visible = false;
        }

        if (strSourceType == "GoodsBO")
        {
            NB_SourceID.Amount = 0;
            BT_SelectBO.Visible = true;
            TabContainer1.ActiveTabIndex = 11;
        }
        else
        {
            BT_SelectBO.Visible = false;
        }

        if (strSourceType == "Contract")
        {
            NB_SourceID.Amount = 0;
            BT_SelectCS.Visible = true;
            TabContainer1.ActiveTabIndex = 12;
        }
        else
        {
            BT_SelectCS.Visible = false;
        }

        if (strSourceType == "GoodsCIO")
        {
            NB_SourceID.Amount = 0;
            BT_SelectCIO.Visible = true;
            TabContainer1.ActiveTabIndex = 13;
        }
        else
        {
            BT_SelectCIO.Visible = false;
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

            TabContainer1.ActiveTabIndex = 11;
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

    protected void DataGrid8_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strPlanVerID;

            strPlanVerID = ((Button)e.Item.FindControl("BT_PlanVerID")).Text.Trim();

            for (int i = 0; i < DataGrid8.Items.Count; i++)
            {
                DataGrid8.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            NB_RelatedID.Amount = int.Parse(strPlanVerID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void DataGrid21_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        string strCOOID;
        IList lst;

        if (e.CommandName != "Page")
        {
            strCOOID = ((Button)e.Item.FindControl("BT_COOID")).Text.Trim();

            for (int i = 0; i < DataGrid21.Items.Count; i++)
            {
                DataGrid21.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "from GoodsCheckOutNoticeOrder as goodsCheckOutNoticeOrder where goodsCheckOutNoticeOrder.COOID = " + strCOOID;
            GoodsCheckOutNoticeOrderBLL goodsCheckOutNoticeOrderBLL = new GoodsCheckOutNoticeOrderBLL();
            lst = goodsCheckOutNoticeOrderBLL.GetAllGoodsCheckOutNoticeOrders(strHQL);
            GoodsCheckOutNoticeOrder goodsCheckOutNoticeOrder = (GoodsCheckOutNoticeOrder)lst[0];

            NB_SourceID.Amount = int.Parse(strCOOID);

            LoadGoodsCheckOutNoticeOrderDetail(strCOOID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid22_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strCONID = LB_CONID.Text.Trim();
            string strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            for (int i = 0; i < DataGrid22.Items.Count; i++)
            {
                DataGrid22.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            string strHQL = " from GoodsCheckOutNoticeOrderDetail as goodsCheckOutNoticeOrderDetail where goodsCheckOutNoticeOrderDetail.ID = " + strID;

            GoodsCheckOutNoticeOrderDetailBLL goodsCheckOutNoticeOrderDetailBLL = new GoodsCheckOutNoticeOrderDetailBLL();
            IList lst = goodsCheckOutNoticeOrderDetailBLL.GetAllGoodsCheckOutNoticeOrderDetails(strHQL);
            GoodsCheckOutNoticeOrderDetail goodsCheckOutNoticeOrderDetail = (GoodsCheckOutNoticeOrderDetail)lst[0];


            TB_GoodsCode.Text = goodsCheckOutNoticeOrderDetail.GoodsCode;
            TB_GoodsName.Text = goodsCheckOutNoticeOrderDetail.GoodsName.Trim();
            try
            {
                DL_GoodsType.SelectedValue = goodsCheckOutNoticeOrderDetail.Type;
            }
            catch
            {
                DL_GoodsType.SelectedValue = "";
            }

            TB_Spec.Text = goodsCheckOutNoticeOrderDetail.Spec.Trim();

            NB_Number.Amount = goodsCheckOutNoticeOrderDetail.Number;
            NB_Price.Amount = goodsCheckOutNoticeOrderDetail.Price;

            DL_Unit.SelectedValue = goodsCheckOutNoticeOrderDetail.Unit;
            TB_ModelNumber.Text = goodsCheckOutNoticeOrderDetail.ModelNumber.Trim();

            TB_Comment.Text = goodsCheckOutNoticeOrderDetail.Comment;

            LB_SourceRelatedID.Text = strCONID;
            DL_RecordSourceType.SelectedValue = "GoodsCONRecord";
            NB_RecordSourceID.Amount = decimal.Parse(strID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strAAID;

        if (e.CommandName != "Page")
        {
            strAAID = ((Button)e.Item.FindControl("BT_AAID")).Text.Trim();
            NB_SourceID.Amount = int.Parse(strAAID);

            for (int i = 0; i < DataGrid3.Items.Count; i++)
            {
                DataGrid3.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            LB_SAID.Text = strAAID;
            NB_SourceID.Amount = int.Parse(strAAID);

            LoadGoodsApplicationDetailForSale(strAAID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid6_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strSOID;

        if (e.CommandName != "Page")
        {
            strSOID = ((Button)e.Item.FindControl("BT_SOID")).Text.Trim();
            NB_SourceID.Amount = int.Parse(strSOID);

            for (int i = 0; i < DataGrid6.Items.Count; i++)
            {
                DataGrid6.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            LB_SOID.Text = strSOID;
            NB_RelatedID.Amount = int.Parse(strSOID);
            NB_SourceID.Amount = int.Parse(strSOID);

            string strHQL = "From GoodsSaleOrder as goodsSaleOrder Where goodsSaleOrder.SOID = " + strSOID;
            GoodsSaleOrderBLL goodsSaleOrderBLL = new GoodsSaleOrderBLL();
            IList lst = goodsSaleOrderBLL.GetAllGoodsSaleOrders(strHQL);
            GoodsSaleOrder goodsSaleOrder = (GoodsSaleOrder)lst[0];

            try
            {
                DL_Customer.SelectedValue = goodsSaleOrder.CustomerCode;
            }
            catch
            {
                DL_Customer.SelectedValue = "";

            }

            LoadGoodsSaleOrderDetail(strSOID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid13_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strAAID;
        if (e.CommandName != "Page")
        {
            strAAID = ((Button)e.Item.FindControl("BT_AAID")).Text.Trim();
            NB_SourceID.Amount = int.Parse(strAAID);

            for (int i = 0; i < DataGrid13.Items.Count; i++)
            {
                DataGrid13.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            LB_PAID.Text = strAAID;
            NB_SourceID.Amount = int.Parse(strAAID);

            LoadGoodsApplicationDetailForFilling(strAAID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid15_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strROID;

            strROID = ((Button)e.Item.FindControl("BT_ROID")).Text.Trim();
            LB_PURID.Text = strROID;

            NB_SourceID.Amount = int.Parse(strROID);

            for (int i = 0; i < DataGrid15.Items.Count; i++)
            {
                DataGrid15.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            LB_PURID.Text = strROID;
            NB_SourceID.Amount = int.Parse(strROID);

            LoadGoodsReturnDetailForPurchase(strROID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid11_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strAAID;

        if (e.CommandName != "Page")
        {
            strAAID = ((Button)e.Item.FindControl("BT_AAID")).Text.Trim();

            for (int i = 0; i < DataGrid11.Items.Count; i++)
            {
                DataGrid11.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            LB_PAID.Text = strAAID;
            NB_SourceID.Amount = int.Parse(strAAID);

            LoadGoodsApplicationDetail(strAAID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid18_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strPDID;

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

    protected void DataGrid19_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strBorrowNO;

            strBorrowNO = ((Button)e.Item.FindControl("BT_BorrowNO")).Text.Trim();
            LB_BOID.Text = strBorrowNO;

            for (int i = 0; i < DataGrid19.Items.Count; i++)
            {
                DataGrid19.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            LB_BOID.Text = strBorrowNO;
            NB_SourceID.Amount = int.Parse(strBorrowNO);

            LoadGoodsBorrowOrderDetail(strBorrowNO);

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
            LB_ProjectID.Text = strProjectID;

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

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void LoadProjectRelatedItem(string strProjectID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ProjectRelatedItem as projectRelatedItem where projectRelatedItem.ProjectID = " + strProjectID + " Order by projectRelatedItem.ID ASC";
        ProjectRelatedItemBLL projectRelatedItemBLL = new ProjectRelatedItemBLL();
        lst = projectRelatedItemBLL.GetAllProjectRelatedItems(strHQL);

        DataGrid25.DataSource = lst;
        DataGrid25.DataBind();
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
        string strWareHouse;

        strWareHouse = DL_InWareHouse.SelectedValue.Trim();
        TB_ToPosition.Text = strWareHouse;

        ShareClass.LoadWareHousePositions(strWareHouse, DL_WHPosition);

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID;

            strID = e.Item.Cells[3].Text.Trim();

            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {
                DataGrid1.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            string strShipmentNO = LB_ShipmentNO.Text;
            DateTime dtCheckOutTime, dtCurrentTime;
            strHQL = "From GoodsShipmentOrder as goodsShipmentOrder Where goodsShipmentOrder.ShipmentNO = " + strShipmentNO;
            GoodsShipmentOrderBLL goodsShipmentOrderBLL = new GoodsShipmentOrderBLL();
            lst = goodsShipmentOrderBLL.GetAllGoodsShipmentOrders(strHQL);
            GoodsShipmentOrder goodsShipmentOrder = (GoodsShipmentOrder)lst[0];

            dtCurrentTime = DateTime.Now;
            dtCheckOutTime = goodsShipmentOrder.ShipTime;
            TimeSpan ts = dtCurrentTime - dtCheckOutTime;

            if (e.CommandName == "Update")
            {
                strHQL = "From GoodsShipmentDetail as goodsShipmentDetail Where goodsShipmentDetail.ID = " + strID;
                GoodsShipmentDetailBLL goodsShipmentDetailBLL = new GoodsShipmentDetailBLL();
                lst = goodsShipmentDetailBLL.GetAllGoodsShipmentDetails(strHQL);

                GoodsShipmentDetail goodsShipmentDetail = (GoodsShipmentDetail)lst[0];

                try
                {
                    DL_GoodsType.SelectedValue = goodsShipmentDetail.Type;
                }
                catch
                {
                }

                try
                {
                    DL_Unit.SelectedValue = goodsShipmentDetail.UnitName;
                }
                catch
                {
                }
                try
                {
                    DL_RecordSourceType.SelectedValue = goodsShipmentDetail.SourceType.Trim();
                }
                catch
                {
                }

                TB_SN.Focus();

                LB_ID.Text = strID;
                TB_SN.Text = goodsShipmentDetail.SN;
                TB_GoodsCode.Text = goodsShipmentDetail.GoodsCode.Trim();
                TB_GoodsName.Text = goodsShipmentDetail.GoodsName.Trim();
                TB_SN.Text = goodsShipmentDetail.SN.Trim();
                TB_ModelNumber.Text = goodsShipmentDetail.ModelNumber.Trim();
                TB_Spec.Text = goodsShipmentDetail.Spec.Trim();
                NB_Number.Amount = goodsShipmentDetail.Number;
                NB_Price.Amount = goodsShipmentDetail.Price;
                TB_Manufacturer.Text = goodsShipmentDetail.Manufacturer.Trim();
                NB_WarrantyPeriod.Amount = goodsShipmentDetail.WarrantyPeriod;
                TB_ToPosition.Text = goodsShipmentDetail.ToPosition.Trim();

                try
                {
                    ShareClass.LoadWareHousePositions(TB_ToPosition.Text.Trim(), DL_WHPosition);
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

                TB_FromPosition.Text = goodsShipmentDetail.FromPosition;
                TB_FromWHPosition.Text = goodsShipmentDetail.FromWHPosition.Trim();

                LB_FromGoodsID.Text = goodsShipmentDetail.FromGoodsID.ToString();
                TB_Comment.Text = goodsShipmentDetail.Comment.Trim();
                LB_SourceRelatedID.Text = goodsShipmentDetail.RelatedID.ToString();
                NB_RecordSourceID.Amount = goodsShipmentDetail.SourceID;

                //取得出库单明细的其它属性
                LoadGoodsCheckOutDetailOtherColumn(strID);

                int intCount = GetRelatedWL("物料出货", "物料", goodsShipmentDetail.ShipmentNO);
                if (intCount > 0)
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

                if (ts.Days == 0)
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
                string strFromGoodsID, strGoodsCode, strWareHouse;
                string strSourceType, strSourceID;
                decimal deOldNumber;

                if (ts.Days > 0)
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('删除失败，只能删除当天的记录，请检查！')", true);
                    return;
                }

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
                    LB_ID.Text = "";

                    //更改物料库存原位置数量
                    ShareClass.UpdateGoodsNumberForDelete(strFromGoodsID, deOldNumber);

                    //更改出库单关联业务数据的数量
                    UpdateGoodsRelatedBusinessNumber(strSourceType, strSourceID);

                    //依单据主体关联类型更新项目物资预算的物料代码的预算使用量
                    string strRelatedType = DL_RelatedType.SelectedValue.Trim();
                    string strRelatedID = NB_RelatedID.Amount.ToString();
                    if (DL_RelatedType.SelectedValue.Trim() == "Project")
                    {
                        ShareClass.UpdateProjectRelatedItemNumberByBudgetBusinessType("CHECKOUT", strRelatedType, strRelatedID, strGoodsCode);
                        RefreshProjectRelatedItemNumber(strRelatedID);
                    }


                    if (strSourceType == "GoodsSARecord")
                    {
                        LoadGoodsApplicationDetailForSale(LB_SAID.Text.Trim());
                    }
                    if (strSourceType == "GoodsSORecord")
                    {
                        LoadGoodsSaleOrderDetail(LB_SOID.Text.Trim());
                    }
                    if (strSourceType == "GoodsPURRecord")
                    {
                        LoadGoodsReturnDetailForPurchase(LB_PURID.Text.Trim());
                    }
                    if (strSourceType == "GoodsCSRecord")
                    {
                        string strConstractCode = LB_ConstractCode.Text.Trim();
                        if (strConstractCode != "")
                        {
                            LoadConstractRelatedGoodsList(strConstractCode);
                        }
                    }
                    //更改项目关联物资下单量
                    if (strSourceType == "GoodsPJRecord")
                    {
                        if (DL_RelatedType.SelectedValue.Trim() == "Project")
                        {
                            RefreshProjectRelatedItemNumber(NB_RelatedID.Amount.ToString());
                        }
                    }

                    LoadGoodsShipmentDetail(strShipmentNO);
                    LoadGoods(strGoodsCode, strWareHouse);


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


    //取得出库单明细的其它属性
    protected void LoadGoodsCheckOutDetailOtherColumn(string strCIODetailID)
    {
        string strHQL;

        strHQL = "Select * From T_GoodsShipmentDetail Where ID = " + strCIODetailID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentDetail");

        TB_BatchNumber.Text = ds.Tables[0].Rows[0]["BatchNumber"].ToString();
        DLC_ProductionDate.Text = DateTime.Parse(ds.Tables[0].Rows[0]["ProductDate"].ToString()).ToString("yyyy-MM-dd");
        DLC_ExpiryDate.Text = DateTime.Parse(ds.Tables[0].Rows[0]["ExpiryDate"].ToString()).ToString("yyyy-MM-dd");
        TB_ProductionEquipmentNumber.Text = ds.Tables[0].Rows[0]["ProductionEquipmentNumber"].ToString();
        TB_MaterialFormNumber.Text = ds.Tables[0].Rows[0]["MaterialFormNumber"].ToString();

        TB_RegistrationNumber.Text = ds.Tables[0].Rows[0]["RegistrationNumber"].ToString();
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
                    DL_GoodsType.SelectedValue = projectRelatedItemBom.ItemType;
                }
                catch
                {
                }
                TB_ModelNumber.Text = projectRelatedItemBom.ModelNumber;
                TB_Spec.Text = projectRelatedItemBom.Specification.Trim();
                TB_Manufacturer.Text = projectRelatedItemBom.Brand;

                NB_Number.Amount = projectRelatedItemBom.Number - projectRelatedItemBom.AleadyCheckOut;

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


    protected void TB_QrSN_TextChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strSN = TB_QrSN.Text.Trim();
        TB_SN.Text = strSN;


        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

        strHQL = "From Goods as goods Where goods.SN = '" + strSN + "'";
        GoodsBLL goodsBLL = new GoodsBLL();
        IList lst = goodsBLL.GetAllGoodss(strHQL);
        if (lst.Count > 0)
        {
            Goods goods = (Goods)lst[0];

            TB_GoodsCode.Text = goods.GoodsCode;
            TB_GoodsName.Text = goods.GoodsName;
            try
            {
                DL_GoodsType.SelectedValue = goods.Type.Trim();
            }
            catch
            {
                DL_GoodsType.SelectedValue = "";
            }
            DL_Unit.SelectedValue = goods.UnitName;
            TB_ModelNumber.Text = goods.ModelNumber.Trim();
            TB_Spec.Text = goods.Spec;
            TB_Manufacturer.Text = goods.Manufacturer;

            NB_Price.Amount = goods.Price;
            NB_WarrantyPeriod.Amount = goods.WarrantyPeriod;

            TB_BatchNumber.Text = goods.BatchNumber.Trim();
            DLC_ProductionDate.Text = goods.ProductDate.ToString("yyyy-MM-dd");
            DLC_ExpiryDate.Text = goods.ExpiryDate.ToString("yyyy-MM-dd");
            TB_ProductionEquipmentNumber.Text = goods.ProductionEquipmentNumber.Trim();
            TB_MaterialFormNumber.Text = goods.MaterialFormNumber.Trim();

            if (LB_SourceRelatedID.Text.Trim() == "0")
            {
                DL_RecordSourceType.SelectedValue = "Other";
                NB_RecordSourceID.Amount = 0;
            }

            LoadGoodsInformationBySN(strSN);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void LoadGoodsInformationBySN(string strSN)
    {
        string strHQL;

        string strWareHouse, strDepartString;

        TabContainer1.ActiveTabIndex = 0;

        strDepartString = LB_DepartString.Text.Trim();
        strWareHouse = TB_WHName.Text.Trim();

        strHQL = "Select * From T_Goods  Where SN = '" + strSN + "'";
        strHQL += " and Position in (Select WHName From T_WareHouse Where BelongDepartCode in " + strDepartString + ")";
        strHQL += " Order by Number DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void TB_SN_TextChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strSN = TB_SN.Text.Trim();

        strHQL = "From Goods as goods Where goods.SN = '" + strSN + "'";
        GoodsBLL goodsBLL = new GoodsBLL();
        IList lst = goodsBLL.GetAllGoodss(strHQL);
        if (lst.Count > 0)
        {
            Goods goods = (Goods)lst[0];

            TB_GoodsCode.Text = goods.GoodsCode;
            TB_GoodsName.Text = goods.GoodsName;
            try
            {
                DL_GoodsType.SelectedValue = goods.Type.Trim();
            }
            catch
            {
                DL_GoodsType.SelectedValue = "";
            }
            DL_Unit.SelectedValue = goods.UnitName;
            TB_ModelNumber.Text = goods.ModelNumber.Trim();
            TB_Spec.Text = goods.Spec;
            TB_Manufacturer.Text = goods.Manufacturer;

            NB_Price.Amount = goods.Price;
            NB_WarrantyPeriod.Amount = goods.WarrantyPeriod;

            TB_BatchNumber.Text = goods.BatchNumber.Trim();
            DLC_ProductionDate.Text = goods.ProductDate.ToString("yyyy-MM-dd");
            DLC_ExpiryDate.Text = goods.ExpiryDate.ToString("yyyy-MM-dd");
            TB_ProductionEquipmentNumber.Text = goods.ProductionEquipmentNumber.Trim();
            TB_MaterialFormNumber.Text = goods.MaterialFormNumber.Trim();

            if (LB_SourceRelatedID.Text.Trim() == "0")
            {
                DL_RecordSourceType.SelectedValue = "Other";
                NB_RecordSourceID.Amount = 0;
            }
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_CreateDetail_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";

        TB_SN.Text = "";
        TB_SN.Focus();

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
        strToPosition = TB_ToPosition.Text.Trim();
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

                //更新出库单明细的其它属性
                UpdateGoodsCheckOutDetailForOtherColumn(LB_ID.Text);

                //更新对应物料记录数量
                ShareClass.UpdateGoodsNumberForAdd(strFromGoodsID, deNumber);

                //更改出库单关联业务的数量
                UpdateGoodsRelatedBusinessNumber(strSourceType, strSourceID);

                //依单据主体关联类型更新项目物资预算的物料代码的预算使用量
                string strRelatedType = DL_RelatedType.SelectedValue.Trim();
                string strRelatedID = NB_RelatedID.Amount.ToString();
                if (DL_RelatedType.SelectedValue.Trim() == "Project")
                {
                    ShareClass.UpdateProjectRelatedItemNumberByBudgetBusinessType("CHECKOUT", strRelatedType, strRelatedID, strGoodsCode);
                    RefreshProjectRelatedItemNumber(strRelatedID);
                }


                LoadGoodsShipmentDetail(strShipmentNO);
                LoadGoods(strGoodsCode, strWareHouse);

                if (strSourceType == "GoodsSARecord")
                {
                    LoadGoodsApplicationDetailForSale(LB_SAID.Text.Trim());
                }
                if (strSourceType == "GoodsSORecord")
                {
                    LoadGoodsSaleOrderDetail(LB_SOID.Text.Trim());
                }
                if (strSourceType == "GoodsPURRecord")
                {
                    LoadGoodsReturnDetailForPurchase(LB_PURID.Text.Trim());
                }

                if (strSourceType == "GoodsCSRecord")
                {
                    string strConstractCode = LB_ConstractCode.Text.Trim();
                    if (strConstractCode != "")
                    {
                        LoadConstractRelatedGoodsList(strConstractCode);
                    }
                }



                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJCCJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }
        }
    }

    protected void RefreshProjectRelatedItemNumber(string strProjectID)
    {
        LoadProjectRelatedItem(strProjectID);
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
        strToPosition = TB_ToPosition.Text.Trim();
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

                //更新出库单明细的其它属性
                UpdateGoodsCheckOutDetailForOtherColumn(intID.ToString());

                //更改物料原位置库存数量
                ShareClass.UpdateGoodsNumberForUpdate(strFromGoodsID, deNumber, deOldNumber);

                //更改出库单关联业务数据的数量
                UpdateGoodsRelatedBusinessNumber(strSourceType, strSourceID);

                //依单据主体关联类型更新项目物资预算的物料代码的预算使用量
                string strRelatedType = DL_RelatedType.SelectedValue.Trim();
                string strRelatedID = NB_RelatedID.Amount.ToString();
                if (DL_RelatedType.SelectedValue.Trim() == "Project")
                {
                    ShareClass.UpdateProjectRelatedItemNumberByBudgetBusinessType("CHECKOUT", strRelatedType, strRelatedID, strGoodsCode);
                    RefreshProjectRelatedItemNumber(strRelatedID);
                }


                if (strSourceType == "GoodsSARecord")
                {
                    LoadGoodsApplicationDetailForSale(LB_SAID.Text.Trim());
                }
                if (strSourceType == "GoodsSORecord")
                {
                    LoadGoodsSaleOrderDetail(LB_SOID.Text.Trim());
                }
                if (strSourceType == "GoodsPURRecord")
                {
                    LoadGoodsReturnDetailForPurchase(LB_PURID.Text.Trim());
                }

                if (strSourceType == "GoodsCSRecord")
                {
                    string strConstractCode = LB_ConstractCode.Text.Trim();
                    if (strConstractCode != "")
                    {
                        LoadConstractRelatedGoodsList(strConstractCode);
                    }
                }

                LoadGoodsShipmentDetail(strShipmentNO);
                LoadGoods(strGoodsCode, strWareHouse);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJCCJC + "')", true);

                ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
            }
        }
    }

    //更新出库单明细的其它属性
    protected void UpdateGoodsCheckOutDetailForOtherColumn(string strCOODetailID)
    {
        string strHQL;

        string strBatchNumber, strProductDate, strExpiryDate, strProductionEquipmentNumber, strMaterialFormNumber, strRegistrationNumber;

        strBatchNumber = TB_BatchNumber.Text.Trim();
        strProductDate = DLC_ProductionDate.Text;
        strExpiryDate = DLC_ExpiryDate.Text;
        strProductionEquipmentNumber = TB_ProductionEquipmentNumber.Text.Trim();
        strMaterialFormNumber = TB_MaterialFormNumber.Text.Trim();
        strRegistrationNumber = TB_RegistrationNumber.Text.Trim();


        //strHQL = "Update T_GoodsShipmentDetail Set BatchNumber = '" + strBatchNumber + "',ProductDate = " + strProductDate + ",ExpiryDate = " + strExpiryDate + ",ProductionEquipmentNumber = '" + strProductionEquipmentNumber + "',MaterialFormNumber = '" + strMaterialFormNumber + "',RegistrationNumber = '" + strRegistrationNumber + "' Where ID = " + strCOODetailID;

        strHQL = String.Format(@"Update T_GoodsShipmentDetail Set BatchNumber =  '{0}',ProductDate = cast('{1}' as date),ExpiryDate = cast('{2}' as date),ProductionEquipmentNumber = '{3}',MaterialFormNumber = '{4}',RegistrationNumber = '{5}' Where ID = {6}", strBatchNumber, strProductDate, strExpiryDate, strProductionEquipmentNumber, strMaterialFormNumber, strRegistrationNumber, strCOODetailID);
        ShareClass.RunSqlCommand(strHQL);
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
        strHQL += " Order By Type DESC, OrderTime ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemRelatedOrderBomToExpendDetailData");

        DataGrid17.DataSource = ds;
        DataGrid17.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_FindGoods_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strSN, strGoodsCode, strGoodsName, strType, strModelNumber, strSpec, strBrand;
        string strWareHouse, strDepartString;

        TabContainer1.ActiveTabIndex = 0;

        strSN = TB_SN.Text.Trim();
        strGoodsCode = TB_GoodsCode.Text.Trim();
        strGoodsName = TB_GoodsName.Text.Trim();
        strType = DL_GoodsType.SelectedValue.Trim();
        strModelNumber = TB_ModelNumber.Text.Trim();
        strSpec = TB_Spec.Text.Trim();
        strBrand = TB_Manufacturer.Text.Trim();

        strSN = "%" + strSN + "%";
        strGoodsCode = "%" + strGoodsCode + "%";
        strGoodsName = "%" + strGoodsName + "%";
        strType = "%" + strType + "%";
        strModelNumber = "%" + strModelNumber + "%";
        strSpec = "%" + strSpec + "%";
        strBrand = "%" + strBrand + "%";

        strDepartString = LB_DepartString.Text.Trim();
        strWareHouse = TB_WHName.Text.Trim();

        strHQL = "Select * From T_Goods  Where SN like '" + strSN + "' and GoodsCode Like " + "'" + strGoodsCode + "'" + " and GoodsName like " + "'" + strGoodsName + "'";
        strHQL += " and type Like " + "'" + strType + "'" + " and ModelNumber Like " + "'" + strModelNumber + "'" + " and Spec Like " + "'" + strSpec + "'";
        strHQL += " and Manufacturer Like " + "'" + strBrand + "'";
        strHQL += " and Number > 0";
        strHQL += " and Position = " + "'" + strWareHouse + "'";
        strHQL += " and Position in (Select WHName From T_WareHouse Where BelongDepartCode in " + strDepartString + ")";
        strHQL += " Order by Number DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Goods");

        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();

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
                    NB_Price.Amount = item.SalePrice;
                }
            }
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

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
            TB_FromWHPosition.Text = goods.WHPosition.Trim();

            LB_FromGoodsID.Text = goods.ID.ToString();

            TB_SN.Text = goods.SN;

            NB_WarrantyPeriod.Amount = goods.WarrantyPeriod;

            if (LB_SourceRelatedID.Text.Trim() == "0")
            {
                NB_Price.Amount = goods.Price;
            }

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);

        }
    }

    protected void DataGrid10_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            for (int i = 0; i < DataGrid10.Items.Count; i++)
            {
                DataGrid10.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            string strHQL = " from GoodsApplicationDetail as goodsApplicationDetail where goodsApplicationDetail.ID = " + strID;

            GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
            IList lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);
            GoodsApplicationDetail goodsApplicationDetail = (GoodsApplicationDetail)lst[0];

            TB_GoodsCode.Text = goodsApplicationDetail.GoodsCode;
            TB_GoodsName.Text = goodsApplicationDetail.GoodsName.Trim();

            try
            {
                DL_GoodsType.SelectedValue = goodsApplicationDetail.Type;
            }
            catch
            {
                DL_GoodsType.SelectedValue = "";
            }

            TB_Spec.Text = goodsApplicationDetail.Spec.Trim();
            NB_Number.Amount = goodsApplicationDetail.Number;
            TB_Manufacturer.Text = goodsApplicationDetail.Brand;

            DL_Unit.SelectedValue = goodsApplicationDetail.Unit;
            TB_ModelNumber.Text = goodsApplicationDetail.ModelNumber.Trim();

            LB_SourceRelatedID.Text = goodsApplicationDetail.AAID.ToString();
            DL_RecordSourceType.SelectedValue = "GoodsPARecord";
            NB_RecordSourceID.Amount = goodsApplicationDetail.ID;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid14_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            for (int i = 0; i < DataGrid14.Items.Count; i++)
            {
                DataGrid14.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            string strHQL = " from GoodsApplicationDetail as goodsApplicationDetail where goodsApplicationDetail.ID = " + strID;

            GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
            IList lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);
            GoodsApplicationDetail goodsApplicationDetail = (GoodsApplicationDetail)lst[0];


            TB_GoodsCode.Text = goodsApplicationDetail.GoodsCode;
            TB_GoodsName.Text = goodsApplicationDetail.GoodsName.Trim();

            try
            {
                DL_GoodsType.SelectedValue = goodsApplicationDetail.Type;
            }
            catch
            {
                DL_GoodsType.SelectedValue = "";
            }

            TB_Spec.Text = goodsApplicationDetail.Spec.Trim();
            TB_Manufacturer.Text = goodsApplicationDetail.Brand;

            NB_Number.Amount = goodsApplicationDetail.Number;
            DL_Unit.SelectedValue = goodsApplicationDetail.Unit;
            TB_ModelNumber.Text = goodsApplicationDetail.ModelNumber.Trim();

            LB_SourceRelatedID.Text = goodsApplicationDetail.AAID.ToString();
            DL_RecordSourceType.SelectedValue = "GoodsPFRecord";
            NB_RecordSourceID.Amount = goodsApplicationDetail.ID;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            for (int i = 0; i < DataGrid4.Items.Count; i++)
            {
                DataGrid4.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "from GoodsApplicationDetail as goodsApplicationDetail where goodsApplicationDetail.ID = " + strID;
            GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
            lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);

            if (lst.Count > 0)
            {
                GoodsApplicationDetail goodsApplicationDetail = (GoodsApplicationDetail)lst[0];

                TB_GoodsCode.Text = goodsApplicationDetail.GoodsCode;
                TB_GoodsName.Text = goodsApplicationDetail.GoodsName.Trim();

                try
                {
                    DL_GoodsType.SelectedValue = goodsApplicationDetail.Type;
                }
                catch
                {
                    DL_GoodsType.SelectedValue = "";
                }


                TB_ModelNumber.Text = goodsApplicationDetail.ModelNumber.Trim();
                TB_Spec.Text = goodsApplicationDetail.Spec.Trim();
                TB_Manufacturer.Text = goodsApplicationDetail.Brand;

                NB_Number.Amount = goodsApplicationDetail.Number - goodsApplicationDetail.CheckOutNumber;
                DL_Unit.SelectedValue = goodsApplicationDetail.Unit;

                LB_SourceRelatedID.Text = goodsApplicationDetail.AAID.ToString();
                DL_RecordSourceType.SelectedValue = "GoodsSARecord";
                NB_RecordSourceID.Amount = goodsApplicationDetail.AAID;
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

            string strID;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

            for (int i = 0; i < DataGrid7.Items.Count; i++)
            {
                DataGrid7.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "from GoodsSaleRecord as goodsSaleRecord where goodsSaleRecord.ID = " + strID;
            GoodsSaleRecordBLL goodsSaleRecordBLL = new GoodsSaleRecordBLL();
            lst = goodsSaleRecordBLL.GetAllGoodsSaleRecords(strHQL);

            if (lst.Count > 0)
            {
                GoodsSaleRecord goodsSaleRecord = (GoodsSaleRecord)lst[0];

                TB_GoodsCode.Text = goodsSaleRecord.GoodsCode;
                TB_GoodsName.Text = goodsSaleRecord.GoodsName.Trim();

                try
                {
                    DL_GoodsType.SelectedValue = goodsSaleRecord.Type;
                }
                catch
                {
                    DL_GoodsType.SelectedValue = "";
                }

                TB_ModelNumber.Text = goodsSaleRecord.ModelNumber.Trim();
                TB_Spec.Text = goodsSaleRecord.Spec.Trim();
                TB_Manufacturer.Text = goodsSaleRecord.Brand;

                NB_Number.Amount = goodsSaleRecord.Number - goodsSaleRecord.CheckOutNumber;
                NB_Price.Amount = goodsSaleRecord.Price;
                DL_Unit.SelectedValue = goodsSaleRecord.Unit;

                LB_SourceRelatedID.Text = goodsSaleRecord.SOID.ToString();
                DL_RecordSourceType.SelectedValue = "GoodsSORecord";
                NB_RecordSourceID.Amount = goodsSaleRecord.ID;
            }

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

            try
            {
                DL_GoodsType.SelectedValue = goodsReturnDetail.Type;
            }
            catch
            {
                DL_GoodsType.SelectedValue = "";
            }

            TB_ModelNumber.Text = goodsReturnDetail.ModelNumber.Trim();
            TB_Spec.Text = goodsReturnDetail.Spec.Trim();
            TB_Manufacturer.Text = goodsReturnDetail.Brand;

            NB_Number.Amount = goodsReturnDetail.Number;

            DL_Unit.SelectedValue = goodsReturnDetail.UnitName;

            LB_SourceRelatedID.Text = goodsReturnDetail.ROID.ToString();
            DL_RecordSourceType.SelectedValue = "GoodsPURRecord";
            NB_RecordSourceID.Amount = goodsReturnDetail.ID;

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

            strPDID = LB_PDID.Text.Trim();

            for (int i = 0; i < DataGrid17.Items.Count; i++)
            {
                DataGrid17.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "Select ItemCode,ItemName,Type,ModelNumber,Specification,Brand,Unit,Number From T_ItemRelatedOrderBomToExpendDetailData Where ID = " + strID;
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



    protected void DataGrid20_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strBOID;

            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();
            strBOID = LB_BOID.Text.Trim();

            for (int i = 0; i < DataGrid20.Items.Count; i++)
            {
                DataGrid20.Items[i].ForeColor = Color.Black;
            }

            e.Item.ForeColor = Color.Red;

            strHQL = "From GoodsBorrowOrderDetail as goodsBorrowOrderDetail Where goodsBorrowOrderDetail.ID = " + strID;
            GoodsBorrowOrderDetailBLL goodsBorrowOrderDetailBLL = new GoodsBorrowOrderDetailBLL();
            lst = goodsBorrowOrderDetailBLL.GetAllGoodsBorrowOrderDetails(strHQL);

            GoodsBorrowOrderDetail goodsBorrowOrderDetail = (GoodsBorrowOrderDetail)lst[0];

            TB_GoodsCode.Text = goodsBorrowOrderDetail.GoodsCode.Trim();
            TB_GoodsName.Text = goodsBorrowOrderDetail.GoodsName.Trim();

            try
            {
                DL_GoodsType.SelectedValue = goodsBorrowOrderDetail.Type;
            }
            catch
            {
                DL_GoodsType.SelectedValue = "";
            }


            TB_ModelNumber.Text = goodsBorrowOrderDetail.ModelNumber.Trim();
            TB_Spec.Text = goodsBorrowOrderDetail.Spec.Trim();
            TB_Manufacturer.Text = goodsBorrowOrderDetail.Brand;

            NB_Number.Amount = goodsBorrowOrderDetail.Number;
            NB_Price.Amount = goodsBorrowOrderDetail.Price;
            DL_Unit.SelectedValue = goodsBorrowOrderDetail.UnitName;

            LB_SourceRelatedID.Text = strBOID;
            DL_RecordSourceType.SelectedValue = "GoodsBORecord";
            NB_RecordSourceID.Amount = decimal.Parse(strID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }


    protected void DataGrid23_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strConstractCode;

            for (int i = 0; i < DataGrid23.Items.Count; i++)
            {
                DataGrid23.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strConstractCode = ((Button)e.Item.FindControl("BT_ConstractCode")).Text.Trim();


            LB_ConstractCode.Text = strConstractCode;

            LoadConstractRelatedGoodsList(strConstractCode);

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

            strConstractCode = LB_ConstractCode.Text.Trim();

            for (int i = 0; i < DataGrid24.Items.Count; i++)
            {
                DataGrid24.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            strHQL = "from ConstractRelatedGoods as constractRelatedGoods Where constractRelatedGoods.ConstractCode = " + "'" + strConstractCode + "'";
            strHQL += " and constractRelatedGoods.ID =" + strID;

            ConstractRelatedGoodsBLL constractRelatedGoodsBLL = new ConstractRelatedGoodsBLL();
            lst = constractRelatedGoodsBLL.GetAllConstractRelatedGoodss(strHQL);
            ConstractRelatedGoods constractRelatedGoods = (ConstractRelatedGoods)lst[0];

            TB_GoodsCode.Text = constractRelatedGoods.GoodsCode;
            TB_GoodsName.Text = constractRelatedGoods.GoodsName;
            TB_ModelNumber.Text = constractRelatedGoods.ModelNumber;
            TB_Spec.Text = constractRelatedGoods.Spec;
            TB_Manufacturer.Text = constractRelatedGoods.Brand;

            DL_GoodsType.SelectedValue = constractRelatedGoods.Type;
            DL_Unit.SelectedValue = constractRelatedGoods.Unit;
            NB_Number.Amount = constractRelatedGoods.Number;
            NB_Price.Amount = constractRelatedGoods.Price;

            DL_Unit.SelectedValue = constractRelatedGoods.Unit;

            LB_SourceRelatedID.Text = constractRelatedGoods.ID.ToString();
            DL_RecordSourceType.SelectedValue = "GoodsCSRecord";
            NB_RecordSourceID.Amount = constractRelatedGoods.ID;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
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

            DataGrid25.DataSource = lst;
            DataGrid25.DataBind();
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }


    protected void DataGrid25_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            IList lst;

            string strID, strItemCode, strItemName, strBomVerID, strUnit, strDefaultProcess;
            decimal deNumber, deReservedNumber;

            for (int i = 0; i < DataGrid25.Items.Count; i++)
            {
                DataGrid25.Items[i].ForeColor = Color.Black;
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
                DL_GoodsType.SelectedValue = projectRelatedItem.ItemType;
            }
            catch
            {
            }
            TB_Spec.Text = projectRelatedItem.Specification;
            TB_Manufacturer.Text = projectRelatedItem.Brand;

            TB_ModelNumber.Text = projectRelatedItem.ModelNumber;

            NB_Number.Amount = projectRelatedItem.Number - projectRelatedItem.AleadyCheckOut;

            DL_Unit.SelectedValue = strUnit;

            DL_RecordSourceType.SelectedValue = "GoodsPJRecord";
            NB_RecordSourceID.Amount = projectRelatedItem.ID;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void DataGrid26_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserCode = LB_UserCode.Text;
            string strCIOID;

            strCIOID = ((Button)e.Item.FindControl("BT_CheckInID")).Text.Trim();
            for (int i = 0; i < DataGrid26.Items.Count; i++)
            {
                DataGrid26.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            NB_SourceID.Amount = int.Parse(strCIOID);

            LoadGoodsCheckInOrderDetail(strCIOID);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }


    protected void DataGrid27_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strID;
        string strUserCode;


        strUserCode = LB_UserCode.Text;

        if (e.CommandName != "Page")
        {
            strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();
            strHQL = "from GoodsCheckInOrderDetail as goodsCheckInOrderDetail where goodsCheckInOrderDetail.ID = " + "'" + strID + "'";

            for (int i = 0; i < DataGrid27.Items.Count; i++)
            {
                DataGrid27.Items[i].ForeColor = Color.Black;
            }
            e.Item.ForeColor = Color.Red;

            GoodsCheckInOrderDetailBLL goodsCheckInOrderDetailBLL = new GoodsCheckInOrderDetailBLL();
            lst = goodsCheckInOrderDetailBLL.GetAllGoodsCheckInOrderDetails(strHQL);
            GoodsCheckInOrderDetail goodsCheckInOrderDetail = (GoodsCheckInOrderDetail)lst[0];

            //LB_ID.Text = goodsCheckInOrderDetail.ID.ToString();
            TB_GoodsCode.Text = goodsCheckInOrderDetail.GoodsCode.Trim();
            TB_GoodsName.Text = goodsCheckInOrderDetail.GoodsName;
            TB_SN.Text = goodsCheckInOrderDetail.SN;
            NB_Number.Amount = goodsCheckInOrderDetail.CheckInNumber;
            NB_Price.Amount = goodsCheckInOrderDetail.Price;
            DL_Unit.SelectedValue = goodsCheckInOrderDetail.UnitName;
            TB_Spec.Text = goodsCheckInOrderDetail.Spec;
            TB_Manufacturer.Text = goodsCheckInOrderDetail.Manufacturer.Trim();
            NB_Price.Amount = goodsCheckInOrderDetail.Price;

            try
            {
                DL_GoodsType.SelectedValue = goodsCheckInOrderDetail.Type;
            }
            catch
            {
                DL_GoodsType.SelectedValue = "";
            }

            TB_ModelNumber.Text = goodsCheckInOrderDetail.ModelNumber;

            LB_SourceRelatedID.Text = goodsCheckInOrderDetail.RelatedID.ToString();
            DL_RecordSourceType.SelectedValue = "GoodsCIORecord";
            NB_RecordSourceID.Amount = goodsCheckInOrderDetail.ID;

            NB_WarrantyPeriod.Amount = goodsCheckInOrderDetail.WarrantyPeriod;

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
        }
    }

    protected void LoadGoodsCheckInOrderDetail(string strCheckInID)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsCheckInOrderDetail as goodsCheckInOrderDetail where goodsCheckInOrderDetail.CheckInID = " + strCheckInID;
        strHQL += " Order by goodsCheckInOrderDetail.Number DESC,goodsCheckInOrderDetail.ID DESC";
        GoodsCheckInOrderDetailBLL goodsCheckInOrderDetailBLL = new GoodsCheckInOrderDetailBLL();
        lst = goodsCheckInOrderDetailBLL.GetAllGoodsCheckInOrderDetails(strHQL);
        DataGrid27.DataSource = lst;
        DataGrid27.DataBind();
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

    protected void BT_TransferFromApplicationForm_Click(object sender, EventArgs e)
    {
        string strHQL0, strHQL1, strHQL2, strHQL3, strHQL4;
        string strSAID, strID, strCustomerName, strShipmentNO, strAAGoodsCode, strAAGoodsName, strGoodsModelNumber, strGoodsSpec, strUnitName, strGoodsID, strCurrencyType, strGoodsType;
        string strDepartString;
        decimal deEveryGoodsNumber, deAANumber, deAACheckOutNumber, deTotalGoodsNumber, deGoodsSalePrice;
        int i, j, k = 0;

        DataSet ds0, ds1, ds2, ds3;

        strDepartString = LB_DepartString.Text.Trim();

        strShipmentNO = LB_ShipmentNO.Text.Trim();
        if (strShipmentNO == "")
        {
            AddMain();
        }


        strSAID = LB_SAID.Text.Trim();
        strShipmentNO = LB_ShipmentNO.Text.Trim();
        //strApplicantName = ShareClass.GetApplicantNameFromGoodsApplicaitonOrder(strSAID);

        strHQL0 = " Select GoodsCode,Number From T_GoodsShipmentDetail ";
        strHQL0 += " Where ShipmentNO = " + strShipmentNO;
        ds0 = ShareClass.GetDataSetFromSql(strHQL0, "T_GoodsShipmentDetail");
        if (ds0.Tables[0].Rows.Count == 0)
        {
            strHQL1 = "Select ID,GoodsCode,GoodsName,ModelNumber,Spec,Unit,Number,CheckOutNumber From T_GoodsApplicationDetail Where AAID = " + strSAID;
            strHQL1 += " Order By ID ASC";
            ds1 = ShareClass.GetDataSetFromSql(strHQL1, "T_GoodsApplicationDetail");
            for (i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                strID = ds1.Tables[0].Rows[i][0].ToString();
                strAAGoodsCode = ds1.Tables[0].Rows[i][1].ToString().Trim();
                strAAGoodsName = ds1.Tables[0].Rows[i][2].ToString().Trim();
                strGoodsModelNumber = ds1.Tables[0].Rows[i][3].ToString().Trim();
                strGoodsSpec = ds1.Tables[0].Rows[i][4].ToString().Trim();
                strUnitName = ds1.Tables[0].Rows[i][5].ToString().Trim();

                deAANumber = decimal.Parse(ds1.Tables[0].Rows[i][6].ToString()) - decimal.Parse(ds1.Tables[0].Rows[i][7].ToString());

                if (deAANumber <= 0)
                {
                    continue;
                }


                strHQL2 = "Select A.GoodsCode,A.GoodsName,A.ModelNumber,A.Spec,A.UnitName,sum(A.Number) From T_Goods A ";
                strHQL2 += " Where A.GoodsCode = " + "'" + strAAGoodsCode + "'" + " and A.GoodsName = " + "'" + strAAGoodsName + "'";
                strHQL2 += " and A.Number > 0 ";
                strHQL2 += " and A.ModelNumber = " + "'" + strGoodsModelNumber + "'" + " and A.Spec = " + "'" + strGoodsSpec + "'";
                strHQL2 += " and A.UnitName = " + "'" + strUnitName + "'";
                strHQL2 += " and A.Position in (Select WHName From T_WareHouse Where BelongDepartCode in " + strDepartString + ")";
                strHQL2 += " Group By A.GoodsCode,A.GoodsName,A.ModelNumber,A.Spec,A.UnitName";

                ds2 = ShareClass.GetDataSetFromSql(strHQL2, "T_Goods");

                if (ds2.Tables[0].Rows.Count > 0)
                {
                    deTotalGoodsNumber = decimal.Parse(ds2.Tables[0].Rows[0][5].ToString());

                    if (deAANumber <= deTotalGoodsNumber)
                    {
                        strHQL3 = " Select A.ID, A.GoodsCode,A.Number,A.Price,A.CurrencyType From T_Goods A ";
                        strHQL3 += " Where A.GoodsCode = " + "'" + strAAGoodsCode + "'" + " and A.GoodsName = " + "'" + strAAGoodsName + "'";
                        strHQL3 += " and A.Number > 0 ";
                        strHQL3 += " and A.ModelNumber = " + "'" + strGoodsModelNumber + "'" + " and A.Spec = " + "'" + strGoodsSpec + "'";
                        strHQL3 += " and A.UnitName = " + "'" + strUnitName + "'";
                        strHQL3 += " and A.Position in (Select WHName From T_WareHouse Where BelongDepartCode in " + strDepartString + ")";
                        strHQL3 += " Order By A.Number ASC";
                        ds3 = ShareClass.GetDataSetFromSql(strHQL3, "T_Goods");

                        if (ds3.Tables[0].Rows.Count > 0)
                        {
                            for (j = 0; j < ds3.Tables[0].Rows.Count; j++)
                            {
                                strGoodsID = ds3.Tables[0].Rows[j][0].ToString();
                                deEveryGoodsNumber = decimal.Parse(ds3.Tables[0].Rows[j][2].ToString());
                                deGoodsSalePrice = decimal.Parse(ds3.Tables[0].Rows[j][3].ToString());
                                strCurrencyType = ds3.Tables[0].Rows[j][4].ToString().Trim();

                                if (deAANumber == 0)
                                {
                                    break;
                                }

                                if (deAANumber <= deEveryGoodsNumber)
                                {
                                    strHQL4 = "Insert Into T_GoodsShipmentDetail(ShipmentNO,GoodsCode,GoodsName,Spec,Number,AleadyOutNumber,Price,UnitName,FromPosition,FromGoodsID,ToPosition,Comment,ModelNumber,Manufacturer,Type,SourceType,SourceID)";
                                    strHQL4 += " Select " + strShipmentNO + ",A.GoodsCode,A.GoodsName,A.Spec," + deAANumber.ToString() + "," + deAANumber.ToString() + ",A.Price,A.UnitName,A.Position,A.ID,'','',A.ModelNumber,A.Manufacturer,A.Type,'GoodsSARecord'," + strID + " From T_Goods A ";
                                    strHQL4 += " Where A.ID = " + strGoodsID;
                                    ShareClass.RunSqlCommand(strHQL4);

                                    strHQL4 = "Update T_GoodsApplicationDetail Set CheckOutNumber = CheckOutNumber + " + deAANumber.ToString() + " Where ID = " + strID;
                                    ShareClass.RunSqlCommand(strHQL4);


                                    ////插入应收应付数据到应收应付表
                                    //ShareClass.InsertReceivablesOrPayable("GoodsSHO", "GoodsAO", strSAID, strID, deAANumber * deGoodsSalePrice, strCurrencyType, "", strUserCode);

                                    strHQL4 = "Update T_Goods Set Number = " + (deEveryGoodsNumber - deAANumber).ToString() + " From T_Goods  ";
                                    strHQL4 += " Where ID = " + strGoodsID;
                                    ShareClass.RunSqlCommand(strHQL4);

                                    deAANumber = 0;

                                    k = 1;

                                    break;
                                }
                                else
                                {
                                    strHQL4 = "Insert Into T_GoodsShipmentDetail(ShipmentNO,GoodsCode,GoodsName,Spec,Number,AleadyOutNumber,Price,UnitName,FromPosition,FromGoodsID,ToPosition,Comment,ModelNumber,Manufacturer,Type,SourceType,SourceID)";
                                    strHQL4 += " Select " + strShipmentNO + ",A.GoodsCode,A.GoodsName,A.Spec," + deEveryGoodsNumber.ToString() + "," + deEveryGoodsNumber.ToString() + ",A.Price,A.UnitName,A.Position,A.ID,'','',A.ModelNumber,A.Manufacturer,A.Type ,'GoodsSARecord'," + strID + " From T_Goods A";
                                    strHQL4 += " Where A.ID = " + strGoodsID;
                                    ShareClass.RunSqlCommand(strHQL4);

                                    strHQL4 = "Update T_GoodsApplicationDetail Set CheckOutNumber = CheckOutNumber + " + deEveryGoodsNumber.ToString() + " Where ID = " + strID;
                                    ShareClass.RunSqlCommand(strHQL4);


                                    ////插入应收应付数据到应收应付表
                                    //ShareClass.InsertReceivablesOrPayable("GoodsSHO", "GoodsAO", strSAID, strID, deEveryGoodsNumber * deGoodsSalePrice, strCurrencyType, "", strUserCode);

                                    strHQL4 = "Update T_Goods Set Number = 0 " + " From T_Goods  ";
                                    strHQL4 += " Where ID = " + strGoodsID;
                                    ShareClass.RunSqlCommand(strHQL4);

                                    deAANumber -= deEveryGoodsNumber;

                                    k = 1;
                                }
                            }

                        }
                    }
                }
            }

            if (k == 1)
            {
                LoadGoodsShipmentDetail(strShipmentNO);
                LoadGoodsApplicationDetail(strSAID);
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZJZCCKDCG + "')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBMYFHTJDJLJC + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBCCKDYYJLBNZLJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_TransferFromSaleOrderForm_Click(object sender, EventArgs e)
    {
        string strHQL0, strHQL1, strHQL2, strHQL3, strHQL4;
        string strSOID, strID, strCustomerName, strShipmentNO, strSaleGoodsCode, strSaleGoodsName, strGoodsModelNumber, strGoodsSpec, strUnitName, strGoodsID, strCurrencyType, strGoodsType;
        string strDepartString;
        decimal deEveryGoodsNumber, deSaleNumber, deTotalGoodsNumber, deGoodsSalePrice;
        int i, j, k = 0;

        DataSet ds0, ds1, ds2, ds3;

        strDepartString = LB_DepartString.Text.Trim();

        strShipmentNO = LB_ShipmentNO.Text.Trim();
        if (strShipmentNO == "")
        {
            AddMain();
        }


        strSOID = LB_SOID.Text.Trim();
        strShipmentNO = LB_ShipmentNO.Text.Trim();
        strCustomerName = ShareClass.GetCustomerNameFromGoodsSaleOrder(strSOID);

        strHQL0 = " Select GoodsCode,Number From T_GoodsShipmentDetail ";
        strHQL0 += " Where ShipmentNO = " + strShipmentNO;
        ds0 = ShareClass.GetDataSetFromSql(strHQL0, "T_GoodsShipmentDetail");
        if (ds0.Tables[0].Rows.Count == 0)
        {
            strHQL1 = "Select ID,GoodsCode,GoodsName,ModelNumber,Spec,Unit,Number,CheckOutNumber From T_GoodsSaleRecord Where SOID = " + strSOID;
            strHQL1 += " Order By ID ASC";
            ds1 = ShareClass.GetDataSetFromSql(strHQL1, "T_GoodsSaleRecord");
            for (i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                strID = ds1.Tables[0].Rows[i][0].ToString();
                strSaleGoodsCode = ds1.Tables[0].Rows[i][1].ToString();
                strSaleGoodsName = ds1.Tables[0].Rows[i][2].ToString();
                strGoodsModelNumber = ds1.Tables[0].Rows[i][3].ToString().Trim();
                strGoodsSpec = ds1.Tables[0].Rows[i][4].ToString().Trim();
                strUnitName = ds1.Tables[0].Rows[i][5].ToString().Trim();
                deSaleNumber = decimal.Parse(ds1.Tables[0].Rows[i][6].ToString()) - decimal.Parse(ds1.Tables[0].Rows[i][7].ToString());

                if (deSaleNumber <= 0)
                {
                    continue;
                }

                strHQL2 = "Select A.GoodsCode,A.GoodsName,A.ModelNumber,A.Spec,A.UnitName,sum(A.Number) From T_Goods A ";
                strHQL2 += " Where A.GoodsCode = " + "'" + strSaleGoodsCode + "'" + " and A.GoodsName = " + "'" + strSaleGoodsName + "'";
                strHQL2 += " and A.Number > 0 ";
                strHQL2 += " and A.ModelNumber = " + "'" + strGoodsModelNumber + "'" + " and A.Spec = " + "'" + strGoodsSpec + "'";
                strHQL2 += " and A.UnitName = " + "'" + strUnitName + "'";
                strHQL2 += " and A.Position in (Select WHName From T_WareHouse Where BelongDepartCode in " + strDepartString + ")";
                strHQL2 += " Group By A.GoodsCode,A.GoodsName,A.ModelNumber,A.Spec,A.UnitName";

                ds2 = ShareClass.GetDataSetFromSql(strHQL2, "T_Goods");

                if (ds2.Tables[0].Rows.Count > 0)
                {
                    deTotalGoodsNumber = decimal.Parse(ds2.Tables[0].Rows[0][5].ToString());

                    if (deSaleNumber <= deTotalGoodsNumber)
                    {
                        strHQL3 = " Select A.ID, A.GoodsCode,A.Number,A.Price,A.CurrencyType From T_Goods A ";
                        strHQL3 += " Where A.GoodsCode = " + "'" + strSaleGoodsCode + "'" + " and A.GoodsName = " + "'" + strSaleGoodsName + "'";
                        strHQL3 += " and A.Number > 0 ";
                        strHQL3 += " and A.ModelNumber = " + "'" + strGoodsModelNumber + "'" + " and A.Spec = " + "'" + strGoodsSpec + "'";
                        strHQL3 += " and A.UnitName = " + "'" + strUnitName + "'";
                        strHQL3 += " and A.Position in (Select WHName From T_WareHouse Where BelongDepartCode in " + strDepartString + ")";
                        strHQL3 += " Order By A.Number ASC";
                        ds3 = ShareClass.GetDataSetFromSql(strHQL3, "T_Goods");

                        if (ds3.Tables[0].Rows.Count > 0)
                        {
                            for (j = 0; j < ds3.Tables[0].Rows.Count; j++)
                            {
                                strGoodsID = ds3.Tables[0].Rows[j][0].ToString();
                                deEveryGoodsNumber = decimal.Parse(ds3.Tables[0].Rows[j][2].ToString());
                                deGoodsSalePrice = decimal.Parse(ds3.Tables[0].Rows[j][3].ToString());
                                strCurrencyType = ds3.Tables[0].Rows[j][4].ToString().Trim();

                                if (deSaleNumber == 0)
                                {
                                    break;
                                }

                                if (deSaleNumber <= deEveryGoodsNumber)
                                {
                                    strHQL4 = "Insert Into T_GoodsShipmentDetail(ShipmentNO,GoodsCode,GoodsName,Spec,Number,AleadyOutNumber,Price,UnitName,FromPosition,FromGoodsID,ToPosition,Comment,ModelNumber,Manufacturer,Type,SourceType,SourceID)";
                                    strHQL4 += " Select " + strShipmentNO + ",A.GoodsCode,A.GoodsName,A.Spec," + deSaleNumber.ToString() + "," + deSaleNumber.ToString() + ",A.Price,A.UnitName,A.Position,A.ID,'','',A.ModelNumber,A.Manufacturer,A.Type,'GoodsSORecord'," + strID + " From T_Goods A ";
                                    strHQL4 += " Where A.ID = " + strGoodsID;
                                    ShareClass.RunSqlCommand(strHQL4);

                                    strHQL4 = "Update T_GoodsSaleRecord Set CheckOutNumber = CheckOutNumber + " + deSaleNumber.ToString() + " Where ID = " + strID;
                                    ShareClass.RunSqlCommand(strHQL4);


                                    ////插入应收应付数据到应收应付表
                                    //ShareClass.InsertReceivablesOrPayable("GoodsSHO", "GoodsSO", strSOID, strID, deSaleNumber * deGoodsSalePrice, strCurrencyType, "", strUserCode);

                                    strHQL4 = "Update T_Goods Set Number = " + (deEveryGoodsNumber - deSaleNumber).ToString() + " From T_Goods  ";
                                    strHQL4 += " Where ID = " + strGoodsID;
                                    ShareClass.RunSqlCommand(strHQL4);

                                    deSaleNumber = 0;

                                    k = 1;

                                    break;
                                }
                                else
                                {
                                    strHQL4 = "Insert Into T_GoodsShipmentDetail(ShipmentNO,GoodsCode,GoodsName,Spec,Number,AleadyOutNumber,Price,UnitName,FromPosition,FromGoodsID,ToPosition,Comment,ModelNumber,Manufacturer,Type,SourceType,SourceID)";
                                    strHQL4 += " Select " + strShipmentNO + ",A.GoodsCode,A.GoodsName,A.Spec," + deEveryGoodsNumber.ToString() + "," + deEveryGoodsNumber.ToString() + ",A.Price,A.UnitName,A.Position,A.ID,'','',A.ModelNumber,A.Manufacturer,A.Type ,'GoodsSORecord'," + strID + " From T_Goods A";
                                    strHQL4 += " Where A.ID = " + strGoodsID;
                                    ShareClass.RunSqlCommand(strHQL4);

                                    strHQL4 = "Update T_GoodsSaleRecord Set CheckOutNumber = CheckOutNumber + " + deEveryGoodsNumber.ToString() + " Where ID = " + strID;
                                    ShareClass.RunSqlCommand(strHQL4);


                                    ////插入应收应付数据到应收应付表
                                    //ShareClass.InsertReceivablesOrPayable("GoodsSHO", "GoodsSO", strSOID, strID, deEveryGoodsNumber * deGoodsSalePrice, strCurrencyType, "", strUserCode);

                                    strHQL4 = "Update T_Goods Set Number = 0 " + " From T_Goods  ";
                                    strHQL4 += " Where ID = " + strGoodsID;
                                    ShareClass.RunSqlCommand(strHQL4);

                                    deSaleNumber -= deEveryGoodsNumber;

                                    k = 1;
                                }
                            }

                        }
                    }
                }
            }

            if (k == 1)
            {
                LoadGoodsShipmentDetail(strShipmentNO);
                LoadGoodsSaleOrderDetail(strSOID);

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZJZCCKDCG + "')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBMYFHTJDJLJC + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBCCKDYYJLBNZLJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }

    protected void BT_TransferFromProductionApplicationOrderForm_Click(object sender, EventArgs e)
    {
        string strHQL0, strHQL1, strHQL2, strHQL3, strHQL4;
        string strPAID, strID, strCustomerName, strShipmentNO, strAAGoodsCode, strAAGoodsName, strGoodsModelNumber, strGoodsSpec, strUnitName, strGoodsID, strCurrencyType, strGoodsType;
        string strDepartString;
        decimal deEveryGoodsNumber, deAANumber, deAACheckOutNumber, deTotalGoodsNumber, deGoodsSalePrice;
        int i, j, k = 0;
        DataSet ds0, ds1, ds2, ds3;

        strShipmentNO = LB_ShipmentNO.Text.Trim();
        if (strShipmentNO == "")
        {
            AddMain();
        }


        strDepartString = LB_DepartString.Text.Trim();

        strPAID = LB_PAID.Text.Trim();
        strShipmentNO = LB_ShipmentNO.Text.Trim();
        //strCustomerName = ShareClass.GetCustomerNameFromGoodsSaleOrder(strSOID);

        strHQL0 = " Select  GoodsCode,Number From T_GoodsShipmentDetail ";
        strHQL0 += " Where ShipmentNO = " + strShipmentNO;
        ds0 = ShareClass.GetDataSetFromSql(strHQL0, "T_GoodsShipmentDetail");
        if (ds0.Tables[0].Rows.Count == 0)
        {
            strHQL1 = "Select ID,GoodsCode,GoodsName,ModelNumber,Spec,Unit,Number,CheckOutNumber From T_GoodsApplicationDetail Where AAID = " + strPAID;
            strHQL1 += " Order By ID ASC";
            ds1 = ShareClass.GetDataSetFromSql(strHQL1, "T_GoodsApplicationDetail");
            for (i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                strID = ds1.Tables[0].Rows[i][0].ToString();
                strAAGoodsCode = ds1.Tables[0].Rows[i][1].ToString().Trim();
                strAAGoodsName = ds1.Tables[0].Rows[i][2].ToString().Trim();
                strGoodsModelNumber = ds1.Tables[0].Rows[i][3].ToString().Trim();
                strGoodsSpec = ds1.Tables[0].Rows[i][4].ToString().Trim();
                strUnitName = ds1.Tables[0].Rows[i][5].ToString().Trim();

                deAANumber = decimal.Parse(ds1.Tables[0].Rows[i][6].ToString()) - decimal.Parse(ds1.Tables[0].Rows[i][7].ToString());

                if (deAANumber <= 0)
                {
                    continue;
                }


                strHQL2 = "Select A.GoodsCode,A.GoodsName,A.ModelNumber,A.Spec,A.UnitName,sum(A.Number) From T_Goods A ";
                strHQL2 += " Where A.GoodsCode = " + "'" + strAAGoodsCode + "'" + " and A.GoodsName = " + "'" + strAAGoodsName + "'";
                strHQL2 += " and A.Number > 0 ";
                strHQL2 += " and A.ModelNumber = " + "'" + strGoodsModelNumber + "'" + " and A.Spec = " + "'" + strGoodsSpec + "'";
                strHQL2 += " and A.UnitName = " + "'" + strUnitName + "'";
                strHQL2 += " and A.Position in (Select WHName From T_WareHouse Where BelongDepartCode in " + strDepartString + ")";
                strHQL2 += " Group By A.GoodsCode,A.GoodsName,A.ModelNumber,A.Spec,A.UnitName";

                ds2 = ShareClass.GetDataSetFromSql(strHQL2, "T_Goods");

                if (ds2.Tables[0].Rows.Count > 0)
                {
                    deTotalGoodsNumber = decimal.Parse(ds2.Tables[0].Rows[0][5].ToString());

                    if (deAANumber <= deTotalGoodsNumber)
                    {
                        strHQL3 = " Select A.ID, A.GoodsCode,A.Number,A.Price,A.CurrencyType From T_Goods A ";
                        strHQL3 += " Where A.GoodsCode = " + "'" + strAAGoodsCode + "'" + " and A.GoodsName = " + "'" + strAAGoodsName + "'";
                        strHQL3 += " and A.Number > 0 ";
                        strHQL3 += " and A.ModelNumber = " + "'" + strGoodsModelNumber + "'" + " and A.Spec = " + "'" + strGoodsSpec + "'";
                        strHQL3 += " and A.UnitName = " + "'" + strUnitName + "'";
                        strHQL3 += " and A.Position in (Select WHName From T_WareHouse Where BelongDepartCode in " + strDepartString + ")";
                        strHQL3 += " Order By A.Number ASC";
                        ds3 = ShareClass.GetDataSetFromSql(strHQL3, "T_Goods");

                        if (ds3.Tables[0].Rows.Count > 0)
                        {
                            for (j = 0; j < ds3.Tables[0].Rows.Count; j++)
                            {
                                strGoodsID = ds3.Tables[0].Rows[j][0].ToString();
                                deEveryGoodsNumber = decimal.Parse(ds3.Tables[0].Rows[j][2].ToString());
                                deGoodsSalePrice = decimal.Parse(ds3.Tables[0].Rows[j][3].ToString());
                                strCurrencyType = ds3.Tables[0].Rows[j][4].ToString().Trim();

                                if (deAANumber == 0)
                                {
                                    break;
                                }

                                if (deAANumber <= deEveryGoodsNumber)
                                {
                                    strHQL4 = "Insert Into T_GoodsShipmentDetail(ShipmentNO,GoodsCode,GoodsName,Spec,Number,AleadyOutNumber,Price,UnitName,FromPosition,FromGoodsID,ToPosition,Comment,ModelNumber,Manufacturer,Type,SourceType,SourceID)";
                                    strHQL4 += " Select " + strShipmentNO + ",A.GoodsCode,A.GoodsName,A.Spec," + deAANumber.ToString() + "," + deAANumber.ToString() + ",A.Price,A.UnitName,A.Position,A.ID,'','',A.ModelNumber,A.Manufacturer,A.Type,'GoodsPARecord'," + strID + " From T_Goods A ";
                                    strHQL4 += " Where A.ID = " + strGoodsID;
                                    ShareClass.RunSqlCommand(strHQL4);

                                    strHQL4 = "Update T_GoodsApplicationDetail Set CheckOutNumber = CheckOutNumber + " + deAANumber.ToString() + " Where ID = " + strID;
                                    ShareClass.RunSqlCommand(strHQL4);

                                    ////插入应收应付数据到应收应付表
                                    //ShareClass.InsertReceivablesOrPayable("GoodsSHO", "GoodsAO", strPAID, strID, deAANumber * deGoodsSalePrice, strCurrencyType, "", strUserCode);

                                    strHQL4 = "Update T_Goods Set Number = " + (deEveryGoodsNumber - deAANumber).ToString() + " From T_Goods  ";
                                    strHQL4 += " Where ID = " + strGoodsID;
                                    ShareClass.RunSqlCommand(strHQL4);

                                    deAANumber = 0;

                                    k = 1;

                                    break;
                                }
                                else
                                {
                                    strHQL4 = "Insert Into T_GoodsShipmentDetail(ShipmentNO,GoodsCode,GoodsName,Spec,Number,AleadyOutNumber,Price,UnitName,FromPosition,FromGoodsID,ToPosition,Comment,ModelNumber,Manufacturer,Type,SourceType,SourceID)";
                                    strHQL4 += " Select " + strShipmentNO + ",A.GoodsCode,A.GoodsName,A.Spec," + deEveryGoodsNumber.ToString() + "," + deEveryGoodsNumber.ToString() + ",A.Price,A.UnitName,A.Position,A.ID,'','',A.ModelNumber,A.Manufacturer,A.Type ,'GoodsPARecord'," + strID + " From T_Goods A";
                                    strHQL4 += " Where A.ID = " + strGoodsID;
                                    ShareClass.RunSqlCommand(strHQL4);

                                    strHQL4 = "Update T_GoodsApplicationDetail Set CheckOutNumber = CheckOutNumber + " + deEveryGoodsNumber.ToString() + " Where ID = " + strID;
                                    ShareClass.RunSqlCommand(strHQL4);


                                    ////插入应收应付数据到应收应付表
                                    //ShareClass.InsertReceivablesOrPayable("GoodsSHO", "GoodsAO", strPAID, strID, deEveryGoodsNumber * deGoodsSalePrice, strCurrencyType, "", strUserCode);

                                    strHQL4 = "Update T_Goods Set Number = 0 " + " From T_Goods  ";
                                    strHQL4 += " Where ID = " + strGoodsID;
                                    ShareClass.RunSqlCommand(strHQL4);

                                    deAANumber -= deEveryGoodsNumber;

                                    k = 1;
                                }
                            }

                        }
                    }
                }
            }


            if (k == 1)
            {
                LoadGoodsShipmentDetail(strShipmentNO);
                LoadGoodsApplicationDetail(strPAID);
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZJZCCKDCG + "')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBMYFHTJDJLJC + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSBCCKDYYJLBNZLJC + "')", true);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true','popDetailWindow') ", true);
    }


    //更改出库单关联业务数据的数量
    protected void UpdateGoodsRelatedBusinessNumber(string strSourceType, string strSourceID)
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
                strFromSourceID = strSourceID;
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

        if (strSourceType == "GoodsPARecord")
        {
            strHQL = "Select COALESCE(Sum(Number),0) From T_GoodsShipmentDetail Where SourceType = 'GoodsPARecord' And SourceID=" + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentDetail");

            try
            {
                deSumNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            catch
            {
                deSumNumber = 0;
            }

            strHQL = "Update T_GoodsApplicationDetail Set CheckOutNumber = " + deSumNumber.ToString() + " Where ID = " + strSourceID;
            ShareClass.RunSqlCommand(strHQL);
        }

        if (strSourceType == "GoodsPURRecord")
        {
            strHQL = "Select COALESCE(Sum(Number),0) From T_GoodsShipmentDetail Where SourceType = 'GoodsPURRecord' And SourceID=" + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentDetail");

            try
            {
                deSumNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            catch
            {
                deSumNumber = 0;
            }

            strHQL = "Update T_GoodsPurRecord Set ReturnNumber = " + deSumNumber.ToString() + " Where ID in (Select SourceID From T_GoodsReturnDetail Where SourceType = 'GoodsPORecord' and ID = " + strSourceID + ")";
            ShareClass.RunSqlCommand(strHQL);
        }

        if (strSourceType == "GoodsCSRecord")
        {
            strHQL = "Select COALESCE(Sum(Number),0) From T_GoodsShipmentDetail Where SourceType = 'GoodsCSRecord' And SourceID=" + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentDetail");

            try
            {
                deSumNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            catch
            {
                deSumNumber = 0;
            }

            strHQL = "Update T_ConstractRelatedGoods Set SaleOrderNumber = " + deSumNumber.ToString();
            strHQL += " Where ID = " + strSourceID;
            ShareClass.RunSqlCommand(strHQL);
        }

        //更改项目关联物资下单量
        if (strSourceType == "GoodsPJRecord")
        {
            strHQL = "Select COALESCE(Sum(Number),0) From T_GoodsShipmentDetail Where SourceType = 'GoodsPJRecord' And SourceID=" + strSourceID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsPurRecord");

            try
            {
                deSumNumber = decimal.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            catch
            {
                deSumNumber = 0;
            }

            strHQL = "Update T_ProjectRelatedItem Set AleadyCheckOut = " + deSumNumber.ToString() + " Where ID = " + strSourceID;
            ShareClass.RunSqlCommand(strHQL);
        }
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
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsShipmentOrder");

        DataGrid5.DataSource = ds;
        DataGrid5.DataBind();
    }

    protected void LoadGoodsShipmentOrder(string strUserCode)
    {
        string strHQL;

        strHQL = "Select * From T_GoodsShipmentOrder Where (OperatorCode = " + "'" + strUserCode + "'";
        strHQL += " or OperatorCode in (select UnderCode from T_MemberLevel where UserCode = " + "'" + strUserCode + "'" + ")) ";
        strHQL += " and ShipmentType <> 'Transfer'";
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

    protected void LoadGoodsCheckInOrder(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From GoodsCheckInOrder as goodsCheckInOrder where (goodsCheckInOrder.CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " or goodsCheckInOrder.CreatorCode in (select  memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")) ";
        strHQL += " Order By goodsCheckInOrder.CheckInID DESC";
        GoodsCheckInOrderBLL goodsCheckInOrderBLL = new GoodsCheckInOrderBLL();
        lst = goodsCheckInOrderBLL.GetAllGoodsCheckInOrders(strHQL);
        DataGrid26.DataSource = lst;
        DataGrid26.DataBind();
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

    protected void LoadItemMainPlan(string strUserCode)
    {
        string strHQL;

        strHQL = "Select * From T_ItemMainPlan Where CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " Or CreatorCode in (Select UserCode From T_ProjectMember Where DepartCode in  " + LB_DepartString.Text.Trim() + ")";
        strHQL += " Order By PlanVerID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ItemMainPlan");

        DataGrid8.DataSource = ds;
        DataGrid8.DataBind();
    }

    protected void LoadGoodsSaleOrder(string strOperatorCode)
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

        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
    }

    protected void LoadGoodsApplicationDetailForSale(string strAAID)
    {
        string strHQL;
        IList lst;

        if (strAAID != "")
        {
            strHQL = "from GoodsApplicationDetail as goodsApplicationDetail where goodsApplicationDetail.AAID = " + strAAID;
            GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
            lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);

            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();
        }
    }

    protected void LoadGoodsApplicationDetail(string strAAID)
    {
        string strHQL;
        IList lst;

        if (strAAID != "")
        {
            strHQL = "from GoodsApplicationDetail as goodsApplicationDetail where goodsApplicationDetail.AAID = " + strAAID;
            GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
            lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);

            DataGrid10.DataSource = lst;
            DataGrid10.DataBind();
        }
    }

    protected void LoadGoodsApplicationDetailForFilling(string strAAID)
    {
        string strHQL;
        IList lst;

        if (strAAID != "")
        {
            strHQL = "from GoodsApplicationDetail as goodsApplicationDetail where goodsApplicationDetail.AAID = " + strAAID;
            GoodsApplicationDetailBLL goodsApplicationDetailBLL = new GoodsApplicationDetailBLL();
            lst = goodsApplicationDetailBLL.GetAllGoodsApplicationDetails(strHQL);

            DataGrid14.DataSource = lst;
            DataGrid14.DataBind();
        }
    }

    protected void LoadGoodsApplication(string strType, DataGrid DataGrid)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsApplication as goodsApplication where goodsApplication.ApplicantCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
        strHQL += " and goodsApplication.Type = " + "'" + strType + "'";
        strHQL += " Order by goodsApplication.AAID DESC";
        GoodsApplicationBLL goodsApplicationBLL = new GoodsApplicationBLL();
        lst = goodsApplicationBLL.GetAllGoodsApplications(strHQL);

        DataGrid.DataSource = lst;
        DataGrid.DataBind();
    }

    protected void LoadGoodsApplicationForOther(DataGrid DataGrid)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsApplication as goodsApplication where goodsApplication.ApplicantCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
        strHQL += " and goodsApplication.Type Not In ('PDFILLING','SALE')";
        strHQL += " Order by goodsApplication.AAID DESC";
        GoodsApplicationBLL goodsApplicationBLL = new GoodsApplicationBLL();
        lst = goodsApplicationBLL.GetAllGoodsApplications(strHQL);

        DataGrid.DataSource = lst;
        DataGrid.DataBind();
    }

    protected void LoadGoodsReturnOrderForPurchase(string strFormType, DataGrid dataGrid)
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

    protected void LoadGoodsReturnDetailForPurchase(string strROID)
    {
        string strHQL;
        IList lst;

        strHQL = "From GoodsReturnDetail as goodsReturnDetail Where goodsReturnDetail.ROID = " + strROID + " Order By goodsReturnDetail.ID ASC";
        GoodsReturnDetailBLL goodsReturnDetailBLL = new GoodsReturnDetailBLL();
        lst = goodsReturnDetailBLL.GetAllGoodsReturnDetails(strHQL);

        DataGrid12.DataSource = lst;
        DataGrid12.DataBind();
    }

    protected void LoadGoodsSaleOrderDetail(string strSOID)
    {
        LB_GoodsOwner.Text = Resources.lang.XiaoShouDan + ": " + strSOID + Resources.lang.MingXi;

        if (strSOID != "")
        {
            string strHQL = "Select * from T_GoodsSaleRecord where SOID = " + strSOID + " Order by ID DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsSaleRecord");

            DataGrid7.DataSource = ds;
            DataGrid7.DataBind();

            LB_Sql7.Text = strHQL;
        }
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

    protected void LoadGoodsBorrowOrder(string strUserCode)
    {
        string strHQL;

        strHQL = "Select * From T_GoodsBorrowOrder Where OperatorCode in ( Select UserCode From T_ProjectMember Where DepartCode in " + LB_DepartString.Text.Trim() + ")";
        strHQL += " Order By BorrowNO DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsBorrowOrder");

        DataGrid19.DataSource = ds;
        DataGrid19.DataBind();
    }

    protected void LoadGoodsBorrowOrderDetail(string strBorrowNO)
    {
        string strHQL;
        IList lst;

        strHQL = "From GoodsBorrowOrderDetail as goodsBorrowOrderDetail Where goodsBorrowOrderDetail.BorrowNO = " + strBorrowNO + " Order By goodsBorrowOrderDetail.ID ASC";
        GoodsBorrowOrderDetailBLL goodsBorrowOrderDetailBLL = new GoodsBorrowOrderDetailBLL();
        lst = goodsBorrowOrderDetailBLL.GetAllGoodsBorrowOrderDetails(strHQL);

        DataGrid20.DataSource = lst;
        DataGrid20.DataBind();
    }

    protected void LoadGoodsCheckOutNoticeOrder(string strApplicantCode, string strType)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsCheckOutNoticeOrder as goodsCheckOutNoticeOrder where goodsCheckOutNoticeOrder.ApplicantCode in ( Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
        strHQL += " and goodsCheckOutNoticeOrder.Type = " + "'" + strType + "'";
        strHQL += " Order by goodsCheckOutNoticeOrder.COOID DESC";
        GoodsCheckOutNoticeOrderBLL goodsCheckOutNoticeOrderBLL = new GoodsCheckOutNoticeOrderBLL();
        lst = goodsCheckOutNoticeOrderBLL.GetAllGoodsCheckOutNoticeOrders(strHQL);

        DataGrid21.DataSource = lst;
        DataGrid21.DataBind();
    }


    protected void LoadGoodsCheckOutNoticeOrderDetail(string strCOOID)
    {
        string strHQL;

        strHQL = "Select * From T_GoodsCheckOutNoticeOrderDetail Where COOID = " + strCOOID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_GoodsCheckOutNoticeOrderDetail");

        DataGrid22.DataSource = ds;
        DataGrid22.DataBind();
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

        DataGrid23.DataSource = lst;
        DataGrid23.DataBind();
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


}
