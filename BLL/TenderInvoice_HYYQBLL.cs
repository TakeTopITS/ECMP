using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class TenderInvoice_HYYQBLL
    {
        public void AddTenderInvoice_HYYQ(TenderInvoice_HYYQ tenderInvoice_HYYQ)
        {
            TenderInvoice_HYYQDAL dal = new TenderInvoice_HYYQDAL();
            dal.AddTenderInvoice_HYYQ(tenderInvoice_HYYQ);
        }

        public void UpdateTenderInvoice_HYYQ(TenderInvoice_HYYQ tenderInvoice_HYYQ, int ID)
        {
            TenderInvoice_HYYQDAL dal = new TenderInvoice_HYYQDAL();
            dal.UpdateTenderInvoice_HYYQ(tenderInvoice_HYYQ, ID);
        }

        public void DeleteTenderInvoice_HYYQ(TenderInvoice_HYYQ tenderInvoice_HYYQ)
        {
            TenderInvoice_HYYQDAL dal = new TenderInvoice_HYYQDAL();
            dal.DeleteTenderInvoice_HYYQ(tenderInvoice_HYYQ);
        }

        public IList GetAllTenderInvoice_HYYQs(string strHQL)
        {
            TenderInvoice_HYYQDAL dal = new TenderInvoice_HYYQDAL();
            return dal.GetAllTenderInvoice_HYYQs(strHQL);
        }
    }
}