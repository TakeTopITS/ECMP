<%@ WebHandler Language="C#" Class="CheckUserCodeAndPasswordIsRight" %>

using System;
using System.Collections;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Drawing;
using System.IO;
using System.Net;
using System.Text;

public class CheckUserCodeAndPasswordIsRight : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        string strUserCode = context.Request["UserCode"];
        string strPassword = context.Request["Password"];

        bool blRight = CheckUserInforIsRight(strUserCode, strPassword);

        context.Response.Write(blRight.ToString());
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    //检查用户是否存在
    public bool CheckUserInforIsRight(string strUserCode, string strPassword)
    {
        string strHQL;

        strPassword = EncryptPassword(strPassword, "MD5");
        strHQL = "Select * from T_ProjectMember where UserCode = " + "'" + strUserCode + "'" + " and Password = " + "'" + strPassword + "'" + " and " + " rtrim(ltrim(Status)) not in ( '终止','离职')";
        strHQL += " And UserCode in (Select UserCode From T_SystemActiveUser Where WebUser = 'YES')";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectMember");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }


    protected string EncryptPassword(string strPassword, string strFormat)
    {
        string strNewPassword;

        if (strFormat == "SHA1")
        {
            strNewPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(strPassword, "SHA1");
        }
        else
        {
            strNewPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(strPassword, "MD5");
        }

        return strNewPassword;
    }


}