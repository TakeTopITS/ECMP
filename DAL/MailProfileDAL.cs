using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class MailProfileDAL
    {
        private EntityControl control;

        public MailProfileDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddMailProfile(MailProfile mailProfile)
        {
            control.AddEntity(mailProfile);
        }

        public void UpdateMailProfile(MailProfile mailProfile, int WebMailID)
        {
            control.UpdateEntity(mailProfile, WebMailID);
        }

        public void DeleteMailProfile(MailProfile mailProfile)
        {
            control.DeleteEntity(mailProfile);
        }

        public IList GetAllMailProfiles(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}