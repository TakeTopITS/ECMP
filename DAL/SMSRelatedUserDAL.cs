using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class SMSRelatedUserDAL
    {
        private EntityControl control;

        public SMSRelatedUserDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddSMSRelatedUser(SMSRelatedUser smsRelatedUser)
        {
            control.AddEntity(smsRelatedUser);
        }

        public void UpdateSMSRelatedUser(SMSRelatedUser smsRelatedUser, int ID)
        {
            control.UpdateEntity(smsRelatedUser, ID);
        }

        public void DeleteSMSRelatedUser(SMSRelatedUser smsRelatedUser)
        {
            control.DeleteEntity(smsRelatedUser);
        }

        public IList GetAllSMSRelatedUsers(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}