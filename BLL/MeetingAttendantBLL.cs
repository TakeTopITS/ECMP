using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class MeetingAttendantBLL
    {
        public void AddMeetingAttendant(MeetingAttendant meetingAttendant)
        {
            MeetingAttendantDAL dal = new MeetingAttendantDAL();
            dal.AddMeetingAttendant(meetingAttendant);
        }

        public void UpdateMeetingAttendant(MeetingAttendant meetingAttendant, int MeetingID)
        {
            MeetingAttendantDAL dal = new MeetingAttendantDAL();
            dal.UpdateMeetingAttendant(meetingAttendant, MeetingID);
        }

        public void DeleteMeetingAttendant(MeetingAttendant meetingAttendant)
        {
            MeetingAttendantDAL dal = new MeetingAttendantDAL();
            dal.DeleteMeetingAttendant(meetingAttendant);
        }

        public IList GetAllMeetingAttendants(string strHQL)
        {
            MeetingAttendantDAL dal = new MeetingAttendantDAL();
            return dal.GetAllMeetingAttendants(strHQL);
        }
    }
}