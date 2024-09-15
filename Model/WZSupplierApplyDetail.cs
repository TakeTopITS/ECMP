namespace ProjectMgt.Model
{
    public class WZSupplierApplyDetail
    {
        public WZSupplierApplyDetail()
        {
        }

        public virtual int ID { get; set; }
        public virtual string SupplierCode { get; set; }
        public virtual string PurchaseCode { get; set; }
        public virtual int PurchaseDetailID { get; set; }
        public virtual decimal ApplyMoney { get; set; }
    }
}