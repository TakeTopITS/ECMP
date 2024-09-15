using System; using System.Resources;
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

using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTScheduleEventLeaderReviewReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strHQL;
        string strUserCode, strUserName;
        string strScheduleID, strScheduleName;

        strUserCode = Session["UserCode"].ToString();
        strUserName = ShareClass.GetUserName(strUserCode);
        LB_UserCode.Text = strUserCode;
        LB_UserName.Text = strUserName;

        strScheduleID = Request.QueryString["ScheduleID"];

        if (strScheduleID != "")
        {
            strHQL = "Select Name From T_ScheduleEvent Where ID = " + strScheduleID;
            DataSet ds = ShareClass.GetDataSetFromSql(strHQL, "T_ScheduleEvent");
            if (ds.Tables[0].Rows.Count > 0)
            {
                strScheduleName = ds.Tables[0].Rows[0][0].ToString();
                LB_ScheduleID.Text = strScheduleID;
                LB_ScheduleName.Text = strScheduleName;

                //this.Title = "日程：" + strScheduleID + " " + strScheduleName + " 的评审意见";

                LoadReviewList(strScheduleID);
            }
        }

        ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "clickA", "aHandler();", true); if (Page.IsPostBack == false)
        {
           
        }
    }

    protected void LoadReviewList(string strScheduleID)
    {
       
        string strHQL = "from ScheduleEventLeaderReview as scheduleEventLeaderReview where scheduleEventLeaderReview.ScheduleID = " + strScheduleID + " Order by scheduleEventLeaderReview.ReviewID DESC";
        ScheduleEventLeaderReviewBLL scheduleEventLeaderReviewBLL = new ScheduleEventLeaderReviewBLL();
        IList lst = scheduleEventLeaderReviewBLL.GetAllScheduleEventLeaderReviews(strHQL);


        DataList1.DataSource = lst;
        DataList1.DataBind();
    }

   
}
