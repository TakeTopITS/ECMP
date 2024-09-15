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


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TakeTopSiteContentEdit : System.Web.UI.Page
{
    string strUserCode;
    string strIsMobileDevice;
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        //CKEditor初始化
        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "ckfinder/";
        _FileBrowser.SetupCKEditor(CKEditor1);

        strUserCode = Session["UserCode"].ToString();
        strIsMobileDevice = Session["IsMobileDevice"].ToString();
        strLangCode = Session["LangCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);                                                                                                                            
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.htm");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            if (strIsMobileDevice == "YES")
            {
                HTEditor1.Visible = true;
            }
            else
            {
                CKEditor1.Visible = true;
            }

            ShareClass.LoadLanguageForDropList(ddlLangSwitcher);
            ddlLangSwitcher.SelectedValue = strLangCode;

            InitialSiteModuleTree(TreeView1, "INNER", strLangCode);
        }
    }
    protected void ddlLangSwitcher_SelectedIndexChanged(object sender, EventArgs e)
    {
        strLangCode = ddlLangSwitcher.SelectedValue.Trim();
        InitialSiteModuleTree(TreeView1, "INNER", ddlLangSwitcher.SelectedValue.Trim());

        if (strIsMobileDevice == "YES")
        {
            HTEditor1.Text = "";
        }
        else
        {
            CKEditor1.Text = "";
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strModuleID, strModuleName, strHomeModuleName, strModuleType;
        int intLevel;

        strLangCode = ddlLangSwitcher.SelectedValue.Trim();

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        intLevel = treeNode.Depth;
        LB_Level.Text = intLevel.ToString();

        strModuleID = treeNode.Target.Trim();

        if (strModuleID == "0")
        {
            LB_ModuleID.Text = "";
        }
        else
        {
            strHQL = "Select ID,ModuleName,HomeModuleName From T_ProModuleLevel Where ID = " + strModuleID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

            strModuleType = ds.Tables[0].Rows[0][0].ToString();
            strModuleName = ds.Tables[0].Rows[0][1].ToString();
            strHomeModuleName = ds.Tables[0].Rows[0][2].ToString();

            LB_ModuleID.Text = strModuleID;
            LB_ModuleName.Text = strModuleName;
            LB_HomeModuleName.Text = strHomeModuleName;

            LoadSiteModuleContent(strModuleName, strLangCode);

            BT_Update.Enabled = false;
            BT_Delete.Enabled = false;
        }


    }

    protected void DataGrid4_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;
        string strID = ((Button)e.Item.FindControl("BT_ContentID")).Text.Trim();

        SiteModuleContentBLL siteModuleContentBLL = new SiteModuleContentBLL();
        SiteModuleContent siteModuleContent = new SiteModuleContent();

        strHQL = "From SiteModuleContent as siteModuleContent Where siteModuleContent.ID =" + strID;
        lst = siteModuleContentBLL.GetAllSiteModuleContents(strHQL);

        siteModuleContent = (SiteModuleContent)lst[0];

        LB_ContentID.Text = siteModuleContent.ID.ToString();
        TB_Title.Text = siteModuleContent.Title.Trim();

        if (strIsMobileDevice == "YES")
        {
            HTEditor1.Text = siteModuleContent.Content;
        }
        else
        {
            CKEditor1.Text = siteModuleContent.Content;
        }

        BT_Update.Enabled = true;
        BT_Delete.Enabled = true;
    }


    protected void BT_Add_Click(object sender, EventArgs e)
    {
        string strModuleID, strTitle, strModuleName, strContent;

        strModuleID = LB_ModuleID.Text.Trim();
        strTitle = TB_Title.Text.Trim();
        strModuleName = LB_ModuleName.Text.Trim();
        strLangCode = ddlLangSwitcher.SelectedValue.Trim();


        if (strIsMobileDevice == "YES")
        {
            strContent = HTEditor1.Text.Trim();
        }
        else
        {
            strContent = CKEditor1.Text.Trim();
        }

        try
        {
            SiteModuleContentBLL siteModuleContentBLL = new SiteModuleContentBLL();
            SiteModuleContent siteModuleContent = new SiteModuleContent();

            siteModuleContent.Title = strTitle;
            siteModuleContent.ModuleName = strModuleName;
            siteModuleContent.Content = strContent;
            siteModuleContent.PublisherCode = strUserCode;
            siteModuleContent.PublisherName = ShareClass.GetUserName(strUserCode);
            siteModuleContent.PublishTime = DateTime.Now;
            siteModuleContent.LangCode = strLangCode;

            siteModuleContentBLL.AddSiteModuleContent(siteModuleContent);

            LB_ContentID.Text = ShareClass.GetMyCreatedMaxSitemContentID();

            LoadSiteModuleContent(strModuleName, strLangCode);

            BT_Update.Enabled = true;
            BT_Delete.Enabled = true;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch (Exception err)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }


    protected void BT_Update_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strID, strModuleID, strTitle, strModuleName, strContent;

        strID = LB_ContentID.Text.Trim();
        strModuleID = LB_ModuleID.Text.Trim();
        strTitle = TB_Title.Text.Trim();
        strModuleName = LB_ModuleName.Text.Trim();
        strLangCode = ddlLangSwitcher.SelectedValue.Trim();


        if (strIsMobileDevice == "YES")
        {
            strContent = HTEditor1.Text.Trim();
        }
        else
        {
            strContent = CKEditor1.Text.Trim();
        }

        try
        {
            SiteModuleContentBLL siteModuleContentBLL = new SiteModuleContentBLL();
            SiteModuleContent siteModuleContent = new SiteModuleContent();

            strHQL = "From SiteModuleContent as siteModuleContent Where siteModuleContent.ID = " + strID;
            lst = siteModuleContentBLL.GetAllSiteModuleContents(strHQL);

            siteModuleContent = (SiteModuleContent)lst[0];

            siteModuleContent.Title = strTitle;
            siteModuleContent.Content = strContent;
            siteModuleContent.PublisherCode = strUserCode;
            siteModuleContent.PublisherName = ShareClass.GetUserName(strUserCode);
            siteModuleContent.PublishTime = DateTime.Now;
            siteModuleContent.LangCode = strLangCode;

            siteModuleContentBLL.UpdateSiteModuleContent(siteModuleContent, int.Parse(strID));

            LoadSiteModuleContent(strModuleName, strLangCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_Delete_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strID;

        string strModuleID, strModuleName;

        strModuleID = LB_ModuleID.Text.Trim();
        strModuleName = LB_ModuleName.Text.Trim();
        strLangCode = ddlLangSwitcher.SelectedValue.Trim();

        strID = LB_ContentID.Text.Trim();

        strHQL = "Delete From T_SiteModuleContent Where ID = " + strID;
        ShareClass.RunSqlCommandForNOOperateLog(strHQL);

        LoadSiteModuleContent(strModuleName, strLangCode);

        LB_ContentID.Text = "";

        BT_Update.Enabled = false;
        BT_Delete.Enabled = false;
    }

    protected void InitialSiteModuleTree(TreeView treeView, string strUserType, string strLangCode)
    {
        string strHQL;

        string strModuleID, strModuleName, strModuleType, strHomeModuleName;

        //添加根节点
        treeView.Nodes.Clear();
        TreeNode node1 = new TreeNode();
        TreeNode node2 = new TreeNode();

        node1.Text = "<b>" + Resources.lang.XiTongMoZu + "<b>";
        node1.Target = "0";
        node1.Expanded = true;
        treeView.Nodes.Add(node1);

        strHQL = "Select ID,ModuleName,HomeModuleName,ModuleType From T_ProModuleLevel Where ModuleType= 'SITE' and UserType = " + "'" + strUserType + "'" + " and char_length(ParentModule) = 0 ";
        strHQL += " and LangCode = " + "'" + strLangCode + "'";
        strHQL += " and IsDeleted = 'NO'";
        strHQL += " Order By ModuleType DESC,SortNumber ASC";
        DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            strModuleID = ds1.Tables[0].Rows[i][0].ToString();
            strModuleName = ds1.Tables[0].Rows[i][1].ToString();
            strHomeModuleName = ds1.Tables[0].Rows[i][2].ToString();
            strModuleType = ds1.Tables[0].Rows[i][3].ToString();

            node2 = new TreeNode();

            node2.Text = (i + 1).ToString() + "." + strHomeModuleName;
            node2.Target = strModuleID;
            node2.Expanded = false;

            node1.ChildNodes.Add(node2);

            SiteModuleTreeShow(strUserType, strModuleName, node2, strLangCode);

            treeView.DataBind();
        }
    }

    public static void SiteModuleTreeShow(string strUserType, string strParentModule, TreeNode treeNode, string strLangCode)
    {
        string strHQL;

        string strModuleID, strModuleName, strHomeModuleName;
        TreeNode node1 = new TreeNode();

        strHQL = "Select ID,ModuleName,HomeModuleName From T_ProModuleLevel Where ModuleType ='SITE' and UserType = " + "'" + strUserType + "'" + " and ParentModule = " + "'" + strParentModule + "'";
        strHQL += " and LangCode = " + "'" + strLangCode + "'";
        strHQL += " and IsDeleted = 'NO'";
        strHQL += " Order By SortNumber ASC";
        DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            strModuleID = ds1.Tables[0].Rows[i][0].ToString();
            strModuleName = ds1.Tables[0].Rows[i][1].ToString();
            strHomeModuleName = ds1.Tables[0].Rows[i][2].ToString();

            node1 = new TreeNode();

            node1.Text = (i + 1).ToString() + "." + strHomeModuleName;
            node1.Target = strModuleID;

            node1.Expanded = false;

            treeNode.ChildNodes.Add(node1);

            SiteModuleTreeShow(strUserType, strModuleName, node1, strLangCode);
        }
    }


    protected void LoadSiteModuleContent(string strModuleName, string strLangCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From SiteModuleContent as siteModuleContent Where siteModuleContent.ModuleName = " + "'" + strModuleName + "'" + " and siteModuleContent.LangCode = " + "'" + strLangCode + "'";
        strHQL += " Order By siteModuleContent.ID DESC";
        SiteModuleContentBLL siteModuleContentBLL = new SiteModuleContentBLL();
        lst = siteModuleContentBLL.GetAllSiteModuleContents(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }


    protected int GetTopProModuleCount(string strModuleName, string strModuleType)
    {
        string strHQL;

        strHQL = " select ID,ParentModule, ModuleName,PageName,SortNumber,ModuleType from T_ProModuleLevel  ";
        strHQL += " where ModuleName = " + "'" + strModuleName + "'" + " and ModuleType = " + "'" + strModuleType + "'";
        strHQL += " and  char_length(rtrim(ltrim(ParentModule))) = 0";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        return ds.Tables[0].Rows.Count;
    }

    protected int GetNewProModuleCount(string strNewModuleName, string strModuleType, string strID)
    {
        string strHQL;

        strHQL = " select ID,ParentModule, ModuleName,PageName,SortNumber,ModuleType from T_ProModuleLevel  ";
        strHQL += " where ModuleName = " + "'" + strNewModuleName + "'" + " and ModuleType = " + "'" + strModuleType + "'" + " and ID <> " + strID;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        return ds.Tables[0].Rows.Count;
    }

    protected string GetModuleType(string strModuleID)
    {
        string strHQL = "Select ModuleType From T_ProModuleLevel Where ID = " + strModuleID;
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
}
