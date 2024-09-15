using ProjectMgt.Model;

using System.Collections;

namespace ProjectMgt.DAL
{
    public class ConstractRelatedInvoiceDAL
    {
        private EntityControl control;

        public ConstractRelatedInvoiceDAL()
        {
            control = EntityControl.CreateEntityControl("ProjectMgt.Model");
        }

        public void AddConstractRelatedInvoice(ConstractRelatedInvoice constractRelatedInvoice)
        {
            control.AddEntity(constractRelatedInvoice);
        }

        public void UpdateConstractRelatedInvoice(ConstractRelatedInvoice constractRelatedInvoice, int ID)
        {
            control.UpdateEntity(constractRelatedInvoice, ID);
        }

        public void DeleteConstractRelatedInvoice(ConstractRelatedInvoice constractRelatedInvoice)
        {
            control.DeleteEntity(constractRelatedInvoice);
        }

        public IList GetAllConstractRelatedInvoices(string strHQL)
        {
            return control.GetEntities(strHQL);
        }
    }
}