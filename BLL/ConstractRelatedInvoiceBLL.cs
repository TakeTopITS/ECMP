using ProjectMgt.DAL;
using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.BLL
{
    public class ConstractRelatedInvoiceBLL
    {
        public void AddConstractRelatedInvoice(ConstractRelatedInvoice constractRelatedInvoice)
        {
            ConstractRelatedInvoiceDAL dal = new ConstractRelatedInvoiceDAL();
            dal.AddConstractRelatedInvoice(constractRelatedInvoice);
        }

        public void UpdateConstractRelatedInvoice(ConstractRelatedInvoice constractRelatedInvoice, int ID)
        {
            ConstractRelatedInvoiceDAL dal = new ConstractRelatedInvoiceDAL();
            dal.UpdateConstractRelatedInvoice(constractRelatedInvoice, ID);
        }

        public void DeleteConstractRelatedInvoice(ConstractRelatedInvoice constractRelatedInvoice)
        {
            ConstractRelatedInvoiceDAL dal = new ConstractRelatedInvoiceDAL();
            dal.DeleteConstractRelatedInvoice(constractRelatedInvoice);
        }

        public IList GetAllConstractRelatedInvoices(string strHQL)
        {
            ConstractRelatedInvoiceDAL dal = new ConstractRelatedInvoiceDAL();
            return dal.GetAllConstractRelatedInvoices(strHQL);
        }
    }
}