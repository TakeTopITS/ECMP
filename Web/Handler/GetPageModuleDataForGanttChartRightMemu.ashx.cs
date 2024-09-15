using System;
using System.Resources;
using System.Web;

using System.Data;
using Newtonsoft.Json;

namespace TakeTopGantt.handler
{
    /// <summary>
    /// GetPageModuleDataForGanttChartRightMemu 的摘要说明
    /// </summary>
    public class GetPageModuleDataForGanttChartRightMemu : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            DataTable dt = GetNotToFormList(context.Request);
            string strJson = JsonConvert.SerializeObject(dt);

            context.Response.ContentType = "text/plain";
            context.Response.Write(strJson);
        }


        private DataTable GetNotToFormList(HttpRequest request)
        {
            DataTable dt = new DataTable();
            try
            {
                string strLangCode = request.QueryString["LangCode"];
                string strNotToFormHQL = string.Format(@"
                            Select trim(HomeModuleName)  HomeModuleName,trim(PageName) PageName,Replace(Replace(Replace(Replace( Replace(trim(PageName),'?',''),'.',''),':',''),'//',''),'=','') as ModuleLabel From T_ProModuleLevelForPage 
                            Where ParentModule = '项目计划菜单' and char_length(rtrim(HomeModuleName)) > 0 and rtrim(PageName) <> '' 
                            and Visible = 'YES'
                            and IsDeleted = 'NO'
                            and LangCode = '{0}'
                            Order by SortNumber ASC", strLangCode);

                dt = GanttShareClass.GetDataSetFromSql(strNotToFormHQL, "NotToForm").Tables[0];
            }
            catch (Exception ex)
            {

            }
            return dt;
        }


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

    }
}
