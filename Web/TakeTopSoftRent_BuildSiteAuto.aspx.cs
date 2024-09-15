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
using System.Text;
using System.Text.RegularExpressions;
using System.Collections.Generic;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;
using System.Runtime.InteropServices;

using System.Diagnostics;
using Npgsql;
using NPOI.SS.Formula;


public partial class TakeTopSoftRent_BuildSiteAuto : System.Web.UI.Page
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
            string strIsOEM = Request.QueryString["IsOEM"];

            string strRentProductVersionType;
            if (strRentProductVersion == "集团版")
            {
                strRentProductVersionType = "YES";
            }
            else
            {
                strRentProductVersionType = "NO";
            }


            if (VerifyWebSiteAppIsExist(strSiteName, strSiteAppName))
            {
                LB_Message.Text = "创建失败，存在相同名称的站点，请检查！";
                return;
            }

            //创建站点应用
            CreateSiteAPP(strRentProductType, strRentProductVersionType, strSiteAppSystemName, strSiteAppName, strSiteAppURL, strSiteName, strSiteBindingInfo, strSiteDirectory, strSiteTemplateDirectory, strSiteVirtualDirectoryName, strSiteVirtualDirectoryPhysicalPath, strSiteDBName, strSiteDBRestoreFile, strSiteDBSetupDirectory, strSiteDBLoginUserID, strSiteDBUserLoginPassword, strIsOEM);


            ////跳转页面
            //string strScript = "<script>openMDIFrom('" + strSiteAppURL + "');</script>";
            //ClientScript.RegisterStartupScript(GetType(), "", strScript);

            LB_Message.Text = "站点创建成功，你可以点击下面链接打开和收藏此站点，注意第一次打开登录页面时因要初始化系统，耗时会较长，此后不会超过5秒钟， <br/><br/> <a href='" + strSiteAppURL + "' target='_blank'>" + strSiteAppURL + "</a><br/><br/>登录帐号：ADMIN    密码： 12345678";
            LB_CloseMessage.Visible = false;
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

            LB_Message.Text = err.Message.ToString();
        }
    }

    //-------------创建站点应用------------------------------------------------------------------
    /// <summary> 
    /// 创建一个站点应用
    /// </summary> 
    /// <param name="siteName"></param> 
    /// <param name="bindingInfo">"*:&lt;port&gt;:&lt;hostname&gt;" <example>"*:80:myhost.com"</example></param> 
    /// <param name="physicalPath"></param> 
    public void CreateSiteAPP(string strRentProductType, string strRentProductVersionType, string strSysteName, string strSiteAppName, string strSiteAppURL, string strSiteName, string strBindingInfo, string strSiteDirectory, string strSiteTemplateDirectory, string strSiteVirtualDirectoryName, string strSiteVirtualDirectoryPhysicalPath, string strSiteDBName, string strDBRestoreFile, string strDBSetupDirectory, string strDBLoginUserID, string strDBUserLoginPassword, string strIsOEM)
    {
        //把样板站点文件复制到站点
        CopySiteFile(strSiteTemplateDirectory, strSiteDirectory);

        if (strIsOEM == "YES")
        {
            //直接删除站点Logo目录下的所有文件
            ShareClass.DeleteFileUnderDirectory(strSiteDirectory + @"\Logo");

            //LogClass.WriteLogFile(strSiteDirectory + @"\Logo");

            //如果是OEM版，则把OEM的LOGO文件复制到站点的LOGO文件
            CopySiteFile(strSiteTemplateDirectory + @"\LogoOEM", strSiteDirectory + @"\Logo");

            //LogClass.WriteLogFile(strSiteTemplateDirectory + @"\LogoOEM");
        }

        //添加数据库登录用户
        ShareClass.CreateDBUserAccount(strDBLoginUserID, strDBUserLoginPassword, "YES");

        //从模板数据库恢复数据库
        if (!ShareClass.RestoreDatabaseFromTemplateDB(strSiteDBName, strDBRestoreFile))
        {
            LogClass.WriteLogFile("恢复数据库失败！");
        }

        //授予用户数据库权限，只针对这个数据库
        ShareClass.AuthorizationDBToUser(strDBLoginUserID, strDBUserLoginPassword, strSiteDBName, "YES");

        //ModifyWebConfigDBConnectionString 修改web.config的连接数据库的字符串、平台名称和是否OEM版
        ShareClass.ModifyWebConfigDBConnectionStringAndSystemName(strSiteDirectory, "connection.connection_string", "SQLCONNECTIONSTRING", "extganttDataContextConnectionString", strDBLoginUserID, strDBUserLoginPassword, strSiteDBName, strSysteName, strSiteAppURL, strRentProductType, strRentProductVersionType, strIsOEM);

        //C:\Windows\System32\inetsrv\config 这个目录要赋于IIS_USER用户全部权限，否则会出现错误
        createSiteAPP(strSiteAppName, strSiteName, "http", strBindingInfo, strSiteDirectory, true, strSiteAppName + "Pool", ProcessModelIdentityType.NetworkService, null, null, ManagedPipelineMode.Integrated, null);

        //创建网站应用的虚拟目录
        CreateSiteAppVDir(strSiteName, strSiteAppName, strSiteVirtualDirectoryName, strSiteVirtualDirectoryPhysicalPath);
    }


    //创建一个网站的应用
    private void createSiteAPP(string strSiteAppName, string strSiteName, string protocol, string bindingInformation, string physicalPath,
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


    //创建一个网站应用的虚拟目录
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
                //没有目录的就创建目录
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
            //没有目录的就创建目录
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
    /// 创建一个站点
    /// </summary> 
    /// <param name="siteName"></param> 
    /// <param name="bindingInfo">"*:&lt;port&gt;:&lt;hostname&gt;" <example>"*:80:myhost.com"</example></param> 
    /// <param name="physicalPath"></param> 
    public void CreateSite(string siteName, string bindingInfo, string physicalPath)
    {
        //C:\Windows\System32\inetsrv\config 这个目录要赋于IIS_USER用户全部权限，否则会出现错误
        createSite(siteName, "http", bindingInfo, physicalPath, true, siteName + "Pool", ProcessModelIdentityType.NetworkService, null, null, ManagedPipelineMode.Integrated, null);
    }

    //创建一个站点
    private void createSite(string siteName, string protocol, string bindingInformation, string physicalPath,
            bool createAppPool, string appPoolName, ProcessModelIdentityType identityType,
            string appPoolUserName, string appPoolPassword, ManagedPipelineMode appPoolPipelineMode, string managedRuntimeVersion)
    {
        using (ServerManager mgr = new ServerManager())
        {
            Site site;
            try
            {
                //创建站点时用这个
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

                //创建站点时用这个
                site.Applications["/"].ApplicationPoolName = pool.Name;
            }

            mgr.CommitChanges();
        }
    }

    /// <summary> 
    /// 删除一个网站
    /// </summary> 
    /// <param name="siteName">Site name.</param> 
    public void DeleteSite(string siteName)
    {
        using (ServerManager mgr = new ServerManager())
        {
            Site site = mgr.Sites[siteName];
            if (site != null)
            {
                mgr.Sites.Remove(site);
                mgr.CommitChanges();
            }
        }
    }

    //创建一个虚拟目录
    public void CreateVDir(string siteName, string vDirName, string physicalPath)
    {
        using (ServerManager mgr = new ServerManager())
        {
            Site site = mgr.Sites[siteName];
            if (site == null)
            {
                throw new ApplicationException(String.Format("Web site {0} does not exist", siteName));
            }
            site.Applications.Add("/" + vDirName, physicalPath);
            mgr.CommitChanges();
        }
    }

    public void DeleteVDir(string siteName, string vDirName)
    {
        using (ServerManager mgr = new ServerManager())
        {
            Site site = mgr.Sites[siteName];
            if (site != null)
            {
                Microsoft.Web.Administration.Application app = site.Applications["/" + vDirName];
                if (app != null)
                {
                    site.Applications.Remove(app);
                    mgr.CommitChanges();
                }
            }
        }
    }



}