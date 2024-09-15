using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractRelatedGoodsSaleOrderBLL
    {
        public void AddConstractRelatedGoodsSaleOrder(ConstractRelatedGoodsSaleOrder constractRelatedGoodsSaleOrder)
        {
            ConstractRelatedGoodsSaleOrderDAL dal = new ConstractRelatedGoodsSaleOrderDAL();
            dal.AddConstractRelatedGoodsSaleOrder(constractRelatedGoodsSaleOrder);
        }

        public void UpdateConstractRelatedGoodsSaleOrder(ConstractRelatedGoodsSaleOrder constractRelatedGoodsSaleOrder, int ID)
        {
            ConstractRelatedGoodsSaleOrderDAL dal = new ConstractRelatedGoodsSaleOrderDAL();
            dal.UpdateConstractRelatedGoodsSaleOrder(constractRelatedGoodsSaleOrder, ID);
        }

        public void DeleteConstractRelatedGoodsSaleOrder(ConstractRelatedGoodsSaleOrder constractRelatedGoodsSaleOrder)
        {
            ConstractRelatedGoodsSaleOrderDAL dal = new ConstractRelatedGoodsSaleOrderDAL();
            dal.DeleteConstractRelatedGoodsSaleOrder(constractRelatedGoodsSaleOrder);
        }

        public IList GetAllConstractRelatedGoodsSaleOrders(string strHQL)
        {
            ConstractRelatedGoodsSaleOrderDAL dal = new ConstractRelatedGoodsSaleOrderDAL();
            return dal.GetAllConstractRelatedGoodsSaleOrders(strHQL);
        }
    }
}