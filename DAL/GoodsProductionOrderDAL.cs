using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsProductionOrderDAL
    {
        private EntityControl control;

        public GoodsProductionOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsProductionOrder(GoodsProductionOrder goodsProductionOrder)
        {
            control.AddEntity(goodsProductionOrder);
        }

        public void UpdateGoodsProductionOrder(GoodsProductionOrder goodsProductionOrder, int PDID)
        {
            control.UpdateEntity(goodsProductionOrder, PDID);
        }

        public void DeleteGoodsProductionOrder(GoodsProductionOrder goodsProductionOrder)
        {
            control.DeleteEntity(goodsProductionOrder);
        }

        public IList GetAllGoodsProductionOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}