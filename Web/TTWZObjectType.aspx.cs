using System; using System.Resources;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZObjectType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString(); ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            LoadTree();
        }
    }

    private void LoadTree()
    {
        TV_Type.Nodes.Clear();
        TreeNode Node = new TreeNode();
        Node.Text = "所有";
        Node.Value = "all|0|0|0";
        string strDLSQL = "select * from T_WZMaterialDL";
        DataTable dtDL = ShareClass.GetDataSetFromSql(strDLSQL, "DL").Tables[0];
        if (dtDL != null && dtDL.Rows.Count > 0)
        {
            foreach (DataRow drDL in dtDL.Rows)
            {
                TreeNode DLNode = new TreeNode();
                DLNode.Text = drDL["DLName"].ToString();
                string strDLCode = drDL["DLCode"].ToString();
                DLNode.Value = strDLCode + "|0|0|1";
                string strZLSQL = string.Format("select * from T_WZMaterialZL where DLCode = '{0}'", strDLCode);
                DataTable dtZL = ShareClass.GetDataSetFromSql(strZLSQL, "ZL").Tables[0];
                if (dtZL != null && dtZL.Rows.Count > 0)
                {
                    foreach (DataRow drZL in dtZL.Rows)
                    {
                        TreeNode ZLNode = new TreeNode();
                        ZLNode.Text = drZL["ZLName"].ToString();
                        string strZLCode = drZL["ZLCode"].ToString();
                        ZLNode.Value = strDLCode +"|"+ strZLCode + "|0|2";
                        string strXLSQL = string.Format("select * from T_WZMaterialXL where DLCode = '{0}' and ZLCode = '{1}'", strDLCode, strZLCode);
                        DataTable dtXL = ShareClass.GetDataSetFromSql(strXLSQL,"XL").Tables[0];
                        if (dtXL != null && dtXL.Rows.Count > 0)
                        {
                            foreach (DataRow drXL in dtXL.Rows)
                            {
                                TreeNode XLNode = new TreeNode();
                                XLNode.Text = drXL["XLName"].ToString();
                                XLNode.Value = strDLCode + "|" + strZLCode + "|" + drXL["XLCode"].ToString() + "|3";
                                ZLNode.ChildNodes.Add(XLNode);
                            }
                        }
                        DLNode.ChildNodes.Add(ZLNode);
                    }
                }
                Node.ChildNodes.Add(DLNode);
            }
        }
        Node.ExpandAll();
        TV_Type.Nodes.Add(Node);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string strSelectedValue = TV_Type.SelectedNode.Value;
        string[] arrSelectedValue = strSelectedValue.Split('|');
        if (arrSelectedValue[3] == "0")
        {
            //添加大类
            string strDLSQL = string.Format(@"insert into T_WZMaterialDL(DLCode,DLName,DLDesc,IsMark)
                values('{0}','{1}','{2}',0)", txtCode.Text.Trim(), txtName.Text.Trim(), txtDesc.Value.Trim());
            ShareClass.RunSqlCommand(strDLSQL);
        }
        else if (arrSelectedValue[3] == "1")
        { 
            //添加中类
            string strZLSQL = string.Format(@"insert into T_WZMaterialZL(DLCode,ZLCode,ZLName,ZLDesc,IsMark)
                values('{0}','{1}','{2}','{3}',0)", arrSelectedValue[0], txtCode.Text.Trim(), txtName.Text.Trim(), txtDesc.Value.Trim());
            ShareClass.RunSqlCommand(strZLSQL);
        }
        else if (arrSelectedValue[3] == "2")
        {
            //添加小类
            string strXLSQL = string.Format(@"insert into T_WZMaterialXL(DLCode,ZLCode,XLCode,XLName,XLDesc,IsMark)
                values('{0}','{1}','{2}','{3}','{4}',0)", arrSelectedValue[0], arrSelectedValue[1], txtCode.Text.Trim(), txtName.Text.Trim(), txtDesc.Value.Trim());
            ShareClass.RunSqlCommand(strXLSQL);
        }
        else {
            Response.Write("<script>alert('小类不能再添加子级了！');</script>");
        }
        LoadTree();
    }

    protected void TV_Type_SelectedNodeChanged(object sender, EventArgs e)
    {
        if (TV_Type.SelectedNode != null)
        {
            ClearControl();
        }
    }


    private void ClearControl()
    {
        txtCode.Text = "";
        txtName.Text = "";
        txtDesc.Value = "";
    }
}