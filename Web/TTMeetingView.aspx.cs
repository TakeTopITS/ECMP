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

public partial class TTMeetingView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strMeetingID = Request.QueryString["ID"];
        string strHQL;
        IList lst;

        string strUserCode = Session["UserCode"].ToString(); ClientScript.RegisterStartupScript(this.GetType(), "", "<script>aHandler();</script>");

      
        if (Page.IsPostBack == false)
        {
            strHQL = "from MeetingAttendant as meetingAttendant where meetingAttendant.MeetingID=" + strMeetingID;
            MeetingAttendantBLL meetingAttendantBLL = new MeetingAttendantBLL();
            lst = meetingAttendantBLL.GetAllMeetingAttendants(strHQL);

            RP_Attendant.DataSource = lst;
            RP_Attendant.DataBind();

            strHQL = "from Meeting as meeting where meeting.ID = " + strMeetingID;
            MeetingBLL meetingBLL = new MeetingBLL();
            lst = meetingBLL.GetAllMeetings(strHQL);

            DataList1.DataSource = lst;
            DataList1.DataBind();

            if (lst.Count > 0)
            {
                Meeting meeting = (Meeting)lst[0];
                //this.Title = "会议：" + strMeetingID + " " + meeting.Name.Trim() + " 详细资料";
            }
            else
            {
                Response.Write("此会议资料不存在，可能已被删除，请检查！");
            }
        }
    }  
}
