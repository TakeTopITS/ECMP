using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsCheckOutNoticeOrderBLL
    {
        public void AddGoodsCheckOutNoticeOrder(GoodsCheckOutNoticeOrder goodsCheckOutNoticeOrder)
        {
            GoodsCheckOutNoticeOrderDAL dal = new GoodsCheckOutNoticeOrderDAL();
            dal.AddGoodsCheckOutNoticeOrder(goodsCheckOutNoticeOrder);
        }

        public void UpdateGoodsCheckOutNoticeOrder(GoodsCheckOutNoticeOrder goodsCheckOutNoticeOrder, int COOID)
        {
            GoodsCheckOutNoticeOrderDAL dal = new GoodsCheckOutNoticeOrderDAL();
            dal.UpdateGoodsCheckOutNoticeOrder(goodsCheckOutNoticeOrder, COOID);
        }

        public void DeleteGoodsCheckOutNoticeOrder(GoodsCheckOutNoticeOrder goodsCheckOutNoticeOrder)
        {
            GoodsCheckOutNoticeOrderDAL dal = new GoodsCheckOutNoticeOrderDAL();
            dal.DeleteGoodsCheckOutNoticeOrder(goodsCheckOutNoticeOrder);
        }

        public IList GetAllGoodsCheckOutNoticeOrders(string strHQL)
        {
            GoodsCheckOutNoticeOrderDAL dal = new GoodsCheckOutNoticeOrderDAL();
            return dal.GetAllGoodsCheckOutNoticeOrders(strHQL);
        }
    }
}