<%@ WebHandler Language="C#" Class="addTableTemplateMappingHandler" %>

using System;
using System.Resources;
using System.Web;

using ProjectMgt.Model;
using ProjectMgt.BLL;

public class addTableTemplateMappingHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string result = string.Empty;
        try
        {
            TableTemplateMappingBLL tableTemplateMappingBLL = new TableTemplateMappingBLL();

            string strTableName = context.Request.Form["strTableName"];
            string strTableXMLNodeName = context.Request.Form["strTableXMLNodeName"];
            string strWFTemplateName = context.Request.Form["strWFTemplateName"];
            string strXSNFile = context.Request.Form["strXSNFile"];
            string strWFTemplateXNLNodeName = context.Request.Form["strWFTemplateXNLNodeName"];


            if (!string.IsNullOrEmpty(strTableXMLNodeName) && !string.IsNullOrEmpty(strWFTemplateXNLNodeName))
            {
                //要改为先全部删除，然后再添加新的，不然，修改的时候，有些已经去掉了，不会删除
                string tableMappingHQL = string.Format("delete T_TableTemplateMapping where TableName = '{0}' and WFTemplateName = '{1}'", strTableName, strWFTemplateName);
                ShareClass.RunSqlCommand(tableMappingHQL);

                string[] arrTableXMLNodeName = strTableXMLNodeName.Split('|');
                string[] arrWFTemplateXMLNodeName = strWFTemplateXNLNodeName.Split('|');
                for (int i = 0; i < arrTableXMLNodeName.Length; i++)
                {
                    if (!string.IsNullOrEmpty(arrTableXMLNodeName[i]) && !string.IsNullOrEmpty(arrWFTemplateXMLNodeName[i]))
                    {
                        TableTemplateMapping tableTemplateMapping = new TableTemplateMapping();
                        tableTemplateMapping.TableName = strTableName;
                        tableTemplateMapping.TableXMLNodeName = arrTableXMLNodeName[i];
                        tableTemplateMapping.WFTemplateName = strWFTemplateName;
                        tableTemplateMapping.XSNFile = strXSNFile;
                        tableTemplateMapping.WFTemplateXMLNodeName = arrWFTemplateXMLNodeName[i].Replace("/#document", "");
                        tableTemplateMapping.IdentifyString = "";

                        tableTemplateMappingBLL.AddTableTemplateMapping(tableTemplateMapping);
                    }
                }
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