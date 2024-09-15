using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsReturnOrderDAL
    {
        private EntityControl control;

        public GoodsReturnOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsReturnOrder(GoodsReturnOrder goodsReturnOrder)
        {
            control.AddEntity(goodsReturnOrder);
        }

        public void UpdateGoodsReturnOrder(GoodsReturnOrder goodsReturnOrder, int ROID)
        {
            control.UpdateEntity(goodsReturnOrder, ROID);
        }

        public void DeleteGoodsReturnOrder(GoodsReturnOrder goodsReturnOrder)
        {
            control.DeleteEntity(goodsReturnOrder);
        }

        public IList GetAllGoodsReturnOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}