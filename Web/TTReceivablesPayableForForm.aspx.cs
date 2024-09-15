using ProjectMgt.BLL;
using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTReceivablesPayableForForm : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        strUserCode = Session["UserCode"].ToString();

        string strDepartString;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "收付款（单据）", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT, TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where goodsPurchaseOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
            strHQL += " and goodsPurchaseOrder.POID not in (Select constractRelatedGoodsPurchaseOrder.POID From ConstractRelatedGoodsPurchaseOrder as constractRelatedGoodsPurchaseOrder)";
            strHQL += " Order by goodsPurchaseOrder.POID DESC";
            GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
            lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);

            DataGrid5.DataSource = lst;
            DataGrid5.DataBind();

            LB_Sql5.Text = strHQL;

            strHQL = "from GoodsApplication as goodsApplication where goodsApplication.ApplicantCode  in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
            strHQL += " and goodsApplication.Type = 'PURCHASE'";
            strHQL += "  Order by goodsApplication.AAID DESC";
            GoodsApplicationBLL goodsApplicationBLL = new GoodsApplicationBLL();
            lst = goodsApplicationBLL.GetAllGoodsApplications(strHQL);

            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();
            LB_Sql4.Text = strHQL;

            strHQL = "from GoodsSaleOrder as goodsSaleOrder where goodsSaleOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
            strHQL += " and goodsSaleOrder.SOID not in (Select constractRelatedGoodsSaleOrder.SOID From ConstractRelatedGoodsSaleOrder as constractRelatedGoodsSaleOrder)";
            strHQL += " Order by goodsSaleOrder.SOID DESC";
            GoodsSaleOrderBLL goodsSaleOrderBLL = new GoodsSaleOrderBLL();
            lst = goodsSaleOrderBLL.GetAllGoodsSaleOrders(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
            LB_Sql1.Text = strHQL;

            strHQL = "From GoodsReturnOrder as goodsReturnOrder Where goodsReturnOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
            strHQL += " and goodsReturnOrder.Type = 'SALE'";
            strHQL += " Order By goodsReturnOrder.ROID DESC";
            GoodsReturnOrderBLL goodsReturnOrderBLL = new GoodsReturnOrderBLL();
            lst = goodsReturnOrderBLL.GetAllGoodsReturnOrders(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            LB_Sql2.Text = strHQL;


            strHQL = "from AssetPurchaseOrder as assetPurchaseOrder where assetPurchaseOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
            strHQL += " and assetPurchaseOrder.POID not in (Select constractRelatedAssetPurchaseOrder.POID From ConstractRelatedAssetPurchaseOrder as constractRelatedAssetPurchaseOrder)";
            strHQL += " Order by assetPurchaseOrder.POID DESC";
            AssetPurchaseOrderBLL assetPurchaseOrderBLL = new AssetPurchaseOrderBLL();
            lst = assetPurchaseOrderBLL.GetAllAssetPurchaseOrders(strHQL);

            DataGrid6.DataSource = lst;
            DataGrid6.DataBind();

            LB_Sql6.Text = strHQL;


            strHQL = "from GoodsProductionOrder as goodsProductionOrder where goodsProductionOrder.CreatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + LB_DepartString.Text.Trim() + ")";
            strHQL += " Order by goodsProductionOrder.PDID DESC";
            GoodsProductionOrderBLL goodsProductionOrderBLL = new GoodsProductionOrderBLL();
            lst = goodsProductionOrderBLL.GetAllGoodsProductionOrders(strHQL);

            DataGrid7.DataSource = lst;
            DataGrid7.DataBind();

            LB_Sql7.Text = strHQL;
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartCode, strDepartName;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = treeNode.Text.Trim();

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);

            strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where goodsPurchaseOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode = '" + strDepartCode + "')";
            strHQL += " and goodsPurchaseOrder.POID not in (Select constractRelatedGoodsPurchaseOrder.POID From ConstractRelatedGoodsPurchaseOrder as constractRelatedGoodsPurchaseOrder)";
            strHQL += " Order by goodsPurchaseOrder.POID DESC";
            GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
            lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);

            DataGrid5.DataSource = lst;
            DataGrid5.DataBind();

            LB_Sql5.Text = strHQL;

            strHQL = "from GoodsApplication as goodsApplication where goodsApplication.ApplicantCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode = '" + strDepartCode + "')";
            strHQL += "  Order by goodsApplication.AAID DESC";
            GoodsApplicationBLL goodsApplicationBLL = new GoodsApplicationBLL();
            lst = goodsApplicationBLL.GetAllGoodsApplications(strHQL);

            DataGrid4.DataSource = lst;
            DataGrid4.DataBind();

            LB_Sql4.Text = strHQL;


            strHQL = "From GoodsReturnOrder as goodsReturnOrder Where goodsReturnOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode = '" + strDepartCode + "')";
            strHQL += " Order By goodsReturnOrder.ROID DESC";
            GoodsReturnOrderBLL goodsReturnOrderBLL = new GoodsReturnOrderBLL();
            lst = goodsReturnOrderBLL.GetAllGoodsReturnOrders(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();

            LB_Sql2.Text = strHQL;

            strHQL = "from GoodsSaleOrder as goodsSaleOrder where goodsSaleOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode = '" + strDepartCode + "')";
            strHQL += " and goodsSaleOrder.SOID not in (Select constractRelatedGoodsSaleOrder.SOID From ConstractRelatedGoodsSaleOrder as constractRelatedGoodsSaleOrder)";
            strHQL += " Order by goodsSaleOrder.SOID DESC";
            GoodsSaleOrderBLL goodsSaleOrderBLL = new GoodsSaleOrderBLL();
            lst = goodsSaleOrderBLL.GetAllGoodsSaleOrders(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LB_Sql1.Text = strHQL;


            strHQL = "from AssetPurchaseOrder as assetPurchaseOrder where assetPurchaseOrder.OperatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode = '" + strDepartCode + "')";
            strHQL += " and assetPurchaseOrder.POID not in (Select constractRelatedAssetPurchaseOrder.POID From ConstractRelatedAssetPurchaseOrder as constractRelatedAssetPurchaseOrder)";
            strHQL += " Order by assetPurchaseOrder.POID DESC";
            AssetPurchaseOrderBLL assetPurchaseOrderBLL = new AssetPurchaseOrderBLL();
            lst = assetPurchaseOrderBLL.GetAllAssetPurchaseOrders(strHQL);

            DataGrid6.DataSource = lst;
            DataGrid6.DataBind();

            LB_Sql6.Text = strHQL;

            strHQL = "from GoodsProductionOrder as goodsProductionOrder where goodsProductionOrder.CreatorCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode = '" + strDepartCode + "')";
            strHQL += " Order by goodsProductionOrder.PDID DESC";
            GoodsProductionOrderBLL goodsProductionOrderBLL = new GoodsProductionOrderBLL();
            lst = goodsProductionOrderBLL.GetAllGoodsProductionOrders(strHQL);

            DataGrid7.DataSource = lst;
            DataGrid7.DataBind();

            LB_Sql7.Text = strHQL;
        }
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strUserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        string strUserName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();

        LoadGoodsPurchaseOrder(strUserCode);

        LoadGoodsApplicationOrder(strUserCode);

        LoadGoodsReturnOrder(strUserCode);

        LoadGoodsSaleOrder(strUserCode);

        LoadAssetPurchaseOrder(strUserCode);

        LoadGoodsProductionOrder(strUserCode);
    }


    protected void LoadGoodsPurchaseOrder(string strOperatorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsPurchaseOrder as goodsPurchaseOrder where goodsPurchaseOrder.OperatorCode = " + "'" + strOperatorCode + "'";
        strHQL += " and goodsPurchaseOrder.POID not in (Select constractRelatedGoodsPurchaseOrder.POID From ConstractRelatedGoodsPurchaseOrder as constractRelatedGoodsPurchaseOrder)";
        strHQL += " Order by goodsPurchaseOrder.POID DESC";
        GoodsPurchaseOrderBLL goodsPurchaseOrderBLL = new GoodsPurchaseOrderBLL();
        lst = goodsPurchaseOrderBLL.GetAllGoodsPurchaseOrders(strHQL);

        DataGrid5.DataSource = lst;
        DataGrid5.DataBind();

        LB_Sql5.Text = strHQL;
    }

    protected void LoadGoodsApplicationOrder(string strOperatorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsApplication as goodsApplication where goodsApplication.ApplicantCode = " + "'" + strOperatorCode + "'";
        strHQL += "  Order by goodsApplication.AAID DESC";
        GoodsApplicationBLL goodsApplicationBLL = new GoodsApplicationBLL();
        lst = goodsApplicationBLL.GetAllGoodsApplications(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();

        LB_Sql4.Text = strHQL;
    }

    protected void LoadGoodsReturnOrder(string strOperatorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From GoodsReturnOrder as goodsReturnOrder Where goodsReturnOrder.OperatorCode = " + "'" + strOperatorCode + "'";
        strHQL += " Order By goodsReturnOrder.ROID DESC";
        GoodsReturnOrderBLL goodsReturnOrderBLL = new GoodsReturnOrderBLL();
        lst = goodsReturnOrderBLL.GetAllGoodsReturnOrders(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql2.Text = strHQL;
    }

    protected void LoadGoodsSaleOrder(string strOperatorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsSaleOrder as goodsSaleOrder where goodsSaleOrder.OperatorCode = " + "'" + strOperatorCode + "'";
        strHQL += " and goodsSaleOrder.SOID not in (Select constractRelatedGoodsSaleOrder.SOID From ConstractRelatedGoodsSaleOrder as constractRelatedGoodsSaleOrder)";
        strHQL += " Order by goodsSaleOrder.SOID DESC";
        GoodsSaleOrderBLL goodsSaleOrderBLL = new GoodsSaleOrderBLL();
        lst = goodsSaleOrderBLL.GetAllGoodsSaleOrders(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;
    }

    protected void LoadAssetPurchaseOrder(string strOperatorCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from AssetPurchaseOrder as assetPurchaseOrder where assetPurchaseOrder.OperatorCode = " + "'" + strOperatorCode + "'";
        strHQL += " and assetPurchaseOrder.POID not in (Select constractRelatedAssetPurchaseOrder.POID From ConstractRelatedAssetPurchaseOrder as constractRelatedAssetPurchaseOrder)";
        strHQL += " Order by assetPurchaseOrder.POID DESC";
        AssetPurchaseOrderBLL assetPurchaseOrderBLL = new AssetPurchaseOrderBLL();
        lst = assetPurchaseOrderBLL.GetAllAssetPurchaseOrders(strHQL);

        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();

        LB_Sql6.Text = strHQL;
    }


    protected void LoadGoodsProductionOrder(string strOperatorCode)
    {
        string strHQL;
        IList lst;


        strHQL = "from GoodsProductionOrder as goodsProductionOrder where goodsProductionOrder.CreatorCode = " + "'" + strOperatorCode + "'";
        strHQL += " Order by goodsProductionOrder.PDID DESC";

        GoodsProductionOrderBLL goodsProductionOrderBLL = new GoodsProductionOrderBLL();
        lst = goodsProductionOrderBLL.GetAllGoodsProductionOrders(strHQL);

        DataGrid7.DataSource = lst;
        DataGrid7.DataBind();

        LB_Sql7.Text = strHQL;
    }

    protected void DataGrid4_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql4.Text;

        GoodsApplicationBLL goodsApplicationBLL = new GoodsApplicationBLL();
        IList lst = goodsApplicationBLL.GetAllGoodsApplications(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid5.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql2.Text;

        GoodsReturnOrderBLL goodsReturnOrderBLL = new GoodsReturnOrderBLL();
        IList lst = goodsReturnOrderBLL.GetAllGoodsReturnOrders(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql1.Text;

        GoodsSaleOrderBLL goodsSaleOrderBLL = new GoodsSaleOrderBLL();
        IList lst = goodsSaleOrderBLL.GetAllGoodsSaleOrders(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
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

    protected void DataGrid6_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid6.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql6.Text;

        AssetPurchaseOrderBLL assetPurchaseOrderBLL = new AssetPurchaseOrderBLL();
        IList lst = assetPurchaseOrderBLL.GetAllAssetPurchaseOrders(strHQL);

        DataGrid6.DataSource = lst;
        DataGrid6.DataBind();
    }

    protected void DataGrid7_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid7.CurrentPageIndex = e.NewPageIndex;
        string strHQL = LB_Sql7.Text;

        GoodsProductionOrderBLL puchaseOrderBLL = new GoodsProductionOrderBLL();
        IList lst = puchaseOrderBLL.GetAllGoodsProductionOrders(strHQL);

        DataGrid7.DataSource = lst;
        DataGrid7.DataBind();
    }

}


