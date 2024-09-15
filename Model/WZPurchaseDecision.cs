using System;

namespace ProjectMgt.Model
{
    public class WZPurchaseDecision
    {
        public WZPurchaseDecision()
        {
        }

        public virtual int ID { get; set; }
        public virtual string PurchaseCode { get; set; }
        public virtual string SupplierCode1 { get; set; }
        public virtual string SupplierCode2 { get; set; }
        public virtual string SupplierCode3 { get; set; }
        public virtual string Decision { get; set; }
        public virtual DateTime DecisionTime { get; set; }
        public virtual string DecisionDesc { get; set; }
    }
}