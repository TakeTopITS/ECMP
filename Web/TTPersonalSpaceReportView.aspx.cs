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
using Npgsql;//using System.Data.SqlClient;

using System.Text;
using System.IO;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTPersonalSpaceReportView : System.Web.UI.Page
{
    string strReportID, strReportName, strReportURL;
    string strLangCode, strUserCode;


    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString().Trim();
        strLangCode = Session["LangCode"].ToString().Trim();

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