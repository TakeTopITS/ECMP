using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class SMSRelatedUserBLL
    {
        public void AddSMSRelatedUser(SMSRelatedUser smsRelatedUser)
        {
            SMSRelatedUserDAL dal = new SMSRelatedUserDAL();
            dal.AddSMSRelatedUser(smsRelatedUser);
        }

        public void UpdateSMSRelatedUser(SMSRelatedUser smsRelatedUser, int ID)
        {
            SMSRelatedUserDAL dal = new SMSRelatedUserDAL();
            dal.UpdateSMSRelatedUser(smsRelatedUser, ID);
        }

        public void DeleteSMSRelatedUser(SMSRelatedUser smsRelatedUser)
        {
            SMSRelatedUserDAL dal = new SMSRelatedUserDAL();
            dal.DeleteSMSRelatedUser(smsRelatedUser);
        }

        public IList GetAllSMSRelatedUsers(string strHQL)
        {
            SMSRelatedUserDAL dal = new SMSRelatedUserDAL();
            return dal.GetAllSMSRelatedUsers(strHQL);
        }
    }
}