using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class MeetingAttendantDAL
    {
        private EntityControl control;

        public MeetingAttendantDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddMeetingAttendant(MeetingAttendant meetingAttendant)
        {
            control.AddEntity(meetingAttendant);
        }

        public void UpdateMeetingAttendant(MeetingAttendant meetingAttendant, int MeetingID)
        {
            control.UpdateEntity(meetingAttendant, MeetingID);
        }

        public void DeleteMeetingAttendant(MeetingAttendant meetingAttendant)
        {
            control.DeleteEntity(meetingAttendant);
        }

        public IList GetAllMeetingAttendants(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}