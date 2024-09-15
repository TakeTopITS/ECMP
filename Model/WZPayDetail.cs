using System;

namespace ProjectMgt.Model
{
    public class WZPayDetail
    {
        public WZPayDetail()
        {
        }

        public virtual int ID { get; set; }
        public virtual string PayID { get; set; }
        public virtual string RequestCode { get; set; }
        public virtual DateTime CancelTime { get; set; }
        public virtual string CompactCode { get; set; }
        public virtual string SupplierCode { get; set; }
        public virtual string Supplier { get; set; }
        public virtual decimal PlanMoney { get; set; }
        public virtual string Borrower { get; set; }
        public virtual string UseWay { get; set; }
        public virtual string PayProcess { get; set; }
    }
}