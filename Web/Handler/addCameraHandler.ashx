<%@ WebHandler Language="C#" Class="addCameraHandler" %>

using System; 
    using System.Resources;
using System.Web;
using System.Web.SessionState;

using ProjectMgt.Model;
using ProjectMgt.BLL;

public class addCameraHandler : IHttpHandler, IReadOnlySessionState
{

    public void ProcessRequest(HttpContext context)
    {
        string result = string.Empty;
        try
        {
            string strArea = context.Request.Form["strArea"];
            string strProDepart = context.Request.Form["strProDepart"];
            string strServerIP = context.Request.Form["strServerIP"];
            string strServerPort = context.Request.Form["strServerPort"];
            string strServerChannel = context.Request.Form["strServerChannel"];
            string strCameraName = context.Request.Form["strCameraName"];
            string strCameraUserName = context.Request.Form["strCameraUserName"];
            string strCameraPass = context.Request.Form["strCameraPass"];
            string strDescription = context.Request.Form["strDescription"];
            string strCreatorCode = context.Session["UserCode"] == null ? "" : context.Session["UserCode"].ToString().Trim();
            string strCreatorName = context.Session["UserName"] == null ? "" : context.Session["UserName"].ToString();

            CameraList cameraList = new CameraList();
            cameraList.Area = strArea;
            cameraList.ProjectDepartment = strProDepart;
            cameraList.ServerIP = strServerIP;
            cameraList.ServerPort = strServerPort;
            cameraList.ServerChannel = strServerChannel;
            cameraList.CameraName = strCameraName;
            cameraList.CameraUserName = strCameraUserName;
            cameraList.CameraPass = strCameraPass;
            cameraList.CreatorCode = strCreatorCode;
            cameraList.CreatorName = strCreatorName;
            cameraList.Description = strDescription;
            cameraList.CreateTime = DateTime.Now;

            CameraListBLL cameraListBLL = new CameraListBLL();
            cameraListBLL.AddCameraList(cameraList);
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