using System;

namespace ProjectMgt.Model
{
    public class WZSupplierApplyComment
    {
        public WZSupplierApplyComment()
        {
        }

        public virtual int ID { get; set; }
        public virtual string PurchaseCode { get; set; }
        public virtual string ExpertCode { get; set; }
        public virtual string SupplierCode1 { get; set; }
        public virtual string SupplierCode2 { get; set; }
        public virtual string SupplierCode3 { get; set; }
        public virtual string SignName { get; set; }
        public virtual string Suggest { get; set; }
        public virtual DateTime SignTime { get; set; }
    }
}