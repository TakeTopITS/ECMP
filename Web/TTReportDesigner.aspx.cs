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

public partial class TTReportDesigner : System.Web.UI.Page
{
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strTemID, strTemDefinition, strReportID;
        string strConnectString, strNewConnectString;
        string[] strConnectStringList;

        //给报表模块授权
        Stimulsoft.Base.StiLicense.Key = "6vJhGtLLLz2GNviWmUTrhSqnOItdDwjBylQzQcAOiHntbUcpXQsvOvXJbL2FYMXQuk8goiv6tGtSldt6ZFKYhxCZSj" +
            "sWwGLvvb0iwDKCXcHsTD53uY+t50Z/yiIuO0Y9B/0vojjs/Rdna8Yzz0AvsmraLTH1VDo6/UYokXFOzG4R5pBUcjgZ" +
            "ehBq31U2kGtd69xUhTYc2aKs2UKIwLsSNFmeJ8NneBvDcLQNbaCbsRJ0eMRmracyPBjgLoKVl1YzHoVsgUz2o3Q1Wa" +
            "LhnLZitMshMCBpQYJSQiXnPDPTpB1iLhnjnQZBNTp+XtrSwAb6Mn21bByb0dpvfT2xZmZqgrDeWVvEhROqid9GsULT" +
            "KOr5TBEQ+pGERIXPy0iIk/LOEtvS8/hCR4WFK7XOAbXqHlCrpqBrZg65VmEBJw7qqcd4DoIAQoQxuiEO7OSbkcGK25" +
            "O5aheAq7Y4hHJE/1qeE+1w2nvjXw10ZaMNBpUF0wfIlBFiECSXrMTdNcHjzFc/9senGb4xBGErVoE4rchMWgYhEQQJ" +
            "cBhU5hABuRq1QlM=";

        strLangCode = Session["LangCode"].ToString();

        strTemID = Request.QueryString["TemID"];
        strTemDefinition = GetReportTemDefiniton(strTemID);
        strReportID = Request.QueryString["ReportID"];
    
