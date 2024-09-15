using Npgsql;

using ProjectMgt.BLL;
using ProjectMgt.Model;

using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Web;
public class WebMailProfile
{
    public string UserName;
    public string AliasName;
    public string Email;
    public string MailServerIP;
    public int MailServerPort;
}

public interface IMail
{
    /// <summary>
    /// 获取系统配置信息
    /// </summary>
    /// <returns></returns>
    NpgsqlDataReader GetWebMailProfile();

    /// <summary>
    /// 修改系统的配置信息
    /// </summary>
    /// <param name="sUserName"></param>
    /// <param name="sAliasName"></param>
    /// <param name="sEmail"></param>
    /// <param name="sMailServerIP"></param>
    /// <param name="nMailServerPort"></param>
    /// <returns></returns>
    int WebMailProfile(string sUserName, string sAliasName, string sEmail, string sMailServerIP,
        int nMailServerPort);

    /// <summary>
    /// 获取所有邮件
    /// </summary>
    /// <returns></returns>
    NpgsqlDataReader GetMails();

    /// <summary>
    /// 获取某个邮箱的邮件
    /// </summary>
    /// <param name="nFolderID"></param>
    /// <returns></returns>
    NpgsqlDataReader GetMailsByFloder(int nFolderID);

    /// <summary>
    /// 获取单个邮件的记录
    /// </summary>
    /// <param name="nMailID"></param>
    /// <returns></returns>
    NpgsqlDataReader GetSingleMail(int nMailID);

    /// <summary>
    /// 发送邮件
    /// </summary>
    /// <returns></returns>
    int SenderMail(MailMessage mail);

    /// <summary>
    /// 添加发送的邮件到邮件箱中
    /// </summary>
    /// <param name="sName"></param>
    /// <param name="sBody"></param>
    /// <param name="sFrom"></param>
    /// <param name="sTo"></param>
    /// <param name="sCC"></param>
    /// <param name="bHtmlFormat"></param>
    /// <param name="nContain"></param>
    /// <param name="bAttachmentFlag"></param>
    /// <returns></returns>
    int SaveAsMail(string sName, string sBody, string sFrom, string sTo,
        string sCC, int intHtmlFormat, int nContain, int nAttachmentFlag, int nReaderFlag, int nFolderID, string sUserCode);

    /// <summary>
    /// 添加邮件的附件
    /// </summary>
    /// <param name="sName"></param>
    /// <param name="sUrl"></param>
    /// <param name="sType"></param>
    /// <param name="nContain"></param>
    /// <param name="MailID"></param>
    /// <returns></returns>
    int SaveAsMailAttachment(string sName, string sUrl, string sType,
        int nContain, int nMailID);

    /// <summary>
    /// 移动邮件
    /// </summary>
    /// <param name="nMailID"></param>
    /// <param name="nFolderID"></param>
    /// <returns></returns>
    int MoveMail(int nMailID, int nFolderID);

    /// <summary>
    /// 删除邮件
    /// </summary>
    /// <param name="nMailID"></param>
    /// <returns></returns>
    int DeleteMail(int nMailID);

    /// <summary>
    /// 获取邮件的附件
    /// </summary>
    /// <param name="nMailID"></param>
    /// <returns></returns>
    NpgsqlDataReader GetAttachmentsByMail(int nMailID);
}

/// <summary>
/// Mail 的摘要说明
/// </summary>
public class Mail : IMail
{
    #region IMail 成员

