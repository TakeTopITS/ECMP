using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class SMSCodeDAL
    {
        private EntityControl control;

        public SMSCodeDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddSMSCode(SMSCode smsCode)
        {
            control.AddEntity(smsCode);
        }

        public void UpdateSMSCode(SMSCode smsCode, int ID)
        {
            control.UpdateEntity(smsCode, ID);
        }

        public void DeleteSMSCode(SMSCode smsCode)
        {
            control.DeleteEntity(smsCode);
        }

        public IList GetAllSMSCodes(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}