<%@ WebHandler Language="C#" Class="ProjectModuleHandler" %>

using System; using System.Resources;
using System.Web;

public class ProjectModuleHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string result = string.Empty;
        try
        {
            string strProjectID = context.Request.Form["ProjectID"];
            string strSelectedModule = context.Request.Form["SelectedModule"];

            string strSelectModule = strSelectedModule;
            if (!string.IsNullOrEmpty(strSelectModule))
            {
                string[] arrSelectedModule = strSelectModule.Split(',');

                string strModuleIDs = string.Empty;
                string strModuleNames = string.Empty;

                for (int i = 0; i < arrSelectedModule.Length; i++)
                {
                    if (!string.IsNullOrEmpty(arrSelectedModule[i]))
                    {
                        string[] arrChildModule = arrSelectedModule[i].Split('|');

                        strModuleIDs += arrChildModule[0] + ",";
                        strModuleNames += arrChildModule[1] + ",";

                    }
                }

                string strUpdateSQL = string.Format("update T_Project_YYUP set ModuleIDs = '{0}',ModuleNames='{1}' where ProjectID = {2}", strModuleIDs, strModuleNames, strProjectID);
                ShareClass.RunSqlCommand(strUpdateSQL);

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