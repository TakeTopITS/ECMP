using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsSaleOrderBLL
    {
        public void AddGoodsSaleOrder(GoodsSaleOrder goodsSaleOrder)
        {
            GoodsSaleOrderDAL dal = new GoodsSaleOrderDAL();
            dal.AddGoodsSaleOrder(goodsSaleOrder);
        }

        public void UpdateGoodsSaleOrder(GoodsSaleOrder goodsSaleOrder, int SOID)
        {
            GoodsSaleOrderDAL dal = new GoodsSaleOrderDAL();
            dal.UpdateGoodsSaleOrder(goodsSaleOrder, SOID);
        }

        public void DeleteGoodsSaleOrder(GoodsSaleOrder goodsSaleOrder)
        {
            GoodsSaleOrderDAL dal = new GoodsSaleOrderDAL();
            dal.DeleteGoodsSaleOrder(goodsSaleOrder);
        }

        public IList GetAllGoodsSaleOrders(string strHQL)
        {
            GoodsSaleOrderDAL dal = new GoodsSaleOrderDAL();
            return dal.GetAllGoodsSaleOrders(strHQL);
        }
    }
}