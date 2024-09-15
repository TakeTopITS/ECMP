<%@ WebHandler Language="C#" Class="getMyProjectLongitudeLatitude" %>

using System;
using System.Web;
using Newtonsoft.Json;

using System.Data.SqlClient;
using System.Data;
using System.Text;

using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Web.SessionState;

public class getMyProjectLongitudeLatitude : IHttpHandler, IRequiresSessionState
{

    JavaScriptSerializer jsS = new JavaScriptSerializer();
    List<object> lists = new List<object>();
    //Series seriesObj = new Series();
    string result = "";

    public void ProcessRequest(HttpContext context)
    {
        ////获取一同发送过来的参数
        //string command = context.Request["cmd"];

        context.Response.ContentType = "text/plain";

        //用来传回去的内容
        //context.Response.Write("Hello World");

        Get_Data01(context);
    }

    public void Get_Data01(HttpContext context)
    {
        string strHQL;

        //string strUserCode = HttpContext.Current.Session["UserCode"].ToString().Trim();
        //string strLangCode = HttpContext.Current.Session["LangCode"].ToString();
        //string strDepartString = HttpContext.Current.Session["DepartString"].ToString();

        string strUserCode = HttpContext.Current.Session["UserCode"].ToString();


        try
        {
            //从数据库里取项目的经结度数据，并传回前台
            string jsonStr;

            strHQL = "Select ProjectID,ProjectName,coalesce(Longitude,'0') as Longitude,coalesce(Latitude,'0') as Latitude From T_Project Where PMCode = '" + strUserCode + "' and (coalesce(Longitude,'0') <> '0' and  coalesce(Latitude,'0') <> '0') ";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Project");

            jsonStr = JsonConvert.SerializeObject(ds.Tables[0]);

            HttpContext.Current.Response.ContentType = "text/plain";
            HttpContext.Current.Response.Write(jsonStr);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile(err.Message.ToString());
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
