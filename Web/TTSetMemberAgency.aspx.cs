using System; using System.Resources;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTSetMemberAgency : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //钟礼月作品（jack.erp@gmail.com)
        //泰顶软件2006－2012

        string strUserCode = Session["UserCode"].ToString();
        string strHQL;
        IList lst;

        //this.Title = "我的直接成员设置---" + System.Configuration.ConfigurationManager.AppSettings["SystemName"];

        LB_UserCode.Text = strUserCode;

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();


        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx","我的直接成员设置", strUserCode);

        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
            strHQL = "from ProjectMember as projectMember where projectMember.UserCode in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
            lst = projectMemberBLL.GetAllProjectMembers(strHQL);
            DataGrid3.DataSource = lst;
            DataGrid3.DataBind();
        }
    }
  

  
    protected void DataGrid2_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strUnderCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        string strUserName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();

       
    }

    protected void DataGrid3_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        string strUserCode = LB_UserCode.Text.Trim();
        string strUnderCode = ((Button)e.Item.FindControl("BT_UserCode")).Text.Trim();
        string strUnderName = ((Button)e.Item.FindControl("BT_UserName")).Text.Trim();

        string strID = GetMemberLevelID(strUserCode, strUnderCode);    
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName != "Page")
        {
            string strUserName = ((Button)e.Item.FindControl("BT_UserName")).Text;

            string strHQL, strID;
            IList lst;

            //strID = LB_ID.Text.Trim();
            //strHQL = "from MeetingAttendant as meetingAttendant where meetingAttendant.MeetingID = " + strID + " and meetingAttendant.UserName = " + "'" + strUserName + "'";
            //MeetingAttendantBLL meetingAttendantBLL = new MeetingAttendantBLL();
            //lst = meetingAttendantBLL.GetAllMeetingAttendants(strHQL);

            //MeetingAttendant meetingAttendant = (MeetingAttendant)lst[0];

            //meetingAttendantBLL.DeleteMeetingAttendant(meetingAttendant);

            //LoadMeetingAttendant(strID);
        }
    }  

    protected void LoadMyMemberList(string strUserCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from ProjectMember as projectMember where projectMember.UserCode in (select memberLevel.UnderCode from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + ")";
        MemberLevelBLL memberLevelBLL = new MemberLevelBLL();
        lst = memberLevelBLL.GetAllMemberLevels(strHQL);

        DataGrid3.DataSource = lst;
        DataGrid3.DataBind();
    }

    protected int GetUnderUserCount(string strUserCode, string strUnderCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + " and memberLevel.UnderCode = " + "'" + strUnderCode + "'";
        MemberLevelBLL memberLevelBLL = new MemberLevelBLL();
        lst = memberLevelBLL.GetAllMemberLevels(strHQL);

        return lst.Count;
    }

    protected string GetMemberLevelID(string strUserCode, string strUnderCode)
    {
        string strHQL;
        IList lst;

        strHQL = "from MemberLevel as memberLevel where memberLevel.UserCode = " + "'" + strUserCode + "'" + " and memberLevel.UnderCode = " + "'" + strUnderCode + "'";
        MemberLevelBLL memberLevelBLL = new MemberLevelBLL();
        lst = memberLevelBLL.GetAllMemberLevels(strHQL);

        MemberLevel memberLevel = (MemberLevel)lst[0];

        return memberLevel.ID.ToString();
    }
}
