<%@ WebHandler Language="C#" Class="addJSCodeToFormHandler" %>

using System;
using System.Resources;
using System.Web;
using System.Web.SessionState;
using System.Data;
using System.Collections;

using ProjectMgt.Model;
using ProjectMgt.BLL;

public class addJSCodeToFormHandler : IHttpHandler, IReadOnlySessionState
{
    public void ProcessRequest(HttpContext context)
    {
        string result = string.Empty;
        try
        {
            string strSql = ShareClass.UnEscape(context.Request["strSql"]);
            string strTemName = ShareClass.UnEscape(context.Request["strTemName"]);
            //string strComment = ShareClass.UnEscape(context.Request["strComment"]);

            string strComment = "";
            string objID = context.Request["intID"];
            int ID = 0;

            int.TryParse(objID, out ID);

            strSql = strSql.Replace("TAKETOP[PLUS]", "+");

            string CreatorCode = context.Session["UserCode"] == null ? "" : context.Session["UserCode"].ToString().Trim();
            string CreatorName = context.Session["UserName"] == null ? "" : context.Session["UserName"].ToString();
            DateTime CreateTime = DateTime.Now;
            string strCommanSql = string.Empty;

            strCommanSql = string.Format(@"Select * From T_WFTemplateRelatedJSCode Where TemName = '{0}'", strTemName);
            LogClass.WriteLogFile(strCommanSql);

            DataSet ds = ShareClass.GetDataSetFromSql(strCommanSql, "T_WFTemplateRelatedJSCode");
            if (ds.Tables[0].Rows.Count == 0)
            {
                LogClass.WriteLogFile(strCommanSql);

                try
                {
                    //strCommanSql = string.Format(@"insert into T_WFTemplateRelatedJSCode(TemName,JSCode,Comment,CreatorCode,CreatorName,CreateTime) values('{0}','{1}','{2}','{3}','{4}','{5}')",
                    //    strTemName, strSql, strComment, CreatorCode, CreatorName, CreateTime);
                    //ShareClass.RunSqlCommand(strCommanSql);

                    WFTemplateRelatedJSCodeBLL wfTemplateRelatedJSCodeBLL = new WFTemplateRelatedJSCodeBLL();
                    WFTemplateRelatedJSCode wfTemplateRelatedJSCode = new WFTemplateRelatedJSCode();

                    wfTemplateRelatedJSCode.TemName = strTemName;
                    wfTemplateRelatedJSCode.JSCode = strSql;
                    wfTemplateRelatedJSCode.Comment = strComment;
                    wfTemplateRelatedJSCode.CreatorCode = CreatorCode;
                    wfTemplateRelatedJSCode.CreatorName = CreatorName;
                    wfTemplateRelatedJSCode.CreateTime = CreateTime;

                    wfTemplateRelatedJSCodeBLL.AddWFTemplateRelatedJSCode(wfTemplateRelatedJSCode);

                    result = GetMyCreatedMaxWFTemplateRelatedJSCode(strTemName);
                }
                catch (Exception ex)
                {
                    LogClass.WriteLogFile(ex.Message.ToString());
                    result = "保存失败，原因是：" + ex.Message.ToString();
                }
            }
            else
            {
                try
                {
                    //strCommanSql = string.Format(@"update T_WFTemplateRelatedJSCode set TemName='{0}',JSCode='{1}',Comment='{2}',CreatorCode='{3}',CreatorName='{4}',CreateTime='{5}' where id ={6}",
                    //    strTemName, strSql, strComment, CreatorCode, CreatorName, CreateTime, ID);
                    //ShareClass.RunSqlCommand(strCommanSql);

                    WFTemplateRelatedJSCodeBLL wFTemplateRelatedJSCodeBLL = new WFTemplateRelatedJSCodeBLL();
                    strCommanSql = String.Format(@"from WFTemplateRelatedJSCode as wFTemplateRelatedJSCode where wFTemplateRelatedJSCode.TemName = '{0}'", strTemName);
                    IList lst = wFTemplateRelatedJSCodeBLL.GetAllWFTemplateRelatedJSCodes(strCommanSql);
                    WFTemplateRelatedJSCode wfTemplateRelatedJSCode = (WFTemplateRelatedJSCode)lst[0];
                    ID = wfTemplateRelatedJSCode.ID;

                    wfTemplateRelatedJSCode.TemName = strTemName;
                    wfTemplateRelatedJSCode.JSCode = strSql;
                    wfTemplateRelatedJSCode.Comment = strComment;
                    wfTemplateRelatedJSCode.CreatorCode = CreatorCode;
                    wfTemplateRelatedJSCode.CreatorName = CreatorName;
                    wfTemplateRelatedJSCode.CreateTime = CreateTime;

                    wFTemplateRelatedJSCodeBLL.UpdateWFTemplateRelatedJSCode(wfTemplateRelatedJSCode, ID);

                    result = ID.ToString();
                }
                catch (Exception ex)
                {
                    result = "保存失败，原因是：" + ex.Message.ToString();
                }
            }
        }
        catch (Exception ex)
        {
            result = "保存失败，原因是：" + ex.Message.ToString();
        }

        context.Response.ContentType = "text/plain";
        context.Response.Write(result);
    }

    //取得用户创建的最大工作流模板代码ID号
    public static string GetMyCreatedMaxWFTemplateRelatedJSCode(string strTemName)
    {
        string strHQL;

        strHQL = "Select Max(ID) From  T_WFTemplateRelatedJSCode Where TemName = '" + strTemName + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WFTStepRElatedTem");

        return ds.Tables[0].Rows[0][0].ToString();
    }


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}