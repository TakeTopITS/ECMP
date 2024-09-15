using System;
using System.Resources;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Text;

using System.Security.Cryptography;
using System.Security.Permissions;
using System.Data.SqlClient;

using System.ComponentModel;
using System.Web.SessionState;
using System.Drawing.Imaging;
using System.Timers;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTAppUnHandledCase : System.Web.UI.Page
{
    string strUserCode, strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserInfo, strUserName;

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();

        strLangCode = Session["LangCode"].ToString().Trim();

        if (Page.IsPostBack == false)
        {
            strUserName = ShareClass.GetUserName(strUserCode);
            strUserInfo = "用户：" + strUserCode + "  " + strUserName;
            //LB_SuperDepartString.Text = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);

            LoadFunInforDialBoxList();
        }
    }

    protected void LoadFunInforDialBoxList()
    {
        string strHQL;
        strHQL = "Select * From T_FunInforDialBox Where Status='启用' and char_length(Ltrim(Rtrim(MobileLinkAddress))) > 0 ";
        strHQL += " and LangCode = " + "'" + strLangCode + "'";
        strHQL += " and trim(MobileLinkAddress) <> ''";
        strHQL += " Order By SortNumber Asc ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_FunInforDialBox");
        DataGrid1.CurrentPageIndex = 0;
        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected string GetNumberCount(string strSQLCode)
    {
        string strHQL;
        string strSuperDepartString;
        string strUserCode;
        strUserCode = Session["UserCode"].ToString();

        try
        {
            strSuperDepartString = LB_SuperDepartString.Text.Trim();

            strHQL = strSQLCode.Trim().Replace("[TAKETOPUSERCODE]", strUserCode);
            //strHQL = strHQL.Replace("[TAKETOPSUPERDEPARTSTRING]", strSuperDepartString);

            DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "FunInforDialBoxList");

            return ds.Tables[0].Rows.Count.ToString();
        }
        catch
        {
            return "0";
        }
    }


}
