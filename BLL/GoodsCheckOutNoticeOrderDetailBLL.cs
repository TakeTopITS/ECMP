using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsCheckOutNoticeOrderDetailBLL
    {
        public void AddGoodsCheckOutNoticeOrderDetail(GoodsCheckOutNoticeOrderDetail goodsCheckOutNoticeOrderDetail)
        {
            GoodsCheckOutNoticeOrderDetailDAL dal = new GoodsCheckOutNoticeOrderDetailDAL();
            dal.AddGoodsCheckOutNoticeOrderDetail(goodsCheckOutNoticeOrderDetail);
        }

        public void UpdateGoodsCheckOutNoticeOrderDetail(GoodsCheckOutNoticeOrderDetail goodsCheckOutNoticeOrderDetail, int ID)
        {
            GoodsCheckOutNoticeOrderDetailDAL dal = new GoodsCheckOutNoticeOrderDetailDAL();
            dal.UpdateGoodsCheckOutNoticeOrderDetail(goodsCheckOutNoticeOrderDetail, ID);
        }

        public void DeleteGoodsCheckOutNoticeOrderDetail(GoodsCheckOutNoticeOrderDetail goodsCheckOutNoticeOrderDetail)
        {
            GoodsCheckOutNoticeOrderDetailDAL dal = new GoodsCheckOutNoticeOrderDetailDAL();
            dal.DeleteGoodsCheckOutNoticeOrderDetail(goodsCheckOutNoticeOrderDetail);
        }

        public IList GetAllGoodsCheckOutNoticeOrderDetails(string strHQL)
        {
            GoodsCheckOutNoticeOrderDetailDAL dal = new GoodsCheckOutNoticeOrderDetailDAL();
            return dal.GetAllGoodsCheckOutNoticeOrderDetails(strHQL);
        }
    }
}