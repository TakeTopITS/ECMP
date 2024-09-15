using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class MailBoxAuthorityDAL
    {
        private EntityControl control;

        public MailBoxAuthorityDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddMailBoxAuthority(MailBoxAuthority mailBoxAuthority)
        {
            control.AddEntity(mailBoxAuthority);
        }

        public void UpdateMailBoxAuthority(MailBoxAuthority mailBoxAuthority, int ID)
        {
            control.UpdateEntity(mailBoxAuthority, ID);
        }

        public void DeleteMailBoxAuthority(MailBoxAuthority mailBoxAuthority)
        {
            control.DeleteEntity(mailBoxAuthority);
        }

        public IList GetAllMailBoxAuthoritys(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}