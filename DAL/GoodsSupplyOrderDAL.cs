using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsSupplyOrderDAL
    {
        private EntityControl control;

        public GoodsSupplyOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsSupplyOrder(GoodsSupplyOrder goodsSupplyOrder)
        {
            control.AddEntity(goodsSupplyOrder);
        }

        public void UpdateGoodsSupplyOrder(GoodsSupplyOrder goodsSupplyOrder, int SUID)
        {
            control.UpdateEntity(goodsSupplyOrder, SUID);
        }

        public void DeleteGoodsSupplyOrder(GoodsSupplyOrder goodsSupplyOrder)
        {
            control.DeleteEntity(goodsSupplyOrder);
        }

        public IList GetAllGoodsSupplyOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}