        if (Page.IsPostBack == false)
        {
            StiReport report = new StiReport();
            if (strLangCode == "zh-CN")
            {
                StiMobileDesigner1.Localization = String.Format("Localization/{0}.xml", "zh-CHS");
            }
            else if (strLangCode == "zh-tw")
            {
                StiMobileDesigner1.Localization = String.Format("Localization/{0}.xml", "zh-CHT");
            }
            else
            {
                StiMobileDesigner1.Localization = String.Format("Localization/{0}.xml", "en");
            }
            StiMobileDesigner1.Report = report;

            try
            {
                //////---------------------------------------------------个性化数据库只读用户 BEGIN-------------------------------------------
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

                //建新数据库连接串
                strNewConnectString = strConnectStringList[0] + ";" + strConnectStringList[1] + ";User Id=" + strDBUserID + ";Password=" + strPassword + ";Database=" + strDatabase + ";Pooling=true;Minimum Pool Size=100;Maximum Pool Size=1024;Timeout=1000;";
                //////---------------------------------------------------个性化数据库只读用户 END-------------------------------------------

                StiReport stiReport = new StiReport();
                if (strTemDefinition != "")
                {
                    stiReport.LoadFromString(strTemDefinition);
                }

                //---------------------------------------------------个性化数据库只读用户 BEGIN-------------------------------------------
                ////删除所有的此模板的数据库连接串
                stiReport.Dictionary.Databases.Clear();

                //建立此模板的数据库连接串
                stiReport.Dictionary.Databases.Add(new StiPostgreSQLDatabase("TAKETOPDBConnect", strNewConnectString));

                //////---------------------------------------------------个性化数据库只读用户 END-------------------------------------------

                StiMobileDesigner1.Report = stiReport;
            }
            catch (Exception err)
            {
                LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);
            }
        }
    }

    protected void StiMobileDesigner1_CreateReport(object sender, StiReportDataEventArgs e)
    {
        string strTemID, strTemName;

        strTemID = Request.QueryString["TemID"];
        strTemName = GetReportTemName(strTemID);

        this.Title = "分析模型：" + strTemID + " " + strTemName + " 定义";
    }

    protected void StiMobileDesigner1_SaveReport(object sender, StiSaveReportEventArgs e)
    {
        string strHQL;
        string strTemID, strTemType, strTemName, strTemDefinition, strReportDefinition, strReportURL;
        string strDocSavePath, strReportFileName, strTime, strReportName, strIdentityReportName;
        string strUserCode = Session["UserCode"].ToString();
        string strUserName = ShareClass.GetUserName(strUserCode);

        try
        {
            StiReport report = e.Report;

            strTemID = Request.QueryString["TemID"];
            strTemType = GetReportTemType(strTemID);
            strTemDefinition = report.SaveToString();
            strReportDefinition = report.SaveDocumentToByteArray().ToString();
            strTemName = GetReportTemName(strTemID);

            //-------------保存为mrt格式
            strTime = DateTime.Now.ToString("yyyyMMddHHMMssff");
            strReportName = strTemName + strTime;
            strIdentityReportName = strTemName + strTime + ".mrt";
            strReportURL = "Doc\\Report\\" + strIdentityReportName;
            strDocSavePath = Server.MapPath("Doc") + "\\Report\\";
            strReportFileName = strDocSavePath + strIdentityReportName;

            report.Render(false);
            report.Save(strReportFileName);

            strTemDefinition = strTemDefinition.Replace("'", "''");


            strHQL = "Update T_ReportTemplate Set TemDefinition = " + "'" + strTemDefinition + "'" + " Where ID = " + strTemID;
            ShareClass.RunSqlCommand(strHQL);

            strHQL = "Insert Into T_Report(ReportType,TemName,ReportName,ReportURL,CreatorCode,CreatorName) Values (" + "'" + strTemType + "'" + "," + "'" + strTemName + "'" + "," + "'" + strReportName + "'" + "," + "'" + strReportURL + "'" + "," + "'" + strUserCode + "'" + "," + "'" + strUserName + "'" + ")";
            ShareClass.RunSqlCommand(strHQL);


            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZBCCG + "');</script>");
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile("Error page: " + Request.Url.ToString() + "\n" + err.Message.ToString() + "\n" + err.StackTrace);

            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZBCSBJC + "');</script>");
        }
    }

    protected void StiMobileDesigner1_GetDataSetOnLoad(object sender, StiReportDataEventArgs e)
    {
        //DataSet data = new DataSet();
        //data.ReadXmlSchema(Server.MapPath(@"Data\Demo.xsd"));
        //data.ReadXml(Server.MapPath(@"Data\Demo.xml"));

        //e.Report.RegData(data);
        //e.Report.Dictionary.Synchronize();
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


    protected string GetReportTemDefiniton(string strTemID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ReportTemplate as reportTemplate Where reportTemplate.ID = " + strTemID;
        ReportTemplateBLL reportTemplateBLL = new ReportTemplateBLL();
        lst = reportTemplateBLL.GetAllReportTemplates(strHQL);

        ReportTemplate reportTemplate = (ReportTemplate)lst[0];

        return reportTemplate.TemDefinition.Trim();
    }

    protected string GetReportTemName(string strTemID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ReportTemplate as reportTemplate Where reportTemplate.ID = " + strTemID;
        ReportTemplateBLL reportTemplateBLL = new ReportTemplateBLL();
        lst = reportTemplateBLL.GetAllReportTemplates(strHQL);

        ReportTemplate reportTemplate = (ReportTemplate)lst[0];

        return reportTemplate.TemName.Trim();
    }

    protected string GetReportTemType(string strTemID)
    {
        string strHQL;
        IList lst;

        strHQL = "From ReportTemplate as reportTemplate Where reportTemplate.ID = " + strTemID;
        ReportTemplateBLL reportTemplateBLL = new ReportTemplateBLL();
        lst = reportTemplateBLL.GetAllReportTemplates(strHQL);

        ReportTemplate reportTemplate = (ReportTemplate)lst[0];

        return reportTemplate.ReportType.Trim();
    }

}
