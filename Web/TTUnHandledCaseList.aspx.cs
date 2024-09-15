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

public partial class TTUnHandledCaseList : System.Web.UI.Page
{
    string strUserCode;
    string strLangCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserInfo, strUserName, strUserType;

        strLangCode = Session["LangCode"].ToString();
        strUserCode = Session["UserCode"].ToString();

        if (Page.IsPostBack == false)
        {
            strUserName = ShareClass.GetUserName(strUserCode);
            strUserType = ShareClass.GetUserType(strUserCode);
            strUserInfo = Resources.lang.YongHu + ":" + strUserCode + "  " + strUserName;

            LoadFunInforDialBoxList(strUserType, strLangCode);
        }
    }

    protected void LoadFunInforDialBoxList(string strUserType, string strLangCode)
    {
        string strHQL;
        strHQL = "Select * From T_FunInforDialBox Where Status='启用'";
        strHQL += " and LangCode = " + "'" + strLangCode + "'";
        strHQL += " and (UserType = " + "'" + strUserType + "'" + " Or UserType = 'ALL')";
        strHQL += " Order By SortNumber ASC ";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_FunInforDialBox");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

    protected string GetNumberCount(string strSQLCode)
    {
        try
        {
            DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strSQLCode.Trim().Replace("[TAKETOPUSERCODE]", strUserCode), "FunInforDialBoxList");

            return ds.Tables[0].Rows.Count.ToString();
        }
        catch
        {
            return "0";
        }
    }


}
