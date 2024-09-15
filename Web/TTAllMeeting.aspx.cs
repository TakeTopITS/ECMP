using System; using System.Resources;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAllMeeting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode, strHQL;
        IList lst;

        strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","查看所有会议", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

    
        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            string strDepartString = TakeTopCore.CoreShareClass.InitialDepartmentStringByAuthoritySuperUser(strUserCode);
            LB_DepartString.Text = strDepartString;

            strHQL = "from MeetingRoom as meetingRoom order by meetingRoom.ID ASC";
            MeetingRoomBLL meetingRoomBLL = new MeetingRoomBLL();
            lst = meetingRoomBLL.GetAllMeetingRooms(strHQL);

            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();

            strHQL = "from Meeting as meeting where  meeting.BeginTime > now() ";
            strHQL += " and meeting.BuilderCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " order by meeting.ID DESC";
            MeetingBLL meetingBLL = new MeetingBLL();
            lst = meetingBLL.GetAllMeetings(strHQL);

            DataGrid1.DataSource = lst;
            DataGrid1.DataBind();
            LB_Sql1.Text = strHQL;

            strHQL = "from Meeting as meeting where  meeting.EndTime < now() ";
            strHQL += " and meeting.BuilderCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
            strHQL += " order by meeting.ID DESC";
            meetingBLL = new MeetingBLL();
            lst = meetingBLL.GetAllMeetings(strHQL);

            DataGrid2.DataSource = lst;
            DataGrid2.DataBind();
            LB_Sql2.Text = strHQL;
        }
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strRoomName = ((Button)e.Item.FindControl("BT_RoomName")).Text.Trim();

        string strHQL;
        IList lst;

        MeetingBLL meetingBLL = new MeetingBLL();

        string strDepartString = LB_DepartString.Text.Trim();

        strHQL = "from Meeting as meeting where meeting.Address = " + "'" + strRoomName + "'" + " and meeting.BeginTime > now() ";
        strHQL += " and meeting.BuilderCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " order by meeting.ID DESC";
        lst = meetingBLL.GetAllMeetings(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

        strHQL = "from Meeting as meeting where meeting.Address = " + "'" + strRoomName + "'" + " and meeting.EndTime < now() ";
        strHQL += " and meeting.BuilderCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " order by meeting.ID DESC";
        lst = meetingBLL.GetAllMeetings(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }

    protected void DataGrid1_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid1.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql1.Text;

        MeetingBLL meetingBLL = new MeetingBLL();
        IList lst = meetingBLL.GetAllMeetings(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();

    }

    protected void DataGrid2_PageIndexChanged(object sender, DataGridPageChangedEventArgs e)
    {
        DataGrid2.CurrentPageIndex = e.NewPageIndex;

        string strHQL = LB_Sql2.Text;

        ApproveBLL approveBLL = new ApproveBLL();
        IList lst = approveBLL.GetAllApproves(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
    }
    protected void BT_AllMeeting_Click(object sender, EventArgs e)
    {
        string strHQL;
        IList lst;

        string strDepartString = LB_DepartString.Text.Trim();

        strHQL = "from Meeting as meeting where  meeting.BeginTime > now() ";
        strHQL += " and meeting.BuilderCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " order by meeting.ID DESC";
        MeetingBLL meetingBLL = new MeetingBLL();
        lst = meetingBLL.GetAllMeetings(strHQL);

        DataGrid1.DataSource = lst;
        DataGrid1.DataBind();
        LB_Sql1.Text = strHQL;

        strHQL = "from Meeting as meeting where  meeting.EndTime < now() ";
        strHQL += " and meeting.BuilderCode in (Select projectMember.UserCode From ProjectMember as projectMember Where projectMember.DepartCode in " + strDepartString + ")";
        strHQL += " order by meeting.ID DESC";
        meetingBLL = new MeetingBLL();
        lst = meetingBLL.GetAllMeetings(strHQL);

        DataGrid2.DataSource = lst;
        DataGrid2.DataBind();
        LB_Sql2.Text = strHQL;
    }
}
