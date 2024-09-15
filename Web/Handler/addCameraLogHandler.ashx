<%@ WebHandler Language="C#" Class="addCameraLogHandler" %>

using System; using System.Resources;
using System.Web;
using System.Web.SessionState;

using ProjectMgt.Model;
using ProjectMgt.BLL;

public class addCameraLogHandler : IHttpHandler, IReadOnlySessionState
{
    
    public void ProcessRequest (HttpContext context) 
    {
        string result = string.Empty;
        try
        {
            string strCameraID = context.Request.Form["strCameraID"];
            string strCameraName = context.Request.Form["strCameraName"];
            string strServerIP = context.Request.Form["strServerIP"];
            string strCreatorCode = context.Session["UserCode"] == null ? "" : context.Session["UserCode"].ToString().Trim();
            string strCreatorName = context.Session["UserName"] == null ? "" : context.Session["UserName"].ToString();

            CameraLog cameraLog = new CameraLog();
            int intCameraID = 0;
            int.TryParse(strCameraID, out intCameraID);
            cameraLog.CameraID = intCameraID;
            cameraLog.CameraName = strCameraName;
            cameraLog.ServerIP = strServerIP;
            cameraLog.CreatorCode = strCreatorCode;
            cameraLog.CreatorName = strCreatorName;
            cameraLog.CreateTime = DateTime.Now;
            cameraLog.Description = "查看";
            CameraLogBLL cameraLogBLL = new CameraLogBLL();
            cameraLogBLL.AddCameraLog(cameraLog);

            result = "保存成功！";
        }
        catch (Exception ex)
        {
            result = "保存失败，请检查！" + ex.Message.ToString();
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write(result);
    }


 
    public bool IsReusable {
        get {
            return false;
        }
    }

}