using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class SMSNetSegmentBLL
    {
        public void AddSMSNetSegment(SMSNetSegment smsNetSegment)
        {
            SMSNetSegmentDAL dal = new SMSNetSegmentDAL();
            dal.AddSMSNetSegment(smsNetSegment);
        }

        public void UpdateSMSNetSegment(SMSNetSegment smsNetSegment, int ID)
        {
            SMSNetSegmentDAL dal = new SMSNetSegmentDAL();
            dal.UpdateSMSNetSegment(smsNetSegment, ID);
        }

        public void DeleteSMSNetSegment(SMSNetSegment smsNetSegment)
        {
            SMSNetSegmentDAL dal = new SMSNetSegmentDAL();
            dal.DeleteSMSNetSegment(smsNetSegment);
        }

        public IList GetAllSMSNetSegments(string strHQL)
        {
            SMSNetSegmentDAL dal = new SMSNetSegmentDAL();
            return dal.GetAllSMSNetSegments(strHQL);
        }
    }
}