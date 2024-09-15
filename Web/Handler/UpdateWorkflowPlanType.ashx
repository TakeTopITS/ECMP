<%@ WebHandler Language="C#" Class="UpdateWorkflowPlanType" %>

using System;
using System.Web;

public class UpdateWorkflowPlanType : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        context.Response.ContentType = "text/plain";

        string strHQL;
        
        string strWFID= context.Request.Form["WFID"];   //文本框内容(Get传参对应QueryString)
        string strIsMainPlan = context.Request.Form["IsMainPlan"];   //文本框内容(Get传参对应QueryString)
        /*-----这里可以写插入数据库方法------*/

        try
        {
            strHQL = "Update T_WorkFlow Set IsPlanMainWorkflow = '" + strIsMainPlan + "' Where WLID = " + strWFID;
            ShareClass.RunSqlCommand(strHQL);

             context.Response.Write("SUCESS");
        }
        catch
        {
             context.Response.Write("Fail");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}