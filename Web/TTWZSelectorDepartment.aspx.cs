using System; using System.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZSelectorDepartment : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"] == null ? "" : Session["UserCode"].ToString().Trim();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (!IsPostBack)
        {
            //这个是所有部门
            TakeTopCore.CoreShareClass.InitialAllDepartmentTree( Resources.lang.ZZJGT,TreeView2);

        }
    }


    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            string strDepartName = treeNode.Text.Trim();
            string[] arrDepart = strDepartName.Split(' ');

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "clickMember('" + arrDepart[1] + "');", true);
        }
    }
}