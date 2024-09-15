using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsShipmentOrderDAL
    {
        private EntityControl control;

        public GoodsShipmentOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsShipmentOrder(GoodsShipmentOrder goodsShipmentOrder)
        {
            control.AddEntity(goodsShipmentOrder);
        }

        public void UpdateGoodsShipmentOrder(GoodsShipmentOrder goodsShipmentOrder, int ShipmentNO)
        {
            control.UpdateEntity(goodsShipmentOrder, ShipmentNO);
        }

        public void DeleteGoodsShipmentOrder(GoodsShipmentOrder goodsShipmentOrder)
        {
            control.DeleteEntity(goodsShipmentOrder);
        }

        public IList GetAllGoodsShipmentOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}