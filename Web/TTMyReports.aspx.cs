using System;
using System.Resources;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTMyReports : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "我的报表", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickB", "autoheight();", true);
        if (Page.IsPostBack == false)
        {
            LoadReportType();

            LoadAllReportTemplate();

            LoadUNReadReport(strUserCode);
            LoadReadReport(strUserCode);
        }
    }

    protected void LLB_ReportType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strReportType;

        strReportType = LLB_ReportType.SelectedValue.Trim();

        LoadReportTemplate(strReportType);

        LoadReportByType(strReportType, strUserCode);
    }

    protected void LLB_ReportTemplate_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strTemID, strReportType, strTemName;


        strTemID = LLB_ReportTemplate.SelectedValue;
        strReportType = LLB_ReportType.SelectedValue.Trim();
        strTemName = LLB_ReportTemplate.SelectedItem.Text.Trim();

        strHQL = "From ReportTemplate as reportTemplate where reportTemplate.ID = " + strTemID;
        ReportTemplateBLL reportTemplateBLL = new ReportTemplateBLL();
        lst = reportTemplateBLL.GetAllReportTemplates(strHQL);
        ReportTemplate reportTemplate = (ReportTemplate)lst[0];

        LoadReportByTem(strTemName, strUserCode);
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
                }

                if (e.CommandName == "Read")
                {
                    strHQL = "Update T_ReportRelatedUser Set Status = '已阅' Where ReportID = " + strReportID + " and UserCode = " + "'" + strUserCode + "'";
                    ShareClass.RunSqlCommand(strHQL);

                    LoadUNReadReport(strUserCode);
                    LoadReadReport(strUserCode);
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

    protected void LoadReportType()
    {
        string strHQL;
        IList lst;

        DataGrid1.CurrentPageIndex = 0;

        strHQL = "from ReportType as reportType Where reportType.Type In (Select report.ReportType From Report as report Where  ";
        strHQL += " report.ID in (Select reportRelatedUser.ReportID From ReportRelatedUser as reportRelatedUser Where reportRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " Order By reportType.SortNumber ASC";
        ReportTypeBLL reportTypeBLL = new ReportTypeBLL();
        lst = reportTypeBLL.GetAllReportTypes(strHQL);

        LLB_ReportType.DataSource = lst;
        LLB_ReportType.DataBind();
    }

    protected void LoadReportTemplate(string strReportType)
    {
        string strHQL;

        DataGrid1.CurrentPageIndex = 0;

        strHQL = "Select * From T_ReportTemplate as reportTemplate where reportTemplate.ReportType = " + "'" + strReportType + "'";
        strHQL += " and reportTemplate.TemName In (Select TemName From T_Report Where ID in (Select reportRelatedUser.ReportID From T_ReportRelatedUser as reportRelatedUser Where reportRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))"; 
        strHQL += " Order By reportTemplate.ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ReportTemplate");

        LLB_ReportTemplate.DataSource = ds;
        LLB_ReportTemplate.DataBind();
    }

    protected void LoadAllReportTemplate()
    {
        string strHQL;

        DataGrid1.CurrentPageIndex = 0;

        strHQL = "Select * From T_ReportTemplate as reportTemplate where ";
        strHQL += " reportTemplate.TemName In (Select TemName From T_Report Where ID in (Select reportRelatedUser.ReportID From T_ReportRelatedUser as reportRelatedUser Where reportRelatedUser.UserCode = " + "'" + strUserCode + "'" + "))";
        strHQL += " Order By reportTemplate.ID DESC";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ReportTemplate");

        LLB_ReportTemplate.DataSource = ds;
        LLB_ReportTemplate.DataBind();
    }

    protected void LoadReportByTem(string strReportTemplate, string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From Report as report Where report.TemName = " + "'" + strReportTemplate + "'";
        strHQL += " and report.ID in (Select reportRelatedUser.ReportID From ReportRelatedUser as reportRelatedUser Where reportRelatedUser.Status = '新建' and  reportRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " Order By report.ID DESC";
        ReportBLL reportBLL = new ReportBLL();
        lst = reportBLL.GetAllReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;


        strHQL = "From Report as report Where report.TemName = " + "'" + strReportTemplate + "'";
        strHQL += " and report.ID in (Select reportRelatedUser.ReportID From ReportRelatedUser as reportRelatedUser Where reportRelatedUser.Status = '已阅' and reportRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " Order By report.ID DESC";
        lst = reportBLL.GetAllReports(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql2.Text = strHQL;

    }

    protected void LoadReportByType(string strReportType, string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From Report as report Where report.ReportType = " + "'" + strReportType + "'";
        strHQL += " and report.ID in (Select reportRelatedUser.ReportID From ReportRelatedUser as reportRelatedUser Where reportRelatedUser.Status = '新建' and  reportRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " Order By report.ID DESC";
        ReportBLL reportBLL = new ReportBLL();
        lst = reportBLL.GetAllReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;

        strHQL = "From Report as report Where report.ReportType = " + "'" + strReportType + "'";
        strHQL += " and report.ID in (Select reportRelatedUser.ReportID From ReportRelatedUser as reportRelatedUser Where reportRelatedUser.Status = '已阅' and reportRelatedUser.UserCode = " + "'" + strUserCode + "'" + ")";
        strHQL += " Order By report.ID DESC";
        lst = reportBLL.GetAllReports(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();

        LB_Sql2.Text = strHQL;
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