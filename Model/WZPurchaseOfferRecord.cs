namespace ProjectMgt.Model
{
    public class WZPurchaseOfferRecord
    {
        public WZPurchaseOfferRecord()
        {
        }

        public virtual int ID { get; set; }
        public virtual string PurchaseCode { get; set; }
        public virtual int PlanDetailID { get; set; }
        public virtual int PurchaseDetailID { get; set; }
        public virtual string SupplierCode { get; set; }
        public virtual string Tenders { get; set; }
        public virtual string SerialNumber { get; set; }

        public virtual string ObjectCode { get; set; }
        public virtual string ObjectName { get; set; }
        public virtual string Model { get; set; }
        public virtual string Criterion { get; set; }
        public virtual string Grade { get; set; }
        public virtual int Unit { get; set; }

        public virtual decimal PurchaseNumber { get; set; }

        public virtual decimal ApplyMoney { get; set; }
        public virtual decimal TotalMoney { get; set; }
        public virtual string ReplaceCode { get; set; }
        public virtual string ScalingResult { get; set; }
        public virtual string Progress { get; set; }
    }
}