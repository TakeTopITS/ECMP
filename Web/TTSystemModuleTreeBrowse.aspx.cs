using ProjectMgt.BLL;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using TakeTopSecurity;

public partial class TTSystemModuleTreeBrowse : System.Web.UI.Page
{
    string strLangCode, strUserCode;
    string strForbitModule;

    int intModuleNumber;

    protected void Page_Load(object sender, EventArgs e)
    {
        //strUserCode = Session["UserCode"].ToString();
        strLangCode = System.Configuration.ConfigurationManager.AppSettings["DefaultLang"];

        strForbitModule = Session["ForbitModule"].ToString();

        //ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "系统模组设定", strUserCode);
        //if (blVisible == false)
        //{
        //    Response.Redirect("TTDisplayErrors.aspx");
        //    return;
        //}

        //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "ajustHeight", "AdjustDivHeight();", true);
        //ScriptManager.RegisterOnSubmitStatement(this.Page, this.Page.GetType(), "SavePanelScroll", "SaveScroll();");
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            ShareClass.LoadLanguageForDropList(ddlLangSwitcher);
            ddlLangSwitcher.SelectedValue = strLangCode;

            //生成模组树
            InitialModuleTree();

            LB_ModuleNumber.Text = intModuleNumber.ToString();
        }
    }

    //内部用户用模组
    protected void InitialModuleTree()
    {
        InitialModuleTreeForInner(TreeView1, ddlLangSwitcher.SelectedValue.Trim());

        InitialModuleTreeForOuter(TreeView1, ddlLangSwitcher.SelectedValue.Trim());

        InitialModuleTreeForPage(TreeView1, ddlLangSwitcher.SelectedValue.Trim());
    }

    protected void InitialModuleTreeForInner(TreeView treeView,  string strLangCode)
    {
        string strHQL;
        string strModuleID, strModuleName, strModuleType, strHomeModuleName;

        //添加根节点
        treeView.Nodes.Clear();
        TreeNode node1 = new TreeNode();
        TreeNode node2 = new TreeNode();

        node1.Text = "<b>" + Resources.lang.NeiBuYongHuYongMoZu + "<b>";
        node1.Target = "0";
        node1.Expanded = true;
        treeView.Nodes.Add(node1);

        intModuleNumber++;

        strHQL = "Select ID,ModuleName,HomeModuleName,ModuleType From T_ProModuleLevel Where char_length(ParentModule) = 0 ";
        strHQL += " and position(rtrim(ModuleName)||',' in '" + strForbitModule + "') = 0";
        strHQL += " and ModuleType Not In ('DIYMO','DIYWF')";
        strHQL += " and UserType = 'INNER'";
        strHQL += " and LangCode = " + "'" + strLangCode + "'";
        strHQL += " and IsDeleted = 'NO'";
        strHQL += " Order By ModuleType DESC,SortNumber ASC";
        DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            strModuleID = ds1.Tables[0].Rows[i][0].ToString();
            strModuleName = ds1.Tables[0].Rows[i][1].ToString();
            strHomeModuleName = ds1.Tables[0].Rows[i][2].ToString();
            strModuleType = ds1.Tables[0].Rows[i][3].ToString().Trim();

            if (strForbitModule.IndexOf(strModuleName + ",") >= 0)
            {
                continue;
            }

            node2 = new TreeNode();

            node2.Text = (i + 1).ToString() + "." + strHomeModuleName + "  (" + strModuleType + ")";
            node2.Target = strModuleID;
            node2.Expanded = true;

            node1.ChildNodes.Add(node2);

            intModuleNumber++;

            if (strModuleType != "APP")
            {
                ModuleTreeShowForInner(strModuleType, strModuleName, node2, strLangCode);
            }

            treeView.DataBind();
        }
    }

    public void ModuleTreeShowForInner(string strModuleType, string strParentModule, TreeNode treeNode, string strLangCode)
    {
        string strHQL;

        string strModuleID, strModuleName, strHomeModuleName;
        TreeNode node1 = new TreeNode();

        strHQL = "Select ID,ModuleName,HomeModuleName From T_ProModuleLevel Where ParentModule = " + "'" + strParentModule + "'";
        strHQL += " and position(rtrim(ModuleName)|| ',' in '" + strForbitModule + "') = 0";
        strHQL += " and ModuleType Not In ('DIYMO','DIYWF')";
        strHQL += " and UserType = 'INNER'";
        strHQL += " and LangCode = " + "'" + strLangCode + "'";
        strHQL += " and IsDeleted = 'NO'";
        strHQL += " Order By SortNumber ASC";
        DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            strModuleID = ds1.Tables[0].Rows[i][0].ToString();
            strModuleName = ds1.Tables[0].Rows[i][1].ToString();
            strHomeModuleName = ds1.Tables[0].Rows[i][2].ToString();

            if (strForbitModule.IndexOf(strModuleName + ",") >= 0)
            {
                continue;
            }

            node1 = new TreeNode();
            node1.Text = (i + 1).ToString() + "." + strHomeModuleName + "  (" + strModuleType + ")";
            node1.Target = strModuleID;

            node1.Expanded = true;

            treeNode.ChildNodes.Add(node1);

            intModuleNumber++;

            ModuleTreeShowForInner(strModuleType, strModuleName, node1, strLangCode);
        }
    }


    //外部用户用模组
    protected void InitialModuleTreeForOuter(TreeView treeView, string strLangCode)
    {
        string strHQL;
        string strModuleID, strModuleName, strModuleType, strHomeModuleName;

        //添加根节点
        //treeView.Nodes.Clear();
        TreeNode node1 = new TreeNode();
        TreeNode node2 = new TreeNode();

        node1.Text = "<b>" + Resources.lang.WaiBuYongHuYongMoZu + "<b>";
        node1.Target = "0";
        node1.Expanded = true;
        treeView.Nodes.Add(node1);

        intModuleNumber++;

        strHQL = "Select ID,ModuleName,HomeModuleName,ModuleType From T_ProModuleLevel Where char_length(ParentModule) = 0 ";
        strHQL += " and position(rtrim(ModuleName)|| ',' in '" + strForbitModule + "') = 0";
        strHQL += " and ModuleType Not In ('DIYMO','DIYWF')";
        strHQL += " and UserType = 'OUTER'";
        strHQL += " and LangCode = " + "'" + strLangCode + "'";
        strHQL += " and IsDeleted = 'NO'";
        strHQL += " Order By ModuleType DESC,SortNumber ASC";
        DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            strModuleID = ds1.Tables[0].Rows[i][0].ToString();
            strModuleName = ds1.Tables[0].Rows[i][1].ToString();
            strHomeModuleName = ds1.Tables[0].Rows[i][2].ToString();
            strModuleType = ds1.Tables[0].Rows[i][3].ToString().Trim();

            if (strForbitModule.IndexOf(strModuleName + ",") >= 0)
            {
                continue;
            }

            node2 = new TreeNode();

            node2.Text = (i + 1).ToString() + "." + strHomeModuleName + "  (" + strModuleType + ")";
            node2.Target = strModuleID;
            node2.Expanded = true;

            node1.ChildNodes.Add(node2);

            intModuleNumber++;

            if (strModuleType != "APP")
            {
                ModuleTreeShowForOuter(strModuleType, strModuleName, node2, strLangCode);
            }

            treeView.DataBind();
        }
    }

    public void ModuleTreeShowForOuter(string strModuleType, string strParentModule, TreeNode treeNode, string strLangCode)
    {
        string strHQL;

        string strModuleID, strModuleName, strHomeModuleName;
        TreeNode node1 = new TreeNode();

        strHQL = "Select ID,ModuleName,HomeModuleName From T_ProModuleLevel Where ParentModule = " + "'" + strParentModule + "'";
        strHQL += " and position(rtrim(ModuleName)|| ',' in '" + strForbitModule + "') = 0";
        strHQL += " and ModuleType Not In ('DIYMO','DIYWF')";
        strHQL += " and UserType = 'OUTER'";
        strHQL += " and LangCode = " + "'" + strLangCode + "'";
        strHQL += " and IsDeleted = 'NO'";
        strHQL += " Order By SortNumber ASC";
        DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            strModuleID = ds1.Tables[0].Rows[i][0].ToString();
            strModuleName = ds1.Tables[0].Rows[i][1].ToString();
            strHomeModuleName = ds1.Tables[0].Rows[i][2].ToString();

            if (strForbitModule.IndexOf(strModuleName + ",") >= 0)
            {
                continue;
            }

            node1 = new TreeNode();
            node1.Text = (i + 1).ToString() + "." + strHomeModuleName + "  (" + strModuleType + ")";
            node1.Target = strModuleID;

            node1.Expanded = true;

            treeNode.ChildNodes.Add(node1);

            intModuleNumber++;

            ModuleTreeShowForOuter(strModuleType, strModuleName, node1, strLangCode);
        }
    }

    //页面模组
    protected void InitialModuleTreeForPage(TreeView treeView, string strLangCode)
    {
        string strHQL;
        string strModuleID, strModuleName, strModuleType, strHomeModuleName;


        //添加根节点
        TreeNode node1 = new TreeNode();
        TreeNode node2 = new TreeNode();

        node1.Text = "<b>页面模组<b>";
        node1.Target = "0";
        node1.Expanded = true;
        treeView.Nodes.Add(node1);

        strHQL = "Select ID,ModuleName,HomeModuleName,ModuleType From T_ProModuleLevelForPage Where char_length(ParentModule) = 0 ";
        strHQL += " and position(rtrim(ModuleName)||',' in '" + strForbitModule + "') = 0";
        strHQL += " and ModuleType Not In ('DIYMO','DIYWF')";
        strHQL += " and LangCode = " + "'" + strLangCode + "'";
        strHQL += " and IsDeleted = 'NO'";
        strHQL += " Order By ModuleType DESC,SortNumber ASC";
        DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");

        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            strModuleID = ds1.Tables[0].Rows[i][0].ToString();
            strModuleName = ds1.Tables[0].Rows[i][1].ToString();
            strHomeModuleName = ds1.Tables[0].Rows[i][2].ToString();
            strModuleType = ds1.Tables[0].Rows[i][3].ToString();

            if (strForbitModule.IndexOf(strModuleName + ",") >= 0)
            {
                continue;
            }

            node2 = new TreeNode();

            node2.Text = (i + 1).ToString() + "." + strHomeModuleName + "  (" + strModuleType + ")";
            node2.Target = strModuleID;
            node2.Expanded = true;
            node1.ChildNodes.Add(node2);

            intModuleNumber++;

            ModuleTreeShowForPage(strModuleType, strModuleName, node2, strLangCode);

            treeView.DataBind();
        }
    }

    public void ModuleTreeShowForPage(string strModuleType, string strParentModule, TreeNode treeNode, string strLangCode)
    {
        string strHQL;

        string strModuleID, strModuleName, strHomeModuleName;
        TreeNode node1 = new TreeNode();

        strHQL = "Select ID,ModuleName,HomeModuleName From T_ProModuleLevelForPage Where ParentModule = " + "'" + strParentModule + "'";
        strHQL += " and position(rtrim(ModuleName)||',' in '" + strForbitModule + "') = 0";
        strHQL += " and ModuleType Not In ('DIYMO','DIYWF')";
        strHQL += " and LangCode = " + "'" + strLangCode + "'";
        strHQL += " and IsDeleted = 'NO'";
        strHQL += " Order By SortNumber ASC";
        DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");

        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            strModuleID = ds1.Tables[0].Rows[i][0].ToString();
            strModuleName = ds1.Tables[0].Rows[i][1].ToString();
            strHomeModuleName = ds1.Tables[0].Rows[i][2].ToString();

            if (strForbitModule.IndexOf(strModuleName + ",") >= 0)
            {
                continue;
            }

            node1 = new TreeNode();
            node1.Text = (i + 1).ToString() + "." + strHomeModuleName + "  (" + strModuleType + ")";
            node1.Target = strModuleID;
            node1.Expanded = true;

            treeNode.ChildNodes.Add(node1);

            intModuleNumber++;

            ModuleTreeShowForPage(strModuleType, strModuleName, node1, strLangCode);
        }
    }

    protected void ddlLangSwitcher_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strModuleName, strModuleType;

        strLangCode = ddlLangSwitcher.SelectedValue.Trim();

        strModuleType = GetModuleType("0");
        strModuleName = GetModuleName("0");

        InitialModuleTree();
    }

    protected string GetModuleNameByPageName(string strPageName, string strModuleType)
    {
        string strHQL;

        strHQL = "Select PageName From T_ProModuleLevel Where PageName = " + "'" + strPageName + "'";
        strHQL += " and ModuleType = " + "'" + strModuleType + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "";
        }
    }

    protected int GetChildModuleNumber(string strParentModule, string strModuleName, string strModuleType, string strUserType, string strLangCode)
    {
        string strHQL;

        strHQL = "Select * From T_ProModuleLevel Where ParentModule = '" + strParentModule + "' and ModuleName = '" + strModuleName + "' and ModuleType = '" + strModuleType + "' and UserType = '" + strUserType + "' and LangCode = '" + strLangCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        return ds.Tables[0].Rows.Count;
    }


    protected int GetTopProModuleCount(string strModuleName, string strModuleType)
    {
        string strHQL;

        strHQL = " select ID,ParentModule,ModuleName,PageName,SortNumber,ModuleType from T_ProModuleLevel  ";
        strHQL += " where ModuleName = " + "'" + strModuleName + "'" + " and ModuleType = " + "'" + strModuleType + "'";
        strHQL += " and char_length(rtrim(ltrim(ParentModule))) = 0";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        return ds.Tables[0].Rows.Count;
    }

    protected int GetExistAllSameModuleNumber(string strModuleName, string strUserType, string strID)
    {
        string strHQL;

        if (strID == "")
        {
            strHQL = "Select * From T_ProModuleLevel Where ModuleName = '" + strModuleName + "' and UserType = '" + strUserType + "'";
        }
        else
        {
            strHQL = "Select * From T_ProModuleLevel Where ModuleName = '" + strModuleName + "' and UserType = '" + strUserType + "'";
            strHQL += " and ID <> " + strID;
        }

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
            return ds.Tables[0].Rows[0][0].ToString().Trim();
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


 

    protected int GetUserAuthorizationRecordNumber()
    {
        string strHQL;

        strHQL = "Select * From T_ProModule";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModule");

        return ds.Tables[0].Rows.Count;
    }


}
