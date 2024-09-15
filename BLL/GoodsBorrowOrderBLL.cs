using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsBorrowOrderBLL
    {
        public void AddGoodsBorrowOrder(GoodsBorrowOrder goodsBorrowOrder)
        {
            GoodsBorrowOrderDAL dal = new GoodsBorrowOrderDAL();
            dal.AddGoodsBorrowOrder(goodsBorrowOrder);
        }

        public void UpdateGoodsBorrowOrder(GoodsBorrowOrder goodsBorrowOrder, int BorrowNO)
        {
            GoodsBorrowOrderDAL dal = new GoodsBorrowOrderDAL();
            dal.UpdateGoodsBorrowOrder(goodsBorrowOrder, BorrowNO);
        }

        public void DeleteGoodsBorrowOrder(GoodsBorrowOrder goodsBorrowOrder)
        {
            GoodsBorrowOrderDAL dal = new GoodsBorrowOrderDAL();
            dal.DeleteGoodsBorrowOrder(goodsBorrowOrder);
        }

        public IList GetAllGoodsBorrowOrders(string strHQL)
        {
            GoodsBorrowOrderDAL dal = new GoodsBorrowOrderDAL();
            return dal.GetAllGoodsBorrowOrders(strHQL);
        }
    }
}