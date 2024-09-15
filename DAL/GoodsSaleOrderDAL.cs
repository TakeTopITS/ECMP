using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsSaleOrderDAL
    {
        private EntityControl control;

        public GoodsSaleOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsSaleOrder(GoodsSaleOrder goodsSaleOrder)
        {
            control.AddEntity(goodsSaleOrder);
        }

        public void UpdateGoodsSaleOrder(GoodsSaleOrder goodsSaleOrder, int SOID)
        {
            control.UpdateEntity(goodsSaleOrder, SOID);
        }

        public void DeleteGoodsSaleOrder(GoodsSaleOrder goodsSaleOrder)
        {
            control.DeleteEntity(goodsSaleOrder);
        }

        public IList GetAllGoodsSaleOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}