using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsCheckInOrderDetailBLL
    {
        public void AddGoodsCheckInOrderDetail(GoodsCheckInOrderDetail goodsCheckInOrderDetail)
        {
            GoodsCheckInOrderDetailDAL dal = new GoodsCheckInOrderDetailDAL();
            dal.AddGoodsCheckInOrderDetail(goodsCheckInOrderDetail);
        }

        public void UpdateGoodsCheckInOrderDetail(GoodsCheckInOrderDetail goodsCheckInOrderDetail, int ID)
        {
            GoodsCheckInOrderDetailDAL dal = new GoodsCheckInOrderDetailDAL();
            dal.UpdateGoodsCheckInOrderDetail(goodsCheckInOrderDetail, ID);
        }

        public void DeleteGoodsCheckInOrderDetail(GoodsCheckInOrderDetail goodsCheckInOrderDetail)
        {
            GoodsCheckInOrderDetailDAL dal = new GoodsCheckInOrderDetailDAL();
            dal.DeleteGoodsCheckInOrderDetail(goodsCheckInOrderDetail);
        }

        public IList GetAllGoodsCheckInOrderDetails(string strHQL)
        {
            GoodsCheckInOrderDetailDAL dal = new GoodsCheckInOrderDetailDAL();
            return dal.GetAllGoodsCheckInOrderDetails(strHQL);
        }
    }
}