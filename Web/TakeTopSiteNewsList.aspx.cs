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

using System.Security.Cryptography;
using System.Security.Permissions;
using System.Data.SqlClient;

using System.Globalization;
using System.Threading;
using DayPilot.Web.Ui;
using DayPilot.Web.Ui.Events;

using System.ComponentModel;
using System.Web.SessionState;
using System.Drawing.Imaging;



using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TakeTopSiteNewsList : System.Web.UI.Page
{
    string strLangCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strModuleName, strHomeModuleName;

        if (Session["LangCode"] != null)
        {
            strLangCode = Session["LangCode"].ToString();
        }
        else
        {
            strLangCode = System.Configuration.ConfigurationManager.AppSettings["DefaultLang"];
        }


        strModuleName = Request.QueryString["ModuleName"];
        strHomeModuleName = Request.QueryString["HomeModuleName"];

        if (ShareClass.IsMobileDeviceCheckAgent())
        {
            divLeftBar.Visible = true;
            IM_RightToLeft.Visible = true;
        }
        else
        {
            divLeftBar.Visible = false;
            IM_RightToLeft.Visible = false;
        }

        //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            LoadHeadLine();

            string strHQL;
            strHQL = "Select Distinct * From T_ProModuleLevel A Where ParentModule = " + "'" + strModuleName + "'";
            strHQL += " and A.Visible = 'YES' and A.IsDeleted = 'NO' and A.ModuleType = 'SITE' ";
            strHQL += " and A.LangCode = " + "'" + strLangCode + "'";
            strHQL += " Order By A.SortNumber ASC";
            DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_ProModuleLevel");
            if (ds.Tables[0].Rows.Count > 0 & ShareClass.IsMobileDeviceCheckAgent())
            {
                divLeftBar.Visible = true;
                IM_RightToLeft.Visible = true;
            }
            else
            {
                divLeftBar.Visible = false;
                IM_RightToLeft.Visible = false;
            }
        }
    }

    protected void LoadHeadLine()
    {
        string strHQL;
    
        strHQL = "Select ID,Title,Content,RelatedDepartName,PublisherCode,PublisherName,PublishTime From T_HeadLine ";
        strHQL += "Where Type = '外部' and Status = '发布' ";
        strHQL += " and LangCode = " + "'" + strLangCode + "'";
        strHQL += " Order By ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_HeadLine");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();
    }

}