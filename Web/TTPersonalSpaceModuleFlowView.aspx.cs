using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTPersonalSpaceModuleFlowView : System.Web.UI.Page
{
    string strUserCode, strUserType;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strUserType = ShareClass.GetUserType(strUserCode);

        string strID;
        strID = Request.QueryString["IdentifyString"];
        if (strID == null)
        {
            if (strUserType == "INNER")
            {
                strID = GetSystemModuleID("操作导航", strUserCode, strUserType, Session["LangCode"].ToString());
            }
            else
            {
                strID = GetSystemModuleID("操作导航", strUserCode, strUserType, Session["LangCode"].ToString());
            }
        }

        Response.Redirect("TTModuleFlowChartViewJS.aspx?Type=UserModule&IdentifyString=" + strID);
    }

    protected string GetSystemModuleID(string strModuleName, string strUserCode, string strUserType, string strLangCode)
    {
        string strHQL;

        strHQL = string.Format(@"Select B.ID From T_ProModuleLevel A, T_ProModule B Where rtrim(A.ModuleName)
                ||rtrim(A.ModuleType)||rtrim(A.UserType) = rtrim(B.ModuleName) ||rtrim(B.ModuleType) 
                ||rtrim(B.UserType) and B.ModuleName = '{0}' and B.UserCode ='{1}' and B.UserType = '{2}' and (CHAR_LENGTH(B.ModuleDefinition) > 0 Or CHAR_LENGTH(A.ModuleDefinition) > 0) ", strModuleName, strUserCode, strUserType, strLangCode);

        //LogClass.WriteLogFile(strHQL);

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProModuleLevel");

        if (ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0][0].ToString().Trim();
        }
        else
        {
            return "0";
        }
    }
}