using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsReturnOrderBLL
    {
        public void AddGoodsReturnOrder(GoodsReturnOrder goodsReturnOrder)
        {
            GoodsReturnOrderDAL dal = new GoodsReturnOrderDAL();
            dal.AddGoodsReturnOrder(goodsReturnOrder);
        }

        public void UpdateGoodsReturnOrder(GoodsReturnOrder goodsReturnOrder, int ROID)
        {
            GoodsReturnOrderDAL dal = new GoodsReturnOrderDAL();
            dal.UpdateGoodsReturnOrder(goodsReturnOrder, ROID);
        }

        public void DeleteGoodsReturnOrder(GoodsReturnOrder goodsReturnOrder)
        {
            GoodsReturnOrderDAL dal = new GoodsReturnOrderDAL();
            dal.DeleteGoodsReturnOrder(goodsReturnOrder);
        }

        public IList GetAllGoodsReturnOrders(string strHQL)
        {
            GoodsReturnOrderDAL dal = new GoodsReturnOrderDAL();
            return dal.GetAllGoodsReturnOrders(strHQL);
        }
    }
}