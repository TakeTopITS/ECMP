using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class WZSendDAL
    {
        private EntityControl control;

        public WZSendDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddWZSend(WZSend wZSend)
        {
            control.AddEntity(wZSend);
        }

        public void UpdateWZSend(WZSend wZSend, string strSendCode)
        {
            control.UpdateEntity(wZSend, strSendCode);
        }

        public void DeleteWZSend(WZSend wZSend)
        {
            control.DeleteEntity(wZSend);
        }

        public IList GetAllWZSends(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}