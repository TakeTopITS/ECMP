using System;
using System.Configuration;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// ConfigurationOperator 的摘要说明
/// </summary>
public class ConfigurationOperator : IDisposable
{
    private Configuration config;

    public ConfigurationOperator() : this(HttpContext.Current.Request.ApplicationPath)
    {
    }

    public ConfigurationOperator(string path)
    {
        config = WebConfigurationManager.OpenWebConfiguration(path);
    }

    public void setWebConfigPath(string path)
    {
        config = WebConfigurationManager.OpenWebConfiguration(path);
    }

    /// <summary>
    /// 设置应用程序配置节点，如果已经存在此节点，则会修改该节点的值，否则添加此节点
    /// </summary>
    /// <param name="key">节点名称</param>
    /// <param name="value">节点值</param>
    public void SetAppSetting(string key, string value)
    {
        AppSettingsSection appSetting = (AppSettingsSection)config.GetSection("appSettings");
        if (appSetting.Settings[key] == null)//如果不存在此节点，则添加
        {
            appSetting.Settings.Add(key, value);
        }
        else//如果存在此节点，则修改
        {
            appSetting.Settings[key].Value = value;
        }
    }

    /// <summary>
    /// 设置数据库连接字符串节点，如果不存在此节点，则会添加此节点及对应的值，存在则修改
    /// </summary>
    /// <param name="key">节点名称</param>
    /// <param name="value">节点值</param>
    public void SetConnectionString(string key, string connectionString)
    {
        ConnectionStringsSection connectionSetting = (ConnectionStringsSection)config.GetSection("connectionStrings");
        if (connectionSetting.ConnectionStrings[key] == null)//如果不存在此节点，则添加
        {
            ConnectionStringSettings connectionStringSettings = new ConnectionStringSettings(key, connectionString);
            connectionSetting.ConnectionStrings.Add(connectionStringSettings);
        }
        else//如果存在此节点，则修改
        {
            connectionSetting.ConnectionStrings[key].ConnectionString = connectionString;
        }
    }

    /// <summary>
    /// 保存所作的修改
    /// </summary>
    public void Save()
    {
        config.Save();
        config = null;
    }

    public void Dispose()
    {
        if (config != null)
        {
            config.Save();
        }
    }
}