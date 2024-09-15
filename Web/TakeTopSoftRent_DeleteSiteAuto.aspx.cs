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
using System.Diagnostics;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TakeTopSoftRent_DeleteSiteAuto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strSiteName, strSiteAppName;

        strSiteName = Request.QueryString["SiteName"];
        strSiteAppName = Request.QueryString["SiteAppName"];

        LB_Message.Text = "正在删除你的应用站点，大概需要5分钟，请耐心等候......";

        if (Page.IsPostBack == false)
        {
            if (VerifyWebSiteAppIsExist(strSiteName, strSiteAppName))
            {
                try
                {
                    //删除站点
                    DeleteSite();
                    LB_Message.Text = "站点删除成功！";
                }
                catch (Exception err)
                {
                    LB_Message.Text = "删除失败，请检查！";
                }
            }
            else
            {
                LB_Message.Text = "提示，此站点不存在，请检查！";
            }

            IMB_Process.Visible = false;
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>displayRelatedUI();</script>");
        }
    }

    //删除站点
    protected void DeleteSite()
    {
        string strSiteName, strSiteAppName, strSiteAppSystemName, strSiteDirectory, strSiteVirtualDirectoryPhysicalPath, strSiteTemplateDirectory, strDBLoginUserID, strDBUserLoginPassword, strSiteDBName, strSiteAppURL, strRentProductName, strRentUserEMail, strServerType;

        strSiteAppName = Request.QueryString["SiteAppName"];
        strSiteAppSystemName = Request.QueryString["SiteAppSystemName"];

        strSiteName = Request.QueryString["SiteName"];
        strSiteDirectory = Request.QueryString["SiteDirectory"];
        strSiteTemplateDirectory = Request.QueryString["SiteTemplateDirectory"];

        strDBLoginUserID = Request.QueryString["DBLoginUserID"];
        strDBUserLoginPassword = Request.QueryString["DBUserLoginPassword"];
        strSiteDBName = Request.QueryString["SiteDBName"];
        strSiteAppURL = Request.QueryString["SiteAppURL"];
        strRentProductName = Request.QueryString["RentProductName"];
        strRentUserEMail = Request.QueryString["RentUserEMail"];
        strSiteVirtualDirectoryPhysicalPath = Request.QueryString["SiteVirtualDirectoryPhysicalPath"];
        strServerType = Request.QueryString["ServerType"];

        ////配置POSTGRESQL数据库的环境变量
        //try
        //{
        //    ShareClass.ConfigPostgreSqlPGPassFile(strSiteDBName);
        //}
        //catch (Exception err)
        //{
        //    LogClass.WriteLogFile("Error page: " + err.Message.ToString() + "\n" + err.StackTrace);
        //}


        DeleteSiteApp(strSiteName, strSiteAppName);

        DeleteSiteApplicationPool(strSiteAppName + "Pool");

        //删除站点下的所有文件
        DeleteDirectory(strSiteDirectory);

        try
        {
            //备份数据库
            string strBackupPath = strSiteVirtualDirectoryPhysicalPath + "\\BackupDB";
            ShareClass.BackupOEMSiteDB(strSiteDBName, strBackupPath, "SiteCreator");

            ShareClass.DeleteSiteDBAndDBLoginUserID(strSiteDBName, strDBLoginUserID);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + err.Message.ToString() + "\n" + err.StackTrace);
        }
    }

    //直接删除指定目录下的所有文件及文件夹
    public static void DeleteDirectory(string strDirectory)
    {
        try
        {
            //去除文件夹和子文件的只读属性
            //去除文件夹的只读属性
            System.IO.DirectoryInfo fileInfo = new DirectoryInfo(strDirectory);
            fileInfo.Attributes = FileAttributes.Normal & FileAttributes.Directory;

            //去除文件的只读属性
            System.IO.File.SetAttributes(strDirectory, System.IO.FileAttributes.Normal);

            //判断文件夹是否还存在
            if (Directory.Exists(strDirectory))
            {
                foreach (string f in Directory.GetFileSystemEntries(strDirectory))
                {
                    if (File.Exists(f))
                    {
                        try
                        {
                            //如果有子文件删除文件
                            File.Delete(f);
                        }
                        catch
                        {
                        }
                    }
                    else
                    {
                        try
                        {
                            if (!f.Contains("Logo"))
                            {
                                //循环递归删除子文件夹
                                DeleteDirectory(f);
                            }
                        }
                        catch
                        {
                        }
                    }
                }

                //删除空文件夹
                Directory.Delete(strDirectory);
            }
        }
        catch (Exception ex) // 异常处理
        {
        }
    }



    /// <summary> 
    /// 删除一个网站下面的应用
    /// </summary> 
    /// <param name="siteName">Site name.</param> 
    public void DeleteSiteApp(string siteName, string siteAppName)
    {
        using (ServerManager mgr = new ServerManager())
        {
            Site site = mgr.Sites[siteName];

            Application app = site.Applications["/" + siteAppName];
            if (app != null)
            {
                mgr.Sites[siteName].Applications.Remove(app);
                mgr.CommitChanges();
            }
        }
    }

    //删除一个应用程序池
    public void DeleteSiteApplicationPool(String poolName)
    {
        ServerManager iisManager = new ServerManager();
        ApplicationPool appPool = iisManager.ApplicationPools[poolName];
        iisManager.ApplicationPools.Remove(appPool); iisManager.CommitChanges();
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
}

