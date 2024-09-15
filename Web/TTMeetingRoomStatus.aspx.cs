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

using System.Data.OleDb;
using NickLee.Web.UI.VB;

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;


public partial class TTMeetingRoomStatus : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        ProjectMemberBLL projectMemberBLL = new ProjectMemberBLL();
        Label1.Text = ShareClass.GetPageTitle(this.GetType().BaseType.Name + ".aspx"); bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", strUserCode);  //bool blVisible = TakeTopSecurity.TakeTopLicense.GetAuthobility(this.GetType().BaseType.Name + ".aspx", "库存管理", strUserCode);
        if (blVisible == false)
        {
            Response.Redirect("TTDisplayErrors.aspx");
            return;
        }

        if (!(IsPostBack))
        {
            BindSchedule();
        }

    }

    public void BindSchedule()
    {
        ///定义SQL语句
        string cm = "SELECT ID,BeginTime,Endtime,Address,Name From T_Meeting where Address in (Select RoomName From T_MeetingRoom) and Rtrim(Ltrim(Status)) <> '取消' and to_char(BeginTime,'yyyymmdd') >=" + "'" + DateTime.Now.AddDays(-1).ToString("yyyyMMdd") + "'";

        try
        {
            DataSet ds = ShareClass.GetDataSetFromSql(cm, "T_Meeting");
            Schedule1.DataSource = ds;
            Schedule1.DataBind();
        }
        finally
        {
          
        }
    }
}
