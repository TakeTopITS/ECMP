using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class MailsDAL
    {
        private EntityControl control;

        public MailsDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddMails(Mails mails)
        {
            control.AddEntity(mails);
        }

        public void UpdateMails(Mails mails, int MailID)
        {
            control.UpdateEntity(mails, MailID);
        }

        public void DeleteMails(Mails mails)
        {
            control.DeleteEntity(mails);
        }

        public IList GetAllMailss(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}