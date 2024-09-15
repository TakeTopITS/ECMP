using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class SmsSendDAL
    {
        private EntityControl control;

        public SmsSendDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddSmsSend(SmsSend smsSend)
        {
            control.AddEntity(smsSend);
        }

        public void UpdateSmsSend(SmsSend smsSend, int ID)
        {
            control.UpdateEntity(smsSend, ID);
        }

        public void DeleteSmsSend(SmsSend smsSend)
        {
            control.DeleteEntity(smsSend);
        }

        public IList GetAllSmsSends(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}