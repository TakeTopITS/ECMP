using System;
using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ProjectMgt.BLL;
using ProjectMgt.Model;

public partial class TTGoodsTypeSet : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "物料类型设置", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            GoodsTypeTree(TreeView1);
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        string strGoodsTypeType = treeNode.Target.Trim();

        string strHQL = "From GoodsType as goodsType Where goodsType.Type='" + strGoodsTypeType + "' ";
        GoodsTypeBLL goodsTypeBLL = new GoodsTypeBLL();
        IList lst = goodsTypeBLL.GetAllGoodsTypes(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            GoodsType goodsType = (GoodsType)lst[0];

            TB_GoodsTypeName.Text = goodsType.Type.Trim();
            TB_GoodsTypeChar.Text = goodsType.TypeChar.Trim();
            TB_SortNumber.Text = goodsType.SortNumber.ToString();
            TB_GoodsParentType.Text = goodsType.ParentType.Trim();
        }
    }

    protected void BT_GoodsTypeAdd_Click(object sender, EventArgs e)
    {
        if (TB_GoodsTypeName.Text.Trim() == "" || TB_SortNumber.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTSZDNRBNWKJC + "')", true);
            TB_GoodsTypeName.Focus();

            TB_SortNumber.Focus();

            TB_GoodsParentType.Focus();
            return;
        }


        GoodsTypeBLL goodsTypeBLL = new GoodsTypeBLL();
        GoodsType goodsType = new GoodsType();

        goodsType.Type = TB_GoodsTypeName.Text.Trim();
        goodsType.TypeChar = TB_GoodsTypeChar.Text.Trim();
        goodsType.ParentType = TB_GoodsParentType.Text.Trim();
        goodsType.SortNumber = int.Parse(TB_SortNumber.Text.Trim());


        try
        {
            goodsTypeBLL.AddGoodsType(goodsType);

            GoodsTypeTree(TreeView1);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJC + "')", true);
        }
    }


    protected void BT_GoodsTypeUpdate_Click(object sender, EventArgs e)
    {
        if (TB_GoodsTypeName.Text.Trim() == "" || TB_SortNumber.Text.Trim() == "" || TB_GoodsParentType.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZTSZDNRBNWKJC + "')", true);
            TB_GoodsTypeName.Focus();

            TB_SortNumber.Focus();

            TB_GoodsParentType.Focus();
            return;
        }


        string strHQL = "From GoodsType as goodsType where goodsType.Type = '" + TB_GoodsTypeName.Text.Trim() + "'";
        GoodsTypeBLL goodsTypeBLL = new GoodsTypeBLL();
        IList lst = goodsTypeBLL.GetAllGoodsTypes(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            GoodsType goodsType = (GoodsType)lst[0];
            goodsType.Type = TB_GoodsTypeName.Text.Trim();
            goodsType.TypeChar = TB_GoodsTypeChar.Text.Trim();
            goodsType.ParentType = TB_GoodsParentType.Text.Trim();
            goodsType.SortNumber = int.Parse(TB_SortNumber.Text.Trim());


            try
            {
                goodsTypeBLL.UpdateGoodsType(goodsType, TB_GoodsTypeName.Text.Trim());

                GoodsTypeTree(TreeView1);


                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSJBCZJC + "')", true);
        }
    }

    protected void BT_GoodsTypeDelete_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strGoodsType;

        strGoodsType = TB_GoodsTypeName.Text.Trim();

        strHQL = "Delete From T_GoodsType Where Type = " + "'" + strGoodsType + "'";
        ShareClass.RunSqlCommand(strHQL);

        GoodsTypeTree(TreeView1);

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
    }

    /// <summary>
    /// 绑定会计科目树形结构
    /// </summary>
    /// <param name="tv">树形控件</param>
    protected void GoodsTypeTree(TreeView tv)
    {
        //添加根节点
        tv.Nodes.Clear();

        TreeNode node1 = new TreeNode();
        TreeNode node3 = new TreeNode();

        node1.Text = Resources.lang.LiaoPinLeiXing;
        node1.Target = "0";
        node1.Expanded = true;
        tv.Nodes.Add(node1);

        string strHQL = "From GoodsType as goodsType Where goodsType.ParentType='0' Order By goodsType.SortNumber ";
        GoodsTypeBLL goodsTypeBLL = new GoodsTypeBLL();
        IList lst = goodsTypeBLL.GetAllGoodsTypes(strHQL);
        if (lst != null && lst.Count > 0)
        {
            for (int j = 0; j < lst.Count; j++)
            {
                node3 = new TreeNode();
                GoodsType goodsType = (GoodsType)lst[j];
                node3.Text = goodsType.Type.Trim() + " " + goodsType.TypeChar.Trim();
                node3.Target = goodsType.Type.Trim();
                node3.Expanded = true;
                node1.ChildNodes.Add(node3);

                GetGoodsTypeTreeView(goodsType.Type.Trim(), node3);

                tv.DataBind();
            }
        }
    }

    /// <summary>
    /// 会计科目树形结构循环
    /// </summary>
    /// <param name="strParentID">上级科目ID</param>
    /// <param name="node">树形节点</param>
    protected void GetGoodsTypeTreeView(string strParentType, TreeNode node)
    {
        string strHQL = "From GoodsType as goodsType Where goodsType.ParentType='" + strParentType + "' Order By goodsType.SortNumber ";
        GoodsTypeBLL goodsTypeBLL = new GoodsTypeBLL();
        IList lst = goodsTypeBLL.GetAllGoodsTypes(strHQL);
        if (lst.Count > 0 && lst != null)
        {
            for (int i = 0; i < lst.Count; i++)
            {
                GoodsType goodsType = (GoodsType)lst[i];
                TreeNode node1 = new TreeNode();
                node1.Text = goodsType.Type.Trim() + " " + goodsType.TypeChar.Trim();
                node1.Target = goodsType.Type.Trim();
                node1.Expanded = true;
                node.ChildNodes.Add(node1);

                GetGoodsTypeTreeView(goodsType.Type.Trim(), node1);
            }
        }
    }

}