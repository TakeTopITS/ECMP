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

using System.Text;
using System.IO;
using System.Web.Mail;

using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTReqularWLList : System.Web.UI.Page
{
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        strLangCode = Session["LangCode"].ToString();

        if (Page.IsPostBack == false)
        {
            InitialWorkFlowTree(TreeView1, strUserCode);
        }
    }

    //生成常用工作流申请树
    public void InitialWorkFlowTree(TreeView TreeView, String strUserCode)
    {
        string strHQL;
        DataSet ds;

        string strWFID, strWFName, strPageName, strWFType;
        string strDepartCode, strUnderDepartString, strParentDepartString;


        strParentDepartString = TakeTopCore.CoreShareClass.InitialParentDepartmentStringByAuthority(strUserCode);
        strUnderDepartString = TakeTopCore.CoreShareClass.InitialUnderDepartmentStringByAuthority(strUserCode);


        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        //添加根节点
        TreeView.Nodes.Clear();

        TreeNode node0 = new TreeNode();
        TreeNode node1 = new TreeNode();
        TreeNode node2 = new TreeNode();
        TreeNode node3 = new TreeNode();
        TreeNode node4 = new TreeNode();
        TreeNode node5 = new TreeNode();
        TreeNode node6 = new TreeNode();

        WorkFlowTemplateBLL workFlowTemplateBLL = new WorkFlowTemplateBLL();
        WorkFlowTemplate workFlowTemplate = new WorkFlowTemplate();

        node0.Text = "<table background='ImagesSkin/main_n_bj.jpg' border='0' cellpadding='0' cellspacing='0' width='165px'><tr><td style='width:165px;'><B><B> " + Resources.lang.CYLCSQ + "</B></td></tr></table>";
        node0.Target = "0";
        node0.Expanded = true;
        TreeView.Nodes.Add(node0);

        node1 = new TreeNode();
        node1.Text = "<B>" + Resources.lang.CYLC + "</B>";
        node1.Target = "1";
        node1.Expanded = true;
        node0.ChildNodes.Add(node1);

        strHQL = "select * from T_WorkFlowTemplate as workFlowTemplate Where workFlowTemplate.PageFile <> ''";
        //strHQL += " and (BelongDepartCode in (select ParentDepartCode from F_GetParentDepartCode(" + "'" + strDepartCode + "'" + "))";

        strHQL += " and (BelongDepartCode in " + strParentDepartString;
        strHQL += " Or BelongDepartCode in " + strUnderDepartString;
        strHQL += " Or TemName in (Select TemName From T_WorkFlowTemplateBusinessMember Where UserCode = '" + strUserCode + "')";
        strHQL += " Or TemName in (Select TemName From T_WorkFlowTemplateBusinessDepartment Where DepartCode in " + strParentDepartString + "))";
        strHQL += " Order by workFlowTemplate.SortNumber ASC";
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            strWFID = ds.Tables[0].Rows[i]["IdentifyString"].ToString().Trim();
            strWFName = ds.Tables[0].Rows[i]["TemName"].ToString().Trim();
            strPageName = ds.Tables[0].Rows[i]["PageFile"].ToString().Trim();
            strWFType = ds.Tables[0].Rows[i]["Type"].ToString().Trim();

            node4 = new TreeNode();

            node4.Text = "<A href=" + strPageName + "?TargetID=" + strWFID + " Target=Right>" + strWFName + "</a>";
            node4.Target = strWFID;
            node4.Expanded = true;

            node1.ChildNodes.Add(node4);
        }

        node2 = new TreeNode();
        node2.Text = "<B>" + Resources.lang.ShenQingLeiXing + "</B>";
        node2.Target = "1";
        node2.Expanded = true;
        node0.ChildNodes.Add(node2);

        strHQL = "Select HomeName,ID From T_WLType Where LangCode = " + "'" + strLangCode + "'";
        strHQL += " and Type In (Select Type From T_WorkFlowTemplate as workFlowTemplate Where XSNFile <> ''";
        strHQL += " and (BelongDepartCode in " + strParentDepartString;
        strHQL += " Or BelongDepartCode in " + strUnderDepartString;
        strHQL += " Or TemName in (Select TemName From T_WorkFlowTemplateBusinessMember Where UserCode = '" + strUserCode + "')";
        strHQL += " Or TemName in (Select TemName From T_WorkFlowTemplateBusinessDepartment Where DepartCode in " + strParentDepartString + ")))";
        strHQL += " Order by SortNumber ASC";


        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            strWFName = ds.Tables[0].Rows[i][0].ToString().Trim();
            strWFID = ds.Tables[0].Rows[i][1].ToString().Trim();

            node5 = new TreeNode();
            node5.Text = "<A href=" + "TTDIYWorkFlowForm.aspx" + "?TargetID=" + strWFID + " Target=Right>" + strWFName + "</a>";
            node5.Target = strWFID;
            node5.Expanded = true;

            node2.ChildNodes.Add(node5);
        }

        node3 = new TreeNode();
        node3.Text = "<B>" + Resources.lang.BaoBiao + "</B>";
        node3.Target = "1";
        node3.Expanded = true;
        node0.ChildNodes.Add(node3);

        node6 = new TreeNode();

        node6.Text = "<A href=TTExpenseApplyWFView.aspx Target=Right>" + Resources.lang.FYSQHZ + "</a>";
        node6.Target = "TTExpenseApplyWFView";
        node6.Expanded = true;

        node3.ChildNodes.Add(node6);

        node5 = new TreeNode();

        node5.Text = "<A href=TTExpenseClaimView.aspx Target=Right>" + Resources.lang.FYBXHZ + "</a>";
        node5.Target = "TTExpenseClaimView";
        node5.Expanded = true;

        node3.ChildNodes.Add(node5);

        TreeView.DataBind();
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strWFID;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0" & treeNode.Target != "1")
        {
            strWFID = treeNode.Target.Trim();

        }
    }
}
