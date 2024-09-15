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
using System.Text.RegularExpressions;

public partial class TTPersonalSpaceWorkflow : System.Web.UI.Page
{
    int intRunNumber;
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack == false)
        {
            LB_DepartString.Text = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthority(strUserCode);

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
        string strUserCode;
        String strLangCode;
        string strUserInfo, strUserName;

        strUserCode = Session["UserCode"].ToString();
        strLangCode = Session["LangCode"].ToString();

        strUserName = Session["UserName"].ToString();
        strUserInfo = Resources.lang.YongHu + ": " + strUserCode + "  " + strUserName;

        try
        {
           

            LoadWorkFlowList(strUserCode);
            LoadMyWorkFlow(strUserCode);

            LoadRegularWFList(LB_DepartString.Text);
            LoadDIYWFList(strLangCode, LB_DepartString.Text);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile(err.Message.ToString());
        }
    }

    protected void LoadRegularWFList(string strDepartString)
    {
        string strHQL;

        string strUserCode, strDepartCode;
        strUserCode = Session["UserCode"].ToString();

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strHQL = "select * from T_WorkFlowTemplate as workFlowTemplate Where workFlowTemplate.PageFile <> ''";
        strHQL += " and (BelongDepartCode in " + strDepartString;
        strHQL += " Or TemName in (Select TemName From T_WorkFlowTemplateBusinessMember Where UserCode = '" + strUserCode + "'))";
        strHQL += " Order by workFlowTemplate.SortNumber ASC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");

        RP_RegularWF.DataSource = ds;
        RP_RegularWF.DataBind();
    }

    protected void LoadDIYWFList(string strLongCode, string strDepartString)
    {
        string strHQL;
        String strLangCode;

        strLangCode = Session["LangCode"].ToString();

        string strUserCode, strDepartCode;
        strUserCode = Session["UserCode"].ToString();

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strHQL = "Select HomeName,ID From T_WLType Where  LangCode = " + "'" + strLangCode + "'";
        strHQL += " and Type In (Select Type From T_WorkFlowTemplate as workFlowTemplate Where XSNFile <> ''";
        strHQL += " and (BelongDepartCode in " + strDepartString;
        strHQL += " Or TemName in (Select TemName From T_WorkFlowTemplateBusinessMember Where UserCode = '" + strUserCode + "')))";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowTemplate");

        RP_DIYWF.DataSource = ds;
        RP_DIYWF.DataBind();
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

    protected void LoadWorkFlowList(string strUserCode)
    {
        string strHQL;

        strHQL = string.Format(@"Select * From (Select A.ID,A.StepID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B 
                 Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') 
                 And B.Status Not In ('修改中','关闭','通过','结案') And (trim(A.OperatorCode) = '{0}' Or A.OperatorCode in ( Select UserCode From T_MemberLevel Where UnderCode <> UserCode and UnderCode = '{0}' and AgencyStatus = 1))
																 And A.IsOperator = 'YES' ) C Order By C.StepID DESC", strUserCode);
        DataSet ds = new DataSet();
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();
    }

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;

        string strHQL;
        string strUserCode;
     
        strUserCode = Session["UserCode"].ToString();
        strHQL = "Select * From T_WorkFlow Where CreatorCode = " + "'" + strUserCode + "'";
        strHQL += " And Status <> '结案'";
        strHQL += " Order By WLID DESC";
        DataSet ds = new DataSet();
        ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");
        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "nTabs(this,1);','true') ", true);
    }

    protected void DataGrid6_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid6.CurrentPageIndex = e.NewPageIndex;

        string strHQL;

        string strUserCode;
        strUserCode = Session["UserCode"].ToString();
        strHQL = string.Format(@"Select * From (Select A.ID,A.StepID,A.WorkDetail,B.CreatorCode,B.CreatorName,A.Requisite,A.Operation,A.CheckingTime,A.WLID,Rtrim(cast(A.WLID as char(20))) || '. ' || B.WLName as WLName,B.Status From T_WorkFlowStepDetail A,T_WorkFlow B 
                 Where A.WLID = B.WLID And A.Status In ('处理中','审核中','会签中','复核中') 
                 And B.Status Not In ('修改中','关闭','通过','结案') And (trim(A.OperatorCode) = '{0}' Or A.OperatorCode in ( Select UserCode From T_MemberLevel Where UnderCode <> UserCode and UnderCode = '{0}' and AgencyStatus = 1))
																 And A.IsOperator = 'YES' ) C Order By C.StepID DESC", strUserCode);
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_WorkFlowDetail");

        DataGrid6.DataSource = ds;
        DataGrid6.DataBind();

        ScriptManager.RegisterStartupScript(UpdatePanel1, GetType(), "pop", "nTabs(this,2);','true') ", true);
    }




}