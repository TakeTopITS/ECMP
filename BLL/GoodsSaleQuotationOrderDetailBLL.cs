using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class GoodsSaleQuotationOrderDetailBLL
    {
        public void AddGoodsSaleQuotationOrderDetail(GoodsSaleQuotationOrderDetail goodsSaleQuotationOrderDetail)
        {
            GoodsSaleQuotationOrderDetailDAL dal = new GoodsSaleQuotationOrderDetailDAL();
            dal.AddGoodsSaleQuotationOrderDetail(goodsSaleQuotationOrderDetail);
        }

        public void UpdateGoodsSaleQuotationOrderDetail(GoodsSaleQuotationOrderDetail goodsSaleQuotationOrderDetail, int ID)
        {
            GoodsSaleQuotationOrderDetailDAL dal = new GoodsSaleQuotationOrderDetailDAL();
            dal.UpdateGoodsSaleQuotationOrderDetail(goodsSaleQuotationOrderDetail, ID);
        }

        public void DeleteGoodsSaleQuotationOrderDetail(GoodsSaleQuotationOrderDetail goodsSaleQuotationOrderDetail)
        {
            GoodsSaleQuotationOrderDetailDAL dal = new GoodsSaleQuotationOrderDetailDAL();
            dal.DeleteGoodsSaleQuotationOrderDetail(goodsSaleQuotationOrderDetail);
        }

        public IList GetAllGoodsSaleQuotationOrderDetails(string strHQL)
        {
            GoodsSaleQuotationOrderDetailDAL dal = new GoodsSaleQuotationOrderDetailDAL();
            return dal.GetAllGoodsSaleQuotationOrderDetails(strHQL);
        }
    }
}