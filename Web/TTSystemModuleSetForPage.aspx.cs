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

public partial class TTSystemModuleSetForPage : System.Web.UI.Page
{
    string strLangCode, strUserCode;
    string strForbitModule;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strLangCode = Session["LangCode"].ToString();

        strForbitModule = Session["ForbitModule"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility("TTSystemModuleSet", "系统模组设定", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            ShareClass.LoadLanguageForDropList(ddlLangSwitcher);
            ddlLangSwitcher.SelectedValue = strLangCode;

            InitialModuleTree(TreeView1, "INNER", ddlLangSwitcher.SelectedValue.Trim());
            InitialModuleTree(TreeView2, "INNER", ddlLangSwitcher.SelectedValue.Trim());;
        }
    }

    protected void DL_ForUserType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strUserType;

        strUserType = DL_ForUserType.SelectedValue.Trim();

        InitialModuleTree(TreeView1, strUserType, ddlLangSwitcher.SelectedValue.Trim());
        InitialModuleTree(TreeView2, strUserType, ddlLangSwitcher.SelectedValue.Trim());
    }

    protected void InitialModuleTree(TreeView treeView, string strUserType, string strLangCode)
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

        strHQL = "Select ID,ModuleName,HomeModuleName,ModuleType From T_ProModuleLevelForPage Where UserType = " + "'" + strUserType + "'" + " and char_length(ParentModule) = 0 ";
        strHQL += " and position('"+ strForbitModule + "' in rtrim(ModuleName)) = 0";
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

            node2.Text = (i + 1).ToString() + "." + strHomeModuleName;
            node2.Target = strModuleID;
            node2.Expanded = false;

            node1.ChildNodes.Add(node2);

            ModuleTreeShow(strUserType, strModuleType, strModuleName, node2, strLangCode);

            treeView.DataBind();
        }
    }

    public void ModuleTreeShow(string strUserType, string strModuleType, string strParentModule, TreeNode treeNode, string strLangCode)
    {
        string strHQL;

        string strModuleID, strModuleName, strHomeModuleName;
        TreeNode node1 = new TreeNode();

        strHQL = "Select ID,ModuleName,HomeModuleName From T_ProModuleLevelForPage Where UserType = " + "'" + strUserType + "'" + " and ParentModule = " + "'" + strParentModule + "'";
        strHQL += " and position('" + strForbitModule +"' in rtrim(ModuleName)) = 0";
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
            node1.Text = (i + 1).ToString() + "." + strHomeModuleName;
            node1.Target = strModuleID;

            node1.Expanded = false;

            treeNode.ChildNodes.Add(node1);

            ModuleTreeShow(strUserType, strModuleType, strModuleName, node1, strLangCode);
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strHQL;
        string strModuleID, strModuleName, strParentModuleName, strModuleType, strUserType;
        int intLevel;

        strUserType = DL_ForUserType.SelectedValue.Trim();
        strLangCode = ddlLangSwitcher.SelectedValue.Trim();


        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        intLevel = treeNode.Depth;
        LB_Level.Text = intLevel.ToString();

        strModuleID = treeNode.Target.Trim();

        strModuleType = GetPageModuleType(strModuleID);
        strModuleName = GetPageModuleName(strModuleID);

        if (strModuleID == "0")
        {
            LB_ID.Text = "";
            TB_ParentModuleName.Text = "";

            TB_ModuleName.Text = "";
            TB_HomeModuleName.Text = "";

            TB_PageName.Text = "";
            NB_SortNumber.Amount = 1;

            IM_ModuleIcon.ImageUrl = "";

            TB_ModuleName.Enabled = true;

            BT_AddChildModule.Enabled = true;
            BT_Update.Enabled = false;
            BT_Delete.Enabled = false;

            LB_SelectedModuleName.Text = "";

            LB_OldModuleName.Text = "";
            LB_OldModuleName.Text = "";
            LB_OldModuleType.Text = "";
            LB_OldParentModuleName.Text = "";

            DL_Visible.SelectedValue = "YES";

            LoadChildModule("", strModuleType, strUserType, strLangCode);
        }
        else
        {
            strHQL = "Select ID,ParentModule,ModuleName,PageName,SortNumber,ModuleType,Visible,HomeModuleName,IconURL,UserType From T_ProModuleLevelForPage Where ID = " + strModuleID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");

            LB_ID.Text = strModuleID;

            TB_ParentModuleName.Text = ds.Tables[0].Rows[0]["ParentModule"].ToString().Trim();
            strParentModuleName = ds.Tables[0].Rows[0]["ParentModule"].ToString().Trim();

            TB_ModuleName.Text = ds.Tables[0].Rows[0]["ModuleName"].ToString().Trim();
            strModuleName = ds.Tables[0].Rows[0]["ModuleName"].ToString().Trim();

            TB_HomeModuleName.Text = ds.Tables[0].Rows[0]["HomeModuleName"].ToString().Trim();

            TB_PageName.Text = ds.Tables[0].Rows[0]["PageName"].ToString();
            NB_SortNumber.Amount = int.Parse(ds.Tables[0].Rows[0]["SortNumber"].ToString());

            DL_ModuleType.SelectedValue = ds.Tables[0].Rows[0]["ModuleType"].ToString().Trim();
            strModuleType = ds.Tables[0].Rows[0]["ModuleType"].ToString().Trim();

            BT_UploadModuleIcon.Enabled = true;
            BT_DeleteModuleIcon.Enabled = true;
            IM_ModuleIcon.ImageUrl = ds.Tables[0].Rows[0][8].ToString().Trim();

            LB_SelectedModuleName.Text = strModuleName;
            LB_OldModuleName.Text = strModuleName;
            LB_OldModuleType.Text = strModuleType;
            LB_OldParentModuleName.Text = strParentModuleName;
            DL_Visible.SelectedValue = ds.Tables[0].Rows[0]["Visible"].ToString().Trim();

            if (strModuleType == "SYSTEM" | strModuleType == "APP")
            {
                TB_ModuleName.Enabled = true;

                TB_PageName.Enabled = true;
                DL_ModuleType.Enabled = true;


                BT_Update.Enabled = true;
                BT_Delete.Enabled = false;
            }
            else
            {
                TB_ModuleName.Enabled = true;

                TB_PageName.Enabled = true;
                DL_ModuleType.Enabled = true;


                BT_Update.Enabled = true;
                BT_Delete.Enabled = true;
            }

            if (intLevel == 3 & strModuleType != "SITE")
            {
                BT_AddChildModule.Enabled = false;
            }
            else
            {
                BT_AddChildModule.Enabled = true;
            }

            if (TakeTopSecurity.TakeTopLicense.IsCanNotDeletedModule(strModuleName))
            {
                BT_Delete.Enabled = false;
            }

            LoadChildModule(strModuleName, strModuleType, strUserType, strLangCode);
        }
    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strModuleID, strModuleName, strNewModuleType, strSelectModuleType;
        int intLevel;


        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;
        intLevel = treeNode.Depth;

        LB_Level.Text = intLevel.ToString();
        strModuleID = treeNode.Target.Trim();

        strNewModuleType = DL_ModuleType.SelectedValue.Trim();
        strSelectModuleType = GetPageModuleType(strModuleID);

        if (intLevel > 2 & strNewModuleType != "SITE")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZDSCBNZJZMZQJC + "')", true);
            return;
        }

        if (strNewModuleType != strSelectModuleType & strNewModuleType == "SITE")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZWZMZZNFZMZMZZXQJC + "')", true);
            return;
        }


        strModuleName = GetPageModuleName(strModuleID);

        TB_ParentModuleName.Text = strModuleName;
    }

    protected void ddlLangSwitcher_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strModuleName, strModuleType, strUserType;

        strLangCode = ddlLangSwitcher.SelectedValue.Trim();

        strUserType = DL_ForUserType.SelectedValue.Trim();
        strModuleType = GetPageModuleType("0");
        strModuleName = GetPageModuleName("0");

        InitialModuleTree(TreeView1, strUserType, ddlLangSwitcher.SelectedValue.Trim());
        InitialModuleTree(TreeView2, strUserType, ddlLangSwitcher.SelectedValue.Trim());

        LoadChildModule("", strModuleType, strUserType, strLangCode);
    }


    protected void BT_CopyAllModuleForHomeLanguage_Click(object sender, EventArgs e)
    {
        string strHQL, strLangHQL;

        string strModuleName, strModuleType, strUserType;
        string strFromLangCode = System.Configuration.ConfigurationManager.AppSettings["DefaultLang"];

        strUserType = DL_ForUserType.SelectedValue.Trim();
        strModuleType = GetPageModuleType("0");
        strModuleName = GetPageModuleName("0");

        strLangHQL = "Select LangCode From T_SystemLanguage Where LangCode <> " + "'" + strFromLangCode + "'";
        strLangHQL += " Order By SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strLangHQL, "T_SystemLanguage");

        try
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                strLangCode = ds.Tables[0].Rows[i][0].ToString().Trim();

                strHQL = "Insert Into T_ProModuleLevelForPage(ModuleName,ParentModule,SortNumber,PageName ,ModuleType ,UserType ,Visible,LangCode,HomeModuleName,IsDeleted,IconURL)";
                strHQL += " SELECT ModuleName,ParentModule,SortNumber,PageName ,ModuleType ,UserType ,Visible," + "'" + strLangCode + "'" + ",HomeModuleName,IsDeleted,IconURL FROM T_ProModuleLevelForPage";
                strHQL += " Where LangCode = '" + strFromLangCode + "' and ltrim(rtrim(ModuleName)) || ltrim(rtrim(ParentModule)) || ltrim(rtrim(ModuleType)) || ltrim(rtrim(UserType))  Not in (Select ltrim(rtrim(ModuleName)) || ltrim(rtrim(ParentModule)) || ltrim(rtrim(ModuleType)) || ltrim(rtrim(UserType)) From T_ProModuleLevelForPage Where LangCode = " + "'" + strLangCode + "'" + ")";                
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Update T_ProModuleLevelForPage B Set SortNumber = A.SortNumber,Visible = A.Visible,IsDeleted = A.IsDeleted From T_ProModuleLevelForPage A Where A.ModuleName = B.ModuleName and A.ParentModule = B.ParentModule and A.LangCode = '" + strFromLangCode + "' AND B.LangCode =" + "'" + strLangCode + "'";
                ShareClass.RunSqlCommand(strHQL);

                strHQL = "Delete From T_ProModuleLevelForPage Where LangCode = " + "'" + strLangCode + "'" + " and ModuleType in ('SYSTEM','APP')";
                strHQL += " and ltrim(rtrim(ModuleName)) || ltrim(rtrim(ParentModule)) || ltrim(rtrim(ModuleType)) || ltrim(rtrim(UserType))  Not in (Select ltrim(rtrim(ModuleName)) || ltrim(rtrim(ParentModule)) || ltrim(rtrim(ModuleType)) || ltrim(rtrim(UserType)) From T_ProModuleLevelForPage Where LangCode = '" + strFromLangCode + "')";
                ShareClass.RunSqlCommand(strHQL);
            }

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFZCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFZSBJC + "')", true);
        }

        LoadChildModule("", strModuleType, strUserType, strLangCode);

        //LoadChildModule("", strUserType, strLangCode);

        InitialModuleTree(TreeView1, strUserType, ddlLangSwitcher.SelectedValue.Trim());
        InitialModuleTree(TreeView2, strUserType, ddlLangSwitcher.SelectedValue.Trim());

        //InitialModuleTree(strUserType, ddlLangSwitcher.SelectedValue.Trim());
    }

    protected void BT_UploadModuleIcon_Click(object sender, EventArgs e)
    {
        if (this.FUP_File.PostedFile != null)
        {
            string strParentModule, strModuleName, strModuleType, strUserType;
            string strHQL;


            strUserType = DL_ForUserType.SelectedValue.Trim();
            try
            {
                strParentModule = TreeView1.SelectedNode.Text.Trim();
            }
            catch
            {
                strParentModule = TB_ParentModuleName.Text.Trim();
            }
            strModuleName = TB_ModuleName.Text.Trim();
            strModuleType = DL_ModuleType.SelectedValue.Trim();

            string strFileName1 = FUP_File.PostedFile.FileName.Trim();
            string strLoginUserCode = Session["UserCode"].ToString().Trim();

            int i;


            if (strFileName1 != "")
            {
                //获取初始文件名
                i = strFileName1.LastIndexOf("."); //取得文件名中最后一个"."的索引
                string strNewExt = strFileName1.Substring(i); //获取文件扩展名

                DateTime dtUploadNow = DateTime.Now; //获取系统时间

                string strFileName2 = System.IO.Path.GetFileName(strFileName1);
                string strExtName = Path.GetExtension(strFileName2);
                strFileName2 = Path.GetFileNameWithoutExtension(strFileName2) + strExtName;


                string strDocSavePath = Server.MapPath("ImagesSkin") + "\\";
                string strFileName3 = "ImagesSkin/" + strFileName2;
                string strFileName4 = strDocSavePath + strFileName2;

                FileInfo fi = new FileInfo(strFileName4);

                if (fi.Exists)
                {
                    fi.Delete();
                }
                try
                {
                    FUP_File.PostedFile.SaveAs(strFileName4);

                    strHQL = "Update T_ProModuleLevelForPage Set IconURL = " + "'" + strFileName3 + "'" + " Where ModuleName = " + "'" + strModuleName + "'";
                    strHQL += " and ModuleType = " + "'" + strModuleType + "'" + " and UserType = " + "'" + strUserType + "'";
                    ShareClass.RunSqlCommand(strHQL);

                    IM_ModuleIcon.ImageUrl = strFileName3;

                    LoadChildModule(strParentModule, strModuleType, strUserType, strLangCode);

                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCHCG + "')", true);
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZYSCDWJ + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZYSCDWJ + "')", true);
        }
    }

    protected void BT_DeleteModuleIcon_Click(object sender, EventArgs e)
    {
        string strParentModule, strModuleName, strModuleType, strUserType;
        string strHQL;


        strUserType = DL_ForUserType.SelectedValue.Trim();
        try
        {
            strParentModule = TreeView1.SelectedNode.Text.Trim();
        }
        catch
        {
            strParentModule = TB_ParentModuleName.Text.Trim();
        }
        strModuleName = TB_ModuleName.Text.Trim();
        strModuleType = DL_ModuleType.SelectedValue.Trim();

        string strFileName1 = FUP_File.PostedFile.FileName.Trim();
        string strLoginUserCode = Session["UserCode"].ToString().Trim();

        try
        {
            strHQL = "Update T_ProModuleLevelForPage Set IconURL = '' Where ModuleName = " + "'" + strModuleName + "'";
            strHQL += " and ModuleType = " + "'" + strModuleType + "'" + " and UserType = " + "'" + strUserType + "'";
            ShareClass.RunSqlCommand(strHQL);

            IM_ModuleIcon.ImageUrl = "";

            LoadChildModule(strParentModule, strModuleType, strUserType, strLangCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }
    }

    protected void BT_AddChildModule_Click(object sender, EventArgs e)
    {
        string strID, strParentModuleName, strModuleName, strInnerModuleName, strHomeModuleName, strPageName, strSortNumber, strModuleType, strOldModuleName, strUserType, strVisible;
        string strHQL;

        strID = LB_ID.Text.Trim();

        strModuleName = TB_ModuleName.Text.Trim();
        strHomeModuleName = TB_HomeModuleName.Text.Trim();

        strLangCode = ddlLangSwitcher.SelectedValue.Trim();

        strPageName = TB_PageName.Text.Trim();
        strSortNumber = NB_SortNumber.Amount.ToString();
        strModuleType = DL_ModuleType.SelectedValue.Trim();
        strUserType = DL_ForUserType.SelectedValue.Trim();
        strVisible = DL_Visible.SelectedValue.Trim();
        strOldModuleName = LB_OldModuleName.Text.Trim();
        strParentModuleName = TB_ParentModuleName.Text.Trim();

        if (strModuleName.IndexOf("NONE") >= 0 | strForbitModule.IndexOf(strModuleName + ",") >= 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZJGMZMCBNWNONEBQBNDJYMZMCQDNQJC + "')", true);
            return;
        }

        if (strModuleType == "SYSTEM" | strModuleType == "APP")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGNZXZZDYLXDMZJC + "')", true);
            return;
        }

        if (GetExistAllSameModuleNumber(strModuleName, strUserType, "") > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZJGCZXTMCXTMZLXXTYHLXDMZBNCFZJ + "')", true);
            return;
        }

        if (strModuleName == "DIYMO")
        {
            strInnerModuleName = GetModuleNameByPageName(strPageName, "SYSTEM");
            if (strInnerModuleName != "")
            {
                strModuleName = strInnerModuleName;
                TB_ModuleName.Text = strModuleName;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCYMCZNZMZXMZZNKYSBMM + "')", true);
            }
        }

        if (GetChildModuleNumber(strModuleName, strParentModuleName, strModuleType, strUserType, strLangCode) > 0 | strModuleName == strParentModuleName)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBNBZMZSWHMZDHMZQJC + "')", true);
            return;
        }

        if (strModuleName == strOldModuleName)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGNBNZJHFMZMCXTDMZJC + "')", true);

            return;
        }

        try
        {
            if (GetTopProModuleCount(strModuleName, strModuleType) > 0)
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGCZXTMCYJMZZJSBJC + "')", true);
                return;
            }

            strHQL = "Insert Into T_ProModuleLevelForPage(ParentModule,ModuleName,HomeModuleName,PageName,SortNumber,ModuleType,UserType,Visible,LangCode,IsDeleted)";
            strHQL += " Values (" + "'" + strParentModuleName + "'" + "," + "'" + strModuleName + "'" + "," + "'" + strHomeModuleName + "'" + "," + "'" + strPageName + "'" + "," + strSortNumber + "," + "'" + strModuleType + "'" + ",'" + strUserType + "','" + strVisible + "','" + strLangCode + "','NO')";
            ShareClass.RunSqlCommand(strHQL);

            LB_ID.Text = ShareClass.GetMyCreatedMaxModuleID();
            LB_OldModuleName.Text = strModuleName;

            LoadChildModule(strParentModuleName, strModuleType, strUserType, strLangCode);

            BT_Delete.Enabled = false;
            BT_Update.Enabled = false;

            BT_UploadModuleIcon.Enabled = false;
            BT_DeleteModuleIcon.Enabled = false;


            InitialModuleTree(TreeView1, strUserType, ddlLangSwitcher.SelectedValue.Trim());
            InitialModuleTree(TreeView2, strUserType, ddlLangSwitcher.SelectedValue.Trim());

            //设置缓存更改标志，并刷新页面缓存
            ChangePageCache();

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXJCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZXZSBJC + "')", true);
        }
    }

    protected void BT_Update_Click(object sender, EventArgs e)
    {
        string strID, strParentModule, strModuleName, strInnerModuleName, strHomeModuleName, strPageName, strSortNumber, strOldModuleName, strModuleType, strOldModuleType, strUserType, strVisible;
        string strParentModuleName, strOldParentModuleName;
        string strHQL;

        strID = LB_ID.Text.Trim();

        strUserType = DL_ForUserType.SelectedValue.Trim();

        try
        {
            strParentModule = TreeView1.SelectedNode.Text.Trim();
        }
        catch
        {
            strParentModule = TB_ParentModuleName.Text.Trim();
        }

        strParentModuleName = TB_ParentModuleName.Text.Trim();

        strModuleName = TB_ModuleName.Text.Trim();
        strHomeModuleName = TB_HomeModuleName.Text.Trim();

        strPageName = TB_PageName.Text.Trim();
        strSortNumber = NB_SortNumber.Amount.ToString();
        strModuleType = DL_ModuleType.SelectedValue.Trim();

        strOldModuleName = LB_OldModuleName.Text.Trim();
        strOldParentModuleName = LB_OldParentModuleName.Text.Trim();
        strOldModuleType = LB_OldModuleType.Text.Trim();
        strVisible = DL_Visible.SelectedValue.Trim();

        string strForbitModule = Session["ForbitModule"].ToString();
        if (strModuleName.IndexOf("NONE") >= 0 | strForbitModule.IndexOf(strModuleName + ",") >= 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZJGMZMCBNWNONEBQBNDJYMZMCQDNQJC + "')", true);
            return;
        }

        if (strModuleName != strOldModuleName & GetExistAllSameModuleNumber(strModuleName, strUserType, strID) > 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZZJGCZXTMCXTMZLXXTYHLXDMZBNCFZJ + "')", true);
            return;
        }

        if (strModuleName == "DIYMO")
        {
            strInnerModuleName = GetModuleNameByPageName(strPageName, "SYSTEM");
            if (strInnerModuleName != "")
            {
                strModuleName = strInnerModuleName;
                TB_ModuleName.Text = strModuleName;

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCYMCZNZMZXMZZNKYSBMM + "')", true);
            }
        }

        if (GetChildModuleNumber(strModuleName, strParentModuleName, strModuleType, strUserType, strLangCode) > 0 | strModuleName == strParentModuleName)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBNBZMZSWHMZDHMZQJC + "')", true);
            return;
        }

        try
        {
            if (strOldModuleType == "SYSTEM" | strOldModuleType == "APP")
            {
                strHQL = "Update T_ProModuleLevelForPage Set ParentModule = " + "'" + strParentModuleName + "'" + ",HomeModuleName=" + "'" + strHomeModuleName + "'" + ",PageName=" + "'" + strPageName + "'" + ", SortNumber=" + strSortNumber + ",Visible=" + "'" + strVisible + "'";
                strHQL += " Where ModuleName = " + "'" + strOldModuleName + "'" + " and ParentModule = " + "'" + strOldParentModuleName + "'" + " and ModuleType = " + "'" + strOldModuleType + "'" + " and UserType = " + "'" + strUserType + "'";
                strHQL += " and ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);
            }
            else
            {
                strHQL = "Update T_ProModuleLevelForPage Set ParentModule = " + "'" + strParentModuleName + "'" + ", ModuleName = " + "'" + strModuleName + "'" + ",HomeModuleName=" + "'" + strHomeModuleName + "'" + ",PageName=" + "'" + strPageName + "'" + ",SortNumber=" + strSortNumber + ",Visible=" + "'" + strVisible + "'";
                strHQL += " Where ModuleName = " + "'" + strOldModuleName + "'" + " and ParentModule = " + "'" + strOldParentModuleName + "'" + " and ModuleType = " + "'" + strOldModuleType + "'" + " and UserType = " + "'" + strUserType + "'";
                strHQL += " and ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);

                //strHQL = "Update T_ProModule Set ModuleName = " + "'" + strModuleName + "'";
                //strHQL += " Where ModuleName = " + "'" + strOldModuleName + "'" + " and ModuleType = " + "'" + strOldModuleType + "'" + " and UserType = " + "'" + strUserType + "'";
                //ShareClass.RunSqlCommand(strHQL);
            }

            LoadChildModule(strParentModule, strModuleType, strUserType, strLangCode);

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);


            InitialModuleTree(TreeView1, strUserType, ddlLangSwitcher.SelectedValue.Trim());
            InitialModuleTree(TreeView2, strUserType, ddlLangSwitcher.SelectedValue.Trim());

            //设置缓存更改标志，并刷新页面缓存
            ChangePageCache();
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected void BT_Delete_Click(object sender, EventArgs e)
    {
        string strID, strParentModule, strModuleName, strPageName, strSortNumber, strModuleType, strUserType;
        string strHQL;

        strID = LB_ID.Text.Trim();

        strParentModule = TB_ParentModuleName.Text.Trim();
        strModuleName = TB_ModuleName.Text.Trim();
        strPageName = TB_PageName.Text.Trim();
        strSortNumber = NB_SortNumber.Amount.ToString();
        strModuleType = DL_ModuleType.SelectedValue.Trim();
        strUserType = DL_ForUserType.SelectedValue.Trim();

        try
        {
            strHQL = "Delete From T_ProModuleLevelForPage where ID = " + strID;
            ShareClass.RunSqlCommand(strHQL);

            //strHQL = "Delete From T_ProModule Where rtrim(ModuleName) + rtrim(ModuleType) + rtrim(UserType) = '" + strModuleName + strModuleType + strUserType + "'";
            //ShareClass.RunSqlCommand(strHQL);


            LoadChildModule(strParentModule, strModuleType, strUserType, strLangCode);

            BT_AddChildModule.Enabled = false;
            BT_Update.Enabled = false;
            BT_Delete.Enabled = false;

            BT_UploadModuleIcon.Enabled = false;
            BT_DeleteModuleIcon.Enabled = false;

            InitialModuleTree(TreeView1, strUserType, ddlLangSwitcher.SelectedValue.Trim());
            InitialModuleTree(TreeView2, strUserType, ddlLangSwitcher.SelectedValue.Trim());

            //设置缓存更改标志，并刷新页面缓存
            ChangePageCache();

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
        }
    }

  

    protected void BT_ModuleSave_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strID, strModuleID, strUserType, strModuleType, strHomeModuleName, strVisible;

        int j = 0, intSortNumber;

        strModuleID = LB_ID.Text.Trim();
        strUserType = DL_ForUserType.SelectedValue.Trim();
        strModuleType = DL_ModuleType.SelectedValue.Trim();

        try
        {
            for (j = 0; j < DataGrid4.Items.Count; j++)
            {
                strID = DataGrid4.Items[j].Cells[0].Text;

                intSortNumber = int.Parse(((TextBox)(DataGrid4.Items[j].FindControl("TB_SortNumber"))).Text.Trim());

                strHQL = "Update T_ProModuleLevelForPage Set SortNumber = " + intSortNumber.ToString() + " Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);

                strHomeModuleName = ((TextBox)DataGrid4.Items[j].FindControl("TB_HomeModuleName")).Text;
                strHQL = "Update T_ProModuleLevelForPage Set HomeModuleName = " + "'" + strHomeModuleName + "'" + " Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);

                if (((CheckBox)DataGrid4.Items[j].FindControl("CB_ModuleVisible")).Checked)
                {
                    strVisible = "YES";
                }
                else
                {
                    strVisible = "NO";
                }

                strHQL = "Update T_ProModuleLevelForPage Set Visible = " + "'" + strVisible + "'" + " Where ID = " + strID;
                ShareClass.RunSqlCommand(strHQL);
            }

            if (strModuleID == "0")
            {
                LoadChildModule("", strModuleType, strUserType, strLangCode);
            }
            else
            {
                LoadChildModule(TB_ModuleName.Text.Trim(), strModuleType, strUserType, strLangCode);
            }

            //设置缓存更改标志，并刷新页面缓存
            ChangePageCache();

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSBJC + "')", true);
        }
    }

    protected string GetModuleNameByPageName(string strPageName, string strModuleType)
    {
        string strHQL;

        strHQL = "Select PageName From T_ProModuleLevelForPage Where PageName = " + "'" + strPageName + "'";
        strHQL += " and ModuleType = " + "'" + strModuleType + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");
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

        strHQL = "Select * From T_ProModuleLevelForPage Where ParentModule = '" + strParentModule + "' and ModuleName = '" + strModuleName + "' and ModuleType = '" + strModuleType + "' and UserType = '" + strUserType + "' and LangCode = '" + strLangCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");

        return ds.Tables[0].Rows.Count;

    }

    protected void LoadChildModule(string strParentModuleName, string strModuleType, string strUserType, string strLangCode)
    {
        string strHQL;
        string strSortNumber, strVisible, strModuleName, strHomeModuleName;

        strLangCode = ddlLangSwitcher.SelectedValue.Trim();

        strModuleType = "%" + strModuleType + "%";

        strHQL = " select ID,ParentModule,ModuleName,PageName,SortNumber,ModuleType,Visible,HomeModuleName,LangCode,IconURL,UserType from T_ProModuleLevelForPage ";
        strHQL += " where UserType = " + "'" + strUserType + "'" + " and ltrim(rtrim(ParentModule)) = " + "'" + strParentModuleName + "'";
        strHQL += " and LangCode = " + "'" + strLangCode + "'";
        strHQL += " and IsDeleted = 'NO'";
        strHQL += " Order By ModuleType DESC,SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");

        DataGrid4.DataSource = ds;
        DataGrid4.DataBind();

        BT_ModuleSave.Enabled = true;

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            strSortNumber = ds.Tables[0].Rows[i][4].ToString().Trim();
            ((TextBox)DataGrid4.Items[i].FindControl("TB_SortNumber")).Text = strSortNumber;

            strModuleName = ds.Tables[0].Rows[i]["ModuleName"].ToString().Trim();
            strVisible = ds.Tables[0].Rows[i][6].ToString().Trim();

            if (strVisible == "YES")
            {
                ((CheckBox)DataGrid4.Items[i].FindControl("CB_ModuleVisible")).Checked = true;
            }
            else
            {
                ((CheckBox)DataGrid4.Items[i].FindControl("CB_ModuleVisible")).Checked = false;
            }


            if (TakeTopSecurity.TakeTopLicense.IsCanNotDeletedModule(strModuleName))
            {
                ((CheckBox)DataGrid4.Items[i].FindControl("CB_ModuleVisible")).Checked = true;
                ((CheckBox)DataGrid4.Items[i].FindControl("CB_ModuleVisible")).Enabled = false;
            }

            strHomeModuleName = ds.Tables[0].Rows[i][7].ToString().Trim();
            ((TextBox)DataGrid4.Items[i].FindControl("TB_HomeModuleName")).Text = strHomeModuleName;
        }

        LB_ModuleNumber.Text = ds.Tables[0].Rows.Count.ToString();
    }

    protected int GetTopProModuleCount(string strModuleName, string strModuleType)
    {
        string strHQL;

        strHQL = " select ID,ParentModule,ModuleName,PageName,SortNumber,ModuleType from T_ProModuleLevelForPage  ";
        strHQL += " where ModuleName = " + "'" + strModuleName + "'" + " and ModuleType = " + "'" + strModuleType + "'";
        strHQL += " and char_length(rtrim(ltrim(ParentModule))) = 0";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");

        return ds.Tables[0].Rows.Count;
    }

    protected int GetExistAllSameModuleNumber(string strModuleName, string strUserType, string strID)
    {
        string strHQL;

        if (strID == "")
        {
            strHQL = "Select * From T_ProModuleLevelForPage Where ModuleName = '" + strModuleName + "' and UserType = '" + strUserType + "'";
        }
        else
        {
            strHQL = "Select * From T_ProModuleLevelForPage Where ModuleName = '" + strModuleName + "' and UserType = '" + strUserType + "'";
            strHQL += " and ID <> " + strID;
        }

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");

        return ds.Tables[0].Rows.Count;
    }

    protected int GetNewProModuleCount(string strNewModuleName, string strModuleType, string strID)
    {
        string strHQL;

        strHQL = " select ID,ParentModule, ModuleName,PageName,SortNumber,ModuleType from T_ProModuleLevelForPage  ";
        strHQL += " where ModuleName = " + "'" + strNewModuleName + "'" + " and ModuleType = " + "'" + strModuleType + "'" + " and ID <> " + strID;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");

        return ds.Tables[0].Rows.Count;
    }

    protected string GetPageModuleType(string strModuleID)
    {
        string strHQL = "Select ModuleType From T_ProModuleLevelForPage Where ID = " + strModuleID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "";
        }
    }

    protected string GetPageModuleName(string strModuleID)
    {
        string strHQL = "Select ModuleName From T_ProModuleLevelForPage Where ID = " + strModuleID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevelForPage");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
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

    //设置缓存更改标志，并刷新页面缓存
    protected void ChangePageCache()
    {
        //设置缓存更改标志
        ShareClass.SetPageCacheMark("1");
        Session["CssDirectoryChangeNumber"] = "1";

        //给主界面个人空间添加空行以刷新页面缓存
        ShareClass.AddSpaceLineToPersonalSpaceForRefreshCache();
    }

}
