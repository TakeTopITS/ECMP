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


using ProjectMgt.Model;
using ProjectMgt.DAL;
using ProjectMgt.BLL;

public partial class TTAppTaskDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUserCode = Session["UserCode"].ToString();

        string strID = Request.QueryString["ID"];

        string strHQL;
        IList lst;

        string strTaskID, strProjectID, strMeetingID, strCollaborationID;

        strHQL = "from TaskAssignRecord as taskAssignRecord where taskAssignRecord.ID = " + strID;
        TaskAssignRecordBLL taskAssignRecordBLL = new TaskAssignRecordBLL();
        lst = taskAssignRecordBLL.GetAllTaskAssignRecords(strHQL);
        TaskAssignRecord taskAssignRecord = new TaskAssignRecord();
        taskAssignRecord = (TaskAssignRecord)lst[0];

        strTaskID = taskAssignRecord.TaskID.ToString();

        strHQL = "from ProjectTask as projectTask where projectTask.TaskID = " + strTaskID; ;
        ProjectTaskBLL projectTaskBLL = new ProjectTaskBLL();
        lst = projectTaskBLL.GetAllProjectTasks(strHQL);

        ProjectTask projectTask = (ProjectTask)lst[0];

        strProjectID = projectTask.ProjectID.ToString();
        strMeetingID = projectTask.MeetingID.ToString();
        strCollaborationID = projectTask.CollaborationID.ToString();

        if (strMeetingID != "0")
        {
            Response.Redirect("TTAppMeetingTaskDetail.aspx?ID=" + strID + "&MeetingID=" + strMeetingID);
            return;
        }

        if (strCollaborationID != "0")
        {
            Response.Redirect("TTAppCollaborationTaskDetail.aspx?ID=" + strID + "&CollaborationID=" + strCollaborationID);
            return;
        }

        if (strProjectID == "1")
        {
            Response.Redirect("TTAppOtherTaskDetail.aspx?ID=" + strID + "&ProjectID=" + strProjectID);
            return;
        }

        Response.Redirect("TTAppProjectTaskDetail.aspx?ID=" + strID + "&ProjectID=" + strProjectID);
    }
}