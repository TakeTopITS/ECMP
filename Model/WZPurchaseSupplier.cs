namespace ProjectMgt.Model
{
    public class WZPurchaseSupplier
    {
        public WZPurchaseSupplier()
        {
        }

        public virtual int ID { get; set; }
        public virtual string PurchaseCode { get; set; }
        public virtual string SupplierCode { get; set; }
        public virtual string SupplierName { get; set; }
        public virtual string DocumentName { get; set; }
        public virtual string DocumentURL { get; set; }
        public virtual string IsConfirm { get; set; }
    }
}