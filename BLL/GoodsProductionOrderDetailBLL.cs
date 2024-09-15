using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsProductionOrderDetailBLL
    {
        public void AddGoodsProductionOrderDetail(GoodsProductionOrderDetail goodsProductionOrderDetail)
        {
            GoodsProductionOrderDetailDAL dal = new GoodsProductionOrderDetailDAL();
            dal.AddGoodsProductionOrderDetail(goodsProductionOrderDetail);
        }

        public void UpdateGoodsProductionOrderDetail(GoodsProductionOrderDetail goodsProductionOrderDetail, int ID)
        {
            GoodsProductionOrderDetailDAL dal = new GoodsProductionOrderDetailDAL();
            dal.UpdateGoodsProductionOrderDetail(goodsProductionOrderDetail, ID);
        }

        public void DeleteGoodsProductionOrderDetail(GoodsProductionOrderDetail goodsProductionOrderDetail)
        {
            GoodsProductionOrderDetailDAL dal = new GoodsProductionOrderDetailDAL();
            dal.DeleteGoodsProductionOrderDetail(goodsProductionOrderDetail);
        }

        public IList GetAllGoodsProductionOrderDetails(string strHQL)
        {
            GoodsProductionOrderDetailDAL dal = new GoodsProductionOrderDetailDAL();
            return dal.GetAllGoodsProductionOrderDetails(strHQL);
        }
    }
}