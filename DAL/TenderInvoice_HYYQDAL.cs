using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class TenderInvoice_HYYQDAL
    {
        private EntityControl control;

        public TenderInvoice_HYYQDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddTenderInvoice_HYYQ(TenderInvoice_HYYQ tenderInvoice_HYYQ)
        {
            control.AddEntity(tenderInvoice_HYYQ);
        }

        public void UpdateTenderInvoice_HYYQ(TenderInvoice_HYYQ tenderInvoice_HYYQ, int ID)
        {
            control.UpdateEntity(tenderInvoice_HYYQ, ID);
        }

        public void DeleteTenderInvoice_HYYQ(TenderInvoice_HYYQ tenderInvoice_HYYQ)
        {
            control.DeleteEntity(tenderInvoice_HYYQ);
        }

        public IList GetAllTenderInvoice_HYYQs(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}