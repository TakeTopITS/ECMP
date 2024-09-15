using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text;

using System.Security.Cryptography;
using System.Security.Permissions;
using System.Data.SqlClient;

using System.ComponentModel;
using System.Web.SessionState;
using System.Drawing.Imaging;
using System.Timers;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TakeTopWebServerNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strSystemName, strSrvAppName, strUserHostAddress;


        strSrvAppName = Server.UrlDecode(Request.QueryString["SrvAppName"]);
        strSystemName = Server.UrlDecode(Request.QueryString["SystemName"]);

        strUserHostAddress = ShareClass.GetIPinArea(getIp());

        if (Page.IsPostBack == false)
        {
            try
            {
                if (strSystemName != null)
                {
                    strHQL = "Select * From T_LogonLog Where UserName = " + "'" + strSystemName + "'" + " and Position = " + "'" + strUserHostAddress + "'";
                    strHQL += " and to_char(LoginTime,'yyyymmdd') =" + "'" + DateTime.Now.ToString("yyyyMMdd") + "'";
                    DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_LogonLog");
                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        ShareClass.InsertUserLogonLog("SystemName", strSystemName, "WEB");
                    }
                }
            }
            catch
            {
                return;
            }
        }
    }

    private  string getIp()
    {
        if (System.Web.HttpContext.Current.Request.ServerVariables["HTTP_VIA"] != null)
            return System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].Split(new char[] { ',' })[0];
        else
            return System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
    }

}