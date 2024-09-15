using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class MailBoxAuthorityBLL
    {
        public void AddMailBoxAuthority(MailBoxAuthority mailBoxAuthority)
        {
            MailBoxAuthorityDAL dal = new MailBoxAuthorityDAL();
            dal.AddMailBoxAuthority(mailBoxAuthority);
        }

        public void UpdateMailBoxAuthority(MailBoxAuthority mailBoxAuthority, int ID)
        {
            MailBoxAuthorityDAL dal = new MailBoxAuthorityDAL();
            dal.UpdateMailBoxAuthority(mailBoxAuthority, ID);
        }

        public void DeleteMailBoxAuthority(MailBoxAuthority mailBoxAuthority)
        {
            MailBoxAuthorityDAL dal = new MailBoxAuthorityDAL();
            dal.DeleteMailBoxAuthority(mailBoxAuthority);
        }

        public IList GetAllMailBoxAuthoritys(string strHQL)
        {
            MailBoxAuthorityDAL dal = new MailBoxAuthorityDAL();
            return dal.GetAllMailBoxAuthoritys(strHQL);
        }
    }
}