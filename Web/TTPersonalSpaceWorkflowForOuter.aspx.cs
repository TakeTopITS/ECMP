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
using Npgsql;//using System.Data.SqlClient;

using ProjectMgt.BLL;

public partial class TTPersonalSpaceWorkflowForOuter : System.Web.UI.Page
{
    int intRunNumber;

    protected void Page_Load(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack == false)
        {
            //清空页面缓存，用于改变皮肤
            SetPageNoCache();

            intRunNumber = 0;

            AsyncWork();
        }
    }

    //清空页面缓存，用于改变皮肤
    public void SetPageNoCache()
    {
        if (Session["CssDirectoryChangeNumber"].ToString() == "1")
        {
            //清除全部缓存
            IDictionaryEnumerator allCaches = Page.Cache.GetEnumerator();
            while (allCaches.MoveNext())
            {
                Page.Cache.Remove(allCaches.Key.ToString());
            }

            Page.Response.Buffer = true;
            Page.Response.AddHeader("Pragma", "No-Cache");

            Page.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
            Page.Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Page.Response.Expires = 0;
            Page.Response.CacheControl = "no-cache";
            Page.Response.Cache.SetNoStore();
        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        if (intRunNumber == 0)
        {
            AsyncWork();

            Timer1.Interval = 20000;

            intRunNumber = 1;
        }
    }

    private void AsyncWork()
    {
        string strUserInfo, strUserName;

        string strUserCode;
        String strLangCode;

        strUserCode = Session["UserCode"].ToString();
        strLangCode = Session["LangCode"].ToString();

        strUserName = Session["UserName"].ToString();
        strUserInfo = Resources.lang.YongHu + ": " + strUserCode + "  " + strUserName;

        try
        {
            LoadWorkFlowList(strUserCode);
            LoadMyWorkFlow(strUserCode);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile(err.Message.ToString());
        }
    }

    protected void LoadWorkFlowList(string strUserCode)
    {
        string strHQL;

        strHQL = string.Format(@"Select * From (Select A.ID,A.StepID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B 
                 Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') 
                 And B.Status Not In ('修改中','关闭','通过','结案') And (trim(A.OperatorCode) = '{0}' Or A.OperatorCode in ( Select UserCode From T_MemberLevel Where UnderCode <> UserCode and UnderCode = '{0}' and AgencyStatus = 1))
																 And A.IsOperator = 'YES' ) C Order By C.StepID DESC", strUserCode);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();
    }

    protected void LoadMyWorkFlow(string strUserCode)
    {
        string strHQL;

        strHQL = "Select WLID,WLName,Status From T_WorkFlow Where CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " and Status <> '结案'";
        strHQL += " Order By WLID DESC";
        DataSet ds = new DataSet();

        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlow");
        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
    }


    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;

        string strHQL;
        string strUserCode;
 
        strUserCode = Session["UserCode"].ToString();

        strHQL = "Select WLID,WLName,Status From T_WorkFlow Where CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " and Status <> '结案'";
        strHQL += " Order By WLID DESC";
        DataSet ds = new DataSet();

        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlow");
        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();
    }

    protected void DataGrid6_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid6.CurrentPageIndex = e.NewPageIndex;

        string strUserCode;

        strUserCode = Session["UserCode"].ToString();


        string strHQL;

        strHQL = string.Format(@"Select * From (Select A.ID,A.StepID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B 
                 Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') 
                 And B.Status Not In ('修改中','关闭','通过','结案') And (trim(A.OperatorCode) = '{0}' Or A.OperatorCode in ( Select UserCode From T_MemberLevel Where UnderCode <> UserCode and UnderCode = '{0}' and AgencyStatus = 1))
																 And A.IsOperator = 'YES' ) C Order By C.StepID DESC", strUserCode);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();
    }

}