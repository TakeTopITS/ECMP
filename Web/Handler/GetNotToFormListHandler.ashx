<%@ WebHandler Language="C#" Class="GetNotToFormListHandler" %>

using System;
using System.Resources;
using System.Web;

using System.Data;
using Newtonsoft.Json;

public class GetNotToFormListHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        DataTable dt = GetNotToFormList(context.Request);
        string strJson = JsonConvert.SerializeObject(dt);

        context.Response.ContentType = "text/plain";
        context.Response.Write(strJson);
    }


    private DataTable GetNotToFormList(HttpRequest request)
    {
        DataTable dt = new DataTable();
        try
        {
            string strTemName = request.Form["strTemName"];
            string strNotToFormHQL = string.Format(@"select t.ID as TriggerID ,t.Name from T_TriggerTableToFrom t where t.MainTable in (
                            select m.TableName from T_TableTemplateMapping m where m.WFTemplateName = '{0}'
                            )
                            and t.Status = 0 order by CreateTime limit 10", strTemName);
            dt = ShareClass.GetDataSetFromSql(strNotToFormHQL, "NotToForm").Tables[0];
        }
        catch (Exception ex)
        {

        }
        return dt;
    }


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}