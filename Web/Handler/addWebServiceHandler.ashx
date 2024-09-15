<%@ WebHandler Language="C#" Class="addWebServiceHandler" %>

using System; using System.Resources;
using System.Web;

using System.Web.SessionState;

using ProjectMgt.Model;
using ProjectMgt.BLL;

public class addWebServiceHandler : IHttpHandler, IReadOnlySessionState
{

    public void ProcessRequest(HttpContext context)
    {
        string result = string.Empty;
        try
        {
            string strWebServiceName = context.Request.Form["strWebServiceName"];
            string strWebServiceURL = context.Request.Form["strWebServiceURL"];
            string strMethodName = context.Request.Form["strMethodName"];
            string strArgArray = context.Request.Form["strArgArray"];
            string strComment = context.Request.Form["strComment"];
            string strID = context.Request.Form["intID"];
            int ID = 0;
            int.TryParse(strID, out ID);
            string strCreatorCode = context.Session["UserCode"] == null ? "" : context.Session["UserCode"].ToString().Trim();
            string strCreatorName = context.Session["UserName"] == null ? "" : context.Session["UserName"].ToString();

            WebService webService = new WebService();
            webService.WebServiceName = strWebServiceName;
            webService.WebServiceURI = strWebServiceURL;
            webService.MethodName = strMethodName;
            webService.ArgArray = strArgArray;
            webService.Comment = strComment;
            webService.CreatorCode = strCreatorCode;
            webService.CreatorName = strCreatorName;
            webService.CreateTime = DateTime.Now;

            WebServiceBLL webServiceBLL = new WebServiceBLL();
            if (ID == 0)
            {
                webServiceBLL.AddWebService(webService);
            }
            else {
                webServiceBLL.UpdateWebService(webService, ID);
            }
            result = "保存成功！";
        }
        catch (Exception ex)
        {
            result = "保存失败，请检查！" + ex.Message.ToString();
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write(result);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}