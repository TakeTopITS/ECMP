using System;
using System.Resources;
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
using System.IO;
using System.Drawing;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAPPUserAttendanceRecordForMe : System.Web.UI.Page
{
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();

        string strSystemVersionType = Session["SystemVersionType"].ToString();
        string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];
        if (strSystemVersionType == "SAAS" || strProductType.IndexOf("SAAS") > -1)
        {
            Response.Redirect("TTAPPUserAttendanceRecordForMeSAAS.aspx");
        }

        bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadUserAttendanceRule(strUserCode);
            LoadAttendanceRecord(strUserCode);
        }
    }
    protected void LoadUserAttendanceRule(string strMemberCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From UserAttendanceRule as userAttendanceRule Where userAttendanceRule.UserCode = " + "'" + strMemberCode + "'";
        strHQL += " and COALESCE(userAttendanceRule.LeaderCode,'') = ''";
        strHQL += " Order by userAttendanceRule.ID DESC";
        UserAttendanceRuleBLL userAttendanceRuleBLL = new UserAttendanceRuleBLL();
        lst = userAttendanceRuleBLL.GetAllUserAttendanceRules(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }


    protected void LoadAttendanceRecord(string strUserCode)
    {
        string strHQL;

        string strDisplayType = DL_DisplayType.SelectedValue.Trim();

        if (strDisplayType == "显示异常")
        {
            strHQL = "Select * From T_UserAttendanceRecord  where ";
            strHQL += " (LateMinute <> 0 or EarlyMinute <> 0 or (MCheckInDistance > LargestDistance Or MCheckOutDistance > LargestDistance Or ACheckInDistance > LargestDistance Or ACheckOutDistance > LargestDistance Or NCheckInDistance > LargestDistance Or NCheckOutDistance > LargestDistance Or OCheckInDistance > LargestDistance Or OCheckOutDistance > LargestDistance))";
            strHQL += " and UserCode = " + "'" + strUserCode + "'";
            strHQL += " and COALESCE(LeaderCode,'')= ''";
            strHQL += " Order by to_char(AttendanceDate,'yyyymmdd') DESC";
        }
        else
        {
            strHQL = "Select * From T_UserAttendanceRecord  where";
            strHQL += " UserCode = " + "'" + strUserCode + "'";
            strHQL += " and COALESCE(LeaderCode,'')= ''";
            strHQL += " Order by to_char(AttendanceDate,'yyyymmdd') DESC";
        }
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserAttendanceRecord");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        LB_PageIndex.Text = "1";
        LB_TotalPageNumber.Text = DataGrid1.PageCount.ToString();
    }

    protected void DL_DisplayType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strHQL;

        string strDisplayType = DL_DisplayType.SelectedValue.Trim();

        if (strDisplayType == "显示异常")
        {
            strHQL = "Select * From T_UserAttendanceRecord  where ";
            strHQL += " (LateMinute <> 0 or EarlyMinute <> 0 or (MCheckInDistance > LargestDistance Or MCheckOutDistance > LargestDistance Or ACheckInDistance > LargestDistance Or ACheckOutDistance > LargestDistance Or NCheckInDistance > LargestDistance Or NCheckOutDistance > LargestDistance Or OCheckInDistance > LargestDistance Or OCheckOutDistance > LargestDistance))";
            strHQL += " and UserCode = " + "'" + strUserCode + "'";
            strHQL += " and COALESCE(LeaderCode,'')= ''";
            strHQL += " Order by to_char(AttendanceDate,'yyyymmdd') DESC";
        }
        else
        {
            strHQL = "Select * From T_UserAttendanceRecord  where";
            strHQL += " UserCode = " + "'" + strUserCode + "'";
            strHQL += " and COALESCE(LeaderCode,'')= ''";
            strHQL += " Order by to_char(AttendanceDate,'yyyymmdd') DESC";
        }

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserAttendanceRecord");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        LB_PageIndex.Text = "1";
        LB_TotalPageNumber.Text = DataGrid1.PageCount.ToString();
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserAttendanceRecord");

        DataGrid1.DataSource = ds;
        DataGrid1.DataBind();

        LB_Sql.Text = strHQL;

        LB_PageIndex.Text = (e.NewPageIndex + 1).ToString();
    }


}
