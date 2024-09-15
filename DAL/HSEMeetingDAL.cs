using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class HSEMeetingDAL
    {
        private EntityControl control;

        public HSEMeetingDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddHSEMeeting(HSEMeeting hSEMeeting)
        {
            control.AddEntity(hSEMeeting);
        }

        public void UpdateHSEMeeting(HSEMeeting hSEMeeting, string Code)
        {
            control.UpdateEntity(hSEMeeting, Code);
        }

        public void DeleteHSEMeeting(HSEMeeting hSEMeeting)
        {
            control.DeleteEntity(hSEMeeting);
        }

        public IList GetAllHSEMeetings(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}