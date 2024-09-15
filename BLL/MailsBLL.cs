using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class MailsBLL
    {
        public void AddMails(Mails mails)
        {
            MailsDAL dal = new MailsDAL();
            dal.AddMails(mails);
        }

        public void UpdateMails(Mails mails, int MailID)
        {
            MailsDAL dal = new MailsDAL();
            dal.UpdateMails(mails, MailID);
        }

        public void DeleteMails(Mails mails)
        {
            MailsDAL dal = new MailsDAL();
            dal.DeleteMails(mails);
        }

        public IList GetAllMailss(string strHQL)
        {
            MailsDAL dal = new MailsDAL();
            return dal.GetAllMailss(strHQL);
        }
    }
}