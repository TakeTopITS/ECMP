using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsPurchaseOrderDAL
    {
        private EntityControl control;

        public GoodsPurchaseOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsPurchaseOrder(GoodsPurchaseOrder goodsPurchaseOrder)
        {
            control.AddEntity(goodsPurchaseOrder);
        }

        public void UpdateGoodsPurchaseOrder(GoodsPurchaseOrder goodsPurchaseOrder, int POID)
        {
            control.UpdateEntity(goodsPurchaseOrder, POID);
        }

        public void DeleteGoodsPurchaseOrder(GoodsPurchaseOrder goodsPurchaseOrder)
        {
            control.DeleteEntity(goodsPurchaseOrder);
        }

        public IList GetAllGoodsPurchaseOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}