namespace ProjectMgt.Model
{
    public class WZPurchaseDocument
    {
        public WZPurchaseDocument()
        {
        }

        public virtual int ID { get; set; }
        public virtual string PurchaseCode { get; set; }
        public virtual string DocumentName { get; set; }
        public virtual string DocumentURL { get; set; }
    }
}