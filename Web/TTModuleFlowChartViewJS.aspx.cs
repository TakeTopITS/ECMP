using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


using System.Text;
using System.IO;
using System.Web.Mail;

using System.Data.SqlClient;
using System.Runtime.Serialization.Json;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;
using NHibernate.Util;
using jdk.nashorn.@internal.ir;

public partial class TTModuleFlowChartViewJS : System.Web.UI.Page
{
    private string strIdentifyString;

    int intBegin;
    int intRunNumber;

    string strUserCode, strUserType, strType;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strTemName, strWFDefinition, strHomeModuleName, strSysteModuleID;
        string strID;

        strUserCode = Session["UserCode"].ToString();
        strUserType = ShareClass.GetUserType(strUserCode);

        strID = Request.QueryString["IdentifyString"];
        strType = Request.QueryString["Type"];

        if (Page.IsPostBack == false)
        {
            strHQL = string.Format(@"Select Distinct B.ID,A.ID as SystemModuleID,A.ModuleName,A.HomeModuleName,A.ParentModule,A.PageName,A.ModuleType,B.ModuleDefinition as UserModuleDefinition,A.ModuleDefinition as SystemModuleDefinition,
                A.UserType,A.IconURL,A.SortNumber,A.DIYFlow From T_ProModuleLevel A, T_ProModule B Where rtrim(A.ModuleName)
                ||rtrim(A.ModuleType)||rtrim(A.UserType) = rtrim(B.ModuleName) ||rtrim(B.ModuleType) 
                ||rtrim(B.UserType) and (CHAR_LENGTH(B.ModuleDefinition) > 0 Or CHAR_LENGTH(A.ModuleDefinition) > 0) and B.ID = {0}", strID, Session["LangCode"].ToString());

            //LogClass.WriteLogFile(strHQL);

            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");
            if (ds.Tables[0].Rows.Count > 0)
            {
                strHomeModuleName = ds.Tables[0].Rows[0]["HomeModuleName"].ToString().Trim();
                strTemName = ds.Tables[0].Rows[0]["ModuleName"].ToString().Trim();
                strWFDefinition = ds.Tables[0].Rows[0]["UserModuleDefinition"].ToString().Trim();

                if (strType == "UserModule" && strWFDefinition == "")
                {
                    strSysteModuleID = ds.Tables[0].Rows[0]["SystemModuleID"].ToString().Trim();
                    strWFDefinition = ds.Tables[0].Rows[0]["SystemModuleDefinition"].ToString().Trim();
                }

                TB_CopyRight.Text = System.Configuration.ConfigurationManager.AppSettings["CopyRight"];
                TB_WFIdentifyString.Text = strIdentifyString;
                TB_WFName.Text = strTemName;

                string strNewMFDefinition = strWFDefinition;

                if (strWFDefinition != "")
                {
                    //变更为当前环境语言和当前用户不可用的模组的颜色
                    string strjObjectNodePropsAttr = "";
                    JObject _jObject = JObject.Parse(strWFDefinition);
                    foreach (JProperty item in _jObject.Children())
                    {
                        try
                        {
                            JObject _jObjectNode = JObject.Parse(item.Value.ToString());

                            foreach (JProperty itemNode in _jObjectNode.Children())
                            {
                                try
                                {
                                    JObject _jObjectNodeProps = JObject.Parse(itemNode.Value.ToString());

                                    try
                                    {
                                        strjObjectNodePropsAttr = JsonConvert.SerializeObject(_jObjectNodeProps["attr"]);
                                    }
                                    catch (Exception ex)
                                    {
                                        strjObjectNodePropsAttr = "";
                                    }

                                    foreach (JProperty itemNodeProps in _jObjectNodeProps.Children())
                                    {
                                        if (itemNodeProps.Value.ToString().IndexOf("url") >= 0)
                                        {
                                            try
                                            {
                                                JObject _jObjectNodePropsText = JObject.Parse(itemNodeProps.Value.ToString());


                                                foreach (JProperty itemNodePropsText in _jObjectNodePropsText.Children())
                                                {
                                                    if (itemNodePropsText.Value.ToString().IndexOf("url") >= 0)
                                                    {
                                                        try
                                                        {
                                                            JObject _jObjectNodePropsTextValue = JObject.Parse(itemNodePropsText.Value.ToString());

                                                            string strFromModuleName = _jObjectNodePropsTextValue["value"].ToString();
                                                            string strModuleURL = _jObjectNodePropsTextValue["url"].ToString();


                                                            string strModuleVisible = getModuleUserVisibleByURL(strUserCode, strFromModuleName, strModuleURL, Session["LangCode"].ToString());

                                                            if (strjObjectNodePropsAttr != "" & strModuleVisible == "NO")
                                                            {
                                                                string strNewjObjectNodePropsAttr = strjObjectNodePropsAttr.Replace("x", "fill:'LightGray',\"x");

                                                                strjObjectNodePropsAttr = strjObjectNodePropsAttr.Replace("\"", "").Replace(",", ", ").Replace("{", "").Replace("}", "");
                                                                strNewjObjectNodePropsAttr = strNewjObjectNodePropsAttr.Replace("\"", "").Replace(",", ", ").Replace("{", "").Replace("}", "");

                                                                strNewMFDefinition = strNewMFDefinition.Replace(strjObjectNodePropsAttr, strNewjObjectNodePropsAttr);
                                                            }
                                                            else
                                                            {
                                                                string strNewjObjectNodePropsAttr = strjObjectNodePropsAttr.Replace("x", "fill:'LightGreen',\"x");

                                                                strjObjectNodePropsAttr = strjObjectNodePropsAttr.Replace("\"", "").Replace(",", ", ").Replace("{", "").Replace("}", "");
                                                                strNewjObjectNodePropsAttr = strNewjObjectNodePropsAttr.Replace("\"", "").Replace(",", ", ").Replace("{", "").Replace("}", "");

                                                                strNewMFDefinition = strNewMFDefinition.Replace(strjObjectNodePropsAttr, strNewjObjectNodePropsAttr);
                                                            }

                                                            if (strModuleVisible == "NO")
                                                            {
                                                                strNewMFDefinition = strNewMFDefinition.Replace(strModuleURL, "");
                                                            }

                                                            string strNewHomeModuleName = getHomeModuleNameByURL(strFromModuleName, strModuleURL, Session["LangCode"].ToString(), strUserType);

                                                            //LogClass.WriteLogFile(strFromHomeModuleName + "---" + strNewHomeModuleName);

                                                            strNewMFDefinition = strNewMFDefinition.Replace(strFromModuleName, strNewHomeModuleName);

                                                            //LogClass.WriteLogFile(strFromModuleName + "--" + strModuleVisible);
                                                        }
                                                        catch
                                                        {
                                                        }
                                                    }
                                                }
                                            }
                                            catch
                                            {
                                            }
                                        }
                                    }
                                }
                                catch
                                {
                                }
                            }
                        }
                        catch
                        {
                        }
                    }


                    //LogClass.WriteLogFile(strNewMFDefinition);

                    TB_WFXML.Text = strNewMFDefinition;
                }

            }
        }
    }

