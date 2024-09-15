using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsDeliveryOrderDetailDAL
    {
        private EntityControl control;

        public GoodsDeliveryOrderDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsDeliveryOrderDetail(GoodsDeliveryOrderDetail goodsDeliveryOrderDetail)
        {
            control.AddEntity(goodsDeliveryOrderDetail);
        }

        public void UpdateGoodsDeliveryOrderDetail(GoodsDeliveryOrderDetail goodsDeliveryOrderDetail, int ID)
        {
            control.UpdateEntity(goodsDeliveryOrderDetail, ID);
        }

        public void DeleteGoodsDeliveryOrderDetail(GoodsDeliveryOrderDetail goodsDeliveryOrderDetail)
        {
            control.DeleteEntity(goodsDeliveryOrderDetail);
        }

        public IList GetAllGoodsDeliveryOrderDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}