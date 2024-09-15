<%@ WebHandler Language="C#" Class="GetFoldSize" %>


using System;
using System.Resources;
using System.Web;
using System.Web.SessionState;

using ProjectMgt.Model;
using ProjectMgt.BLL;
using System.Collections;

public class GetFoldSize : IHttpHandler, IReadOnlySessionState
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        string strDirPath = context.Request["DirPath"];

        long longFoldSize = ShareClass.GetDirectoryLength(strDirPath);

        context.Response.Write(longFoldSize.ToString());
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}