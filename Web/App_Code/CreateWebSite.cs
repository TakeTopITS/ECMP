using Microsoft.Web.Administration;

using Npgsql;

using System;
using System.Configuration;
using System.Data;
using System.DirectoryServices;
using System.Web;
using System.Xml;
/// <summary>
/// CreateWebSite 的摘要说明
/// </summary>
public static class IISHelper
{
    /// <summary>
    /// 创建一个站点
    /// </summary>
    /// <param name="name">站点名称</param>
    /// <param name="physicalPath">项目所在路径</param>
    /// <param name="bindingInformation">绑定信息</param>
    /// <param name="bindingProtocol">类型，默认http</param>
    /// <returns></returns>
    public static bool CreateWebSite(string name, string physicalPath, string bindingInformation = "*:80:", string bindingProtocol = "http")
    {
        try
        {
            ServerManager manager = new ServerManager();
            //判断应用程序池是否存在
            if (manager.ApplicationPools[name] != null)
            {
                manager.ApplicationPools.Remove(manager.ApplicationPools[name]);
            }

            //判断web应用程序是否存在
            if (manager.Sites[name] != null)
            {
                manager.Sites.Remove(manager.Sites[name]);
            }

            manager.Sites.Add(name, bindingProtocol, bindingInformation, physicalPath);

            //添加web应用程序池
            ApplicationPool pool = manager.ApplicationPools.Add(name);

            //设置web应用程序池的Framework版本
            pool.ManagedRuntimeVersion = "v4.0";

            //设置是否启用32位应用程序
            pool.SetAttributeValue("enable32BitAppOnWin64", true);

            //设置web网站的应用程序池
            manager.Sites[name].Applications[0].ApplicationPoolName = name;

            manager.CommitChanges();

            return true;
        }
        catch (Exception e)
        {
            return false;
        }
    }

    /// <summary>
    /// 创建一个站点
    /// </summary>
    /// <param name="name">站点名称</param>
    /// <param name="physicalPath">项目所在路径</param>
    /// <param name="port">端口号</param>
    /// <returns></returns>
    public static bool CreateWebSite(string name, string physicalPath, int port = 80)
    {
        try
        {
            ServerManager manager = new ServerManager();
            //判断应用程序池是否存在
            if (manager.ApplicationPools[name] != null)
            {
                manager.ApplicationPools.Remove(manager.ApplicationPools[name]);
            }

            //判断web应用程序是否存在
            if (manager.Sites[name] != null)
            {
                manager.Sites.Remove(manager.Sites[name]);
            }

            manager.Sites.Add(name, physicalPath, port);

            //添加web应用程序池
            ApplicationPool pool = manager.ApplicationPools.Add(name);

            //设置web应用程序池的Framework版本
            pool.ManagedRuntimeVersion = "v4.0";

            //设置是否启用32位应用程序
            pool.SetAttributeValue("enable32BitAppOnWin64", true);

            //设置web网站的应用程序池
            manager.Sites[name].Applications[0].ApplicationPoolName = name;

            manager.CommitChanges();

            return true;
        }
        catch (Exception e)
        {
            return false;
        }
    }

