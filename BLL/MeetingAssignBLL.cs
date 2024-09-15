using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class MeetingAssignBLL
    {
        public void AddMeetingAssign(MeetingAssign meetingAssign)
        {
            MeetingAssignDAL dal = new MeetingAssignDAL();
            dal.AddMeetingAssign(meetingAssign);
        }

        public void UpdateMeetingAssign(MeetingAssign meetingAssign, int ID)
        {
            MeetingAssignDAL dal = new MeetingAssignDAL();
            dal.UpdateMeetingAssign(meetingAssign, ID);
        }

        public void DeleteMeetingAssign(MeetingAssign meetingAssign)
        {
            MeetingAssignDAL dal = new MeetingAssignDAL();
            dal.DeleteMeetingAssign(meetingAssign);
        }

        public IList GetAllMeetingAssigns(string strHQL)
        {
            MeetingAssignDAL dal = new MeetingAssignDAL();
            return dal.GetAllMeetingAssigns(strHQL);
        }
    }
}