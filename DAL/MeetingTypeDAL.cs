using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class MeetingTypeDAL
    {
        private EntityControl control;

        public MeetingTypeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddMeetingType(MeetingType meetingType)
        {
            control.AddEntity(meetingType);
        }

        public void UpdateMeetingType(MeetingType meetingType, string Type)
        {
            control.UpdateEntity(meetingType, Type);
        }

        public void DeleteMeetingType(MeetingType meetingType)
        {
            control.DeleteEntity(meetingType);
        }

        public IList GetAllMeetingTypes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}