    public NpgsqlDataReader GetWebMailProfile()
    {
        ///创建链接
        NpgsqlConnection myConnection = new NpgsqlConnection(
            ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString);

        ///定义SQL语句
        string cmdText = "SELECT * FROM T_MailProfile WHERE WebMailID = 1";
        ///创建Command
        NpgsqlCommand myCommand = new NpgsqlCommand(cmdText, myConnection);
        myCommand.CommandTimeout = 600;

        ///定义DataReader
        NpgsqlDataReader dr = null;
        try
        {
            ///打开链接
            myConnection.Open();
            ///读取数据
            dr = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (NpgsqlException ex)
        {
            ///抛出异常
            throw new Exception(ex.Message, ex);
        }

        //myConnection.Close();

        ///返回DataReader
        return dr;
    }

    public int WebMailProfile(string sUserName, string sAliasName, string sEmail, string sMailServerIP,
        int nMailServerPort)
    {
        ///创建链接
        NpgsqlConnection myConnection = new NpgsqlConnection(
            ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString);

        ///定义SQL语句
        string cmdText = "UPDATE T_MailProfile SET"
            + " UserName='" + sUserName + "',"
            + " AliasName='" + sAliasName + "',"
            + " Email='" + sEmail + "',"
            + " MailServerIP='" + sMailServerIP + "',"
            + " MailServerPort='" + nMailServerPort.ToString() + "'"
            + " WHERE WebMailID=1";
        ///创建Command
        NpgsqlCommand myCommand = new NpgsqlCommand(cmdText, myConnection);
        myCommand.CommandTimeout = 600;

        ///定义返回值
        int nResult = -1;

        try
        {
            ///打开链接
            myConnection.Open();
            ///执行SQL语句
            nResult = myCommand.ExecuteNonQuery();
        }
        catch (NpgsqlException ex)
        {
            ///抛出异常
            throw new Exception(ex.Message, ex);
        }
        finally
        {   ///关闭链接
			myConnection.Close();
        }
        ///返回nResult
        return nResult;
    }

    public NpgsqlDataReader GetMails()
    {
        ///创建链接
        NpgsqlConnection myConnection = new NpgsqlConnection(
            ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString);

        ///定义SQL语句
        string cmdText = "SELECT * FROM T_Mail order by MailID DESC";
        ///创建Command
        NpgsqlCommand myCommand = new NpgsqlCommand(cmdText, myConnection);
        myCommand.CommandTimeout = 600;

        ///定义DataReader
        NpgsqlDataReader dr = null;
        try
        {
            ///打开链接
            myConnection.Open();
            ///读取数据
            dr = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (NpgsqlException ex)
        {
            ///抛出异常
            throw new Exception(ex.Message, ex);
        }

        //myConnection.Close();

        ///返回DataReader
        return dr;
    }

    public NpgsqlDataReader GetMailsByFloder(int nFolderID)
    {
        ///创建链接
        NpgsqlConnection myConnection = new NpgsqlConnection(
            ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString);

        ///定义SQL语句
        string cmdText = "SELECT * FROM T_Mail WHERE FolderID= " + nFolderID.ToString() + " order by MailID DESC";
        ///创建Command
        NpgsqlCommand myCommand = new NpgsqlCommand(cmdText, myConnection);
        myCommand.CommandTimeout = 600;

        ///定义DataReader
        NpgsqlDataReader dr = null;
        try
        {
            ///打开链接
            myConnection.Open();
            ///读取数据
            dr = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (NpgsqlException ex)
        {
            ///抛出异常
            throw new Exception(ex.Message, ex);
        }

        //myConnection.Close();

        ///返回DataReader
        return dr;
    }

    public NpgsqlDataReader GetSingleMail(int nMailID)
    {
        ///创建链接
        NpgsqlConnection myConnection = new NpgsqlConnection(
            ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString);

        ///定义SQL语句
        string cmdText = "SELECT * FROM T_Mail WHERE MailID='" + nMailID.ToString() + "'";
        ///创建Command
        NpgsqlCommand myCommand = new NpgsqlCommand(cmdText, myConnection);
        myCommand.CommandTimeout = 600;

        ///定义DataReader
        NpgsqlDataReader dr = null;
        try
        {
            ///打开链接
            myConnection.Open();
            ///读取数据
            dr = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (NpgsqlException ex)
        {
            ///抛出异常
            throw new Exception(ex.Message, ex);
        }

        //myConnection.Close();

        ///返回DataReader
        return dr;
    }

    public int SenderMail(MailMessage mail)
    {
        ///定义发送邮件的Client
        SmtpClient client = new SmtpClient();
        ///设置邮件服务器主机的IP地址
        client.Host = ((WebMailProfile)HttpContext.Current.Application["WebMailProfile"]).MailServerIP;
        ///设置邮件服务器的端口
        client.Port = ((WebMailProfile)HttpContext.Current.Application["WebMailProfile"]).MailServerPort;
        ///配置发送邮件的属性
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.UseDefaultCredentials = false;
        ///发送邮件
        client.Send(mail);
        return (0);
    }

    public int SaveAsMail(string strTitle, string strBody, string strFrom, string strTo,
        string strCC, int intHtmlFormat, int intContain, int intAttachmentFlag, int intReaderFlag, int intFolderID, string strUserCode)
    {
        string strHQL, strKeyWords;
        IList lst;

        try
        {
            strHQL = " INSERT INTO 	T_Mail(Title,Body,FromAddress,ToAddress,CCAddress,HTMLFormat,SenderDate,Contain,AttachmentFlag,ReaderFlag,FolderID,UserCode)";
            strHQL += " VALUES(" + "'" + strTitle + "'" + "," + "'" + strBody + "'" + "," + "'" + strFrom + "'" + "," + "'" + strTo + "'" + "," + "'" + strCC + "'" + ",";
            strHQL += intHtmlFormat.ToString() + "," + "now()" + "," + intContain.ToString() + "," + intAttachmentFlag.ToString() + "," + intReaderFlag.ToString() + "," + intFolderID.ToString() + "," + "'" + strUserCode + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "UPDATE T_MailFolder SET Total = Total + 1 WHERE FolderId = " + intFolderID.ToString() + " and OwnerCode = " + "'" + strUserCode + "'";
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "FROM Folders as folders where folders.FolderID = " + intFolderID.ToString();
            FoldersBLL foldersBLL = new FoldersBLL();
            lst = foldersBLL.GetAllFolderss(strHQL);
            Folders folders = (Folders)lst[0];
            strKeyWords = folders.KeyWord.ToString().Trim();

            if (strKeyWords == "New")
            {
                strHQL = "UPDATE T_MailFolder SET NOReader = NOReader + 1 WHERE FolderId = " + intFolderID.ToString() + " and OwnerCode = " + "'" + strUserCode + "'";
                ShareClass.RunSqlCommand(strHQL);
            }

            strHQL = "UPDATE T_MailFolder SET Contain = Contain + " + intContain.ToString() + " Where FolderId = " + intFolderID.ToString() + " and OwnerCode = " + "'" + strUserCode + "'";
            ShareClass.RunSqlCommand(strHQL);

            return GetUserMailID(strUserCode);
        }
        catch
        {
            return -1;
        }
    }

    public int SaveAsMailAttachment(string strName, string strUrl, string strType,
        int intContain, int intMailID)
    {
        string cmdText = "INSERT INTO T_MailAttachment (Name,Url,Type,Contain,MailID)VALUES("
            + "'" + strName + "',"
            + "'" + strUrl + "',"
            + "'" + strType + "',"
            + "'" + intContain.ToString() + "',"
            + "'" + intMailID.ToString() + "'"
            + ")";
        ShareClass.RunSqlCommand(cmdText);

        return 1;
    }

    public int MoveMail(int intMailID, int intFolderID)
    {
        string strHQL, strOldForderID, strContain;
        IList lst;

        strHQL = "FROM Mails as mails where mails.MailID = " + intMailID.ToString();
        MailsBLL mailsBLL = new MailsBLL();
        lst = mailsBLL.GetAllMailss(strHQL);
        Mails mails = (Mails)lst[0];

        strOldForderID = mails.FolderID.ToString();
        strContain = mails.Contain.ToString();
        mails.FolderID = intFolderID;

        try
        {
            mailsBLL.UpdateMails(mails, intMailID);

            strHQL = "UPDATE T_MailFolder SET Total = Total + 1 WHERE FolderID = " + intFolderID.ToString();
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "UPDATE T_MailFolder SET Contain = Contain + " + strContain + "  WHERE FolderID = " + intFolderID.ToString();
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "UPDATE T_MailFolder SET Total = Total - 1 WHERE FolderID = " + strOldForderID;
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "UPDATE T_MailFolder SET Contain = Contain - " + strContain + " WHERE FolderID = " + strOldForderID;
            ShareClass.RunSqlCommand(strHQL);
        }
        catch
        {
        }

        return 1;
    }

    public int DeleteMail(int intMailID)
    {
        string strHQL, strForderID;
        IList lst;

        strHQL = "FROM Mails as mails where mails.MailID = " + intMailID.ToString();
        MailsBLL mailsBLL = new MailsBLL();
        lst = mailsBLL.GetAllMailss(strHQL);
        Mails mails = (Mails)lst[0];

        strForderID = mails.FolderID.ToString();

        try
        {
            strHQL = "DELETE T_MailAttachment WHERE MailID = " + intMailID.ToString();
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "DELETE T_Mail WHERE MailID = " + intMailID.ToString();
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "UPDATE T_MailFolder  SET Total = Total - 1 WHERE 	FolderID = " + strForderID;
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "UPDATE T_MailFolder SET NoReader = NoReader - 1 WHERE FolderID = " + strForderID;
            ShareClass.RunSqlCommand(strHQL);
        }
        catch
        {
        }

        return 1;
    }

    public NpgsqlDataReader GetAttachmentsByMail(int nMailID)
    {
        ///创建链接
        NpgsqlConnection myConnection = new NpgsqlConnection(
            ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString);

        ///定义SQL语句
        string cmdText = "SELECT * FROM T_MailAttachment WHERE MailID='" + nMailID.ToString() + "'";
        ///创建Command
        NpgsqlCommand myCommand = new NpgsqlCommand(cmdText, myConnection);
        myCommand.CommandTimeout = 600;

        ///定义DataReader
        NpgsqlDataReader dr = null;
        try
        {
            ///打开链接
            myConnection.Open();
            ///读取数据
            dr = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (NpgsqlException ex)
        {
            ///抛出异常
            throw new Exception(ex.Message, ex);
        }

        //myConnection.Close();

        ///返回DataReader
        return dr;
    }

    public int GetUserMailID(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from Mails as mails where mails.UserCode = " + "'" + strUserCode + "'" + " Order by mails.MailID DESC";
        MailsBLL mailsBLL = new MailsBLL();
        lst = mailsBLL.GetAllMailss(strHQL);

        Mails mails = (Mails)lst[0];

        return mails.MailID;
    }

    #endregion IMail 成员
}