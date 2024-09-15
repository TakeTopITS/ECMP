using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsSaleQuotationOrderBLL
    {
        public void AddGoodsSaleQuotationOrder(GoodsSaleQuotationOrder goodsSaleQuotationOrder)
        {
            GoodsSaleQuotationOrderDAL dal = new GoodsSaleQuotationOrderDAL();
            dal.AddGoodsSaleQuotationOrder(goodsSaleQuotationOrder);
        }

        public void UpdateGoodsSaleQuotationOrder(GoodsSaleQuotationOrder goodsSaleQuotationOrder, int QOID)
        {
            GoodsSaleQuotationOrderDAL dal = new GoodsSaleQuotationOrderDAL();
            dal.UpdateGoodsSaleQuotationOrder(goodsSaleQuotationOrder, QOID);
        }

        public void DeleteGoodsSaleQuotationOrder(GoodsSaleQuotationOrder goodsSaleQuotationOrder)
        {
            GoodsSaleQuotationOrderDAL dal = new GoodsSaleQuotationOrderDAL();
            dal.DeleteGoodsSaleQuotationOrder(goodsSaleQuotationOrder);
        }

        public IList GetAllGoodsSaleQuotationOrders(string strHQL)
        {
            GoodsSaleQuotationOrderDAL dal = new GoodsSaleQuotationOrderDAL();
            return dal.GetAllGoodsSaleQuotationOrders(strHQL);
        }
    }
}