using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class MeetingRoomDAL
    {
        private EntityControl control;

        public MeetingRoomDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddMeetingRoom(MeetingRoom meetingRoom)
        {
            control.AddEntity(meetingRoom);
        }

        public void UpdateMeetingRoom(MeetingRoom meetingRoom, int ID)
        {
            control.UpdateEntity(meetingRoom, ID);
        }

        public void DeleteMeetingRoom(MeetingRoom meetingRoom)
        {
            control.DeleteEntity(meetingRoom);
        }

        public IList GetAllMeetingRooms(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}