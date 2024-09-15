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


using NickLee.Views.Web.UI;
using NickLee.Views.Windows.Forms.Printing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTPersonalSpaceNews : System.Web.UI.Page
{
    int intRunNumber;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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
        string strHQL, strID, strNewsType;
        string strUserCode, strDepartCode, strUserType;
        string strPageName;

        strUserCode = Session["UserCode"].ToString();
        strUserType = Session["UserType"].ToString();

        strID = Request.QueryString["ID"];
        strNewsType = Request.QueryString["Type"];
        strDepartCode = ShareClass.GetDepartCodeFromUserCode(strUserCode);

        if (strID == null & strNewsType == null)
        {
            strHQL = "Select ID,Title,Content From T_HeadLine ";
            strHQL += " Where (RelatedDepartCode in (select ParentDepartCode from F_GetParentDepartCode(" + "'" + strDepartCode + "'" + "))  or RelatedDepartCode = '" + strDepartCode + "')";
            if (strUserType == "INNER")
            {
                //strHQL += " And Type = '内部'";
            }
            else
            {
                strHQL += " And Type = '外部'";
            }
            strHQL += " and Status = '发布' and IsHead = 'YES'";
            strHQL += " Order By ID DESC limit 1";
            DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_HeadLine");
            if (ds.Tables[0].Rows.Count > 0)
            {
                strID = ds.Tables[0].Rows[0][0].ToString().Trim();

                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
            else
            {
                strPageName = GetFirstTypeForNewsAndNotice();
                if (strPageName != "")
                {
                    Response.Redirect(GetFirstTypeForNewsAndNotice());
                }
            }
        }
        else if (strID == null & strNewsType != null)
        {
            strHQL = "Select ID,Title,Content From T_HeadLine ";
            strHQL += " Where (RelatedDepartCode in (select ParentDepartCode from F_GetParentDepartCode(" + "'" + strDepartCode + "'" + "))  or RelatedDepartCode = '" + strDepartCode + "')";
            if (strUserType == "INNER")
            {
                //strHQL += " And Type = '内部'";
            }
            else
            {
                strHQL += " And Type = '外部'";
            }
            strHQL += " and NewsType = '" + strNewsType + "'";
            strHQL += " and Status = '发布' and IsHead != 'YES'";
            strHQL += " Order By ID DESC Limit 1";
            DataSet ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_HeadLine");
            if (ds.Tables[0].Rows.Count > 0)
            {
                strID = ds.Tables[0].Rows[0][0].ToString().Trim();

                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
            else
            {
                strPageName = GetFirstTypeForNewsAndNotice();
                if (strPageName != "")
                {
                    Response.Redirect(GetFirstTypeForNewsAndNotice());
                }
            }
        }
        else
        {
            strHQL = "Select ID,Title,Content From T_HeadLine Where ID = " + strID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_HeadLine");

            DataList1.DataSource = ds;
            DataList1.DataBind();

            UpdateNewsReadLog(strID, strUserCode);
        }
    }

    protected string GetFirstTypeForNewsAndNotice()
    {
        string strHtml = string.Empty;
        string strHQL;
        DataSet ds;

        string strType,strTypeHomeName, strPageName;

        string strLangCode = Session["LangCode"].ToString();

        strHQL = "Select * From T_NewsType Where ";
        strHQL += " LangCode = " + "'" + strLangCode + "'";
        strHQL += " Order By SortNumber ASC";
        ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_NewsType");

        if (ds.Tables[0].Rows.Count > 0)
        {
            strType = ds.Tables[0].Rows[0]["Type"].ToString().Trim();
            strTypeHomeName = ds.Tables[0].Rows[0]["HomeName"].ToString().Trim();
            strPageName = ds.Tables[0].Rows[0]["PageName"].ToString().Trim();

            return strPageName + "?Type=" + strType + "&HomeName=" + strTypeHomeName;
        }
        else
        {
            strHQL = "Select * From T_NewsType Where ";
            strHQL += " LangCode = 'zh-CN'";
            strHQL += " Order By SortNumber ASC";
            ds = ShareClass.GetDataSetFromSqlNOOperateLog(strHQL, "T_NewsType");

            if (ds.Tables[0].Rows.Count > 0)
            {
                strType = ds.Tables[0].Rows[0]["Type"].ToString().Trim();
                strTypeHomeName = ds.Tables[0].Rows[0]["HomeName"].ToString().Trim();
                strPageName = ds.Tables[0].Rows[0]["PageName"].ToString().Trim();

                return strPageName + "?Type=" + strType + "&HomeName=" + strTypeHomeName;
            }
            else
            {
                return "";
            }
        }
    }

    private void UpdateNewsReadLog(string strNewsID, string strUserCode)
    {
        string strHQL1, strHQL2;

        strHQL1 = "Select ID From T_NewsRelatedUser Where NewsID = " + strNewsID;
        strHQL1 += " and UserCode = " + "'" + strUserCode + "'";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL1, "T_NewsRelatedUser");

        if (ds.Tables[0].Rows.Count == 0)
        {
            strHQL2 = "Insert Into T_NewsRelatedUser(NewsID,UserCode,ReadTime) Values (" + strNewsID + "," + "'" + strUserCode + "'" + ",now())";
            ShareClass.RunSqlCommand(strHQL2);
        }
    }
}
