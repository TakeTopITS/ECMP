using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class GoodsSaleQuotationOrderDAL
    {
        private EntityControl control;

        public GoodsSaleQuotationOrderDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddGoodsSaleQuotationOrder(GoodsSaleQuotationOrder goodsSaleQuotationOrder)
        {
            control.AddEntity(goodsSaleQuotationOrder);
        }

        public void UpdateGoodsSaleQuotationOrder(GoodsSaleQuotationOrder goodsSaleQuotationOrder, int QOID)
        {
            control.UpdateEntity(goodsSaleQuotationOrder, QOID);
        }

        public void DeleteGoodsSaleQuotationOrder(GoodsSaleQuotationOrder goodsSaleQuotationOrder)
        {
            control.DeleteEntity(goodsSaleQuotationOrder);
        }

        public IList GetAllGoodsSaleQuotationOrders(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}