    //取得当前模组名称
    protected string getSystemModuleDefinition(string strSystemModuleID)
    {
        string strHQL;

        strHQL = "Select ModuleName From T_ProModuleLevel Where ID = " + strSystemModuleID;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "";
        }
    }

    //取得当前模组名称
    protected string getTrueModuleNameByURL(string strFromHomeModuleName, string strModuleURL, string strLangCode)
    {
        string strHQL;

        strHQL = "Select ModuleName From T_ProModuleLevel Where HomeModuleName = '" + strFromHomeModuleName + "' and PageName = '" + strModuleURL + "' and LangCode = '" + strLangCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return strFromHomeModuleName;
        }
    }

    //取得当前模块对当前用户是否可用
    protected string getModuleUserVisibleByURL(string strUserCode, string strFromModuleName, string strModuleURL, string strLangCode)
    {
        string strHQL;
        string strUserType;

        strUserType = Session["UserType"].ToString();

        strHQL = string.Format(@"SELECT B.Visible
        FROM T_ProModuleLevel A
        JOIN T_ProModule B ON (
            TRIM(A.ModuleName) || TRIM(A.ModuleType) || TRIM(A.UserType) = 
            TRIM(B.ModuleName) || TRIM(B.ModuleType) || TRIM(B.UserType) AND
            B.UserCode = '{0}' AND
            B.ModuleType NOT IN ('APP', 'DIYAPP', 'SITE') AND
            B.UserType = '{1}'
        )
        WHERE
            A.Visible = 'YES' AND
            A.IsDeleted = 'NO' AND B.Visible = 'YES' and
            A.ModuleType NOT IN ('APP', 'DIYAPP', 'SITE') AND
            A.UserType = '{1}' AND
            A.ModuleName = '{2}' AND
            A.PageName = '{3}' AND
            A.LangCode = '{4}' AND
        	(A.ParentModule = ''
              Or
           (A.ParentModule <> '' and A.ParentModule IN (
                SELECT C.ModuleName
                FROM T_ProModuleLevel C
                JOIN T_ProModule D ON (
                    TRIM(C.ModuleName) || TRIM(C.ModuleType) || TRIM(C.UserType) = 
                    TRIM(D.ModuleName) || TRIM(D.ModuleType) || TRIM(D.UserType) AND
                    D.UserCode = '{0}' AND D.UserType = '{1}' and
                    C.LangCode = '{4}'
                )
                WHERE
                    (C.Visible = 'YES' and C.IsDeleted = 'NO') AND
                    D.Visible = 'YES' and C.ParentModule = ''
            )) Or
        	 (A.ParentModule <> '' AND A.ParentModule IN (
                SELECT C.ModuleName
                FROM T_ProModuleLevel C
                JOIN T_ProModule D ON (
                    TRIM(C.ModuleName) || TRIM(C.ModuleType) || TRIM(C.UserType) = 
                    TRIM(D.ModuleName) || TRIM(D.ModuleType) || TRIM(D.UserType) AND
                    D.UserCode = '{0}' AND D.UserType = '{1}' and
                    C.LangCode = '{4}'
                )
                WHERE
                    (C.Visible = 'YES' and C.IsDeleted = 'NO') AND
                    D.Visible = 'YES' and C.ParentModule <> ''
        		    and C.ParentModule in 
        		 (
                SELECT E.ModuleName
                FROM T_ProModuleLevel E
                JOIN T_ProModule F ON (
                    TRIM (E.ModuleName) || TRIM(E.ModuleType) || TRIM(E.UserType) = 
                    TRIM(F.ModuleName) || TRIM(F.ModuleType) || TRIM(F.UserType) AND
                    F.UserCode = '{0}' AND F.UserType = '{1}' and
                    E.LangCode = '{4}'
                )
                WHERE
                    (E.Visible = 'YES' and E.IsDeleted = 'NO') AND
                    F.Visible = 'YES' and E.ParentModule = ''
            )))
            ) 


        ORDER BY A.SortNumber ASC", strUserCode, strUserType, strFromModuleName, strModuleURL, strLangCode);

        //LogClass.WriteLogFile(strHQL);

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return "YES";
        }
        else
        {
            return "NO";
        }
    }

    //取得当前语言模组名称
    protected string getHomeModuleNameByURL(string strFromModuleName, string strModuleURL, string strLangCode, string strUserType)
    {
        string strHQL;

        strHQL = string.Format(@"Select A.HomeModuleName  From T_ProModuleLevel A, T_ProModule B  Where rtrim(A.ModuleName)
                ||rtrim(A.ModuleType)||rtrim(A.UserType) = rtrim(B.ModuleName) ||rtrim(B.ModuleType) 
                ||rtrim(B.UserType)  and A.Visible = 'YES' and A.IsDeleted = 'NO' 
                and A.ModuleType Not In ('APP','DIYAPP','SITE') and A.UserType = '{4}' and B.UserType = '{4}' 
                and B.UserCode = '{0}' and B.Visible = 'YES' and B.ModuleType Not In ('APP','DIYAPP','SITE') and A.ModuleName = '{1}' and A.PageName = '{2}' 
                and A.LangCode = '{3}' Order By A.SortNumber ASC", strUserCode, strFromModuleName, strModuleURL, strLangCode, strUserType);

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");
        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return strFromModuleName;
        }
    }

}