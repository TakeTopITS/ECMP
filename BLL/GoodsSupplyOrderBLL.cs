using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsSupplyOrderBLL
    {
        public void AddGoodsSupplyOrder(GoodsSupplyOrder goodsSupplyOrder)
        {
            GoodsSupplyOrderDAL dal = new GoodsSupplyOrderDAL();
            dal.AddGoodsSupplyOrder(goodsSupplyOrder);
        }

        public void UpdateGoodsSupplyOrder(GoodsSupplyOrder goodsSupplyOrder, int POID)
        {
            GoodsSupplyOrderDAL dal = new GoodsSupplyOrderDAL();
            dal.UpdateGoodsSupplyOrder(goodsSupplyOrder, POID);
        }

        public void DeleteGoodsSupplyOrder(GoodsSupplyOrder goodsSupplyOrder)
        {
            GoodsSupplyOrderDAL dal = new GoodsSupplyOrderDAL();
            dal.DeleteGoodsSupplyOrder(goodsSupplyOrder);
        }

        public IList GetAllGoodsSupplyOrders(string strHQL)
        {
            GoodsSupplyOrderDAL dal = new GoodsSupplyOrderDAL();
            return dal.GetAllGoodsSupplyOrders(strHQL);
        }
    }
}