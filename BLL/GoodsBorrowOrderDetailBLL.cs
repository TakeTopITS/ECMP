using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsBorrowOrderDetailBLL
    {
        public void AddGoodsBorrowOrderDetail(GoodsBorrowOrderDetail goodsBorrowOrderDetail)
        {
            GoodsBorrowOrderDetailDAL dal = new GoodsBorrowOrderDetailDAL();
            dal.AddGoodsBorrowOrderDetail(goodsBorrowOrderDetail);
        }

        public void UpdateGoodsBorrowOrderDetail(GoodsBorrowOrderDetail goodsBorrowOrderDetail, int ID)
        {
            GoodsBorrowOrderDetailDAL dal = new GoodsBorrowOrderDetailDAL();
            dal.UpdateGoodsBorrowOrderDetail(goodsBorrowOrderDetail, ID);
        }

        public void DeleteGoodsBorrowOrderDetail(GoodsBorrowOrderDetail goodsBorrowOrderDetail)
        {
            GoodsBorrowOrderDetailDAL dal = new GoodsBorrowOrderDetailDAL();
            dal.DeleteGoodsBorrowOrderDetail(goodsBorrowOrderDetail);
        }

        public IList GetAllGoodsBorrowOrderDetails(string strHQL)
        {
            GoodsBorrowOrderDetailDAL dal = new GoodsBorrowOrderDetailDAL();
            return dal.GetAllGoodsBorrowOrderDetails(strHQL);
        }
    }
}