using System;
using System.Resources;
using System.Collections.Generic;
using System.Configuration;
using System.Data;

using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stimulsoft.Report;
using Stimulsoft.Report.Web;
using Stimulsoft.Report.Dictionary;
using System.Data.SqlClient;

using System.Text;
using System.IO;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

using Stimulsoft.Base;

public partial class TTReportView : System.Web.UI.Page
{
    string strReportID, strReportName, strReportURL;
    string strLangCode, strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString().Trim();
        strLangCode = Session["LangCode"].ToString().Trim();

        //给报表模块授权
        Stimulsoft.Base.StiLicense.Key = "6vJhGtLLLz2GNviWmUTrhSqnOItdDwjBylQzQcAOiHntbUcpXQsvOvXJbL2FYMXQuk8goiv6tGtSldt6ZFKYhxCZSj" +
            "sWwGLvvb0iwDKCXcHsTD53uY+t50Z/yiIuO0Y9B/0vojjs/Rdna8Yzz0AvsmraLTH1VDo6/UYokXFOzG4R5pBUcjgZ" +
            "ehBq31U2kGtd69xUhTYc2aKs2UKIwLsSNFmeJ8NneBvDcLQNbaCbsRJ0eMRmracyPBjgLoKVl1YzHoVsgUz2o3Q1Wa" +
            "LhnLZitMshMCBpQYJSQiXnPDPTpB1iLhnjnQZBNTp+XtrSwAb6Mn21bByb0dpvfT2xZmZqgrDeWVvEhROqid9GsULT" +
            "KOr5TBEQ+pGERIXPy0iIk/LOEtvS8/hCR4WFK7XOAbXqHlCrpqBrZg65VmEBJw7qqcd4DoIAQoQxuiEO7OSbkcGK25" +
            "O5aheAq7Y4hHJE/1qeE+1w2nvjXw10ZaMNBpUF0wfIlBFiECSXrMTdNcHjzFc/9senGb4xBGErVoE4rchMWgYhEQQJ" +
            "cBhU5hABuRq1QlM=";

       
        try
        {
            //////---------------------------------------------------个性化数据库只读用户 BEGIN-------------------------------------------
            string strConnectString;
            string[] strConnectStringList;
            strConnectString = ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString;
            strConnectStringList = strConnectString.Split(";".ToCharArray());

            string strDBUserID = GetDatabaseReadOnlyUserID().ToLower();
            if (strDBUserID == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "111", "<script>alert('" + Resources.lang.ZZTSSJBBYDSJKYHIDWK + "');</script>");
                Response.Write(Resources.lang.ZZTSSJBBYDSJKYHIDWK);
                return;
            }

            string strPassword = GetDatabaseReadOnlyUsePassword();
            string strDatabase = strConnectStringList[4].Replace("Database=", "");

            //创建数据库用户
            ShareClass.CreateDBUserAccount(strDBUserID, strPassword, "NO");

            //授予用户数据库权限
            ShareClass.AuthorizationDBToUser(strDBUserID, strPassword, strDatabase, "NO");
        }
        catch
        {
        }

        if (strLangCode == "zh-CN")
        {
            StiWebViewer1.Localization = String.Format("Localization/{0}.xml", "zh-CHS");
        }
        else if (strLangCode == "zh-tw")
        {
            StiWebViewer1.Localization = String.Format("Localization/{0}.xml", "zh-CHT");
        }
        else
        {
            StiWebViewer1.Localization = String.Format("Localization/{0}.xml", "en");
        }
    }

    protected void StiWebViewer1_GetReport(object sender, StiReportDataEventArgs e)
    {
        string strHQL;

        strReportID = Request.QueryString["ReportID"];
        strReportName = Request.QueryString["ReportName"];

        if (strReportID != null)
        {
            strHQL = "Select ReportURL From T_Report Where ID = " + strReportID;
        }
        else
        {
            strHQL = "Select ReportURL From T_Report Where ReportName  = '" + strReportName + "'";
        }
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Reoprt");
        strReportURL = ds.Tables[0].Rows[0][0].ToString().Trim();

        StiReport report = new StiReport();
        report = StiReport.CreateNewReport();
        var path = Server.MapPath(strReportURL);
        report.Load(path);

        //////---------------------------------------------------个性化数据库只读用户 BEGIN------------------------------------------ -
        ////删除所有的此模板的数据库连接串
        report.Dictionary.Databases.Clear();

        for (int i = 0; i < report.Dictionary.Databases.Count; i++)
        {
            if (report.Dictionary.Databases[i].Name == "TAKETOPDBConnect")
            {
                //删除此模板的数据库连接串
                report.Dictionary.Databases.RemoveAt(i);

                //重新建立此模板的数据库连接串
                report.Dictionary.Databases.Insert(i, new StiPostgreSQLDatabase("TAKETOPDBConnect", GetReportDBConnectString()));
            }
        }
        if (report.Dictionary.Databases.Count == 0)
        {
            //重新建立此模板的数据库连接串
            report.Dictionary.Databases.Add(new StiPostgreSQLDatabase("TAKETOPDBConnect", GetReportDBConnectString()));
        }
        //////---------------------------------------------------个性化数据库只读用户 END-------------------------------------------

        StiWebViewer1.Report = report;
    }

    //取得数据库连接串
    public string GetReportDBConnectString()
    {
        string strConnectString, strNewConnectString;
        string[] strConnectStringList;

        strLangCode = Session["LangCode"].ToString();

        try
        {
            strConnectString = ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString;
            strConnectStringList = strConnectString.Split(";".ToCharArray());

            string strDBUserID = GetDatabaseReadOnlyUserID().ToLower();
            if (strDBUserID == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "111", "<script>alert('" + Resources.lang.ZZTSSJBBYDSJKYHIDWK + "');</script>");
                Response.Write(Resources.lang.ZZTSSJBBYDSJKYHIDWK);
                return "";
            }

            string strPassword = GetDatabaseReadOnlyUsePassword();
            string strDatabase = strConnectStringList[4].Replace("Database=", "");

            //创建数据库用户
            ShareClass.CreateDBUserAccount(strDBUserID, strPassword, "NO");

            //建新数据库连接串
            strNewConnectString = strConnectStringList[0] + ";" + strConnectStringList[1] + ";User Id=" + strDBUserID + ";Password=" + strPassword + ";Database=" + strDatabase + ";Pooling=true;Minimum Pool Size=100;Maximum Pool Size=1024;Timeout=1000;";

            return strNewConnectString;
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + err.Message.ToString() + "\n" + err.StackTrace);

            return "";
        }
    }

    protected string GetDatabaseReadOnlyUserID()
    {
        string strHQL;

        strHQL = "Select DBUserID From T_DBReadOnlyUserInfor";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DBReadOnlyUserInfor");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "";
        }
    }

    protected string GetDatabaseReadOnlyUsePassword()
    {
        string strHQL;

        strHQL = "Select Password From T_DBReadOnlyUserInfor";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DBReadOnlyUserInfor");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "";
        }
    }
}