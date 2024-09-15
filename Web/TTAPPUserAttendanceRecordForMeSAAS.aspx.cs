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


public partial class TTAPPUserAttendanceRecordForMeSAAS : System.Web.UI.Page
{
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();

        if (Page.IsPostBack == false)
        {
            LoadUserAttendanceRule(strUserCode);
        }
    }
   
    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        IList lst;

        string strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

        for (int i = 0; i < DataGrid3.Items.Count; i++)
        {
            DataGrid3.Items[i].ForeColor = Color.Black;
        }

        e.Item.ForeColor = Color.Red;

        strHQL = "From UserAttendanceRule as userAttendanceRule Where userAttendanceRule.ID = " + strID;
        UserAttendanceRuleBLL userAttendanceRuleBLL = new UserAttendanceRuleBLL();
        lst = userAttendanceRuleBLL.GetAllUserAttendanceRules(strHQL);

        UserAttendanceRule userAttendanceRule = (UserAttendanceRule)lst[0];

        string strLeaderCode = userAttendanceRule.LeaderCode.Trim();
        string strDisplayType = DL_DisplayType.SelectedValue.Trim();

        LB_LeaderCode.Text = strLeaderCode;

        if (strDisplayType == "显示异常")
        {
            strHQL = "Select * From T_UserAttendanceRecord  where ";
            strHQL += " (LateMinute <> 0 or EarlyMinute <> 0 or (MCheckInDistance > LargestDistance Or MCheckOutDistance > LargestDistance Or ACheckInDistance > LargestDistance Or ACheckOutDistance > LargestDistance Or NCheckInDistance > LargestDistance Or NCheckOutDistance > LargestDistance Or OCheckInDistance > LargestDistance Or OCheckOutDistance > LargestDistance))";
            strHQL += " and UserCode = " + "'" + strUserCode + "'";
            strHQL += " and LeaderCode = '" + strLeaderCode + "'";
            strHQL += " Order by to_char(AttendanceDate,'yyyymmdd') DESC";
        }
        else
        {
            strHQL = "Select * From T_UserAttendanceRecord  where";
            strHQL += " UserCode = " + "'" + strUserCode + "'";
            strHQL += " and LeaderCode = '" + strLeaderCode + "'";
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

        string strLeaderCode = LB_LeaderCode.Text.Trim();
        string strDisplayType = DL_DisplayType.SelectedValue.Trim();

        if (strLeaderCode == "")
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZQXXZSMDKQGUIZE + "')", true);
            return;
        }

        if (strDisplayType == "显示异常")
        {
            strHQL = "Select * From T_UserAttendanceRecord  where ";
            strHQL += " (LateMinute <> 0 or EarlyMinute <> 0 or (MCheckInDistance > LargestDistance Or MCheckOutDistance > LargestDistance Or ACheckInDistance > LargestDistance Or ACheckOutDistance > LargestDistance Or NCheckInDistance > LargestDistance Or NCheckOutDistance > LargestDistance Or OCheckInDistance > LargestDistance Or OCheckOutDistance > LargestDistance))";
            strHQL += " and UserCode = " + "'" + strUserCode + "'";
            strHQL += " and LeaderCode = '" + strLeaderCode + "'";
            strHQL += " Order by to_char(AttendanceDate,'yyyymmdd') DESC";
        }
        else
        {
            strHQL = "Select * From T_UserAttendanceRecord  where";
            strHQL += " UserCode = " + "'" + strUserCode + "'";
            strHQL += " and LeaderCode = '" + strLeaderCode + "'";
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

    protected void LoadUserAttendanceRule(string strMemberCode)
    {
        string strHQL;
        IList lst;

        strHQL = "From UserAttendanceRule as userAttendanceRule Where userAttendanceRule.UserCode = " + "'" + strMemberCode + "'";
        strHQL += " and char_length(rtrim(userAttendanceRule.LeaderCode)) > 0";
        strHQL += " and userAttendanceRule.UserCode <> userAttendanceRule.LeaderCode";
        strHQL += " Order by userAttendanceRule.ID DESC";
        UserAttendanceRuleBLL userAttendanceRuleBLL = new UserAttendanceRuleBLL();
        lst = userAttendanceRuleBLL.GetAllUserAttendanceRules(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }


}
