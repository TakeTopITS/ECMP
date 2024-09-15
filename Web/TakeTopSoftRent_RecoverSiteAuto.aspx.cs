using System;
using System.Resources;
using System.Data;
using System.Configuration.Internal;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Configuration;
using Microsoft.Web.Administration;
using System.DirectoryServices;
using System.Xml;
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;
using NickLee.Common.SmartWin32;

public partial class TakeTopSoftRent_RecoverSiteAuto : System.Web.UI.Page
{
    string strWebSite;
    string strSiteAppSystemName;
    string strSiteAppName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strWebSite = Request.QueryString["WebSite"];
        if (strWebSite == null)
        {
            strWebSite = "";
        }

        strSiteAppSystemName = Request.QueryString["SiteAppSystemName"];
        strSiteAppName = Request.QueryString["SiteAppName"];

        if (Page.IsPostBack == false)
        {
            if (strSiteAppSystemName != null & strSiteAppName != null)
            {
                CreateSite(strSiteAppSystemName, strSiteAppName);
            }

            ClientScript.RegisterStartupScript(GetType(), "dd", "<script>displayRelatedUI();</script>");
        }
    }

    protected void CreateSite(string strSiteAppSystemName, string strSiteAppName)
    {
        try
        {
            string strRentUserPhoneNumber = Request.QueryString["RentUserPhoneNumber"];
            string strRentUserEMail = Request.QueryString["RentUserEMail"];
            string strRentUserName = Request.QueryString["RentUserName"];
            string strRentUserCompanyName = Request.QueryString["RentUserCompanyName"];
            string strRentProductName = Request.QueryString["RentProductName"];
            string strRentProductVersion = Request.QueryString["RentProductVersion"];
            string strRentUserNumber = Request.QueryString["RentUserNumber"];
            string strSiteID = Request.QueryString["SiteID"];

            string strRentProductType = Request.QueryString["RentProductType"];
            string strSiteCreatorName = strRentUserName;

            string strSiteName = Request.QueryString["SiteName"];
            string strSiteURL = Request.QueryString["SiteURL"];
            string strSiteAppURL = Request.QueryString["SiteAppURL"];
            string strSiteBindingInfo = Request.QueryString["SiteBindingInfo"];
            string strSiteDirectory = Request.QueryString["SiteDirectory"];
            string strSiteTemplateDirectory = Request.QueryString["SiteTemplateDirectory"];
            string strSiteVirtualDirectoryName = Request.QueryString["SiteVirtualDirectoryName"];
            string strSiteVirtualDirectoryPhysicalPath = Request.QueryString["SiteVirtualDirectoryPhysicalPath"];
            string strSiteDBName = Request.QueryString["SiteDBName"];
            string strSiteDBRestoreFile = Request.QueryString["SiteDBRestoreFile"];
            string strSiteDBSetupDirectory = Request.QueryString["SiteDBSetupDirectory"];
            string strSiteDBLoginUserID = Request.QueryString["SiteDBLoginUserID"];
            string strSiteDBUserLoginPassword = Request.QueryString["SiteDBUserLoginPassword"];
            string strServerType = Request.QueryString["ServerType"];

            string strRentProductVersionType;
            if (strRentProductVersion == "集团版")
            {
                strRentProductVersionType = "YES";
            }
            else
            {
                strRentProductVersionType = "NO";
            }

            string strIsOEM = Request.QueryString["IsOEM"];


            if (VerifyWebSiteAppIsExist(strSiteName, strSiteAppName))
            {
                LB_Message.Text = "恢复失败，存在相同名称的站点，请检查！";
                return;
            }

            //恢复站点应用
            RecoverSiteAPP(strRentProductType, strRentProductVersionType, strSiteAppSystemName, strSiteAppName, strSiteAppURL, strSiteName, strSiteBindingInfo, strSiteDirectory, strSiteTemplateDirectory, strSiteVirtualDirectoryName, strSiteVirtualDirectoryPhysicalPath, strSiteDBName, strSiteDBRestoreFile, strSiteDBSetupDirectory, strSiteDBLoginUserID, strSiteDBUserLoginPassword, strIsOEM);

            LB_Message.Text = "站点恢复成功，你可以打开和收藏此站点 <br/> <a href='" + strSiteAppURL + "' target='_blank'>" + strSiteAppURL + "</a>";
            LB_CloseMessage.Visible = false;

            //LB_Message.Text = strSiteDBRestoreFile;
        }
        catch (Exception ex)
        {
            LB_Message.Text = ex.Message.ToString();
        }
    }

    //-------------恢复站点应用------------------------------------------------------------------
    /// <summary> 
    /// 恢复一个站点应用
    /// </summary> 
    /// <param name="siteName"></param> 
    /// <param name="bindingInfo">"*:&lt;port&gt;:&lt;hostname&gt;" <example>"*:80:myhost.com"</example></param> 
    /// <param name="physicalPath"></param> 
    public void RecoverSiteAPP(string strRentProductType, string strRentProductVersionType, string strSysteName, string strSiteAppName, string strSiteAppURL, string strSiteName, string strBindingInfo, string strSiteDirectory, string strSiteTemplateDirectory, string strSiteVirtualDirectoryName, string strSiteVirtualDirectoryPhysicalPath, string strSiteDBName, string strDBRestoreFile, string strDBSetupDirectory, string strDBLoginUserID, string strDBUserLoginPassword, string strIsOEM)
    {
        //把样板站点文件复制到站点
        CopySiteFile(strSiteTemplateDirectory, strSiteDirectory);

        ////配置POSTGRESQL数据库的环境变量
        //try
        //{
        //    ShareClass.ConfigPostgreSqlPGPassFile(strSiteDBName);
        //}
        //catch (Exception err)
        //{
        //    LogClass.WriteLogFile("Error page: " + err.Message.ToString() + "\n" + err.StackTrace);
        //}

        //添加数据库登录用户
        ShareClass.CreateDBUserAccount(strDBLoginUserID, strDBUserLoginPassword, "YES");

        //从用户备份数据库恢复数据库
        ShareClass.RestoreDatabaseFromOEMUserDB(strSiteDBName, strDBRestoreFile);

        //授予用户数据库权限
        ShareClass.AuthorizationDBToUser(strDBLoginUserID,strDBUserLoginPassword, strSiteDBName, "YES");

        //ModifyWebConfigDBConnectionString 修改web.config的连接数据库的字符串、平台名称和是否OEM版
        ShareClass.ModifyWebConfigDBConnectionStringAndSystemName(strSiteDirectory, "connection.connection_string", "SQLCONNECTIONSTRING", "extganttDataContextConnectionString", strDBLoginUserID, strDBUserLoginPassword, strSiteDBName, strSysteName, strSiteAppURL, strRentProductType, strRentProductVersionType, strIsOEM);

        //C:\Windows\System32\inetsrv\config 这个目录要赋于IIS_USER用户全部权限，否则会出现错误
        RecoverSiteAPP(strSiteAppName, strSiteName, "http", strBindingInfo, strSiteDirectory, true, strSiteAppName + "Pool", ProcessModelIdentityType.NetworkService, null, null, ManagedPipelineMode.Integrated, null);

        //恢复网站应用的虚拟目录
        CreateSiteAppVDir(strSiteName, strSiteAppName, strSiteVirtualDirectoryName, strSiteVirtualDirectoryPhysicalPath);
    }

    //恢复一个网站的应用
    private void RecoverSiteAPP(string strSiteAppName, string strSiteName, string protocol, string bindingInformation, string physicalPath,
           bool createAppPool, string appPoolName, ProcessModelIdentityType identityType,
           string appPoolUserName, string appPoolPassword, ManagedPipelineMode appPoolPipelineMode, string managedRuntimeVersion)
    {
        using (ServerManager mgr = new ServerManager())
        {
            Application app;
            try
            {
                app = mgr.Sites[strSiteName].Applications.Add("/" + strSiteAppName, physicalPath);
            }
            catch (Exception err)
            {
                LB_Message.Text = err.Message.ToString();
                return;
            }

            if (createAppPool)
            {
                ApplicationPool pool = mgr.ApplicationPools.Add(appPoolName);
                if (pool.ProcessModel.IdentityType != identityType)
                {
                    pool.ProcessModel.IdentityType = identityType;
                }
                if (!String.IsNullOrEmpty(appPoolUserName))
                {
                    pool.ProcessModel.UserName = appPoolUserName;
                    pool.ProcessModel.Password = appPoolPassword;
                }

                //设为经典模式
                pool.ManagedPipelineMode = ManagedPipelineMode.Classic;

                //设置web应用程序池的Framework版本
                pool.ManagedRuntimeVersion = "v4.0";

                //设置是否启用32位应用程序
                pool.SetAttributeValue("enable32BitAppOnWin64", true);
                pool.ProcessModel.IdentityType = ProcessModelIdentityType.ApplicationPoolIdentity;

                app.ApplicationPoolName = pool.Name;
            }

            mgr.CommitChanges();
        }
    }


    //恢复一个网站应用的虚拟目录
    public void CreateSiteAppVDir(string siteName, string siteAppName, string vDirName, string physicalPath)
    {
        using (ServerManager mgr = new ServerManager())
        {
            Site site = mgr.Sites[siteName];
            if (site == null)
            {
                throw new ApplicationException(String.Format("Web site {0} does not exist", siteName));
            }

            Application app = site.Applications["/" + siteAppName];
            if (app == null)
            {
                throw new ApplicationException(String.Format("Web site app {0} does not exist", siteAppName));
            }

            try
            {
                //没有目录的就恢复目录
                ShareClass.CreateDirectory(physicalPath);

                app.VirtualDirectories.Add(vDirName, physicalPath);
                mgr.CommitChanges();
            }
            catch
            {
            }
        }
    }

    //判断站点应用是否存在
    public bool VerifyWebSiteAppIsExist(string siteName, string siteAppName)
    {
        using (ServerManager mgr = new ServerManager())
        {
            Site site = mgr.Sites[siteName];

            Application app = site.Applications["/" + siteAppName];

            if (app != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }

    //复制文件夹
    public static bool CopyDirectory(string SourcePath, string DestinationPath, bool overwriteexisting)
    {
        bool ret = false;
        try
        {
            SourcePath = SourcePath.EndsWith(@"\") ? SourcePath : SourcePath + @"\";
            DestinationPath = DestinationPath.EndsWith(@"\") ? DestinationPath : DestinationPath + @"\";

            if (Directory.Exists(SourcePath))
            {
                if (Directory.Exists(DestinationPath) == false)
                    Directory.CreateDirectory(DestinationPath);

                foreach (string fls in Directory.GetFiles(SourcePath))
                {
                    FileInfo flinfo = new FileInfo(fls);
                    flinfo.CopyTo(DestinationPath + flinfo.Name, overwriteexisting);
                }
                foreach (string drs in Directory.GetDirectories(SourcePath))
                {
                    DirectoryInfo drinfo = new DirectoryInfo(drs);
                    if (CopyDirectory(drs, DestinationPath + drinfo.Name, overwriteexisting) == false)
                        ret = false;
                }
            }
            ret = true;
        }
        catch (Exception ex)
        {
            ret = false;
        }
        return ret;
    }



    //-------------复制站点文件------------------------------------------------------------------
    public static bool CopySiteFile(string strFromDirectory, string strToDirectory)
    {
        try
        {
            //没有目录的就恢复目录
            ShareClass.CreateDirectory(strToDirectory);

            bool blCopy = ShareClass.CopyDirectory(strFromDirectory, strToDirectory, false);
            return blCopy;
        }
        catch
        {
            return false;
        }
    }

    //----------------------------------------------------------------------------------------------
    /// <summary> 
    /// 恢复一个站点
    /// </summary> 
    /// <param name="siteName"></param> 
    /// <param name="bindingInfo">"*:&lt;port&gt;:&lt;hostname&gt;" <example>"*:80:myhost.com"</example></param> 
    /// <param name="physicalPath"></param> 
    public void CreateSite(string siteName, string bindingInfo, string physicalPath)
    {
        //C:\Windows\System32\inetsrv\config 这个目录要赋于IIS_USER用户全部权限，否则会出现错误
        createSite(siteName, "http", bindingInfo, physicalPath, true, siteName + "Pool", ProcessModelIdentityType.NetworkService, null, null, ManagedPipelineMode.Integrated, null);
    }

    //恢复一个站点
    private void createSite(string siteName, string protocol, string bindingInformation, string physicalPath,
            bool createAppPool, string appPoolName, ProcessModelIdentityType identityType,
            string appPoolUserName, string appPoolPassword, ManagedPipelineMode appPoolPipelineMode, string managedRuntimeVersion)
    {
        using (ServerManager mgr = new ServerManager())
        {
            Site site;
            try
            {
                //恢复站点时用这个
                site = mgr.Sites.Add(siteName, protocol, bindingInformation, physicalPath);
            }
            catch (Exception err)
            {
                LB_Message.Text = err.Message.ToString();
                return;
            }

            if (createAppPool)
            {
                ApplicationPool pool = mgr.ApplicationPools.Add(appPoolName);
                if (pool.ProcessModel.IdentityType != identityType)
                {
                    pool.ProcessModel.IdentityType = identityType;
                }
                if (!String.IsNullOrEmpty(appPoolUserName))
                {
                    pool.ProcessModel.UserName = appPoolUserName;
                    pool.ProcessModel.Password = appPoolPassword;
                }
                //if (appPoolPipelineMode != pool.ManagedPipelineMode)
                //{
                //    //设为集成模式
                //    pool.ManagedPipelineMode = appPoolPipelineMode;
                //}

                //设为经典模式
                pool.ManagedPipelineMode = ManagedPipelineMode.Classic;

                //设置web应用程序池的Framework版本
                pool.ManagedRuntimeVersion = "v4.0";

                //设置是否启用32位应用程序
                pool.SetAttributeValue("enable32BitAppOnWin64", true);

                //恢复站点时用这个
                site.Applications["/"].ApplicationPoolName = pool.Name;
            }

            mgr.CommitChanges();
        }
    }

}