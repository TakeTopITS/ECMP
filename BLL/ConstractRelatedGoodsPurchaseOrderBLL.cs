using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractRelatedGoodsPurchaseOrderBLL
    {
        public void AddConstractRelatedGoodsPurchaseOrder(ConstractRelatedGoodsPurchaseOrder constractRelatedGoodsPurchaseOrder)
        {
            ConstractRelatedGoodsPurchaseOrderDAL dal = new ConstractRelatedGoodsPurchaseOrderDAL();
            dal.AddConstractRelatedGoodsPurchaseOrder(constractRelatedGoodsPurchaseOrder);
        }

        public void UpdateConstractRelatedGoodsPurchaseOrder(ConstractRelatedGoodsPurchaseOrder constractRelatedGoodsPurchaseOrder, int ID)
        {
            ConstractRelatedGoodsPurchaseOrderDAL dal = new ConstractRelatedGoodsPurchaseOrderDAL();
            dal.UpdateConstractRelatedGoodsPurchaseOrder(constractRelatedGoodsPurchaseOrder, ID);
        }

        public void DeleteConstractRelatedGoodsPurchaseOrder(ConstractRelatedGoodsPurchaseOrder constractRelatedGoodsPurchaseOrder)
        {
            ConstractRelatedGoodsPurchaseOrderDAL dal = new ConstractRelatedGoodsPurchaseOrderDAL();
            dal.DeleteConstractRelatedGoodsPurchaseOrder(constractRelatedGoodsPurchaseOrder);
        }

        public IList GetAllConstractRelatedGoodsPurchaseOrders(string strHQL)
        {
            ConstractRelatedGoodsPurchaseOrderDAL dal = new ConstractRelatedGoodsPurchaseOrderDAL();
            return dal.GetAllConstractRelatedGoodsPurchaseOrders(strHQL);
        }
    }
}