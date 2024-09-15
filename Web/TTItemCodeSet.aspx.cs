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

public partial class TTItemCodeSet : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        //ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();

        //bool blVisible2 = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "物料定义", strUserCode);

        //if ( blVisible2 == false )
        //{
        //    Response.Redirect("TTDisplayErrors.aspx");
        //    return;
        //}

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            GoodsTypeTree(TreeView1);
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        string strTypeCharString = "", strMaxItemCode, strFlowNumber;

        string strGoodsType = treeNode.Target.Trim();
        string strGoodsTypeAndCode = treeNode.Text.Trim();
        string strTypeChar = strGoodsTypeAndCode.Replace(strGoodsType, "");


        string strItemCode = TB_ItemCode.Text.Trim();

        DataSet ds = GetItemTypeModule(RP_ItemType);
        DataTable dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (dt.Rows[i]["Type"].ToString().Trim() == strGoodsType.Trim())
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCCYYCZBNZFJRJC + "')", true);
                return;
            }
        }

        DataRow dr = dt.NewRow();
        dr["Type"] = strGoodsType;

        dt.Rows.Add(dr);

        RP_ItemType.DataSource = ds;
        RP_ItemType.DataBind();

        TB_TypeCharString.Text += strTypeChar;

        strTypeCharString = TB_TypeCharString.Text.Trim();

        strMaxItemCode = GetMaxItemCode(strGoodsType, strTypeCharString);

        TB_MaxItemCode.Text = strMaxItemCode;

        strFlowNumber = strMaxItemCode.Replace(strTypeCharString, "");

        TB_ItemCode.Text = strTypeCharString + GetNewFlowNumber(strFlowNumber);
    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strFlowNumber;
            string strTypeChar;
            string strTypeCharString = "";

            string strTypeName = ((Button)e.Item.FindControl("BT_TypeName")).Text;

            DataTable dt = GetItemTypeModule(RP_ItemType).Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["Type"].ToString().Trim() == strTypeName.Trim())
                {
                    dt.Rows.Remove(dt.Rows[i]);
                }
            }
            RP_ItemType.DataSource = dt;
            RP_ItemType.DataBind();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                strTypeName = dt.Rows[i]["Type"].ToString().Trim();
                strTypeChar = GetTypeChar(strTypeName);
                strTypeCharString += strTypeChar;
            }

            try
            {
                if (dt.Rows.Count == 0)
                {
                    strTypeName = "";
                    TB_TypeCharString.Text = "";
                    TB_MaxItemCode.Text = "";
                    TB_ItemCode.Text = "";
                }
                else
                {
                    TB_TypeCharString.Text = strTypeCharString;

                    TB_MaxItemCode.Text = GetMaxItemCode(strTypeName, strTypeCharString);

                    strFlowNumber = TB_MaxItemCode.Text.Replace(strTypeCharString, "");

                    TB_ItemCode.Text = strTypeCharString + GetNewFlowNumber(strFlowNumber);
                }
            }
            catch
            {
            }
        }
    }

    protected void BT_Refresh_Click(object sender, EventArgs e)
    {
        string strFlowNumber;
        string strTypeChar;
        string strTypeCharString = "";
        string strTypeName = "";


        DataTable dt = GetItemTypeModule(RP_ItemType).Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            strTypeName = dt.Rows[i]["Type"].ToString().Trim();
            strTypeChar = GetTypeChar(strTypeName);
            strTypeCharString += strTypeChar;
        }

        try
        {
            if (dt.Rows.Count == 0)
            {
                strTypeName = "";
                TB_TypeCharString.Text = "";
                TB_MaxItemCode.Text = "";
                TB_ItemCode.Text = "";
            }
            else
            {
                TB_TypeCharString.Text = strTypeCharString;

                TB_MaxItemCode.Text = GetMaxItemCode(strTypeName, strTypeCharString);

                strFlowNumber = TB_MaxItemCode.Text.Replace(strTypeCharString, "");

                TB_ItemCode.Text = strTypeCharString + GetNewFlowNumber(strFlowNumber);
            }
        }
        catch
        {
        }
    }

    protected string GetMaxItemCode(string strType, string strTypeCharString)
    {
        string strHQL;
        string strItemCode;

        if (strType != "")
        {
            strHQL = "Select ItemCode From T_Item Where ";
            strHQL += " SmallType = " + "'" + strType + "'";
            strHQL += " and ItemCode Like " + "'" + strTypeCharString + "%'";
        }
        else
        {
            strHQL = "Select ItemCode From T_Item Where ";
            strHQL += " ItemCode Like " + "'" + strTypeCharString + "%'";
        }
        strHQL += " Order By ItemCode DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Item");
        if (ds.Tables[0].Rows.Count > 0)
        {
            strItemCode = ds.Tables[0].Rows[0][0].ToString().Trim();
            return strItemCode;
        }
        else
        {
            return strTypeCharString;
        }
    }


    protected string GetNewFlowNumber(string strFlowNumber)
    {
        int i = 0;
        string strNewFlowNumber, strNumber = "", strNewNumber = "";

        if (strFlowNumber == "")
        {
            return "";
        }

        for (i = 1; i < strFlowNumber.Length; i++)
        {
            strNumber = strFlowNumber.Substring(i - 1, 1);
            if (strNumber == "0")
            {
                strNewNumber += "0";
            }
            else
            {
                break;
            }
        }

        if (strNewNumber.Length > 0)
        {
            if (strNewNumber.Substring(0, 1) == "0")
            {
                strFlowNumber = strFlowNumber.Substring(strNewNumber.Length, strFlowNumber.Length - strNewNumber.Length);
            }
        }

        try
        {
            int.Parse(strFlowNumber);
        }
        catch
        {
            strFlowNumber = "0";
        }

        strNewFlowNumber = (int.Parse(strFlowNumber) + 1).ToString();

        if (strNewFlowNumber.Length != strFlowNumber.Length)
        {
            if (strNewNumber != "")
            {
                strNewNumber = strNewNumber.Substring(1, strNewNumber.Length - 1);
            }
        }

        strNewFlowNumber = strNewNumber + strNewFlowNumber;

        return strNewFlowNumber;
    }


    protected DataSet GetItemTypeModule(Repeater RP)
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable("ItemTypeModule");
        DataColumn dc = new DataColumn();
        dt.Columns.Add("Type", typeof(string));

        if (RP.Items.Count > 0)
        {
            for (int i = 0; i < RP.Items.Count; i++)
            {
                DataRow dr = dt.NewRow();
                dr["Type"] = ((Button)RP_ItemType.Items[i].FindControl("BT_TypeName")).Text.Trim();

                dt.Rows.Add(dr);
            }
        }
        ds.Tables.Add(dt);
        return ds;
    }

    protected string GetTypeChar(string strTypeName)
    {
        string strHQL;

        strHQL = "Select TypeChar From T_GoodsType Where Type = " + "'" + strTypeName + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Item");

        return ds.Tables[0].Rows[0][0].ToString().Trim();
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
                node3.Text = goodsType.Type.Trim() + goodsType.TypeChar.Trim();
                node3.Target = goodsType.Type.Trim();
                node3.Expanded = true;
                node1.ChildNodes.Add(node3);

                GetGoodsTypeTreeView(goodsType.Type.Trim(), node3);

                tv.DataBind();
            }
        }
    }

    /// <summary>
    /// 类型树形结构循环
    /// </summary>
    /// <param name="strParentType">上级类型</param>
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
                node1.Text = goodsType.Type.Trim() + goodsType.TypeChar.Trim();
                node1.Target = goodsType.Type.Trim();
                node1.Expanded = true;
                node.ChildNodes.Add(node1);

                GetGoodsTypeTreeView(goodsType.Type.Trim(), node1);
            }
        }
    }


}