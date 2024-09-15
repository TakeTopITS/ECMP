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
public partial class TTUserSchedule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode, strUserName;

        strUserCode = Session["UserCode"].ToString();
        //strUserCode = "C7094";
        strUserName = ShareClass.GetUserName(strUserCode);

        //ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "员工考勤规则设置", strUserCode);
        //if (blVisible == false)
        //{
        //    Response.Redirect("TTDisplayErrors.aspx");
        //    return;
        //}

        string strSystemVersionType = Session["SystemVersionType"].ToString();
        string strProductType = System.Configuration.ConfigurationManager.AppSettings["ProductType"];
        if (strSystemVersionType == "SAAS" || strProductType.IndexOf("SAAS") > -1)
        {
            Response.Redirect("TTUserAttendanceRuleSAAS.aspx");
        }


        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true);
        if (Page.IsPostBack == false)
        {
            LoadUserAttendanceRule();
        }
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strHQL;
        DataSet lst;

        string strID = ((Button)e.Item.FindControl("BT_ID")).Text.Trim();

        for (int i = 0; i < DataGrid3.Items.Count; i++)
        {
            DataGrid3.Items[i].ForeColor = Color.Black;
        }

        e.Item.ForeColor = Color.Red;

        strHQL = "select * from T_UserSchedule Where ID = " + strID;
        lst = ShareClass.GetDataSetFromSql(strHQL, "T_UserSchedule");

        foreach(DataRow dr in lst.Tables[0].Rows)
        {
            LB_ID.Text = dr["ID"].ToString();
            tb_Name.Text = dr["ScheduleName"].ToString().Trim();
            TB_CheckInStart.Text = dr["CheckInStart"].ToString().Trim();
            TB_CheckInEnd.Text = dr["CheckInEnd"].ToString().Trim();
            TB_Longitude.Text = dr["OfficeLongitude"].ToString().Trim();
            TB_Latitude.Text = dr["OfficeLatitude"].ToString().Trim();
            NB_LargestDistance.Text = dr["LargestDistance"].ToString().Trim();
        }

        BT_UpdateUserAttendanceRule.Enabled = true;
        BT_DeleteUserAttendanceRule.Enabled = true;
    }

    protected void BT_AddUserAttendanceRule_Click(object sender, EventArgs e)
    {
        string strHQL;
        string strScheduleName = tb_Name.Text.Trim();
        string strCheckInStart = TB_CheckInStart.Text.Trim();
        string strCheckInEnd = TB_CheckInEnd.Text.Trim();      

        decimal decLargestDistance = NB_LargestDistance.Amount;

        string strOfficeLatitude = "0";
        string strOfficeLongitude = "0";


        try
        {
            strHQL = "Insert into T_UserSchedule(ScheduleName,CheckInStart,CheckInEnd,OfficeLongitude,OfficeLatitude,LargestDistance) values('" + strScheduleName + "','" + strCheckInStart + "','" + strCheckInEnd + "','" + strOfficeLatitude + "','" + strOfficeLongitude + "'," + decLargestDistance + ")";
            ShareClass.RunSqlCommand(strHQL);

            LoadUserAttendanceRule();

            BT_UpdateUserAttendanceRule.Enabled = true;
            BT_DeleteUserAttendanceRule.Enabled = true;


            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWXJSBJC + "')", true);
        }
    }

    protected void BT_UpdateUserAttendanceRule_Click(object sender, EventArgs e)
    {        
        string strHQL;
        string strID;
        string strScheduleName = tb_Name.Text.Trim();
        string strCheckInStart = TB_CheckInStart.Text.Trim();
        string strCheckInEnd = TB_CheckInEnd.Text.Trim();

        decimal decLargestDistance = NB_LargestDistance.Amount;

        string strOfficeLatitude = "0";
        string strOfficeLongitude = "0";

        strID = LB_ID.Text.Trim();


        try
        {
            strHQL = "Update T_UserSchedule set ScheduleName='" + strScheduleName + "',CheckInStart='" + strCheckInStart + "',CheckInEnd='" + strCheckInEnd + "',OfficeLongitude='" + strOfficeLatitude + "',OfficeLatitude='" + strOfficeLongitude + "',LargestDistance=" + decLargestDistance + " where ID=" + strID;
            ShareClass.RunSqlCommand(strHQL);

            LoadUserAttendanceRule();

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZBCCG + "')", true);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWXGSBJC + "')", true);
        }
    }

    protected void BT_DeleteUserAttendanceRule_Click(object sender, EventArgs e)
    {
        string strID;
        string strHQL;

        strID = LB_ID.Text.Trim();
        strHQL = "Delete From T_UserSchedule Where ID = " + strID;

        try
        {
            ShareClass.RunSqlCommand(strHQL);

            LoadUserAttendanceRule();

            BT_UpdateUserAttendanceRule.Enabled = false;
            BT_DeleteUserAttendanceRule.Enabled = false;

            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZSCCG + "')", true);
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "click", "alert('" + Resources.lang.ZZCWSCSBJC + "')", true);
        }
    }

    protected void LoadUserAttendanceRule()
    {
        string strHQL;
        strHQL = "select * from  T_UserSchedule";
        strHQL += " Order by ID ASC";
        ShareClass.DataGridBindingDataSet(strHQL, DataGrid3);
    }


    protected int GetUserNumber()
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectMember as projectMember";
        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        lst = projectMemberBLL.GetAllProjectMembers(strHQL);

        return lst.Count;
    }

}