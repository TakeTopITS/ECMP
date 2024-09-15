using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class SMSInterfaceDAL
    {
        private EntityControl control;

        public SMSInterfaceDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddSMSInterface(SMSInterface smsInterface)
        {
            control.AddEntity(smsInterface);
        }

        public void UpdateSMSInterface(SMSInterface smsInterface, int ID)
        {
            control.UpdateEntity(smsInterface, ID);
        }

        public void DeleteSMSInterface(SMSInterface smsInterface)
        {
            control.DeleteEntity(smsInterface);
        }

        public IList GetAllSMSInterfaces(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}