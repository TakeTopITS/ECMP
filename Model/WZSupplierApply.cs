namespace ProjectMgt.Model
{
    public class WZSupplierApply
    {
        public WZSupplierApply()
        {
        }

        public virtual int ID { get; set; }
        public virtual string PurchaseCode { get; set; }
        public virtual string SupplierCode { get; set; }
        public virtual string SupplierName { get; set; }
        public virtual decimal ApplyMoney { get; set; }
        public virtual string ApplyDocument { get; set; }
        public virtual string ApplyTime { get; set; }
    }
}