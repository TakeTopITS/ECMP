using System;

namespace ProjectMgt.Model
{
    public class WZAdvanceDetail
    {
        public WZAdvanceDetail()
        {
        }

        public virtual int ID { get; set; }
        public virtual string AdvanceCode { get; set; }
        public virtual string ContractCode { get; set; }
        public virtual string ContractName { get; set; }
        public virtual decimal ContractMoney { get; set; }
        public virtual DateTime EffectTime { get; set; }
        public virtual string SupplierCode { get; set; }
        public virtual string SupplierName { get; set; }
        public virtual decimal PayMoney { get; set; }
        public virtual string UseWay { get; set; }
        public virtual string PayProgress { get; set; }
    }
}