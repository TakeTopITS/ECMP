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

public partial class TTPersonalSpaceNewsList : System.Web.UI.Page
{
    int intRunNumber;

    protected void Page_Load(object sender, EventArgs e)
    {
        LB_NewsTypeName.Text = Request.QueryString["HomeName"];

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

        string strNewsType;

        strNewsType = Request.QueryString["Type"];

        strUserCode = Session["UserCode"].ToString();
        strLangCode = Session["LangCode"].ToString();

        strUserName = Session["UserName"].ToString();
        strUserInfo = Resources.lang.YongHu + ": " + strUserCode + "  " + strUserName;
        //LB_SuperDepartString.Text = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);

        try
        {
            LoadHeadLine(strUserCode, strLangCode, strNewsType);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile(err.Message.ToString());
        }
    }

    protected void LoadHeadLine(string strUserCode, string strLangCode,string strNewsType)
    {
        string strHQL;
        string strID;
        int intNumber;

        string strDepartCode, strUserType;
        strUserType = Session["UserType"].ToString();

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strHQL = "Select ID,Title,Content,RelatedDepartName,PublisherCode,PublisherName,PublishTime From T_HeadLine ";
        strHQL += " Where (RelatedDepartCode in (select ParentDepartCode from F_GetParentDepartCode(" + "'" + strDepartCode + "'" + ")) or RelatedDepartCode = '" + strDepartCode + "')";
        strHQL += " and LangCode = " + "'" + strLangCode + "'";
        strHQL += " and NewsType = " + "'" + strNewsType + "'";
        if (strUserType == "INNER")
        {
            strHQL += " And Type = '内部'";
        }
        else
        {
            strHQL += " And Type = '外部'";
        }
        strHQL += " and Status = '发布' Order By ID DESC";



        DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_HeadLine");
        DataGrid9.DataSource = ds;
        DataGrid9.DataBind();
        LB_Sql9.Text = strHQL;

        for (int i = 0; i < DataGrid9.Items.Count; i++)
        {
            strID = DataGrid9.Items[i].Cells[0].Text;

            strHQL = "Select Count(*) From T_HeadLine Where ID =" + strID;
            strHQL += " And ID not in (Select NewsID From T_NewsRelatedUser Where UserCode = " + "'" + strUserCode + "'" + ")";
            ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_HeadLine");
            intNumber = int.Parse(ds.Tables[0].Rows[0][0].ToString());

            if (intNumber > 0)
            {
                DataGrid9.Items[i].ForeColor = Color.Red;
            }
            
        }
    }
  

    protected void DataGrid9_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid9.CurrentPageIndex = e.NewPageIndex;

        string strHQL;
        string strUserCode;
        strUserCode = Session["UserCode"].ToString();

        string strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strHQL = LB_Sql9.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_HeadLine");

        DataGrid9.DataSource = ds;
        DataGrid9.DataBind();
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