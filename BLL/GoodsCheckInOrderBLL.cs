using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsCheckInOrderBLL
    {
        public void AddGoodsCheckInOrder(GoodsCheckInOrder goodsCheckInOrder)
        {
            GoodsCheckInOrderDAL dal = new GoodsCheckInOrderDAL();
            dal.AddGoodsCheckInOrder(goodsCheckInOrder);
        }

        public void UpdateGoodsCheckInOrder(GoodsCheckInOrder goodsCheckInOrder, int CheckInID)
        {
            GoodsCheckInOrderDAL dal = new GoodsCheckInOrderDAL();
            dal.UpdateGoodsCheckInOrder(goodsCheckInOrder, CheckInID);
        }

        public void DeleteGoodsCheckInOrder(GoodsCheckInOrder goodsCheckInOrder)
        {
            GoodsCheckInOrderDAL dal = new GoodsCheckInOrderDAL();
            dal.DeleteGoodsCheckInOrder(goodsCheckInOrder);
        }

        public IList GetAllGoodsCheckInOrders(string strHQL)
        {
            GoodsCheckInOrderDAL dal = new GoodsCheckInOrderDAL();
            return dal.GetAllGoodsCheckInOrders(strHQL);
        }
    }
}