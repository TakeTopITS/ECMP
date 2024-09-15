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
using System.IO;

public partial class TTPersonalSpaceToDoList : System.Web.UI.Page
{
    int intRunNumber;

    protected void Page_Load(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack == false)
        {
            //LB_SuperDepartString.Text = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(Session["UserCode"].ToString());

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
            LoadFunInforDialBoxList(strLangCode);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile(err.Message.ToString());
        }
    }


    protected void LoadFunInforDialBoxList(string strLangCode)
    {
        string strHQL;

        strHQL = String.Format(@"Select * From T_FunInforDialBox Where Status = '启用' 
           and LangCode = '{0}'
           and LinkAddress In (Select PageName From T_ProModuleLevel Where LangCode = '{0}' and ModuleName In ( Select ModuleName From T_ProModule Where Visible = 'YES' And UserCode = '{1}'))
           and LinkAddress In (Select PageName From T_ProModuleLevel Where LangCode = '{0}' and (ParentModule In ( Select ModuleName From T_ProModule Where Visible = 'YES' And UserCode = '{1}') Or ParentModule =''))
           and LinkAddress In (Select PageName From T_ProModuleLevel Where LangCode = '{0}' and (Visible ='YES' and IsDeleted = 'NO'))
           Order By SortNumber Asc ", strLangCode, Session["UserCode"].ToString());
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_FunInforDialBox");

        RP_ToDoList.DataSource = ds;
        RP_ToDoList.DataBind();
    }

    protected string GetNumberCount(string strSQLCode)
    {
        string strHQL;
        string strSuperDepartString;
        string strUserCode;
        strUserCode = Session["UserCode"].ToString();

        strSuperDepartString = LB_SuperDepartString.Text.Trim();

        try
        {
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