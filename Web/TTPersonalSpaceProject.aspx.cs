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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTPersonalSpaceProject : System.Web.UI.Page
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
            LoadMyProjectList(strUserCode);
            LoadInvolvedProjectList(strUserCode);
            LoadCreateProjectList(strUserCode);
        }
        catch (Exception err)
        {
            LogClass.WriteLogFile(err.Message.ToString());
        }
    }

    protected void LoadMyProjectList(string strUserCode)
    {
        string strHQL;

        strHQL = "Select * from T_Project as project where project.PMCode = " + "'" + strUserCode + "'" + " and project.Status not in ('新建',  '隐藏','删除','归档')  Order by project.ProjectID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Project");
        DataGrid2.DataSource = ds;
        DataGrid2.DataBind();
    }

    protected void LoadInvolvedProjectList(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProRelatedUser as proRelatedUser where proRelatedUser.UserCode = " + "'" + strUserCode + "'" + " and proRelatedUser.PMCode <> " + "'" + strUserCode + "'" + "  and proRelatedUser.ProStatus not in ('新建','评审','隐藏','删除','归档','暂停','终止') Order by proRelatedUser.ProjectID DESC";
        ProRelatedUserBLL proRelatedUserBLL = new ProRelatedUserBLL();
        lst = proRelatedUserBLL.GetAllProRelatedUsers(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }

    protected void LoadCreateProjectList(string strUserCode)
    {
        string strHQL;

        strHQL = "select C.*,COALESCE(D.TotalBL,0) PercentRea from T_Project C left join (select A.ProjectID,COALESCE(B.TotalRea,0)/CASE WHEN A.Total = 0 Then 1 END as TotalBL from (select " +
                "ProjectID,SUM(Total) Total from T_ProjectCostManage Where Type='基础' group by ProjectID) A left join (select ProjectID,SUM(Total) TotalRea from " +
                "T_ProjectCostManage where Type='操作' group by ProjectID) B on A.ProjectID=B.ProjectID) D on C.ProjectID=D.ProjectID where C.UserCode='" + strUserCode + "' and " +
                "C.Status not in ('新建','隐藏','删除','归档') Order by C.ProjectID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectCost");
        DataGrid8.DataSource = ds;
        DataGrid8.DataBind();
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strUserCode;

        strUserCode = Session["UserCode"].ToString();


        string strHQL = "from Project as project where project.PMCode = " + "'" + strUserCode + "'" + " and project.Status not in ('新建',  '隐藏','删除','归档')  Order by project.ProjectID DESC";

        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void DataGrid4_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid4.CurrentPageIndex = e.NewPageIndex;

        string strUserCode;

        strUserCode = Session["UserCode"].ToString();


        string strHQL = "from ProRelatedUser as proRelatedUser where proRelatedUser.UserCode = " + "'" + strUserCode + "'" + " and proRelatedUser.PMCode <> " + "'" + strUserCode + "'" + "  and proRelatedUser.ProStatus not in ('新建','评审','隐藏','删除','归档','暂停','终止') Order by proRelatedUser.ProjectID DESC";

        ProjectBLL projectBLL = new ProjectBLL();
        IList lst = projectBLL.GetAllProjects(strHQL);

        DataGrid4.DataSource = lst;
        DataGrid4.DataBind();
    }



    protected void DataGrid8_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid8.CurrentPageIndex = e.NewPageIndex;

        string strUserCode;
        strUserCode = Session["UserCode"].ToString();


        string strHQL;
        strHQL = "select C.*,COALESCE(D.TotalBL,0) PercentRea from T_Project C left join (select A.ProjectID,COALESCE(B.TotalRea,0)/CASE WHEN A.Total = 0 Then 1 END as TotalBL from (select " +
                "ProjectID,SUM(Total) Total from T_ProjectCostManage Where Type='基础' group by ProjectID) A left join (select ProjectID,SUM(Total) TotalRea from " +
                "T_ProjectCostManage where Type='操作' group by ProjectID) B on A.ProjectID=B.ProjectID) D on C.ProjectID=D.ProjectID where C.UserCode='" + strUserCode + "' and " +
                "C.Status not in ('新建','隐藏','删除','归档') Order by C.ProjectID DESC";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ProjectCost");
        DataGrid8.DataSource = ds;
        DataGrid8.DataBind();
    }


}

