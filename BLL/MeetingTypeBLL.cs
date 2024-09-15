using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class MeetingTypeBLL
    {
        public void AddMeetingType(MeetingType meetingType)
        {
            MeetingTypeDAL dal = new MeetingTypeDAL();
            dal.AddMeetingType(meetingType);
        }

        public void UpdateMeetingType(MeetingType meetingType, string Type)
        {
            MeetingTypeDAL dal = new MeetingTypeDAL();
            dal.UpdateMeetingType(meetingType, Type);
        }

        public void DeleteMeetingType(MeetingType meetingType)
        {
            MeetingTypeDAL dal = new MeetingTypeDAL();
            dal.DeleteMeetingType(meetingType);
        }

        public IList GetAllMeetingTypes(string strHQL)
        {
            MeetingTypeDAL dal = new MeetingTypeDAL();
            return dal.GetAllMeetingTypes(strHQL);
        }
    }
}