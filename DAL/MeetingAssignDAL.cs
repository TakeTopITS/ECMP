using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class MeetingAssignDAL
    {
        private EntityControl control;

        public MeetingAssignDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddMeetingAssign(MeetingAssign meetingAssign)
        {
            control.AddEntity(meetingAssign);
        }

        public void UpdateMeetingAssign(MeetingAssign meetingAssign, int ID)
        {
            control.UpdateEntity(meetingAssign, ID);
        }

        public void DeleteMeetingAssign(MeetingAssign meetingAssign)
        {
            control.DeleteEntity(meetingAssign);
        }

        public IList GetAllMeetingAssigns(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}