using ProjectMgt.BLL;
using ProjectMgt.Model;
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TakeTopSoftRent_BaseDataSet : System.Web.UI.Page
{
    string strLangCode;
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserName;

        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "软件租用建站参数", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadRentSiteBaseData();

            LoadHomeSiteURL();
        }
    }

    protected void BT_Create_Click(object sender, EventArgs e)
    {
        LB_ID.Text = "";
        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','false') ", true);
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strID = e.Item.Cells[2].Text.Trim();


            string strHQL;

            if (e.CommandName == "Update")
            {
                strHQL = "Select * From T_RentSiteBaseData Where ID = " + strID;
                DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_RentSiteBaseData");

                LB_ID.Text = ds.Tables[0].Rows[0]["ID"].ToString().Trim();
                try
                {
                    DL_RentProductName.SelectedValue = ds.Tables[0].Rows[0]["RentProductName"].ToString().Trim();
                }
                catch
                {
                }
                try
                {
                    DL_ProductVerType.SelectedValue = ds.Tables[0].Rows[0]["RentProductVersion"].ToString().Trim();
                }
                catch
                {
                }
                try
                {
                    DL_RentProductType.SelectedValue = ds.Tables[0].Rows[0]["RentProductType"].ToString().Trim();
                }
                catch
                {
                }
                TB_SiteCreatorAppName.Text = ds.Tables[0].Rows[0]["SiteCreatorAppName"].ToString().Trim();
                TB_SiteURL.Text = ds.Tables[0].Rows[0]["SiteURL"].ToString().Trim();
                TB_SiteBindingInfo.Text = ds.Tables[0].Rows[0]["SiteBindingInfo"].ToString().Trim();
                TB_SiteDirectory.Text = ds.Tables[0].Rows[0]["SiteDirectory"].ToString().Trim();
                TB_SiteTemplateDirectory.Text = ds.Tables[0].Rows[0]["SiteTemplateDirectory"].ToString().Trim();
                TB_SiteVirtualDirectoryPhysicalPath.Text = ds.Tables[0].Rows[0]["SiteVirtualDirectoryPhysicalPath"].ToString().Trim();
                TB_SiteDBRestoreFile.Text = ds.Tables[0].Rows[0]["SiteDBRestoreFile"].ToString().Trim();
                TB_SiteDBSetupDirectory.Text = ds.Tables[0].Rows[0]["SiteDBSetupDirectory"].ToString().Trim();
                TB_SiteDBLoginUserID.Text = ds.Tables[0].Rows[0]["SiteDBLoginUserID"].ToString().Trim();
                DL_AutoBuildSite.SelectedValue = ds.Tables[0].Rows[0]["IsAutoBuildSite"].ToString().Trim();

                if (e.CommandName == "Update")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
                }
            }

            if (e.CommandName == "Delete")
            {
                try
                {
                    strHQL = "Delete From T_RentSiteBaseData Where ID = " + strID;
                    ShareClass.RunSqlCommand(strHQL);

                    LoadRentSiteBaseData();
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCSBJC + "')", true);
                }
            }
        }
    }

    protected void BT_New_Click(object sender, EventArgs e)
    {
        string strID;

        strID = LB_ID.Text.Trim();

        if (strID == "")
        {
            AddRentSiteBaseData();
        }
        else
        {
            UpdateRentSiteBaseData();
        }
    }

    protected void AddRentSiteBaseData()
    {
        string strHQL;

        string strRentProductName = DL_RentProductName.SelectedValue.Trim();
        string strRentProductVersion = DL_ProductVerType.SelectedValue.Trim();
        string strRentProductType = DL_RentProductType.SelectedValue.Trim();

        string strSiteURL = TB_SiteURL.Text.Trim();
        string strSiteBindingInfo = TB_SiteBindingInfo.Text.Trim();
        string strSiteDirectory = TB_SiteDirectory.Text.Trim();
        string strSiteTemplateDirectory = TB_SiteTemplateDirectory.Text.Trim();
        string strSiteVirtualDirectoryPhysicalPath = TB_SiteVirtualDirectoryPhysicalPath.Text.Trim();
        string strSiteDBRestoreFile = TB_SiteDBRestoreFile.Text.Trim();
        string strSiteDBSetupDirectory = TB_SiteDBSetupDirectory.Text.Trim();
        string strSiteDBLoginUserID = TB_SiteDBLoginUserID.Text.Trim();
        string strIsAutoBuildSite = DL_AutoBuildSite.SelectedValue;
        string strSiteCreatorAppName = TB_SiteCreatorAppName.Text.Trim();

        strHQL = string.Format(@"INSERT INTO T_RentSiteBaseData
           (RentProductName
           ,RentProductVersion
           ,RentProductType

           ,SiteCreatorAppName
           ,SiteURL
           ,SiteBindingInfo
           ,SiteDirectory
           ,SiteTemplateDirectory
           ,SiteVirtualDirectoryPhysicalPath
           ,SiteDBRestoreFile
           ,SiteDBSetupDirectory
           ,SiteDBLoginUserID
           ,IsAutoBuildSite)
     VALUES
           ('{0}'
           ,'{1}'
           ,'{2}'
           ,'{3}'
           ,'{4}'
           ,'{5}'
           ,'{6}'
           ,'{7}'
           ,'{8}'
           ,'{9}'
           ,'{10}'
           ,'{11}'
           ,'{12}'

           )", strRentProductName, strRentProductVersion, strRentProductType, strSiteCreatorAppName, strSiteURL, strSiteBindingInfo, strSiteDirectory, strSiteTemplateDirectory,
                    strSiteVirtualDirectoryPhysicalPath, strSiteDBRestoreFile, strSiteDBSetupDirectory, strSiteDBLoginUserID, strIsAutoBuildSite);

        try
        {
            ShareClass.RunSqlCommand(strHQL);
            LB_ID.Text = GetMyCreatedRentSiteBaseData();

            LoadRentSiteBaseData();
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCSB + "')", true);
            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected void UpdateRentSiteBaseData()
    {
        string strHQL;

        string strID = LB_ID.Text.Trim();
        string strRentProductName = DL_RentProductName.SelectedValue.Trim();
        string strRentProductVersion = DL_ProductVerType.SelectedValue.Trim();
        string strRentProductType = DL_RentProductType.SelectedValue.Trim();

        string strSiteURL = TB_SiteURL.Text.Trim();
        string strSiteBindingInfo = TB_SiteBindingInfo.Text.Trim();
        string strSiteDirectory = TB_SiteDirectory.Text.Trim();
        string strSiteTemplateDirectory = TB_SiteTemplateDirectory.Text.Trim();
        string strSiteVirtualDirectoryPhysicalPath = TB_SiteVirtualDirectoryPhysicalPath.Text.Trim();
        string strSiteDBRestoreFile = TB_SiteDBRestoreFile.Text.Trim();
        string strSiteDBSetupDirectory = TB_SiteDBSetupDirectory.Text.Trim();
        string strSiteDBLoginUserID = TB_SiteDBLoginUserID.Text.Trim();
        string strSiteCreatorAppName = TB_SiteCreatorAppName.Text.Trim();
        string strIsAutoBuildSite = DL_AutoBuildSite.SelectedValue;

        strHQL = string.Format(@"Update T_RentSiteBaseData Set
            RentProductName = '{0}'
           ,RentProductVersion ='{1}'
           ,SiteURL='{2}'
           ,SiteBindingInfo ='{3}'
           ,SiteDirectory ='{4}'
           ,SiteTemplateDirectory ='{5}'
           ,SiteVirtualDirectoryPhysicalPath ='{6}'
           ,SiteDBRestoreFile ='{7}'
           ,SiteDBSetupDirectory ='{8}'
           ,SiteDBLoginUserID ='{9}'
           ,SiteCreatorAppName ='{11}'
           ,RentProductType ='{12}'
           ,IsAutoBuildSite ='{13}'
            Where ID = {10}
            ", strRentProductName, strRentProductVersion, strSiteURL, strSiteBindingInfo, strSiteDirectory, strSiteTemplateDirectory,
                    strSiteVirtualDirectoryPhysicalPath, strSiteDBRestoreFile, strSiteDBSetupDirectory, strSiteDBLoginUserID, strID, strSiteCreatorAppName, strRentProductType,strIsAutoBuildSite);

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            LoadRentSiteBaseData();

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch (Exception err)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + err.Message.ToString() + "')", true);

            ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "popShow('popwindow','true') ", true);
        }
    }

    protected string GetMyCreatedRentSiteBaseData()
    {
        string strHQL;

        strHQL = "Select Max(ID) From T_RentSiteBaseData ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_RentSiteBaseData");

        return ds.Tables[0].Rows[0][0].ToString();
    }

    protected void DL_HomeSiteURL_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strHomeSiteURL = DL_HomeSiteURL.SelectedValue.Trim();

        strHQL = "Select * From T_RentSiteBaseData Where SiteURL Like '%" + strHomeSiteURL + "%'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_RentSiteBaseData");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_FromHomeSiteURL.Text = strHomeSiteURL;
    }

    protected void BT_Copy_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strFromHomeSiteURL = LB_FromHomeSiteURL.Text.Trim();
        string strToHomeSiteURL = TB_HomeSiteURL.Text.Trim();

        if (strFromHomeSiteURL != "" & strToHomeSiteURL != "")
        {
            strHQL = string.Format(@"INSERT INTO T_RentSiteBaseData
           (RentProductName
           ,RentProductVersion
           ,RentProductType
           ,SiteURL
           ,SiteBindingInfo
           ,SiteDirectory
           ,SiteTemplateDirectory
           ,SiteVirtualDirectoryPhysicalPath
           ,SiteDBRestoreFile
           ,SiteDBSetupDirectory
           ,SiteDBLoginUserID
           ,IsAutoBuildSite
           ,SiteCreatorAppName)
         Select RentProductName
           ,RentProductVersion
           ,RentProductType
           ,'{0}'
           ,SiteBindingInfo
           ,SiteDirectory
           ,SiteTemplateDirectory
           ,SiteVirtualDirectoryPhysicalPath
           ,SiteDBRestoreFile
           ,SiteDBSetupDirectory
           ,SiteDBLoginUserID
           ,IsAutoBuildSite
           ,SiteCreatorAppName
           From T_RentSiteBaseData Where SiteURL = '{1}' Order By ID ASC", strToHomeSiteURL, strFromHomeSiteURL);

            try
            {
                ShareClass.RunSqlCommand(strHQL);

                LoadHomeSiteURL();

                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFZCG + "')", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZFZSBJC + "')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('失败，要复制的站点不能为空，请检查！')", true);
        }
    }
    protected void BT_CanUse_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strHomeSiteURL;
        strHomeSiteURL = DL_HomeSiteURL.SelectedValue.Trim();

        strHQL = "Update T_RentSiteBaseData Set IsCanUse = 'YES' Where SiteURL = '" + strHomeSiteURL + "'";
        ShareClass.RunSqlCommand(strHQL);

        strHQL = "Update T_RentSiteBaseData Set IsCanUse = 'NO' Where SiteURL <> '" + strHomeSiteURL + "'";
        ShareClass.RunSqlCommand(strHQL);

        LoadRentSiteBaseData();
    }

    protected void BT_Delete_Click(object sender, EventArgs e)
    {
        string strHQL1, strHQL2;
        string strHomeSiteURL = DL_HomeSiteURL.SelectedValue.Trim();

        if (strHomeSiteURL != "")
        {
            strHQL1 = "Select * From T_RentSiteInfoByCustomer Where SiteURL = '" + strHomeSiteURL + "'";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL1, "T_RentSiteInfoByCustomer");
            if (ds.Tables[0].Rows.Count == 0)
            {
                strHQL2 = "Delete From T_RentSiteBaseData Where SiteURL = '" + strHomeSiteURL + "'";

                ShareClass.RunSqlCommand(strHQL2);

                LoadHomeSiteURL();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('提示，此站点的数据已应用，不能删除，请检查！')", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('失败，要删除的站点不能为空，请检查！')", true);

        }
    }

    protected void DL_IsAutoBuildSite_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;

        strHQL = "Update T_RentSiteBaseData Set IsAutoBuildSite = '" + DL_IsAutoBuildSite.SelectedValue + "'";
        ShareClass.RunSqlCommand(strHQL);

        LoadRentSiteBaseData();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('全部更新成功！')", true);
    }

    protected void LoadRentSiteBaseData()
    {
        string strHQL;

        strHQL = "Select * From T_RentSiteBaseData Order By ID ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_RentSiteBaseData");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected void LoadHomeSiteURL()
    {
        string strHQL;

        strHQL = "Select distinct SiteURL From T_RentSiteBaseData Order By SiteURL ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_RentSiteBaseData");

        DL_HomeSiteURL.DataSource = ds;
        DL_HomeSiteURL.DataBind();

        DL_HomeSiteURL.Items.Insert(0, new ListItem("--Select--", ""));
    }
}
