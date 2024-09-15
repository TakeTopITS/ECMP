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
using System.IO;
using System.Data.SqlClient;
using System.Data.OleDb;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

using TakeTopSecurity;
using NHibernate.Hql.Ast;
using log4net.Repository.Hierarchy;

public partial class TTModuleTreeSelectPage : System.Web.UI.Page
{
    public string licenseKey;
    public string strUserCode, strUserType;

    protected void Page_Load(object sender, EventArgs e)
    {
        licenseKey = System.Configuration.ConfigurationManager.AppSettings["CopyRight"];
        Session["LicenseKey"] = licenseKey;

        if (licenseKey != "泰顶-拓鼎-钟礼月")
        {
            HttpContext.Current.Response.Redirect("TTDisplayErrors.aspx");
        }

        strUserCode = Session["UserCode"].ToString();
        strUserType = ShareClass.GetUserType(strUserCode);

        if (Page.IsPostBack == false)
        {
            InitialModuleTree(TreeView1, strUserType, Session["LangCode"].ToString());
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strModuleID, strHomeModuleName, strPageName;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        strModuleID = treeNode.Target.Trim();
        try
        {
            strHomeModuleName = GetModuleName(strModuleID).ToString().Trim();
        }
        catch
        {
            strHomeModuleName = "";
        }

        try
        {
            strPageName = GetModulePageName(strModuleID).ToString().Trim();
        }
        catch
        {
            strPageName = "";
        }

        //LogClass.WriteLogFile(strHomeModuleName + strPageName);

        //调用前台js方法
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "selectNode('" + strHomeModuleName + "','" + strPageName + "')", true);
    }

    protected void InitialModuleTree(TreeView treeView, string strUserType, string strLangCode)
    {
        string strHQL;
        string strModuleID, strModuleName, strModuleType, strHomeModuleName, strPageName;

        //添加根节点
        treeView.Nodes.Clear();
        TreeNode node1 = new TreeNode();
        TreeNode node2 = new TreeNode();

        node1.Text = "<b>" + Resources.lang.XiTongMoZu + "<b>";
        node1.Target = "0";
        node1.Expanded = true;
        treeView.Nodes.Add(node1);


        strHQL = string.Format(@"Select Distinct A.ID,A.ModuleName,A.HomeModuleName,A.ParentModule,A.PageName,A.ModuleType,
                A.UserType,A.IconURL,A.SortNumber,A.DIYFlow From T_ProModuleLevel A, T_ProModule B Where rtrim(A.ModuleName)
                ||rtrim(A.ModuleType)||rtrim(A.UserType) = rtrim(B.ModuleName) ||rtrim(B.ModuleType) 
                ||rtrim(B.UserType)  and A.Visible = 'YES' and A.IsDeleted = 'NO' 
                and A.ModuleType Not In ('APP','DIYAPP','SITE')  and B.UserCode = '{0}' and A.UserType = '{1}' and B.UserType = '{1}' and char_length(A.ParentModule) = 0
                and B.Visible = 'YES' and B.ModuleType Not In ('APP','DIYAPP','SITE') and position(rtrim(A.ModuleName)||',' in '{2}') = 0
                and A.LangCode = '{3}' Order By A.ModuleType DESC,A.SortNumber ASC", strUserCode,strUserType, Session["ForbitModule"].ToString(), strLangCode);
        DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            strModuleID = ds1.Tables[0].Rows[i]["ID"].ToString();
            strModuleName = ds1.Tables[0].Rows[i]["ModuleName"].ToString().Trim();
            strHomeModuleName = ds1.Tables[0].Rows[i]["HomeModuleName"].ToString().Trim();
            strModuleType = ds1.Tables[0].Rows[i]["ModuleType"].ToString().Trim();
            strPageName = ds1.Tables[0].Rows[i]["PageName"].ToString().Trim();

            if (Session["ForbitModule"].ToString().IndexOf(strModuleName + ",") >= 0)
            {
                continue;
            }

            node2 = new TreeNode();

            node2.Text = (i + 1).ToString() + "." + strModuleName;
            node2.ToolTip = strPageName;
            node2.Target = strModuleID;
            node2.Expanded = false;

            node1.ChildNodes.Add(node2);


            ModuleTreeShow(strUserType, strModuleType, strModuleName, node2, strLangCode);


            treeView.DataBind();
        }
    }

    public void ModuleTreeShow(string strParentUserType, string strParentModuleType, string strParentModule, TreeNode treeNode, string strLangCode)
    {
        string strHQL;

        string strModuleID, strModuleName, strModuleType, strHomeModuleName, strPageName;
        TreeNode node1 = new TreeNode();


        strHQL = string.Format(@"Select Distinct A.ID,A.ModuleName,A.HomeModuleName,A.ParentModule,A.PageName,A.ModuleType,
                A.UserType,A.IconURL,A.SortNumber,A.DIYFlow From T_ProModuleLevel A, T_ProModule B Where rtrim(A.ModuleName)
                ||rtrim(A.ModuleType)||rtrim(A.UserType) = rtrim(B.ModuleName) ||rtrim(B.ModuleType) 
                ||rtrim(B.UserType)  and A.Visible = 'YES' and A.IsDeleted = 'NO' 
                and A.ModuleType Not In ('APP','DIYAPP','SITE') and B.UserCode = '{0}' and A.UserType = '{1}' and B.UserType = '{1}' and A.ParentModule = '{2}'
                 and B.Visible = 'YES' and B.ModuleType Not In ('APP','DIYAPP','SITE') and position(rtrim(A.ModuleName)||',' in '{3}') = 0
                and A.LangCode = '{4}' Order By A.ModuleType DESC,A.SortNumber ASC",strUserCode, strParentUserType, strParentModule,  Session["ForbitModule"].ToString(), strLangCode);
        DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            strModuleID = ds1.Tables[0].Rows[i]["ID"].ToString();
            strModuleName = ds1.Tables[0].Rows[i]["ModuleName"].ToString();
            strHomeModuleName = ds1.Tables[0].Rows[i]["HomeModuleName"].ToString();
            strModuleType = ds1.Tables[0].Rows[i]["ModuleType"].ToString().Trim();
            strPageName = ds1.Tables[0].Rows[i]["PageName"].ToString().Trim();

            node1 = new TreeNode();
            node1.Text = (i + 1).ToString() + "." + strModuleName;
            node1.ToolTip = strPageName;
            node1.Target = strModuleID;

            node1.Expanded = false;

            treeNode.ChildNodes.Add(node1);

            ModuleTreeShow(strParentUserType, strModuleType, strModuleName, node1, strLangCode);
        }
    }


    protected string GetModuleName(string strModuleID)
    {
        string strHQL = "Select ModuleName From T_ProModuleLevel Where ID = " + strModuleID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "";
        }
    }

    protected string GetModulePageName(string strModuleID)
    {
        string strHQL = "Select PageName From T_ProModuleLevel Where ID = " + strModuleID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "";
        }
    }

    public static string getUrl()
    {
        return "www.taketopits.com";
    }

}