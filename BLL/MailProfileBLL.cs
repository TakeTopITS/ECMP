using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class MailProfileBLL
    {
        public void AddMailProfile(MailProfile mailProfile)
        {
            MailProfileDAL dal = new MailProfileDAL();
            dal.AddMailProfile(mailProfile);
        }

        public void UpdateMailProfile(MailProfile mailProfile, int WebMailID)
        {
            MailProfileDAL dal = new MailProfileDAL();
            dal.UpdateMailProfile(mailProfile, WebMailID);
        }

        public void DeleteMailProfile(MailProfile mailProfile)
        {
            MailProfileDAL dal = new MailProfileDAL();
            dal.DeleteMailProfile(mailProfile);
        }

        public IList GetAllMailProfiles(string strHQL)
        {
            MailProfileDAL dal = new MailProfileDAL();
            return dal.GetAllMailProfiles(strHQL);
        }
    }
}