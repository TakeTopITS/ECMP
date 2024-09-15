using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TTProjectMemberManHourSummaryReportForAlone : System.Web.UI.Page
{
    private string strProjectID, strProjectName;

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode;

        strProjectID = Request.QueryString["ProjectID"];
        strProjectName = ShareClass.GetProjectName(strProjectID);

        strUserCode = Session["UserCode"].ToString();

        LB_ReportName.Text = Resources.lang.XiangMu + ": " + strProjectID + " " + strProjectName + " 成员工时汇总表";

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            string strHQL;

            strHQL = "Select UserCode,UserName,DepartCode,DepartName,ProjectID,Sum(ManHour) as ManHour,Sum(ConfirmManHour) as ConfirmManHour  From V_ProjectMemberManHourSummary";
            strHQL += " Where ProjectID = " + strProjectID;
            strHQL += " Group by UserCode,UserName,DepartCode,DepartName,ProjectID";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DailyWork");
            DataList1.DataSource = ds;
            DataList1.DataBind();

            SumManHour(ds);
        }
    }

    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strOpretorName;

        strOpretorName = "%" + TB_MemberName.Text.Trim() + "%";

        strHQL = "Select UserCode,UserName,DepartCode,DepartName,ProjectID,Sum(ManHour) as ManHour,Sum(ConfirmManHour) as ConfirmManHour  From V_ProjectMemberManHourSummary";
        strHQL += " Where ProjectID = " + strProjectID + " and UserName Like " + "'" + strOpretorName + "'"; ;
        strHQL += " Group by UserCode,UserName,DepartCode,DepartName,ProjectID";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DailyWork");
        DataList1.DataSource = ds;
        DataList1.DataBind();

        SumManHour(ds);
    }

    protected void SumManHour(DataSet ds)
    {
        decimal deTotalManHour = 0, DeTotalConfirmManHour = 0;

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            deTotalManHour += decimal.Parse(ds.Tables[0].Rows[i][5].ToString());
            DeTotalConfirmManHour += decimal.Parse(ds.Tables[0].Rows[i][6].ToString());
        }

        LB_TotalManHour.Text = deTotalManHour.ToString();
        LB_TotalConfirmManHour.Text = DeTotalConfirmManHour.ToString();
    }

    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strOpretorName;

        strOpretorName = "%" + TB_MemberName.Text.Trim() + "%";

        strHQL = @"Select DepartCode as '部门',
                   UserName as '姓名',
                   DepartCode as '部门代码',
                   DepartName as '部门名称',
                   ProjectID as '项目ID',
                   Sum(ManHour) as '工时',
                   sum(ConfirmManHour) as '确认工时'
                   From V_ProjectMemberManHourSummary";

        strHQL += " Where ProjectID = " + strProjectID + " and UserName Like " + "'" + strOpretorName + "'"; ;
        strHQL += " Group by UserCode,UserName,DepartCode,DepartName,ProjectID";

        DataTable dtProject = ShareClass.GetDataSetFromSql(strHQL, "project").Tables[0];

        Export3Excel(dtProject, Resources.lang.XiangMu + ": " + strProjectID + " " + strProjectName + " 成员工时汇总表.xls");

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('导出成功！');", true);
    }

    public void Export3Excel(DataTable dtData, string strFileName)
    {
        DataGrid dgControl = new DataGrid();
        dgControl.DataSource = dtData;
        dgControl.DataBind();

        Response.Clear();
        Response.Buffer = true;
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + strFileName);
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        Response.ContentType = "application/shlnd.ms-excel";
        Response.Charset = "GB2312";
        EnableViewState = false;
        System.Globalization.CultureInfo mycitrad = new System.Globalization.CultureInfo("ZH-CN", true);
        System.IO.StringWriter ostrwrite = new System.IO.StringWriter(mycitrad);
        System.Web.UI.HtmlTextWriter ohtmt = new HtmlTextWriter(ostrwrite);
        dgControl.RenderControl(ohtmt);
        Response.Clear();
        Response.Write("<meta http-equiv=\"content-type\" content=\"application/ms-excel; charset=gb2312\"/>" + ostrwrite.ToString());
        Response.End();
    }
}