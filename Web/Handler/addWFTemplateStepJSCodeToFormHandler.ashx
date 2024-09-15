<%@ WebHandler Language="C#" Class="addWFTemplateStepJSCodeToFormHandler" %>

using System;
using System.Resources;
using System.Web;
using System.Data;

using System.Web.SessionState;
using ProjectMgt.Model;
using ProjectMgt.BLL;
using System.Collections;

public class addWFTemplateStepJSCodeToFormHandler : IHttpHandler, IReadOnlySessionState
{
    public void ProcessRequest(HttpContext context)
    {
        string result = string.Empty;
        try
        {
            string strSql = ShareClass.UnEscape(context.Request["strSql"]);
            string strSortNumberName = ShareClass.UnEscape(context.Request["strSortName"]);
            string[] ArrNumberName = strSortNumberName.Split('.');
            int intSortNumber = 0;
            int.TryParse(ArrNumberName[0], out intSortNumber);
            string strSortName = ArrNumberName[1];
            string strTemName = ShareClass.UnEscape(context.Request["strTemName"]);
            string strComment = ShareClass.UnEscape(context.Request["strComment"]);
            string strWebServiceName = ShareClass.UnEscape(context.Request["strWebServiceName"]);
            string objID = context.Request["intID"];

            int ID = 0;
            int.TryParse(objID, out ID);

            strSql = strSql.Replace("TAKETOP[PLUS]", "+");
            //strSql = strSql.Replace("'", "''");
            string CreatorCode = context.Session["UserCode"] == null ? "" : context.Session["UserCode"].ToString().Trim();
            string CreatorName = context.Session["UserName"] == null ? "" : context.Session["UserName"].ToString();
            DateTime CreateTime = DateTime.Now;
            string strCommanSql = string.Empty;

            strCommanSql = string.Format(@"Select * From T_WFTemplateStepRelatedJSCode Where TemName = '{0}' and StepSortNumber = {1}", strTemName, intSortNumber);
            DataSet ds = ShareClass.GetDataSetFromSql(strCommanSql, "T_WFTemplateStepRelatedJSCode");
            if (ds.Tables[0].Rows.Count == 0)
            {
                try
                {
                    //strCommanSql = string.Format(@"insert into T_WFTemplateStepRelatedJSCode(TemName,StepSortNumber,StepName,JSCode,Comment,CreatorCode,CreatorName,CreateTime) values('{0}',{1},'{2}','{3}','{4}','{5}','{6}','{7}')",
                    //    strTemName, intSortNumber, strSortName, strSql, strComment, CreatorCode, CreatorName, CreateTime);
                    //ShareClass.RunSqlCommand(strCommanSql);

                    WFTemplateStepRelatedJSCodeBLL wFTemplateStepRelatedJSCodeBLL = new WFTemplateStepRelatedJSCodeBLL();
                    WFTemplateStepRelatedJSCode wFTemplateStepRelatedJSCode = new WFTemplateStepRelatedJSCode();

                    wFTemplateStepRelatedJSCode.TemName = strTemName;
                    wFTemplateStepRelatedJSCode.StepName = strSortName;
                    wFTemplateStepRelatedJSCode.StepSortNumber = intSortNumber;
                    wFTemplateStepRelatedJSCode.JSCode = strSql;
                    wFTemplateStepRelatedJSCode.Comment = strComment;
                    wFTemplateStepRelatedJSCode.CreatorCode = CreatorCode;
                    wFTemplateStepRelatedJSCode.CreatorName = CreatorName;
                    wFTemplateStepRelatedJSCode.CreateTime = CreateTime;

                    wFTemplateStepRelatedJSCodeBLL.AddWFTemplateStepRelatedJSCode(wFTemplateStepRelatedJSCode);

                    result = GetMyCreatedMaxWFTemplateStepRelatedJSCode(CreatorCode);
                }
                catch (Exception ex)
                {
                    result = "保存失败，原因：" + ex.Message.ToString();
                }


                //要改为先全部删除，然后再添加新的，不然，修改的时候，有些已经去掉了，不会删除
                if (!string.IsNullOrEmpty(strWebServiceName))
                {
                    string DeleteWebServiceSQL = string.Format("delete T_WFTemplateStepRelatedWebService where TemName = '{0}' and StepSortNumber = {1} and StepName = '{2}'", strTemName, intSortNumber, strSortName);
                    ShareClass.RunSqlCommand(DeleteWebServiceSQL);
                    string[] arrWebService = strWebServiceName.Split('|');
                    WFTemplateStepRelatedWebServiceBLL wFTemplateStepRelatedWebServiceBLL = new WFTemplateStepRelatedWebServiceBLL();
                    //string webMethodSql = "from WFTemplateStepRelatedWebService as wFTemplateStepRelatedWebService where TemName = '{0}' and StepSortNumber = {1} and StepName = '{2}' and WebServiceName = '{3}' and MethodName = '{4}'";
                    for (int i = 0; i < arrWebService.Length; i++)
                    {
                        if (!string.IsNullOrEmpty(arrWebService[i]))
                        {
                            string[] ArrWebMethod = arrWebService[i].Split(':');

                            WFTemplateStepRelatedWebService wFTemplateStepRelatedWebService = new WFTemplateStepRelatedWebService();
                            wFTemplateStepRelatedWebService.TemName = strTemName;
                            wFTemplateStepRelatedWebService.StepSortNumber = intSortNumber;
                            wFTemplateStepRelatedWebService.StepName = strSortName;
                            wFTemplateStepRelatedWebService.WebServiceName = ArrWebMethod[0];
                            wFTemplateStepRelatedWebService.MethodName = ArrWebMethod[1];

                            wFTemplateStepRelatedWebServiceBLL.AddWFTemplateStepRelatedWebService(wFTemplateStepRelatedWebService);
                        }
                    }
                }
            }
            else
            {
                try
                {
                    //strCommanSql = string.Format(@"update T_WFTemplateStepRelatedJSCode set TemName='{0}',JSCode='{1}',Comment='{2}',CreatorCode='{3}',CreatorName='{4}',CreateTime='{5}',StepSortNumber={6},StepName='{7}' where id ={8}",
                    //    strTemName, strSql, strComment, CreatorCode, CreatorName, CreateTime, intSortNumber, strSortName, ID);
                    //ShareClass.RunSqlCommand(strCommanSql);

                    WFTemplateStepRelatedJSCodeBLL wFTemplateStepRelatedJSCodeBLL = new WFTemplateStepRelatedJSCodeBLL();
                    strCommanSql = String.Format(@"from WFTemplateStepRelatedJSCode as wFTemplateStepRelatedJSCode where wFTemplateStepRelatedJSCode.TemName = '{0}' and  StepSortNumber = {1}", strTemName, intSortNumber);
                    IList lst = wFTemplateStepRelatedJSCodeBLL.GetAllWFTemplateStepRelatedJSCodes(strCommanSql);
                    WFTemplateStepRelatedJSCode wFTemplateStepRelatedJSCode = (WFTemplateStepRelatedJSCode)lst[0];

                    ID = wFTemplateStepRelatedJSCode.ID;

                    wFTemplateStepRelatedJSCode.TemName = strTemName;
                    wFTemplateStepRelatedJSCode.StepName = strSortName;
                    wFTemplateStepRelatedJSCode.StepSortNumber = intSortNumber;
                    wFTemplateStepRelatedJSCode.JSCode = strSql;
                    wFTemplateStepRelatedJSCode.Comment = strComment;
                    wFTemplateStepRelatedJSCode.CreatorCode = CreatorCode;
                    wFTemplateStepRelatedJSCode.CreatorName = CreatorName;
                    wFTemplateStepRelatedJSCode.CreateTime = CreateTime;

                    wFTemplateStepRelatedJSCodeBLL.UpdateWFTemplateStepRelatedJSCode(wFTemplateStepRelatedJSCode, ID);

                    result = ID.ToString();
                }
                catch (Exception ex)
                {
                    result = "保存失败，原因：" + ex.Message.ToString();
                }

                //要改为先全部删除，然后再添加新的，不然，修改的时候，有些已经去掉了，不会删除
                if (!string.IsNullOrEmpty(strWebServiceName))
                {
                    string DeleteWebServiceSQL = string.Format("delete T_WFTemplateStepRelatedWebService where TemName = '{0}' and StepSortNumber = {1} and StepName = '{2}'", strTemName, intSortNumber, strSortName);
                    ShareClass.RunSqlCommand(DeleteWebServiceSQL);
                    string[] arrWebService = strWebServiceName.Split('|');
                    WFTemplateStepRelatedWebServiceBLL wFTemplateStepRelatedWebServiceBLL = new WFTemplateStepRelatedWebServiceBLL();
                    for (int i = 0; i < arrWebService.Length; i++)
                    {
                        if (!string.IsNullOrEmpty(arrWebService[i]))
                        {
                            string[] ArrWebMethod = arrWebService[i].Split(':');

                            WFTemplateStepRelatedWebService wFTemplateStepRelatedWebService = new WFTemplateStepRelatedWebService();
                            wFTemplateStepRelatedWebService.TemName = strTemName;
                            wFTemplateStepRelatedWebService.StepName = strSortName;
                            wFTemplateStepRelatedWebService.StepSortNumber = intSortNumber;
                            wFTemplateStepRelatedWebService.WebServiceName = ArrWebMethod[0];
                            wFTemplateStepRelatedWebService.MethodName = ArrWebMethod[1];

                            wFTemplateStepRelatedWebServiceBLL.AddWFTemplateStepRelatedWebService(wFTemplateStepRelatedWebService);
                        }
                    }
                }


            }
        }
        catch (Exception ex)
        {
            result = "保存失败，原因：" + ex.Message.ToString();
        }

        context.Response.ContentType = "text/plain";
        context.Response.Write(result);
    }

    //取得用户创建的最大工作流模板步骤代码ID号
    public static string GetMyCreatedMaxWFTemplateStepRelatedJSCode(string strCreatorCode)
    {
        string strHQL;

        strHQL = "Select Max(ID) From  T_WFTemplateStepRelatedJSCode Where CreatorCode = '" + strCreatorCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WFTemplateStepRelatedJSCode");

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