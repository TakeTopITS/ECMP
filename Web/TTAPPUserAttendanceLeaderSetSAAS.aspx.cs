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
public partial class TTAPPUserAttendanceLeaderSetSAAS : System.Web.UI.Page
{
    string strUserCode, strUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);

        if (Page.IsPostBack == false)
        {
            LoadUserAttendanceRule(strUserCode);
        }
    }
    protected void BT_AddLeaderCode_Click(object sender, EventArgs e)
    {
        string strHQL;

        string strUserCode, strUserName, strLeaderCode;

        strUserCode = Session["UserCode"].ToString();
        strUserName = Session["UserName"].ToString();

        strLeaderCode = TB_LeaderCode.Text.Trim();
        if (strLeaderCode == "")
        {
            return;
        }

        strHQL = "Select * From T_ContactInfor Where UserCode = " + "'" + strLeaderCode + "' and  MobilePhone = " + "'" + strUserCode + "'";
        DataSet ds1 = ShareClass.GetDataSetFromSql(strHQL, "T_ContactInfor");
        if (ds1.Tables[0].Rows.Count == 0)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZJGNBZCZGKQYQZLBNJRQJC + "')", true);
            return;
        }

        strHQL = "Select * From T_MemberLevel Where UserCode = '" + strLeaderCode + "' and UnderCode = '" + strUserCode + "'";
        DataSet ds2 = ShareClass.GetDataSetFromSql(strHQL, "T_MemberLevel");
        if (ds2.Tables[0].Rows.Count == 0)
        {
            strHQL = "Insert Into T_MemberLevel(UserCode ,UnderCode ,AgencyStatus,ProjectVisible ,PlanVisible  ,KPIVisible ,WorkloadVisible ,ScheduleVisible ,WorkflowVisible,CustomerServiceVisible ,ConstractVisible,PositionVisible,SortNumber)";
            strHQL += " values('" + strLeaderCode + "','" + strUserCode + "',1,'YES','YES','YES','YES','YES','YES','YES','YES','YES',1)";
            ShareClass.RunSqlCommand(strHQL);
        }

        strHQL = "Insert Into T_UserAttendanceRule(UserCode,UserName,CreateDate,MCheckInStart,MCheckInEnd,MCheckOutStart,MCheckOutEnd,";
        strHQL += "ACheckInStart,ACheckInEnd,ACheckOutStart,ACheckOutEnd,NCheckInStart,NCheckInEnd,NCheckOutStart,NCheckOutEnd,";
        strHQL += "OCheckInStart,OCheckInEnd,OCheckOutStart,OCheckOutEnd,Status,MCheckInIsMust,MCheckOutIsMust,ACheckInIsMust,ACheckOutIsMust,NCheckInIsMust,NCheckOutIsMust,OCheckInIsMust,OCheckOutIsMust,LargestDistance,LeaderCode,LeaderName,OfficeLongitude,OfficeLatitude)";
        strHQL += " Select '" + strUserCode + "','" + strUserName + "',now(),B.MCheckInStart,B.MCheckInEnd,B.MCheckOutStart,B.MCheckOutEnd,";
        strHQL += "B.ACheckInStart,B.ACheckInEnd,B.ACheckOutStart,B.ACheckOutEnd,B.NCheckInStart,B.NCheckInEnd,B.NCheckOutStart,B.NCheckOutEnd,";
        strHQL += "B.OCheckInStart,B.OCheckInEnd,B.OCheckOutStart,B.OCheckOutEnd,'处理中',B.MCheckInIsMust,B.MCheckOutIsMust,B.ACheckInIsMust,B.ACheckOutIsMust,B.NCheckInIsMust,B.NCheckOutIsMust,B.OCheckInIsMust,B.OCheckOutIsMust,B.LargestDistance,'" + strLeaderCode + "','" + ShareClass.GetUserName(strLeaderCode) + "',B.OfficeLongitude,B.OfficeLatitude";
        strHQL += " From T_UserAttendanceRule B";
        strHQL += " Where B.LeaderCode = " + "'" + strLeaderCode + "'";
        strHQL += " And B.LeaderCode not in (Select LeaderCode From T_UserAttendanceRule Where UserCode = '" + strUserCode + "')";
        ShareClass.RunSqlCommand(strHQL);

        LoadUserAttendanceRule(strUserCode);
    }


    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        string strID = e.Item.Cells[0].Text;

        for (int i = 0; i < DataGrid3.Items.Count; i++)
        {
            DataGrid3.Items[i].ForeColor = Color.Black;
        }

        e.Item.ForeColor = Color.Red;

        strHQL = "Delete From T_UserAttendanceRule Where ID = " + strID;
        ShareClass.RunSqlCommand(strHQL);

        LoadUserAttendanceRule(strUserCode);
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
