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

public partial class TTReportCenter : System.Web.UI.Page
{
    string strUserCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "BI分析中心", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickB", "autoheight();", true);
        if (Page.IsPostBack == false)
        {
            LB_DepartString.Text = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);

            LoadReportType();
            LoadReportTemplate();
            LoadReport();
        }
    }

    protected void LLB_ReportType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strReportType;

        strReportType = LLB_ReportType.SelectedValue.Trim();

        LoadReportTemplateByReportType(strReportType);

        LoadReportByType(strReportType);
    }

    protected void LLB_ReportTemplate_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strTemName;

         strTemName = LLB_ReportTemplate.SelectedItem.Text.Trim();

        LoadReportByTem(strTemName);
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

    protected void LoadReportType()
    {
        string strHQL;
        IList lst;

        DataGrid1.CurrentPageIndex = 0;

        strHQL = "from ReportType as reportType Where reportType.Type In (Select report.ReportType From Report as report Where  ";
        strHQL += " report.TemName in (Select reportTemplate.TemName From ReportTemplate as reportTemplate Where reportTemplate.BelongDepartCode In " + LB_DepartString.Text + "))";
        strHQL += " Order By reportType.SortNumber ASC";
        ReportTypeBLL reportTypeBLL = new ReportTypeBLL();
        lst = reportTypeBLL.GetAllReportTypes(strHQL);

        LLB_ReportType.DataSource = lst;
        LLB_ReportType.DataBind();
    }

    protected void LoadReportTemplateByReportType(string strReportType)
    {
        string strHQL;
        IList lst;

        DataGrid1.CurrentPageIndex = 0;

        strHQL = "From ReportTemplate as reportTemplate where reportTemplate.ReportType = " + "'" + strReportType + "'";
        strHQL += " and reportTemplate.BelongDepartCode In " + LB_DepartString.Text;
        strHQL += " and reportTemplate.TemName in (Select report.TemName From Report as report)";
        strHQL += " Order By reportTemplate.ID DESC";

        ReportTemplateBLL reportTemplateBLL = new ReportTemplateBLL();
        lst = reportTemplateBLL.GetAllReportTemplates(strHQL);

        LLB_ReportTemplate.DataSource = lst;
        LLB_ReportTemplate.DataBind();
    }

    protected void LoadReportTemplate()
    {
        string strHQL;
        IList lst;

        DataGrid1.CurrentPageIndex = 0;

        strHQL = "From ReportTemplate as reportTemplate where ";
        strHQL += " reportTemplate.BelongDepartCode In " + LB_DepartString.Text;
        strHQL += " and reportTemplate.TemName in (Select report.TemName From Report as report)";
        strHQL += " Order By reportTemplate.ID DESC";

        ReportTemplateBLL reportTemplateBLL = new ReportTemplateBLL();
        lst = reportTemplateBLL.GetAllReportTemplates(strHQL);

        LLB_ReportTemplate.DataSource = lst;
        LLB_ReportTemplate.DataBind();
    }

    protected void LoadReportByType(string strReportType)
    {
        string strHQL;
        IList lst;

        strHQL = "From Report as report Where report.ReportType = " + "'" + strReportType + "'";
        strHQL += " and report.TemName in (Select reportTemplate.TemName From ReportTemplate as reportTemplate Where reportTemplate.BelongDepartCode In " + LB_DepartString.Text + ")";
        strHQL += " Order By report.ID DESC";
        ReportBLL reportBLL = new ReportBLL();
        lst = reportBLL.GetAllReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;
    }


    protected void LoadReportByTem(string strReportTemplate)
    {
        string strHQL;
        IList lst;

        strHQL = "From Report as report Where report.TemName = " + "'" + strReportTemplate + "'";
        strHQL += " and report.TemName in (Select reportTemplate.TemName From ReportTemplate as reportTemplate Where reportTemplate.BelongDepartCode In " + LB_DepartString.Text + ")";
        strHQL += " Order By report.ID DESC";
        ReportBLL reportBLL = new ReportBLL();
        lst = reportBLL.GetAllReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;
    }

    protected void LoadReport()
    {
        string strHQL;
        IList lst;

        strHQL = "From Report as report Where ";
        strHQL += " report.TemName in (Select reportTemplate.TemName From ReportTemplate as reportTemplate Where reportTemplate.BelongDepartCode In " + LB_DepartString.Text + ")";
        strHQL += " Order By report.ID DESC";
        ReportBLL reportBLL = new ReportBLL();
        lst = reportBLL.GetAllReports(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        LB_Sql1.Text = strHQL;
    }

}