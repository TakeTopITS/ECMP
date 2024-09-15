using ProjectMgt.BLL;
using ProjectMgt.Model;
using System; using System.Resources;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTWZSelectorUserInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode;
        string strDepartString;

        strUserCode = Session["UserCode"].ToString();


        //this.Title = "组织架构设置---" + System.Configuration.ConfigurationManager.AppSettings["SystemName"];

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByUserInfor(Resources.lang.ZZJGT,TreeView1, strUserCode);
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strHQL;
        string strUserCode = Session["UserCode"].ToString();
        IList lst;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();

            DepartmentBLL departmentBLL = new DepartmentBLL();
            strHQL = "from Department as department where department.DepartCode = " + "'" + strDepartCode + "'";
            lst = departmentBLL.GetAllDepartments(strHQL);

            Department department = (Department)lst[0];

            string strDepartName = department.DepartName.Trim();

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "clickMember('" + strDepartCode + "|" + strDepartName + "');", true);
        }
    }

}