using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ReceivePayWayDAL
    {
        private EntityControl control;

        public ReceivePayWayDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddReceivePayWay(ReceivePayWay receivePayWay)
        {
            control.AddEntity(receivePayWay);
        }

        public void UpdateReceivePayWay(ReceivePayWay receivePayWay, string Type)
        {
            control.UpdateEntity(receivePayWay, Type);
        }

        public void DeleteReceivePayWay(ReceivePayWay receivePayWay)
        {
            control.DeleteEntity(receivePayWay);
        }

        public IList GetAllReceivePayWays(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}