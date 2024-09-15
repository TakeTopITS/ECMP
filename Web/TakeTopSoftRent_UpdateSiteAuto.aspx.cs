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
using System.Diagnostics;
using System.Text.RegularExpressions;

///第三方dll
using ICSharpCode.SharpZipLib;
using ICSharpCode.SharpZipLib.Checksum;
using ICSharpCode.SharpZipLib.Zip;
using log4net;
using log4net.Config;
using Npgsql;

public partial class TakeTopSoftRent_UpdateSiteAuto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strSiteName, strSiteAppName;

        strSiteName = Request.QueryString["SiteName"];
        strSiteAppName = Request.QueryString["SiteAppName"];

        LB_Message.Text = "正在升级你的应用站点，大概需要5分钟，请耐心等候......";

        if (Page.IsPostBack == false)
        {
            if (VerifyWebSiteAppIsExist(strSiteName, strSiteAppName))
            {
                try
                {
                    UpdateSite();
                    LB_Message.Text = "站点升级成功！";
                }
                catch
                {
                    LB_Message.Text = "站点升级失败，请检查！";
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

    //升级站点
    protected void UpdateSite()
    {
        string strSiteID, strRentProductType, strRentProductVersionType, strRentProductVersion, strSiteName, strSiteAppName, strSiteDirectory, strSiteTemplateDirectory, strDBLoginUserID, strDBUserLoginPassword, strSiteDBName, strSiteAppSystemName, strSiteAppURL, strRentProductName, strRentUserEMail, strServerType, strIsOEM;

        strSiteID = Request.QueryString["SiteID"];
        strSiteName = Request.QueryString["SiteName"];
        strSiteAppName = Request.QueryString["SiteAppName"];
        strSiteDirectory = Request.QueryString["SiteDirectory"];
        strSiteTemplateDirectory = Request.QueryString["SiteTemplateDirectory"];

        strDBLoginUserID = Request.QueryString["DBLoginUserID"];
        strDBUserLoginPassword = Request.QueryString["DBUserLoginPassword"];
        strSiteDBName = Request.QueryString["SiteDBName"];
        strSiteAppSystemName = Request.QueryString["SiteAppSystemName"];
        strSiteAppURL = Request.QueryString["SiteAppURL"];
        strRentProductName = Request.QueryString["RentProductName"];
        strRentUserEMail = Request.QueryString["RentUserEMail"];
        strServerType = Request.QueryString["ServerType"];
        strIsOEM = Request.QueryString["IsOEM"];

        strRentProductType = Request.QueryString["RentProductType"];
        strRentProductVersion = Request.QueryString["RentProductVersion"];
        if (strRentProductVersion == "集团版")
        {
            strRentProductVersionType = "YES";
        }
        else
        {
            strRentProductVersionType = "NO";
        }

        strDBLoginUserID = strDBLoginUserID.ToLower();
        strSiteDBName = strSiteDBName.ToLower();

        string strHQL;
        strHQL = "Select * From T_RentSiteBaseData Where RentProductName = '" + strRentProductName + "' and RentProductVersion = '" + strRentProductVersion + "' and IsCanUse = 'YES'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_RentSiteBaseData");
        if (ds.Tables[0].Rows.Count == 0)
        {
            LB_Message.Text = "创建失败，没有你选取的产品版本的可用站点基础参数，请检查！";
            return;
        }
        strRentProductType = ds.Tables[0].Rows[0]["RentProductType"].ToString().Trim();

        //删除站点下的所有文件
        DeleteDirectory(strSiteDirectory);

        //把样板站点文件复制到站点
        CopySiteFile(strSiteTemplateDirectory, strSiteDirectory);

        //ModifyWebConfigDBConnectionString 修改web.config的连接数据库的字符串、平台名称和是否OEM版
        ShareClass.ModifyWebConfigDBConnectionStringAndSystemName(strSiteDirectory, "connection.connection_string", "SQLCONNECTIONSTRING", "extganttDataContextConnectionString",strDBLoginUserID, strDBUserLoginPassword, strSiteDBName, strSiteAppSystemName, strSiteAppURL, strRentProductType, strRentProductVersionType, strIsOEM);

        //授予自建站点用户所有权限
        ShareClass.GanttAllPrivilegesToSiteUser(strSiteDBName, strDBLoginUserID);

        // 更新网站建立时间
        UpdateSiteCreateTime(strSiteID);
    }

    //取得自建站点的数据库连接串
    public static string GetSiteConnectString(string strSiteDBName)
    {
        string strConnectString, strDBName;

        strConnectString = ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString;
        strDBName = ShareClass.GetSystemDBName();

        strConnectString = strConnectString.Replace("=" + strDBName, "=" + strSiteDBName);

        return strConnectString;
    }


    //更新网站建立时间
    protected void UpdateSiteCreateTime(string strSiteID)
    {
        string strHQL;

        strHQL = "Update T_RentSiteInfoByCustomer Set SiteCreateTime = now() Where ID = " + strSiteID;
        ShareClass.RunSqlCommand(strHQL);
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