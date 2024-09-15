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
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Web.Mail;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;
using Npgsql;

public partial class Index : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        //this.Title = "我的邮件管理---" + System.Configuration.ConfigurationManager.AppSettings["SystemName"];
        if (!Page.IsPostBack)
        {
            try
            {
                ///获取系统配置信息
                BindWebMailProfile();
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }

            //创建用户邮件附件存放目录;
            // CreateUserDirectory(strUserCode);
        }
    }
    private void BindWebMailProfile()
    {
        if (Session["Profile"] == null)
        {
            ///获取系统配置信息
            IMail mail = new Mail();
            NpgsqlDataReader dr = mail.GetWebMailProfile();
            if (dr.Read() & dr.HasRows)
            {
                WebMailProfile profile = new WebMailProfile();
                profile.UserName = dr["UserName"].ToString();
                profile.AliasName = dr["AliasName"].ToString();
                profile.Email = dr["Email"].ToString();
                profile.MailServerIP = dr["MailServerIP"].ToString();
                profile.MailServerPort = Int32.Parse(dr["MailServerPort"].ToString());
                ///保存邮件配置属性到应用程序上下文中
                HttpContext.Current.Application.Add("WebMailProfile", profile);
            }
            dr.Close();
            Session["Profile"] = "Profile";
        }
    }

    protected bool CreateUserDirectory(string strUserCode)
    {
        string strDirectory = Server.MapPath("./") + "\\MailAttachments\\" + strUserCode;

        if (!Directory.Exists(strDirectory))
        {
            Directory.CreateDirectory(strDirectory);
            DirectoryInfo NewDirInfo = new DirectoryInfo(strDirectory);
            NewDirInfo.Attributes = FileAttributes.Normal;

            return true;
        }
        else
        {
            return false;
        }
    }
}
