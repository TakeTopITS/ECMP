using Npgsql;

using ProjectMgt.BLL;
using ProjectMgt.Model;

using System;
using System.Collections;
using System.Configuration;
using System.Data;

public interface IFolder
{
    /// <summary>
    /// 获取所有邮箱
    /// </summary>
    /// <returns></returns>
    NpgsqlDataReader GetFolders(string strOwnerCode);

    /// <summary>
    /// 获取单个邮箱
    /// </summary>
    /// <param name="nFolderID"></param>
    /// <returns></returns>
    NpgsqlDataReader GetSingleFolder(int nFolderID);

    /// <summary>
    /// 新建邮箱
    /// </summary>
    /// <param name="sName"></param>
    /// <returns></returns>
    int NewFolder(string sName, string strOwnerCode);

    /// <summary>
    /// 重命名邮箱
    /// </summary>
    /// <param name="nFolderID"></param>
    /// <param name="sName"></param>
    /// <returns></returns>
    int RenameFolder(int nFolderID, string sName);

    /// <summary>
    /// 删除邮箱
    /// </summary>
    /// <param name="nFolderID"></param>
    /// <returns></returns>
    int DeleteFolder(int nFolderID);

    int GetFolderID(string strKeyWord, string strUserCode);
}

/// <summary>
/// Folder 的摘要说明
/// </summary>
public class Folder : IFolder
{
    #region IFolder 成员

    public NpgsqlDataReader GetFolders(string strOwnerCode)
    {
        ///创建链接
        NpgsqlConnection myConnection = new NpgsqlConnection(
            ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString);

        ///定义SQL语句
        string cmdText = "SELECT * FROM T_MailFolder where OwnerCode is null or OwnerCode =  " + "'" + strOwnerCode + "'";
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

    public NpgsqlDataReader GetSingleFolder(int nFolderID)
    {
        ///创建链接
        NpgsqlConnection myConnection = new NpgsqlConnection(
            ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString);

        ///定义SQL语句
        string cmdText = "SELECT * FROM T_MailFolder WHERE FolderID='" + nFolderID.ToString() + "'";
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

    public int NewFolder(string sName, string strOwnerCode)
    {
        ///创建链接
        NpgsqlConnection myConnection = new NpgsqlConnection(
            ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString);

        ///定义SQL语句
        string cmdText = "INSERT INTO T_MailFolder (Name,Total,NoReader,Contain,Flag,CreateDate,OwnerCode)VALUES("
            + "'" + sName + "',"
            + "'0" + "',"
            + "'0" + "',"
            + "'0" + "',"
            + "'1" + "',"
            + "now()" + ","
            + "'" + strOwnerCode + "'"
            + ")";
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

    public int RenameFolder(int nFolderID, string sName)
    {
        ///创建链接
        NpgsqlConnection myConnection = new NpgsqlConnection(
            ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString);

        ///定义SQL语句
        string cmdText = "UPDATE T_MailFolder SET Name ="
            + "'" + sName + "'"
            + " WHERE FolderID='" + nFolderID.ToString() + "'";
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

    public int DeleteFolder(int nFolderID)
    {
        ///创建链接
        NpgsqlConnection myConnection = new NpgsqlConnection(
            ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString);

        ///定义SQL语句
        string cmdText = "Delete T_MailFolder "
            + " WHERE FolderID='" + nFolderID.ToString() + "'";
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

    public int GetFolderID(string strKeyWord, string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "FROM Folders as folders where folders.KeyWord = " + "'" + strKeyWord + "'" + " and folders.OwnerCode = " + "'" + strUserCode + "'";
        FoldersBLL foldersBLL = new FoldersBLL();

        lst = foldersBLL.GetAllFolderss(strHQL);
        Folders folders = (Folders)lst[0];

        return folders.FolderID;
    }

    #endregion IFolder 成员
}