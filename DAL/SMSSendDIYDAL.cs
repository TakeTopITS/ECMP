using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class SMSSendDIYDAL
    {
        private EntityControl control;

        public SMSSendDIYDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddSMSSendDIY(SMSSendDIY smsSendDIY)
        {
            control.AddEntity(smsSendDIY);
        }

        public void UpdateSMSSendDIY(SMSSendDIY smsSendDIY, int ID)
        {
            control.UpdateEntity(smsSendDIY, ID);
        }

        public void DeleteSMSSendDIY(SMSSendDIY smsSendDIY)
        {
            control.DeleteEntity(smsSendDIY);
        }

        public IList GetAllSMSSendDIYs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}