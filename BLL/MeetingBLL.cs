using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class MeetingBLL
    {
        public void AddMeeting(Meeting meeting)
        {
            MeetingDAL dal = new MeetingDAL();
            dal.AddMeeting(meeting);
        }

        public void UpdateMeeting(Meeting meeting, int ID)
        {
            MeetingDAL dal = new MeetingDAL();
            dal.UpdateMeeting(meeting, ID);
        }

        public void DeleteMeeting(Meeting meeting)
        {
            MeetingDAL dal = new MeetingDAL();
            dal.DeleteMeeting(meeting);
        }

        public IList GetAllMeetings(string strHQL)
        {
            MeetingDAL dal = new MeetingDAL();
            return dal.GetAllMeetings(strHQL);
        }
    }
}