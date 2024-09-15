namespace ProjectMgt.Model
{
    public class TenderInvoice_HYYQ
    {
        public TenderInvoice_HYYQ()
        {
        }

        public virtual int id { get; set; }
        public virtual int TenderID { get; set; }
        public virtual string InvoiceNumber { get; set; }
        public virtual decimal InvoiceMoney { get; set; }
        public virtual string Remarks { get; set; }
        public virtual string InvoiceDate { get; set; }
    }
}