    /// <summary>
    /// 创建虚拟目录
    /// </summary>
    /// <param name="vDirName">虚拟目录名称</param>
    /// <param name="path">实际路径</param>
    /// <param name="iAuth">设置目录的安全性 0-不允许匿名访问，1-为允许，2-基本身份验证，3-允许匿名+基本身份验证，4-整合Windows验证，5-允许匿名+整合Windows验证</param>
    /// <param name="serverName">默认localhost</param>
    /// <returns></returns>
    public static bool CreateVirtualDirectory(string vDirName, string path, int iAuth = 1, string serverName = "localhost")
    {
        try
        {
            // 确定IIS版本   
            DirectoryEntry iisSchema = new DirectoryEntry("IIS://" + serverName + "/Schema/AppIsolated");
            bool iisUnderNt = iisSchema.Properties["Syntax"].Value.ToString().ToUpper() == "BOOLEAN";
            iisSchema.Dispose();

            // 获得管理权限
            DirectoryEntry iisAdmin = new DirectoryEntry("IIS://" + serverName + "/W3SVC/1/Root");

            // 如果虚拟目录已经存在则删除  
            foreach (DirectoryEntry v in iisAdmin.Children)
            {
                if (v.Name == vDirName)
                {
                    try
                    {
                        iisAdmin.Invoke("Delete", new object[] { v.SchemaClassName, vDirName });
                        iisAdmin.CommitChanges();
                    }
                    catch (Exception ex)
                    {
                        return false;
                    }
                }
            }

            // 创建一个虚拟目录
            DirectoryEntry vDir = iisAdmin.Children.Add(vDirName, "IIsWebVirtualDir");

            // 创建一个web应用
            vDir.Invoke("AppCreate", !iisUnderNt);

            //应用程序名称
            vDir.Properties["AppFriendlyName"][0] = vDirName;
            //设置读取权限
            vDir.Properties["AccessRead"][0] = true;
            //值 true 表示不论文件类型是什么，文件或文件夹的内容都可以执行
            vDir.Properties["AccessExecute"][0] = false;
            //值 true 表示允许用户将文件及其相关属性上载到服务器上已启用的目录中，或者更改可写文件的内容。
            //只有使用支持 HTTP 1.1 协议标准的 PUT 功能的浏览器，才能执行写入操作
            vDir.Properties["AccessWrite"][0] = false;
            //值 true 表示如果是脚本文件或静态内容，则可以执行文件或文件夹的内容。值 false 只允许提供静态文件，如 HTML 文件
            vDir.Properties["AccessScript"][0] = true;
            //设置为 true 时，浏览目录时系统会加载该目录的默认文档（由 De, faultDoc 属性指定）
            vDir.Properties["EnableDefaultDoc"][0] = true;
            //设置为 true 时，将启用目录浏览
            vDir.Properties["EnableDirBrowsing"][0] = false;
            //包含一个或多个默认文档的文件名，如果在客户端的请求中不包含文件名，将把默认文档的文件名返回给客户端
            vDir.Properties["DefaultDoc"][0] = "login.html,index.html,default.html,Default.aspx,index.aspx";
            //项目路径
            vDir.Properties["Path"][0] = path;
            //作为有效方案返回给客户端的 Windows 验证方案的设置
            vDir.Properties["AuthFlags"][0] = iAuth;

            // NT格式不支持这特性
            if (!iisUnderNt)
            {
                //页面是否允许当前目录的相对路径（使用 ..\ 表示法）
                vDir.Properties["AspEnableParentPaths"][0] = true;
            }

            // 设置改变
            vDir.CommitChanges();
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    /// <summary>
    /// 修改web.config文件appsettings配置节中的add里的value属性
    /// </summary>
    /// <remarks>
    /// 注意，调用该函数后，会使整个web application重启，导致当前所有的会话丢失 /// </remarks>
    /// <param name="key">要修改的键key</param>
    /// <param name="strvalue">修改后的value</param>
    /// <exception cref="">找不到相关的键</exception>
    /// <exception cref="">权限不够，无法保存到web.config文件中</exception>
    public static void Modify(string key, string strvalue)
    {
        string xpath = "/configuration/appSettings/add[@key=''Count'']";
        XmlDocument domwebconfig = new XmlDocument();

        domwebconfig.Load(HttpContext.Current.Server.MapPath("/web.config"));
        XmlNode addkey = domwebconfig.SelectSingleNode((xpath.Replace("Count", key)));
        if (addkey == null)
        {
            throw new ArgumentException("没有找到<add key=" + key + " value=.../>的配置节");
        }
        addkey.Attributes["value"].InnerText = strvalue;
        domwebconfig.Save(HttpContext.Current.Server.MapPath("/web.config"));
    }

    /// <summary>
    /// 还原数据库
    /// </summary>
    /// <param name="dataBaseName">数据库名称</param>
    /// <param name="path">还原的路径bak文件</param>
    /// <param name="UserId">用户名</param>
    /// <param name="PassWord">密码</param>
    /// <param name="DataSource">IP或者当前服务（.）</param>
    public static void Restoredb(string dataBaseName, string path, string userId, string passWord, string dataSource)
    {
        var strconn = "Data Source=" + dataSource + ";Initial Catalog=master;User ID=" + userId + ";pwd =" + passWord + "";
        DataTable DBNameTable = new DataTable();
        NpgsqlDataAdapter Adapter = new NpgsqlDataAdapter("select name from master..sysdatabases", strconn);
        lock (Adapter)
        {
            Adapter.Fill(DBNameTable);
        }
        foreach (DataRow row in DBNameTable.Rows)
        {
            if (row["name"].ToString() == dataBaseName)
            {
                //throw new KnownException("已存在对应的数据，请勿重复还原数据库！");
            }
        }
        //检测真正当前bak文件真正的log mdf的名字
        var strsql = " restore  filelistonly from disk = '" + path + "'";
        NpgsqlDataAdapter Adapter2 = new NpgsqlDataAdapter(strsql, strconn);
        var dt = new DataTable();
        lock (Adapter2)
        {
            Adapter2.Fill(dt);
        }
        var mdf = dt.Rows[0][0].ToString();
        var log = dt.Rows[1][0].ToString();
        string restore = string.Format(@"restore database {0} from disk = '{1}'
                                                with REPLACE
                                                , move '{2}' to 'D:\{3}.mdf'
                                                ,move '{4}' to 'D:\{5}.ldf'", dataBaseName, path, mdf, dataBaseName, log, dataBaseName);
        NpgsqlConnection conn = new NpgsqlConnection(strconn);
        NpgsqlCommand cmd1 = new NpgsqlCommand(restore, conn);
        conn.Open();//k
        cmd1.ExecuteNonQuery();
        conn.Close();//g
    }

    /// <summary>
    /// 删除数据库
    /// </summary>
    /// <param name="dataBaseName"></param>
    /// <param name="UserId"></param>
    /// <param name="PassWord"></param>
    /// <param name="DataSource"></param>
    /// <param name="code"></param>
    /// <returns></returns>
    public static void DeleteDataBase(string dataBaseName, string userId, string passWord, string dataSource)
    {

        var strconn = "Data Source=" + dataSource + ";Initial Catalog=master;User ID=" + userId + ";pwd =" + passWord + "";
        NpgsqlConnection conn = new NpgsqlConnection(strconn);//创建一个数据库连接对象
        conn.Open();
        var strsql = string.Format("drop database {0}", dataBaseName);
        NpgsqlCommand cmd = new NpgsqlCommand(strsql, conn);
        cmd.ExecuteNonQuery();
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            //throw new KnownException(ex.Message);
        }
        finally
        {
            conn.Close();//g
        }
    }

    //创建数据库用户
    public static void CreateSqlServerUserAccount(string usertobeadded, string password, string databasename)
    {
        //string usertobeadded = "admin";
        //string password = "ComplexPasswordExample123456";
        //string databasename = "MyDataBaseName";

        NpgsqlConnection connection = new NpgsqlConnection(
                  ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString);

        // Create the new Login account for connection to the SQL Database.
        string cmdText1 = "CREATE LOGIN " + usertobeadded + " WITH PASSWORD = '" +
        password + "';  USE " + databasename + "; CREATE USER " + usertobeadded + " FOR LOGIN " + usertobeadded + ";";

        // Add the user 'admin' to the exisiting role db_datareader.
        // Members of the db_datareader fixed database role can read all data from all user tables.
        string cmdText2 = "ALTER ROLE db_datareader ADD MEMBER " + usertobeadded + "";

        // Add the user 'admin' to the exisiting role db_datawriter.
        // Members of the db_datawriter fixed database role can add, delete, or change data in all user tables.
        string cmdText3 = "ALTER ROLE db_datawriter ADD MEMBER " + usertobeadded + "";

        // The connection is automatically closed at the end of the using block.
        try
        {
            connection.Open();

            NpgsqlCommand cmd = new NpgsqlCommand(cmdText1, connection);
            cmd.ExecuteNonQuery();
            //log.Info("NEW Login: [admin] & User Account: [admin] created Microsoft SQL Server");

            cmd = new NpgsqlCommand(cmdText2, connection);
            cmd.ExecuteNonQuery();
            //log.Info("User Account: [admin] added to the db_datareader Role on Microsoft SQL Server");

            cmd = new NpgsqlCommand(cmdText3, connection);
            cmd.ExecuteNonQuery();
            //log.Info("User Account: [admin] added to the db_datawriter Role on Microsoft SQL Server");
        }
        catch (Exception ex)
        {
            //log.Error("Error creating a new login and user account on Microsoft SQL Server: ", ex);
            //SystemEvents.DatabaseExceptions(ex);
        }
    }

    //执行存储过程
    public static void runDBProcedure()
    {
        NpgsqlConnection myConnection = new NpgsqlConnection(
                   ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString);

        NpgsqlCommand cmd = new NpgsqlCommand("sp_Add_contact", myConnection);
        cmd.CommandTimeout = 600;
        cmd.CommandType = CommandType.Text;

        cmd.Parameters.AddWithValue("@FirstName", SqlDbType.VarChar).Value = "";
        cmd.Parameters.AddWithValue("@LastName", SqlDbType.VarChar).Value = "";

        myConnection.Open();
        cmd.ExecuteNonQuery();

        myConnection.Close();
    }
}

