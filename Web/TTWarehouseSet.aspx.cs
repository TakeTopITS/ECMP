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

public partial class TTWarehouseSet : System.Web.UI.Page
{
    string strUserCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strDepartString;
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "仓库设置", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthorityAsset(Resources.lang.ZZJGT, TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            ShareClass.InitialWarehouseTreeByAuthorityAsset(TreeView3, strUserCode, strDepartString);
            ShareClass.InitialWarehouseTreeByAuthorityAsset(TreeView2, strUserCode, strDepartString);

            //LoadWareHouse(strWHName);
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            TB_DepartCode.Text = strDepartCode;
            LB_DepartName.Text = ShareClass.GetDepartName(strDepartCode);
        }
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "")
        {
            TB_ParentWH.Text = treeNode.Target.Trim();
        }
    }

    protected void TreeView3_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode treeNode = new TreeNode();
        treeNode = TreeView3.SelectedNode;

        if (treeNode.Target != "")
        {
            string strHQL;
            IList lst;

            string strWHName;

            strWHName = treeNode.Target.Trim();

            strHQL = "from WareHouse as wareHouse Where wareHouse.WHName = " + "'" + strWHName + "'";
            WareHouseBLL wareHouseBLL = new WareHouseBLL();
            lst = wareHouseBLL.GetAllWareHouses(strHQL);

            WareHouse wareHouse = (WareHouse)lst[0];

            TB_WHName.Text = strWHName;
            DL_CapitalMethod.SelectedValue = wareHouse.CapitalMethod.Trim();
            TB_ParentWH.Text = wareHouse.ParentWH.Trim();
            TB_WHSortNumber.Text = wareHouse.SortNumber.ToString();
            TB_DepartCode.Text = wareHouse.BelongDepartCode.Trim();
            LB_DepartName.Text = wareHouse.BelongDepartName.Trim();

            LoadWareHouse(strWHName);

            LB_BelongWHName.Text = strWHName;
            LoadWareHousePosition(strWHName);
        }
    }


    protected void DataGrid21_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strWHName = ((Button)e.Item.FindControl("BT_WHName")).Text.Trim();
        string strParentWH = e.Item.Cells[1].Text.Trim();
        string strDepartCode = e.Item.Cells[2].Text.Trim();
        string strDepartName = e.Item.Cells[3].Text.Trim();
        string strSortNumber = e.Item.Cells[4].Text.Trim();

        TB_WHName.Text = strWHName;
        TB_ParentWH.Text = strParentWH;
        TB_DepartCode.Text = strDepartCode;
        LB_DepartName.Text = strDepartName;
        TB_WHSortNumber.Text = strSortNumber;
    }


    protected void DataGrid22_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        for (int i = 0; i < DataGrid22.Items.Count; i++)
        {
            DataGrid22.Items[i].ForeColor = Color.Black;
        }
        e.Item.ForeColor = Color.Red;

        string strWHPositionName = ((Button)e.Item.FindControl("BT_WHPositionName")).Text.Trim();
        string strWHName = e.Item.Cells[1].Text.Trim();
        string strComment = e.Item.Cells[2].Text.Trim();

        TB_WHPositionName.Text = strWHPositionName;
        LB_BelongWHName.Text = strWHName;
        TB_Comment.Text = strComment;
    }


    protected void BT_AddWH_Click(object sender, EventArgs e)
    {
        string strParentWH, strWHName, strBelongDepartCode, strBelongDepartName;
        int intSortNumber;

        strParentWH = TB_ParentWH.Text.Trim();
        strWHName = TB_WHName.Text.Trim();
        strBelongDepartCode = TB_DepartCode.Text.Trim();
        strBelongDepartName = LB_DepartName.Text.Trim();
        intSortNumber = int.Parse(TB_WHSortNumber.Text.Trim());

        if (strParentWH == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFCKBNWKQJC + "')", true);
            return;
        }

        WareHouseBLL wareHouseBLL = new WareHouseBLL();
        WareHouse wareHouse = new WareHouse();

        wareHouse.ParentWH = strParentWH;
        wareHouse.WHName = strWHName;
        wareHouse.CapitalMethod = DL_CapitalMethod.SelectedValue;
        wareHouse.BelongDepartCode = strBelongDepartCode;
        wareHouse.BelongDepartName = strBelongDepartName;
        wareHouse.SortNumber = intSortNumber;

        try
        {
            wareHouseBLL.AddWareHouse(wareHouse);

            string strDepartString = LB_DepartString.Text.Trim();
            ShareClass.InitialWarehouseTreeByAuthorityAsset(TreeView3, strUserCode, strDepartString);
            ShareClass.InitialWarehouseTreeByAuthorityAsset(TreeView2, strUserCode, strDepartString);

            LoadWareHouse(strWHName);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSB + "')", true);
        }
    }


    protected void BT_UpdateWH_Click(object sender, EventArgs e)
    {
        string strParentWH, strWHName, strBelongDepartCode, strBelongDepartName;
        int intSortNumber;

        strParentWH = TB_ParentWH.Text.Trim();
        strWHName = TB_WHName.Text.Trim();
        strBelongDepartCode = TB_DepartCode.Text.Trim();
        strBelongDepartName = LB_DepartName.Text.Trim();
        intSortNumber = int.Parse(TB_WHSortNumber.Text.Trim());

        if (strParentWH == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFCKBNWKQJC + "')", true);
            return;
        }

        WareHouseBLL wareHouseBLL = new WareHouseBLL();
        WareHouse wareHouse = new WareHouse();

        wareHouse.ParentWH = strParentWH;
        wareHouse.WHName = strWHName;
        wareHouse.CapitalMethod = DL_CapitalMethod.SelectedValue;
        wareHouse.BelongDepartCode = strBelongDepartCode;
        wareHouse.BelongDepartName = strBelongDepartName;
        wareHouse.SortNumber = intSortNumber;

        try
        {
            wareHouseBLL.UpdateWareHouse(wareHouse, strWHName);

            string strDepartString = LB_DepartString.Text.Trim();
            ShareClass.InitialWarehouseTreeByAuthorityAsset(TreeView3, strUserCode, strDepartString);
            ShareClass.InitialWarehouseTreeByAuthorityAsset(TreeView2, strUserCode, strDepartString);


            LoadWareHouse(strWHName);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
        }
    }

    protected void BT_DeleteWH_Click(object sender, EventArgs e)
    {
        string strWHName, strParentWH;
        int intSortNumber;

        strParentWH = TB_ParentWH.Text.Trim();
        strWHName = TB_WHName.Text.Trim();
        intSortNumber = int.Parse(TB_WHSortNumber.Text.Trim());

        WareHouseBLL wareHouseBLL = new WareHouseBLL();
        WareHouse wareHouse = new WareHouse();

        wareHouse.ParentWH = strParentWH;
        wareHouse.WHName = strWHName;
        wareHouse.SortNumber = intSortNumber;

        try
        {
            wareHouseBLL.DeleteWareHouse(wareHouse);

            string strDepartString = LB_DepartString.Text.Trim();
            ShareClass.InitialWarehouseTreeByAuthorityAsset(TreeView3, strUserCode, strDepartString);
            ShareClass.InitialWarehouseTreeByAuthorityAsset(TreeView2, strUserCode, strDepartString);

            LoadWareHouse(strWHName);
        }
        catch
        {
        }
    }

    protected void BT_AddWHPosition_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strWHPositionName, strWHName, strComment;

        strWHPositionName = TB_WHPositionName.Text.Trim();
        strWHName = LB_BelongWHName.Text.Trim();
        strComment = TB_Comment.Text.Trim();

        if (strWHPositionName == "" & strWHName == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('警告，仓位名称和归属仓库都不能为空，请检查！')", true);
            return;
        }

        try
        {
            strHQL = string.Format(@"Insert Into T_WareHousePositions(PositionName,WHName,Comment) 
                       values ('{0}','{1}','{2}')", strWHPositionName, strWHName, strComment);
            ShareClass.RunSqlCommand(strHQL);

            LoadWareHousePosition(strWHName);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSB + "')", true);
        }
    }


    protected void BT_UpdateWHPosition_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strWHPositionName, strWHName, strComment;

        strWHPositionName = TB_WHPositionName.Text.Trim();
        strWHName = LB_BelongWHName.Text.Trim();
        strComment = TB_Comment.Text.Trim();


        if (strWHPositionName == "" & strWHName == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('警告，仓位名称和归属仓库都不能为空，请检查！')", true);
            return;
        }

        try
        {
            strHQL = string.Format(@"Update T_WareHousePositions Set WHName='{1}',Comment='{2}' Where PositionName = '{0}'", strWHPositionName, strWHName, strComment);
            ShareClass.RunSqlCommand(strHQL);

            LoadWareHousePosition(strWHName);


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
        }
    }

    protected void BT_DeleteWHPosition_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strWHPositionName, strWHName, strComment;

        strWHPositionName = TB_WHPositionName.Text.Trim();
        strWHName = LB_BelongWHName.Text.Trim();
        strComment = TB_Comment.Text.Trim();

        if (strWHPositionName == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('警告，仓位名称不能为空，请检查！')", true);
            return;
        }

        try
        {
            strHQL = string.Format(@"Delete From T_WareHousePositions Where  PositionName = '{0}'", strWHPositionName);
            ShareClass.RunSqlCommand(strHQL);

            LoadWareHousePosition(strWHName);
        }
        catch
        {
        }
    }

    protected void LoadWareHouse(string strWHName)
    {
        string strHQL;
        IList lst;

        strHQL = "from WareHouse as wareHouse Where wareHouse.WHName = " + "'" + strWHName + "'";
        WareHouseBLL wareHouseBLL = new WareHouseBLL();
        lst = wareHouseBLL.GetAllWareHouses(strHQL);

        DataGrid21.DataSource = lst;
        DataGrid21.DataBind();
    }

    protected void LoadWareHousePosition(string strWHName)
    {
        string strHQL;
        IList lst;

        strHQL = "Select * From T_WareHousePositions Where WHName = " + "'" + strWHName + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WareHousePositions");

        DataGrid22.DataSource = ds;
        DataGrid22.DataBind();
    }

    /// <summary>
    /// 判断读者类型是否存在  存在返回true；不存在则返回false
    /// </summary>
    protected bool IsBookReaderType(string strtypename)
    {
        bool flag = true;
        string strHQL = "from WorkType as workType Where workType.TypeName='" + strtypename + "' ";
        WorkTypeBLL workTypeBLL = new WorkTypeBLL();
        IList lst = workTypeBLL.GetAllWorkType(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            flag = true;
        }
        else
            flag = false;
        return flag;
    }

    //判断输入的字符是否是数字
    private bool IsNumeric(string str)
    {
        System.Text.RegularExpressions.Regex reg1
            = new System.Text.RegularExpressions.Regex(@"^[-]?\d+[.]?\d*$");
        return reg1.IsMatch(str);
    }

    protected bool IsWeiXinStand(string strWeiXinNo)
    {
        bool flag = false;
        string strHQL = "From WeiXinStand as weiXinStand Where weiXinStand.WeiXinNo='" + strWeiXinNo + "' ";
        WeiXinStandBLL weiXinStandBLL = new WeiXinStandBLL();
        IList lst = weiXinStandBLL.GetAllWeiXinStands(strHQL);
        if (lst != null && lst.Count > 0)
            flag = true;

        return flag;
    }


}
