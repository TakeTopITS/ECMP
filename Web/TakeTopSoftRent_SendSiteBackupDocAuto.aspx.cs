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

public partial class TakeTopSoftRent_SendSiteBackupDocAuto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strSiteName, strSiteAppName;

        strSiteName = Request.QueryString["SiteName"];
        strSiteAppName = Request.QueryString["SiteAppName"];

        LB_Message.Text = "正在备份你的站点文件，大概需要5分钟，请耐心等候......";

        if (Page.IsPostBack == false)
        {
            if (VerifyWebSiteAppIsExist(strSiteName, strSiteAppName))
            {
                try
                {
                    //发送站点备份文件
                    SendSiteBackupDoc();
                    LB_Message.Text = "站点备份文件发送成功！";
                }
                catch
                {
                    LB_Message.Text = "提示，发送失败，请检查！";
                }
            }
            else
            {
                LB_Message.Text = "提示，此站点不存在，请检查！";
            }
        }

        IMB_Process.Visible = false;
        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>displayRelatedUI();</script>");
    }

    //发送站点备份文件
    protected void SendSiteBackupDoc()
    {
        string strSiteName, strSiteAppName, strSiteDirectory, strSiteVirtualDirectoryPhysicalPath, strSiteTemplateDirectory, strDBLoginUserID, strDBUserLoginPassword, strSiteDBName, strSiteAppSystemName, strSiteAppURL, strRentProductName, strRentUserEMail, strServerType;

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
        strSiteVirtualDirectoryPhysicalPath = Request.QueryString["SiteVirtualDirectoryPhysicalPath"];
        strServerType = Request.QueryString["ServerType"];

        strDBLoginUserID = strDBLoginUserID.ToLower();
        strSiteDBName = strSiteDBName.ToLower();


        ////配置POSTGRESQL数据库的环境变量
        //try
        //{
        //    ShareClass.ConfigPostgreSqlPGPassFile(strSiteDBName);
        //}
        //catch (Exception err)
        //{
        //    LogClass.WriteLogFile("Error page: " + err.Message.ToString() + "\n" + err.StackTrace);
        //}

        //备份数据库
        ShareClass.BackupOEMSiteDB(strSiteDBName, strSiteVirtualDirectoryPhysicalPath + "\\BackupDB","SiteCreator");

        //压缩并生成备份文件
        string strZipDocName = Request.QueryString["ZipDocName"];
        string strDocBackupPath = strSiteDirectory + @"\BackupDoc";
        string strZipDocPath = strDocBackupPath + @"\" + strZipDocName;
        string strDownloadDocURL = strSiteAppURL + @"/BackupDoc/" + strZipDocName;
        ShareClass.CreateDirectory(strDocBackupPath);
        ZipFile(strSiteVirtualDirectoryPhysicalPath, strZipDocPath);
    }

    //直接删除指定目录下的所有文件及文件夹
    public void DeleteDirectory(string strDirectory)
    {
        try
        {
            string strSiteVirtualDirectoryPhysicalPath, strSiteDBName;
            strSiteDBName = Request.QueryString["SiteDBName"];
            strSiteVirtualDirectoryPhysicalPath = Request.QueryString["SiteVirtualDirectoryPhysicalPath"];

            ////备份数据库
            //ShareClass.BackupOEMSiteDB(strSiteDBName, strSiteVirtualDirectoryPhysicalPath + "\\BackupDB");

            //去除文件夹和子文件的只读属性
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


    protected static readonly ILog logger = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

    /// <summary>
    /// 加密压缩包的方法
    /// </summary>
    /// <param name="strFile"></param>
    /// <param name="strZip"></param>
    /// <param name="sPassWord"></param>
    public void ZipFile(string strFile, string strZip, string sPassWord)
    {
        if (strFile[strFile.Length - 1] != Path.DirectorySeparatorChar)
            strFile += Path.DirectorySeparatorChar;
        ZipOutputStream s = new ZipOutputStream(File.Create(strZip));
        if (sPassWord != "")
        {
            s.Password = sPassWord; //Zip压缩文件密码
        }
        s.SetLevel(6);
        zip(strFile, s, strFile);
        s.Finish();
        s.Close();
    }
    /// <summary>
    /// 压缩文件夹
    /// </summary>
    /// <param name="strFile"></param>
    /// <param name="strZip"></param>
    /// <param name="sPassWord"></param>
    public void ZipFile(string strFile, string strZip)
    {
        if (strFile[strFile.Length - 1] != Path.DirectorySeparatorChar)
            strFile += Path.DirectorySeparatorChar;
        ZipOutputStream s = new ZipOutputStream(File.Create(strZip));
        s.SetLevel(6);
        zip(strFile, s, strFile);
        s.Finish();
        s.Close();
    }
    private void zip(string strFile, ZipOutputStream s, string staticFile)
    {
        if (strFile[strFile.Length - 1] != Path.DirectorySeparatorChar) strFile += Path.DirectorySeparatorChar;
        Crc32 crc = new Crc32();
        string[] filenames = Directory.GetFileSystemEntries(strFile);
        foreach (string file in filenames)
        {

            if (Directory.Exists(file))
            {
                zip(file, s, staticFile);
            }

            else // 否则直接压缩文件
            {
                //打开压缩文件
                FileStream fs = File.OpenRead(file);

                byte[] buffer = new byte[fs.Length];
                fs.Read(buffer, 0, buffer.Length);
                string tempfile = file.Substring(staticFile.LastIndexOf("\\") + 1);
                ZipEntry entry = new ZipEntry(tempfile);

                entry.DateTime = DateTime.Now;
                entry.Size = fs.Length;
                fs.Close();
                crc.Reset();
                crc.Update(buffer);
                entry.Crc = crc.Value;
                s.PutNextEntry(entry);

                s.Write(buffer, 0, buffer.Length);
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
}