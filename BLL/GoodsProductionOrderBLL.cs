using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsProductionOrderBLL
    {
        public void AddGoodsProductionOrder(GoodsProductionOrder goodsProductionOrder)
        {
            GoodsProductionOrderDAL dal = new GoodsProductionOrderDAL();
            dal.AddGoodsProductionOrder(goodsProductionOrder);
        }

        public void UpdateGoodsProductionOrder(GoodsProductionOrder goodsProductionOrder, int PDID)
        {
            GoodsProductionOrderDAL dal = new GoodsProductionOrderDAL();
            dal.UpdateGoodsProductionOrder(goodsProductionOrder, PDID);
        }

        public void DeleteGoodsProductionOrder(GoodsProductionOrder goodsProductionOrder)
        {
            GoodsProductionOrderDAL dal = new GoodsProductionOrderDAL();
            dal.DeleteGoodsProductionOrder(goodsProductionOrder);
        }

        public IList GetAllGoodsProductionOrders(string strHQL)
        {
            GoodsProductionOrderDAL dal = new GoodsProductionOrderDAL();
            return dal.GetAllGoodsProductionOrders(strHQL);
        }
    }
}