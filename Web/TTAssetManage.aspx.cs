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

public partial class TTAssetManage : System.Web.UI.Page
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

        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "资产管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        LB_UserCode.Text = strUserCode;
        strUserName = Session["UserName"].ToString();
        LB_UserName.Text = strUserName;


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthorityAsset(Resources.lang.ZZJGT,TreeView1, strUserCode);

            LB_DepartString.Text = strDepartString;

            strHQL = "from AssetType as assetType Order by assetType.SortNumber ASC";
            AssetTypeBLL assetTypeBLL = new AssetTypeBLL();
            lst = assetTypeBLL.GetAllAssetTypes(strHQL);
            DL_AssetType.DataSource = lst;
            DL_AssetType.DataBind();
            DL_AssetType.Items.Insert(0, new ListItem("--Select--", ""));

            string strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);

            LB_AssetOwner.Text = Resources.lang.SYZCLB;

            strHQL = "from Asset as asset where ";
            strHQL += " asset.OwnerCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " and asset.Number > 0";
            strHQL += " and asset.Status = '在用' Order by asset.ID DESC";
            AssetBLL assetBLL = new AssetBLL();
            lst = assetBLL.GetAllAssets(strHQL);
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

            LB_AssetOwner.Text = strDepartName + Resources.lang.DZCLB;
            strHQL = "from Asset as asset where asset.OwnerCode in (select projectMember.UserCode from ProjectMember as projectMember where projectMember.DepartCode = " + "'" + strDepartCode + "'" + ") ";
            strHQL += " and asset.Number > 0";
            strHQL += " and asset.Status = '在用' Order by asset.ID DESC";
            AssetBLL assetBLL = new AssetBLL();
            lst = assetBLL.GetAllAssets(strHQL);
            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();

            ShareClass.LoadUserByDepartCodeForDataGrid(strDepartCode, DataGrid3);
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strType = "%" + DL_AssetType.SelectedValue.Trim() + "%";
        string strOwnerName = "%" + TB_OwnerName.Text.Trim() + "%";
        string strOwnerCode = "%" + TB_AssetCode.Text.Trim() + "%";
        string strAssetName = "%" + TB_AssetName.Text.Trim() + "%";

        LB_AssetOwner.Text = Resources.lang.SYZCLB;
        strDepartString = LB_DepartString.Text.Trim();

        strHQL = "from Asset as asset where ";
        strHQL += " asset.Type Like " + "'" + strType + "'";
        strHQL += " and asset.OwnerName Like " + "'" + strOwnerName + "'";
        strHQL += " and asset.AssetCode Like " + "'" + strOwnerCode + "'";
        strHQL += " and asset.AssetName Like " + "'" + strAssetName + "'";
        strHQL += " and asset.OwnerCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " and asset.Number > 0";
        strHQL += " and asset.Status = '在用' Order by asset.ID DESC";
        AssetBLL assetBLL = new AssetBLL();
        lst = assetBLL.GetAllAssets(strHQL);
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

        LB_AssetOwner.Text = strUserName + Resources.lang.DZCLB;

        strHQL = "from Asset as asset where asset.OwnerCode = " + "'" + strUserCode + "'";
        strHQL += " and asset.Number > 0";
        strHQL += " and asset.Status = '在用' Order by asset.ID DESC";
        AssetBLL assetBLL = new AssetBLL();
        lst = assetBLL.GetAllAssets(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;

        AssetBLL assetBLL = new AssetBLL();
        IList lst = assetBLL.GetAllAssets(strHQL);
        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }
}
