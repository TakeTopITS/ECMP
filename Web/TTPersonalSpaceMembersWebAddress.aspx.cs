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

public partial class TTPersonalSpaceMembersWebAddress : System.Web.UI.Page
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

            Timer1.Interval = 3600000;

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
            LoadMyMemberList(strUserCode);

            LoadWebSite(strUserCode);

            LoadMemberAgencyList(strUserCode);
            LoadMyDepartmentMember(strUserCode);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile(err.Message.ToString());
        }
    }


    protected void DL_MemberAgency_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        string strAgencyCode, strUserCode, strAgencyName;

        strAgencyCode = DL_MemberAgency.SelectedValue.Trim();
        strAgencyName = ShareClass.GetUserName(strAgencyCode);

        strUserCode = Session["UserCode"].ToString();

        strHQL = "Update T_MemberLevel Set AgencyStatus = 1 Where UserCode = " + "'" + strUserCode + "'" + " and UnderCode = " + "'" + strAgencyCode + "'";
        ShareClass.RunSqlCommand(strHQL);


        strHQL = "Update T_MemberLevel Set AgencyStatus = 0 Where UserCode = " + "'" + strUserCode + "'" + " and UnderCode <> " + "'" + strAgencyCode + "'";
        ShareClass.RunSqlCommand(strHQL);

        if (strUserCode != strAgencyCode)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZYSZSTRAGENCYNAMEWNDGZLSPDLRXZXSWNZJJK + "');</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + Resources.lang.ZZYXGZLSPDL + "');</script>");
        }
    }


    protected void LoadMyMemberList(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectMember as projectMember where projectMember.UserCode in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ") Order By projectMember.SortNumber ASC";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        lst = projectMemberBLL.GetAllProjectMembers(strHQL);
        RP_MyMemberList.DataSource = lst;
        RP_MyMemberList.DataBind();
    }

    protected void LoadMemberAgencyList(string strUserCode)
    {
        string strHQL;

        strHQL = "select A.UnderCode as UserCode,B.UserName as UserName From T_MemberLevel A,T_ProjectMember B Where A.UnderCode = B.UserCode and A.UserCode = " + "'" + strUserCode + "'";
        strHQL += " Order by A.AgencyStatus DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_MemberLevel");

        DL_MemberAgency.DataSource = ds;
        DL_MemberAgency.DataBind();
    }

    protected void LoadMyDepartmentMember(string strUserCode)
    {
        string strHQL;
        IList lst;

        string strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strHQL = "from ProjectMember as projectMember where projectMember.DepartCode= " + "'" + strDepartCode + "'" + " Order By projectMember.SortNumber ASC";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        lst = projectMemberBLL.GetAllProjectMembers(strHQL);

        RP_MyDepartmentMember.DataSource = lst;
        RP_MyDepartmentMember.DataBind();
    }

    protected void LoadWebSite(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From WebSite as webSite where webSite.UserCode = " + "'" + strUserCode + "'";
        strHQL += " Order By webSite.SortNumber ASC";
        WebSiteBLL webSiteBLL = new WebSiteBLL();
        lst = webSiteBLL.GetAllWebSites(strHQL);

        RP_WebSite.DataSource = lst;
        RP_WebSite.DataBind();
    }



}