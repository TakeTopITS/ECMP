using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsDeliveryOrderBLL
    {
        public void AddGoodsDeliveryOrder(GoodsDeliveryOrder goodsDeliveryOrder)
        {
            GoodsDeliveryOrderDAL dal = new GoodsDeliveryOrderDAL();
            dal.AddGoodsDeliveryOrder(goodsDeliveryOrder);
        }

        public void UpdateGoodsDeliveryOrder(GoodsDeliveryOrder goodsDeliveryOrder, int DOID)
        {
            GoodsDeliveryOrderDAL dal = new GoodsDeliveryOrderDAL();
            dal.UpdateGoodsDeliveryOrder(goodsDeliveryOrder, DOID);
        }

        public void DeleteGoodsDeliveryOrder(GoodsDeliveryOrder goodsDeliveryOrder)
        {
            GoodsDeliveryOrderDAL dal = new GoodsDeliveryOrderDAL();
            dal.DeleteGoodsDeliveryOrder(goodsDeliveryOrder);
        }

        public IList GetAllGoodsDeliveryOrders(string strHQL)
        {
            GoodsDeliveryOrderDAL dal = new GoodsDeliveryOrderDAL();
            return dal.GetAllGoodsDeliveryOrders(strHQL);
        }
    }
}