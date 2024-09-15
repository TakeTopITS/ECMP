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

using System.Data.SqlClient;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTProjectMemberManHourReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode;

        //Session["UserCode"] = "C7094";

        strUserCode = Session["UserCode"].ToString();

        LB_ReportName.Text = "项目成员工时汇总表";


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            DLC_BeginDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_EndDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentTreeByAuthoritySuperUser(Resources.lang.ZZJGT,TreeView1, strUserCode);
            LB_DepartString.Text = strDepartString;

            ShareClass.InitialAllProjectTree(TreeView2, strDepartString);
        }
    }


    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strDepartName, strOpretorName,strProjectID, strProjectName;
        string strBeginTime, strEndTime;

        strProjectID = LB_ProjectID.Text.Trim();
        strDepartName = "%" + TB_BelongDepartName.Text.Trim() + "%";
        strOpretorName = "%" + TB_MemberName.Text.Trim() + "%";
        strProjectName = "%" + TB_ProjectName.Text.Trim() + "%";
        strBeginTime = DateTime.Parse(DLC_BeginDate.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndDate.Text).ToString("yyyyMMdd");

        strHQL = "Select UserCode,UserName,DepartCode,DepartName,ProjectID,ProjectName,sum(ManHour) as ManHour,sum(ConfirmManHour) as ConfirmManHour From V_ProjectMemberManHourSummary";
        strHQL += " Where DepartName Like " + "'" + strDepartName + "'";
        strHQL += " and UserName Like " + "'" + strOpretorName + "'";
        if (strProjectID != "")
        {
            strHQL += " and ProjectID = " + strProjectID;
        }
        else
        {
            strHQL += " and ProjectName Like '" + strProjectName + "'";
        }
        strHQL += " and to_char(WorkDate,'yyyymmdd') >= " + "'" + strBeginTime + "'";
        strHQL += " and to_char(WorkDate,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " Group By UserCode,UserName,DepartCode,DepartName,ProjectID,ProjectName";
        strHQL += " Order By ProjectID";
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DailyWork");
        DataList1.DataSource = ds;
        DataList1.DataBind();

        //LB_Sql.Text = strHQL;

        SumManHour(ds);
    }


    protected void BT_Export_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strDepartCode, strDepartName, strOpretorName, strProjectID, strProjectName;
        string strBeginTime, strEndTime;

        strProjectID = LB_ProjectID.Text;
        strDepartCode = "%" + LB_BelongDepartCode.Text.Trim() + "%";
        strDepartName = "%" + TB_BelongDepartName.Text.Trim() + "%";
        strOpretorName = "%" + TB_MemberName.Text.Trim() + "%";
        strProjectName = "%" + TB_ProjectName.Text.Trim() + "%";
        strBeginTime = DateTime.Parse(DLC_BeginDate.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndDate.Text).ToString("yyyyMMdd");

        strHQL = @"Select UserCode as '代码',
                   UserName as '姓名',
                   DepartCode as '部门代码',
                   DepartName as '部门名称',
                   ProjectID as '项目ID',
                   ProjectName as '项目',
                   sum(ManHour) as '申报工时',
                   sum(ConfirmManHour) as '确认工时'
                   From V_ProjectMemberManHourSummary";

        strHQL += " Where DepartName Like " + "'" + strDepartName + "'";
        strHQL += " and UserName Like " + "'" + strOpretorName + "'";
        if (strProjectID != "")
        {
            strHQL += " and ProjectID = " + strProjectID;
        }
        else
        {
            strHQL += " and ProjectName Like '" + strProjectName + "'";
        }
        strHQL += " and to_char(WorkDate,'yyyymmdd') >= " + "'" + strBeginTime + "'";
        strHQL += " and to_char(WorkDate,'yyyymmdd') <= " + "'" + strEndTime + "'";
        strHQL += " Group By UserCode,UserName,DepartCode,DepartName,ProjectID,ProjectName";
        strHQL += " Order By ProjectID";

        DataTable dtProject = ShareClass.GetDataSetFromSql(strHQL, "project").Tables[0];

        Export3Excel(dtProject, "项目成员工时汇总表.xls");

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('导出成功！');", true);
    }

    protected void SumManHour(DataSet ds)
    {
        decimal deTotalManHour = 0, DeTotalConfirmManHour = 0;

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            deTotalManHour += decimal.Parse(ds.Tables[0].Rows[i]["ManHour"].ToString());
            DeTotalConfirmManHour += decimal.Parse(ds.Tables[0].Rows[i]["ConfirmManHour"].ToString());
        }

        LB_TotalManHour.Text = deTotalManHour.ToString();
        LB_TotalConfirmManHour.Text = DeTotalConfirmManHour.ToString();
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strDepartCode, strDepartName;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView1.SelectedNode;

        if (treeNode.Target != "0")
        {
            strDepartCode = treeNode.Target.Trim();
            strDepartName = ShareClass.GetDepartName(strDepartCode);

            LB_BelongDepartCode.Text = strDepartCode;
            TB_BelongDepartName.Text = strDepartName;
        }
    }


    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        string strProjectID, strProjectName;

        TreeNode treeNode = new TreeNode();
        treeNode = TreeView2.SelectedNode;

        if (treeNode.Target != "0")
        {
            strProjectID = treeNode.Target;

            strProjectName = ShareClass.GetProjectName(strProjectID);

            LB_ProjectID.Text = strProjectID;
            TB_ProjectName.Text = strProjectName;
        }
    }

    protected void LoadProjectMembeManHour()
    {
        string strHQL;

        strHQL = "Select UserCode,UserName,DepartCode,DepartName,WorkDate,ProjectID,ProjectName,ManHour,ConfirmManHour From V_ProjectMemberManHourSummary";
        strHQL += " Order By WorkDate";

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_DailyWork");

        DataList1.DataSource = ds;
        DataList1.DataBind();

        SumManHour(ds);
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