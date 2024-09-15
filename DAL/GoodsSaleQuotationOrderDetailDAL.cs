using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsSaleQuotationOrderDetailDAL
    {
        private EntityControl control;

        public GoodsSaleQuotationOrderDetailDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsSaleQuotationOrderDetail(GoodsSaleQuotationOrderDetail goodsSaleQuotationOrderDetail)
        {
            control.AddEntity(goodsSaleQuotationOrderDetail);
        }

        public void UpdateGoodsSaleQuotationOrderDetail(GoodsSaleQuotationOrderDetail goodsSaleQuotationOrderDetail, int ID)
        {
            control.UpdateEntity(goodsSaleQuotationOrderDetail, ID);
        }

        public void DeleteGoodsSaleQuotationOrderDetail(GoodsSaleQuotationOrderDetail goodsSaleQuotationOrderDetail)
        {
            control.DeleteEntity(goodsSaleQuotationOrderDetail);
        }

        public IList GetAllGoodsSaleQuotationOrderDetails(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}