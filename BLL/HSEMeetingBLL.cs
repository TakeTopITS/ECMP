using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class HSEMeetingBLL
    {
        public void AddHSEMeeting(HSEMeeting hSEMeeting)
        {
            HSEMeetingDAL dal = new HSEMeetingDAL();
            dal.AddHSEMeeting(hSEMeeting);
        }

        public void UpdateHSEMeeting(HSEMeeting hSEMeeting, string Code)
        {
            HSEMeetingDAL dal = new HSEMeetingDAL();
            dal.UpdateHSEMeeting(hSEMeeting, Code);
        }

        public void DeleteHSEMeeting(HSEMeeting hSEMeeting)
        {
            HSEMeetingDAL dal = new HSEMeetingDAL();
            dal.DeleteHSEMeeting(hSEMeeting);
        }

        public IList GetAllHSEMeetings(string strHQL)
        {
            HSEMeetingDAL dal = new HSEMeetingDAL();
            return dal.GetAllHSEMeetings(strHQL);
        }
    }
}