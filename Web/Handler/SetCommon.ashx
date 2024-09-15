<%@ WebHandler Language="C#" Class="SetCommon" %>

using System;
using System.Resources;
using System.Web;
using System.Collections;
using ProjectMgt.BLL;
using Newtonsoft.Json;
using System.Data;

using ProjectMgt.Model;
using ProjectMgt.DAL;

public class SetCommon : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        bool result = runRequest(context.Request);
        string jsonStr = JsonConvert.SerializeObject(result);

        context.Response.ContentType = "text/plain";
        context.Response.Write(jsonStr);
    }

    private bool runRequest(HttpRequest request)
    {
        try
        {
            string strValue = string.Empty;

            strValue = request.Form["sql"];


            if (strValue.ToLower().Contains("create ") || strValue.ToLower().Contains("execute ") || strValue.ToLower().Contains("drop ") || strValue.ToLower().Contains("alter ") || strValue.ToLower().Contains("delete "))
            {
                return false;
            }

            //ShareClass.RunSqlCommand(strValue);

            ////---保存用户操作日志到日志表-------
            //InsertUserOperateLog(strValue);

        }
        catch (Exception ex)
        {

        }
        return true;
    }

    //保存用户操作日志到日志表
    public static void InsertUserOperateLog(string strHQL)
    {
        string strSQL;
        string strUserCode, strUserName, strUserIP;


        try
        {

            if (HttpContext.Current.Session["UserCode"] != null & HttpContext.Current.Session["UserName"] != null)
            {
                strUserCode = HttpContext.Current.Session["UserCode"].ToString().Trim();
                strUserName = HttpContext.Current.Session["UserName"].ToString();
                strUserIP = HttpContext.Current.Request.UserHostAddress.Trim();

                strHQL = strHQL.Replace("'", "''");

                new System.Threading.Thread(delegate ()
                {
                    try
                    {
                        strSQL = "Insert into T_UserOperateLog(UserCode,UserName,UserIP,OperateContent,OperateTime) ";
                        strSQL += " Values(" + "'" + strUserCode + "'" + "," + "'" + strUserName + "'" + "," + "'" + strUserIP + "'" + "," + "'" + strHQL + "'" + ",now())";

                        ShareClass.RunSqlCommandForNOOperateLog(strSQL);
                    }
                    catch
                    {
                    }
                }).Start();
            }

        }
        catch
        {
        }
    }


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}