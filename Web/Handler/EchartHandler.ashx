<%@ WebHandler Language="C#" Class="EchartHandler" %>

using System;
using System.Web;
using Newtonsoft.Json;

using System.Data.SqlClient;
using System.Data;
using System.Text;

using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Web.SessionState;


public class EchartHandler : IHttpHandler, IRequiresSessionState
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
        string strHQL, sql;

        string strUserCode = HttpContext.Current.Session["UserCode"].ToString().Trim();
        string strLangCode = HttpContext.Current.Session["LangCode"].ToString();
        string strDepartString = HttpContext.Current.Session["DepartString"].ToString();

        string strFormType = context.Request["FormType"];
        string strChartName = context.Request["ChartName"];


        try
        {
            string strSqlCode = context.Request["SqlCode"].Trim();

            sql = ShareClass.UnEscape(strSqlCode);
            sql = sql.Replace("[TAKETOPUSERCODE]", strUserCode).Replace("[TAKETOPDEPARTSTRING]", strDepartString).Replace("[TAKETOPLANGCODE]", strLangCode);

            //LogClass.WriteLogFile(sql);

            DataSet ds = ShareClass.GetDataSetFromSql(sql, "T_Project");

            //LogClass.WriteLogFile(ds.Tables[0].Rows.Count.ToString());

            if (ds.Tables[0].Rows.Count > 0)
            {
                lists = new List<object>();
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (strFormType == "Column1" || strFormType == "Bar1")
                    {
                        var obj1 = new { XName = dr["XName"], YNumber = dr["YNumber"] };
                        lists.Add(obj1);
                    }
                    else if (strFormType == "Column2" || strFormType == "Bar2")
                    {
                        var obj2 = new { XName = dr["XName"], YNumber = dr["YNumber"], ZNumber = dr["ZNumber"] };
                        lists.Add(obj2);
                    }
                    else if (strFormType == "Column3" || strFormType == "Bar3")
                    {
                        var obj3 = new { XName = dr["XName"], YNumber = dr["YNumber"], ZNumber = dr["ZNumber"], HNumber = dr["HNumber"] };
                        lists.Add(obj3);
                    }
                    else if (strFormType == "Column4" || strFormType == "Bar4")
                    {
                        var obj4 = new { XName = dr["XName"], YNumber = dr["YNumber"], ZNumber = dr["ZNumber"], HNumber = dr["HNumber"], KNumber = dr["KNumber"] };
                        lists.Add(obj4);
                    }
                    else
                    {
                        var obj = new { XName = dr["XName"], YNumber = dr["YNumber"] };
                        lists.Add(obj);
                    }
                }

                jsS = new JavaScriptSerializer();
                result = jsS.Serialize(lists);

                context.Response.Write(result);
                return;
            }
            else
            {
                context.Response.Write("");
            }
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile(err.Message.ToString());
        }

        try
        {
            if (strFormType == "Management")
            {
                strHQL = "Select * From T_SystemAnalystChartManagement Where ChartName = '" + strChartName + "'";
            }
            else
            {
                strHQL = "Select A.ChartName,(Select SqlCode From T_SystemAnalystChartManagement Where ChartName = A.ChartName ) as SqlCode,(Select ChartType From T_SystemAnalystChartManagement Where ChartName = A.ChartName ) as ChartType  From T_SystemAnalystChartRelatedUser A ";
                strHQL += " Where A.UserCode = '" + strUserCode + "' and A.FormType = '" + strFormType + "' and A.ChartName = '" + strChartName + "'";
                strHQL += " Order By A.SortNumber ASC";
            }
            DataSet dsSqlCode = ShareClass.GetDataSetFromSql(strHQL, "T_SystemAnalystChartRelatedUser");
            if (dsSqlCode.Tables[0].Rows.Count > 0)
            {
                sql = dsSqlCode.Tables[0].Rows[0]["SqlCode"].ToString();
                sql = sql.Replace("[TAKETOPUSERCODE]", strUserCode).Replace("[TAKETOPDEPARTSTRING]", strDepartString).Replace("[TAKETOPLANGCODE]", strLangCode);

                DataSet ds = ShareClass.GetDataSetFromSql(sql, "T_Project");
                lists = new List<object>();
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    var obj = new { XName = dr["XName"], YNumber = dr["YNumber"] };
                    lists.Add(obj);
                }

                jsS = new JavaScriptSerializer();
                result = jsS.Serialize(lists);

                context.Response.Write(result);
            }
            else
            {
                context.Response.Write("");
            }
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
