using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsPurchaseOrderBLL
    {
        public void AddGoodsPurchaseOrder(GoodsPurchaseOrder goodsPurchaseOrder)
        {
            GoodsPurchaseOrderDAL dal = new GoodsPurchaseOrderDAL();
            dal.AddGoodsPurchaseOrder(goodsPurchaseOrder);
        }

        public void UpdateGoodsPurchaseOrder(GoodsPurchaseOrder goodsPurchaseOrder, int POID)
        {
            GoodsPurchaseOrderDAL dal = new GoodsPurchaseOrderDAL();
            dal.UpdateGoodsPurchaseOrder(goodsPurchaseOrder, POID);
        }

        public void DeleteGoodsPurchaseOrder(GoodsPurchaseOrder goodsPurchaseOrder)
        {
            GoodsPurchaseOrderDAL dal = new GoodsPurchaseOrderDAL();
            dal.DeleteGoodsPurchaseOrder(goodsPurchaseOrder);
        }

        public IList GetAllGoodsPurchaseOrders(string strHQL)
        {
            GoodsPurchaseOrderDAL dal = new GoodsPurchaseOrderDAL();
            return dal.GetAllGoodsPurchaseOrders(strHQL);
        }
    }
}