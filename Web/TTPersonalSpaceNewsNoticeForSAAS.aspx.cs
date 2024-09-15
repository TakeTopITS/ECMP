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


public partial class TTPersonalSpaceNewsNoticeForSAAS : System.Web.UI.Page
{
    int intRunNumber;

    protected void Page_Load(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickParentA", "aHandlerForSpecialPopWindow();", true);
        if (Page.IsPostBack == false)
        {
            intRunNumber = 0;

            AsyncWork();

            //清空页面缓存，用于改变皮肤
            SetPageNoCache();
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
            LoadHeadLine(strUserCode,strLangCode);
            LoadCompanyNoticeList(strUserCode);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile(err.Message.ToString());
        }
    }

    protected void LoadHeadLine(string strUserCode,string strLangCode)
    {
        string strHQL;
        string strID;
        int intNumber;

     
        string strDepartCode;
        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strHQL = "Select ID,Title,Content,RelatedDepartName,PublisherCode,PublisherName,PublishTime From T_HeadLine ";
        strHQL += " Where (RelatedDepartCode in (select ParentDepartCode from F_GetParentDepartCode(" + "'" + strDepartCode + "'" + "))  or RelatedDepartCode = '" + strDepartCode + "')";
        strHQL += " and LangCode = " + "'" + strLangCode + "'";
        strHQL += " And Type = '内部' and Status = '发布' Order By ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_HeadLine");

        DataGrid9.DataSource = ds;
        DataGrid9.DataBind();

        LB_Sql9.Text = strHQL;

        for (int i = 0; i < DataGrid9.Items.Count; i++)
        {
            strID = DataGrid9.Items[i].Cells[0].Text;

            strHQL = "Select Count(*) From T_HeadLine Where ID =" + strID;
            strHQL += " And ID not in (Select NewsID From T_NewsRelatedUser Where UserCode = " + "'" + strUserCode + "'" + ")";
            strHQL += " And (RelatedDepartCode in (select ParentDepartCode from F_GetParentDepartCode(" + "'" + strDepartCode + "'" + "))  or RelatedDepartCode = '" + strDepartCode + "')";
            strHQL += " And Type = '内部' and Status = '发布' ";
            strHQL += " and LangCode = " + "'" + strLangCode + "'";
            ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_HeadLine");
            intNumber = int.Parse(ds.Tables[0].Rows[0][0].ToString());

            if (intNumber > 0)
            {
                DataGrid9.Items[i].ForeColor = Color.Red;
            }
        }
    }

    protected void LoadCompanyNoticeList(string strUserCode)
    {
        string strHQL;
        string strDocID, strDepartCode;
        int intNumber;

        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        strHQL = "Select DocID,DocType,DocName,Address,RelatedDepartName,UploadManCode,UploadManName,UploadTime From T_PublicNotice ";
        strHQL += " Where (RelatedDepartCode in (select ParentDepartCode from F_GetParentDepartCode(" + "'" + strDepartCode + "'" + "))  or RelatedDepartCode = '" + strDepartCode + "')";
        strHQL += " And Status = '发布' Order By DocID DESC";
        DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_PublicNotice");

        DataGrid7.DataSource = ds;
        DataGrid7.DataBind();

        LB_Sql7.Text = strHQL;

        for (int i = 0; i < DataGrid7.Items.Count; i++)
        {
            strDocID = DataGrid7.Items[i].Cells[0].Text;

            strHQL = "Select Count(*) From T_PublicNotice Where DocID =" + strDocID;
            strHQL += " And DocID not in (Select NoticeID From T_NoticeRelatedUser Where UserCode = " + "'" + strUserCode + "'" + ")";
            strHQL += " And (RelatedDepartCode in (select ParentDepartCode from F_GetParentDepartCode(" + "'" + strDepartCode + "'" + "))  or RelatedDepartCode = '" + strDepartCode + "')";
            strHQL += " And Status = '发布' ";
            ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_PublicNotice");
            intNumber = int.Parse(ds.Tables[0].Rows[0][0].ToString());

            if (intNumber > 0)
            {
                DataGrid7.Items[i].ForeColor = Color.Red;
            }
        }
    }

    protected void DataGrid7_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            string strID;

            string strUserCode;
            strUserCode = Session["UserCode"].ToString();

            strID = e.Item.Cells[0].Text.Trim();

            strHQL = "Insert Into T_NoticeRelatedUser(NoticeID,UserCode,ReadTime) Values (" + strID + "," + "'" + strUserCode + "'" + ",now())";
            ShareClass.RunSqlCommand(strHQL);

            LoadCompanyNoticeList(strUserCode);
        }
    }

    protected void DataGrid7_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid7.CurrentPageIndex = e.NewPageIndex;

        string strUserCode;
        strUserCode = Session["UserCode"].ToString();

        string strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        string strHQL = LB_Sql7.Text;

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_PublicNotice");

        DataGrid7.DataSource = ds;
        DataGrid7.DataBind();
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

        string strUserCode;
        strUserCode = Session["UserCode"].ToString();

        try
        {
            strHQL = strSQLCode.Trim().Replace("[TAKETOPUSERCODE]", strUserCode);

            DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "FunInforDialBoxList");

            return ds.Tables[0].Rows.Count.ToString();
        }
        catch
        {
            return "0";
        }
    }
}