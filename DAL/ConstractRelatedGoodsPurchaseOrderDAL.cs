using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractRelatedGoodsPurchaseOrderDAL
    {
        private EntityControl control;

        public ConstractRelatedGoodsPurchaseOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractRelatedGoodsPurchaseOrder(ConstractRelatedGoodsPurchaseOrder constractRelatedGoodsPurchaseOrder)
        {
            control.AddEntity(constractRelatedGoodsPurchaseOrder);
        }

        public void UpdateConstractRelatedGoodsPurchaseOrder(ConstractRelatedGoodsPurchaseOrder constractRelatedGoodsPurchaseOrder, int ID)
        {
            control.UpdateEntity(constractRelatedGoodsPurchaseOrder, ID);
        }

        public void DeleteConstractRelatedGoodsPurchaseOrder(ConstractRelatedGoodsPurchaseOrder constractRelatedGoodsPurchaseOrder)
        {
            control.DeleteEntity(constractRelatedGoodsPurchaseOrder);
        }

        public IList GetAllConstractRelatedGoodsPurchaseOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}