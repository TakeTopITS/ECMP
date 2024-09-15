using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsDeliveryOrderDAL
    {
        private EntityControl control;

        public GoodsDeliveryOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsDeliveryOrder(GoodsDeliveryOrder goodsDeliveryOrder)
        {
            control.AddEntity(goodsDeliveryOrder);
        }

        public void UpdateGoodsDeliveryOrder(GoodsDeliveryOrder goodsDeliveryOrder, int DOID)
        {
            control.UpdateEntity(goodsDeliveryOrder, DOID);
        }

        public void DeleteGoodsDeliveryOrder(GoodsDeliveryOrder goodsDeliveryOrder)
        {
            control.DeleteEntity(goodsDeliveryOrder);
        }

        public IList GetAllGoodsDeliveryOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}