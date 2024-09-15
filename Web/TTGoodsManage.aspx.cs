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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTGoodsManage : System.Web.UI.Page
{
    string strDepartString;

    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //Taketop Software 2006－2012

        string strUserCode = Session["UserCode"].ToString();
        string strHQL;
        IList lst;
        string strUserName;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "库存管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        //this.Title = "物料管理---" + System.Configuration.ConfigurationManager.AppSettings["SystemName"];

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthorityAsset(Resources.lang.ZZJGT,TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            string strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);

            LoadGoodsType();
            ShareClass.LoadVendorList(DL_VendorList, strUserCode);

            LB_GoodsOwner.Text = Resources.lang.SYLPLB;

            strHQL = "from Goods as goods where ";
            strHQL += " goods.OwnerCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and goods.Number > 0";
            strHQL += " and goods.Status = '在用' Order by goods.ID DESC";
            GoodsBLL goodsBLL = new GoodsBLL();
            lst = goodsBLL.GetAllGoodss(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            LB_Sql.Text = strHQL;
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strDepartName, strHQL;
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = treeNode.Text.Trim();

            LB_GoodsOwner.Text = strDepartName + Resources.lang.DLPLB;

            strHQL = "from Goods as goods where goods.OwnerCode in (select projectMember.UserCode from ProjectMember as projectMember where projectMember.DepartCode = " + "'" + strDepartCode + "'" + ") ";
            strHQL += " and goods.Number > 0";
            strHQL += " and goods.Status = '在用' Order by goods.ID DESC";
            GoodsBLL goodsBLL = new GoodsBLL();
            lst = goodsBLL.GetAllGoodss(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);
        }

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "displayOwnerColumn()", true);
    }


    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strType = "%" + DL_GoodsType.SelectedValue.Trim() + "%";
        string strOwnerName = "%" + TB_OwnerName.Text.Trim() + "%";
        string strGoodsCode = "%" + TB_GoodsCode.Text.Trim() + "%";
        string strGoodsName = "%" + TB_GoodsName.Text.Trim() + "%";
        string strVendor = "%" + DL_VendorList.SelectedValue.Trim() + "%";

        LB_GoodsOwner.Text = Resources.lang.SYLPLB;
        strDepartString = LB_DepartString.Text.Trim();

        strHQL = "from Goods as goods where ";
        strHQL += " goods.Type Like " + "'" + strType + "'";
        strHQL += " and goods.OwnerName Like " + "'" + strOwnerName + "'";
        strHQL += " and goods.GoodsCode Like " + "'" + strGoodsCode + "'";
        strHQL += " and goods.GoodsName Like " + "'" + strGoodsName + "'";
        strHQL += " and goods.Manufacturer Like " + "'" + strVendor + "'";
        strHQL += " and goods.OwnerCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " and goods.Number > 0";
        strHQL += " and goods.Status = '在用' Order by goods.ID DESC";
        GoodsBLL goodsBLL = new GoodsBLL();
        lst = goodsBLL.GetAllGoodss(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }


    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strUserCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        string strUserName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();

        LB_GoodsOwner.Text = strUserName + Resources.lang.DLPLB;

        strHQL = "from Goods as goods where goods.OwnerCode = " + "'" + strUserCode + "'";
        strHQL += " and goods.Number > 0";
        strHQL += " and goods.Status = '在用' Order by goods.ID DESC";
        GoodsBLL goodsBLL = new GoodsBLL();
        lst = goodsBLL.GetAllGoodss(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();


        LB_Sql.Text = strHQL;

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "displayOwnerColumn()", true);
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        GoodsBLL goodsBLL = new GoodsBLL();
        IList lst = goodsBLL.GetAllGoodss(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void LoadGoodsType()
    {
        string strHQL;
        IList lst;

        strHQL = "from GoodsType as goodsType Order by goodsType.SortNumber ASC";
        GoodsTypeBLL goodsTypeBLL = new GoodsTypeBLL();
        lst = goodsTypeBLL.GetAllGoodsTypes(strHQL);
        DL_GoodsType.DataSource = lst;
        DL_GoodsType.DataBind();
        DL_GoodsType.Items.Insert(0, new ListItem("--Select--", ""));
    }

}
