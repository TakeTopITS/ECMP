using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class MeetingRoomBLL
    {
        public void AddMeetingRoom(MeetingRoom meetingRoom)
        {
            MeetingRoomDAL dal = new MeetingRoomDAL();
            dal.AddMeetingRoom(meetingRoom);
        }

        public void UpdateMeetingRoom(MeetingRoom meetingRoom, int ID)
        {
            MeetingRoomDAL dal = new MeetingRoomDAL();
            dal.UpdateMeetingRoom(meetingRoom, ID);
        }

        public void DeleteMeetingRoom(MeetingRoom meetingRoom)
        {
            MeetingRoomDAL dal = new MeetingRoomDAL();
            dal.DeleteMeetingRoom(meetingRoom);
        }

        public IList GetAllMeetingRooms(string strHQL)
        {
            MeetingRoomDAL dal = new MeetingRoomDAL();
            return dal.GetAllMeetingRooms(strHQL);
        }
    }
}