<%@ WebHandler Language="C#" Class="GetUserInfo" %>

using System;
using System.Resources;
using System.Web;
using System.Web.SessionState;

using ProjectMgt.Model;
using ProjectMgt.BLL;
using System.Collections;

public class GetUserInfo : IHttpHandler, IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        string strUserCode = context.Session["UserCode"] == null ? "" : context.Session["UserCode"].ToString().Trim();
        string strUserName = ShareClass.GetUserName(strUserCode);

        string strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);
        string strDepartName = GetDepartNameFromUserCode(strUserCode);

        context.Response.ContentType = "text/plain";
        context.Response.Write(strUserCode + "," + strUserName + "|" + strDepartCode + "," + strDepartName);
    }



    //取得用户部门名称(根据用户代码）
    public static string GetDepartNameFromUserCode(string strUserCode)
    {
        string strDepartName, strHQL;

        strHQL = " from ProjectMember as projectMember where projectMember.UserCode = " + "'" + strUserCode + "'";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        IList lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        ProjectMember projectMember = (ProjectMember)lst[0];
        strDepartName = ShareClass.ObjectToString(projectMember.DepartName);
        return strDepartName.Trim();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}