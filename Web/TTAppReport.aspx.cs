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

using System.ComponentModel;
using System.Web.SessionState;
using System.Drawing.Imaging;

using ZedGraph;
using ZedGraph.Web;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAppReport : System.Web.UI.Page
{
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();


        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;


        if (Page.IsPostBack != true)
        {
            LoadUNReadReport(strUserCode);
            LoadReadReport(strUserCode);
        }
    }

    protected void DataGrid1_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            string strReportID, strReportURL;

            if (e.CommandName != "Page")
            {
                strReportID = e.Item.Cells[0].Text;

                if (e.CommandName == "Open")
                {
                    strHQL = "Select ReportURL From T_Report Where ID = " + strReportID;
                    DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Reoprt");
                    strReportURL = ds.Tables[0].Rows[0][0].ToString().Trim();

                    if (strReportURL.IndexOf(".mrt") > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "popShowByURL('TTReportView.aspx?ReportID=" + strReportID + "', 'Report', 800, 600,window.location);", true);
                    }
                    else
                    {
                        strReportURL = strReportURL.Replace(@"\", @"//");
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "popShowByURL('" + strReportURL + "', 'Report', 800, 600,window.location);", true);
                    }


                    strHQL = "Update T_ReportRelatedUser Set Status = '已阅' Where ReportID = " + strReportID + " and UserCode = " + "'" + strUserCode + "'";
                    ShareClass.RunSqlCommand(strHQL);
                }
            }
        }
    }

    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strHQL;
            string strReportID, strReportURL;

            if (e.CommandName != "Page")
            {
                strReportID = e.Item.Cells[0].Text;

                if (e.CommandName == "Open")
                {
                    strHQL = "Select ReportURL From T_Report Where ID = " + strReportID;
                    DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_Reoprt");
                    strReportURL = ds.Tables[0].Rows[0][0].ToString().Trim();

                    if (strReportURL.IndexOf(".mrt") > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "popShowByURL('TTReportView.aspx?ReportID=" + strReportID + "', 'Report', 800, 600,window.location);", true);
                    }
                    else
                    {
                        strReportURL = strReportURL.Replace(@"\", @"//");
                        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "popShowByURL('" + strReportURL + "', 'Report', 800, 600,window.location);", true);
                    }


                    //strHQL = "Update T_ReportRelatedUser Set Status = '已阅' Where ReportID = " + strReportID + " and UserCode = " + "'" + strUserCode + "'";
                    //ShareClass.RunSqlCommand(strHQL);
                }
            }
        }
    }



    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql1.Text;
        IList lst;

        ReportBLL reportBLL = new ReportBLL();
        lst = reportBLL.GetAllReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql2.Text;
        IList lst;

        ReportBLL reportBLL = new ReportBLL();
        lst = reportBLL.GetAllReports(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }


    protected void LoadUNReadReport(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From Report as report  where ";
        strHQL += " report.ID in (Select reportRelatedUser.ReportID From ReportRelatedUser as reportRelatedUser Where reportRelatedUser.Status = '新建' and reportRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " Order By report.ID DESC";
        ReportBLL reportBLL = new ReportBLL();
        lst = reportBLL.GetAllReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;
    }

    protected void LoadReadReport(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From Report as report  where ";
        strHQL += " report.ID in (Select reportRelatedUser.ReportID From ReportRelatedUser as reportRelatedUser Where reportRelatedUser.Status = '已阅' and reportRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " Order By report.ID DESC";
        ReportBLL reportBLL = new ReportBLL();
        lst = reportBLL.GetAllReports(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql2.Text = strHQL;
    }



}