using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractRelatedGoodsSaleOrderDAL
    {
        private EntityControl control;

        public ConstractRelatedGoodsSaleOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractRelatedGoodsSaleOrder(ConstractRelatedGoodsSaleOrder constractRelatedGoodsSaleOrder)
        {
            control.AddEntity(constractRelatedGoodsSaleOrder);
        }

        public void UpdateConstractRelatedGoodsSaleOrder(ConstractRelatedGoodsSaleOrder constractRelatedGoodsSaleOrder, int ID)
        {
            control.UpdateEntity(constractRelatedGoodsSaleOrder, ID);
        }

        public void DeleteConstractRelatedGoodsSaleOrder(ConstractRelatedGoodsSaleOrder constractRelatedGoodsSaleOrder)
        {
            control.DeleteEntity(constractRelatedGoodsSaleOrder);
        }

        public IList GetAllConstractRelatedGoodsSaleOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}