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

public partial class TTUserAttendanceReportSAAS : System.Web.UI.Page
{
    string strUserCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;


        string strUserName;
        strUserCode = Session["UserCode"].ToString();

        //this.Title = "员工考勤报表";

        LB_UserCode.Text = strUserCode;
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserName.Text = strUserName;

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack != true)
        {
            DLC_EndTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
            DLC_StartTime.Text = DateTime.Now.ToString("yyyy-MM-dd");

            string strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
            string strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

            strHQL = "Select * From T_UserAttendanceRecord  where to_char(AttendanceDate,'yyyymmdd') >= " + "'" + strStartTime + "'";
            strHQL += " and  to_char(AttendanceDate,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " and (LateMinute <> 0 or EarlyMinute <> 0";
            strHQL += " or (MCheckInDistance > LargestDistance Or MCheckOutDistance > LargestDistance Or ACheckInDistance > LargestDistance Or ACheckOutDistance > LargestDistance Or NCheckInDistance > LargestDistance Or NCheckOutDistance > LargestDistance Or OCheckInDistance > LargestDistance Or OCheckOutDistance > LargestDistance))";
            strHQL += " and LeaderCode = '" + strUserCode + "'";
            strHQL += " Order by to_char(AttendanceDate,'yyyymmdd') DESC";
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserAttendanceRecord");

            DataGrid3.DataSource = ds;
            DataGrid3.DataBind();

            LB_Sql.Text = strHQL;

            //LB_PageIndex.Text = "1";
            //LB_TotalPageNumber.Text = DataGrid3.PageCount.ToString();
        }
    }


    protected void BT_Find_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strUserName, strDisplayType, strStartTime, strEndTime;
       
     
        strUserName = TB_UserName.Text.Trim();

        strStartTime = DateTime.Parse(DLC_StartTime.Text).ToString("yyyyMMdd");
        strEndTime = DateTime.Parse(DLC_EndTime.Text).ToString("yyyyMMdd");

        strDisplayType = DL_DisplayType.SelectedValue.Trim();

     
        strUserName = "%" + strUserName + "%";

        if (strDisplayType == "显示异常")
        {
            strHQL = "Select * From T_UserAttendanceRecord  where to_char(AttendanceDate,'yyyymmdd') >= " + "'" + strStartTime + "'";
            strHQL += " and  to_char(AttendanceDate,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " and (LateMinute <> 0 or EarlyMinute <> 0 or (MCheckInDistance > LargestDistance Or MCheckOutDistance > LargestDistance Or ACheckInDistance > LargestDistance Or ACheckOutDistance > LargestDistance Or NCheckInDistance > LargestDistance Or NCheckOutDistance > LargestDistance Or OCheckInDistance > LargestDistance Or OCheckOutDistance > LargestDistance))";
            strHQL += " and UserName Like " + "'" + strUserName + "'";
            strHQL += " and LeaderCode = '" + strUserCode + "'";
            strHQL += " Order by to_char(AttendanceDate,'yyyymmdd') DESC";
        }
        else
        {
            strHQL = "Select * From T_UserAttendanceRecord  where to_char(AttendanceDate,'yyyymmdd') >= " + "'" + strStartTime + "'";
            strHQL += " and  to_char(AttendanceDate,'yyyymmdd') <= " + "'" + strEndTime + "'";
            strHQL += " and  UserName Like " + "'" + strUserName + "'";
            strHQL += " and LeaderCode = '" + strUserCode + "'";
            strHQL += " Order by to_char(AttendanceDate,'yyyymmdd') DESC";
        }

        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserAttendanceRecord");

        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();

        LB_Sql.Text = strHQL;

        //LB_PageIndex.Text = "1";
        //LB_TotalPageNumber.Text = DataGrid3.PageCount.ToString();
    }

    protected void DataGrid3_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid3.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql.Text;
        DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_UserAttendanceRecord");

        DataGrid3.DataSource = ds;
        DataGrid3.DataBind();

        LB_Sql.Text = strHQL;

        //LB_PageIndex.Text = (e.NewPageIndex + 1).ToString();
    }
}
