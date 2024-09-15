using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsDeliveryOrderDetailBLL
    {
        public void AddGoodsDeliveryOrderDetail(GoodsDeliveryOrderDetail goodsDeliveryOrderDetail)
        {
            GoodsDeliveryOrderDetailDAL dal = new GoodsDeliveryOrderDetailDAL();
            dal.AddGoodsDeliveryOrderDetail(goodsDeliveryOrderDetail);
        }

        public void UpdateGoodsDeliveryOrderDetail(GoodsDeliveryOrderDetail goodsDeliveryOrderDetail, int ID)
        {
            GoodsDeliveryOrderDetailDAL dal = new GoodsDeliveryOrderDetailDAL();
            dal.UpdateGoodsDeliveryOrderDetail(goodsDeliveryOrderDetail, ID);
        }

        public void DeleteGoodsDeliveryOrderDetail(GoodsDeliveryOrderDetail goodsDeliveryOrderDetail)
        {
            GoodsDeliveryOrderDetailDAL dal = new GoodsDeliveryOrderDetailDAL();
            dal.DeleteGoodsDeliveryOrderDetail(goodsDeliveryOrderDetail);
        }

        public IList GetAllGoodsDeliveryOrderDetails(string strHQL)
        {
            GoodsDeliveryOrderDetailDAL dal = new GoodsDeliveryOrderDetailDAL();
            return dal.GetAllGoodsDeliveryOrderDetails(strHQL);
        }
    }
}