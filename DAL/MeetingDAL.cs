using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class MeetingDAL
    {
        private EntityControl control;

        public MeetingDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddMeeting(Meeting meeting)
        {
            control.AddEntity(meeting);
        }

        public void UpdateMeeting(Meeting meeting, int ID)
        {
            control.UpdateEntity(meeting, ID);
        }

        public void DeleteMeeting(Meeting meeting)
        {
            control.DeleteEntity(meeting);
        }

        public IList GetAllMeetings(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}