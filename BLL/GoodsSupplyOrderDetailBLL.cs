using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsSupplyOrderDetailBLL
    {
        public void AddGoodsSupplyOrderDetail(GoodsSupplyOrderDetail goodsSupplyOrderDetail)
        {
            GoodsSupplyOrderDetailDAL dal = new GoodsSupplyOrderDetailDAL();
            dal.AddGoodsSupplyOrderDetail(goodsSupplyOrderDetail);
        }

        public void UpdateGoodsSupplyOrderDetail(GoodsSupplyOrderDetail goodsSupplyOrderDetail, int ID)
        {
            GoodsSupplyOrderDetailDAL dal = new GoodsSupplyOrderDetailDAL();
            dal.UpdateGoodsSupplyOrderDetail(goodsSupplyOrderDetail, ID);
        }

        public void DeleteGoodsSupplyOrderDetail(GoodsSupplyOrderDetail goodsSupplyOrderDetail)
        {
            GoodsSupplyOrderDetailDAL dal = new GoodsSupplyOrderDetailDAL();
            dal.DeleteGoodsSupplyOrderDetail(goodsSupplyOrderDetail);
        }

        public IList GetAllGoodsSupplyOrderDetails(string strHQL)
        {
            GoodsSupplyOrderDetailDAL dal = new GoodsSupplyOrderDetailDAL();
            return dal.GetAllGoodsSupplyOrderDetails(strHQL);
        }
    }
}