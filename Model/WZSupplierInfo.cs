using System;

namespace ProjectMgt.Model
{
    public class WZSupplierInfo
    {
        public WZSupplierInfo()
        {
        }

        public virtual int ID { get; set; }
        public virtual string SupplierCode { get; set; }
        public virtual string SupplierPass { get; set; }
        public virtual string SupplierName { get; set; }
        public virtual DateTime CreateTime { get; set; }
    }
}