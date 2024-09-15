namespace ProjectMgt.Model
{
    public class WZPurchaseDetail
    {
        public WZPurchaseDetail()
        {
        }

        public virtual int ID { get; set; }
        public virtual string PurchaseCode { get; set; }
        public virtual int PlanDetailID { get; set; }
        public virtual string SerialNumber { get; set; }
        public virtual string Tenders { get; set; }
        public virtual string ObjectCode { get; set; }
        public virtual string MajorType { get; set; }
        public virtual decimal PurchaseNumber { get; set; }
        public virtual decimal ConvertNumber { get; set; }
        public virtual decimal PlanMoney { get; set; }
        public virtual string Factory { get; set; }
        public virtual string StandardCode { get; set; }
        public virtual string Remark { get; set; }
        public virtual string SupplierCode { get; set; }
        public virtual decimal ApplyMoney { get; set; }
        public virtual decimal TotalMoney { get; set; }
        public virtual string Progress { get; set; }
        public virtual int IsMark { get; set; }
        public virtual int IsPrint { get; set; }
    }
}