using System;

namespace ProjectMgt.Model
{
    public class WZCollect
    {
        public WZCollect()
        {
        }

        public virtual string CollectCode { get; set; }
        public virtual int CompactDetailID { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual int PlanDetailID { get; set; }
        public virtual string ObjectCode { get; set; }
        public virtual string StoreRoom { get; set; }
        public virtual DateTime TicketTime { get; set; }
        public virtual string CollectMethod { get; set; }
        public virtual decimal CollectNumber { get; set; }
        public virtual decimal ActualNumber { get; set; }
        public virtual decimal ActualPrice { get; set; }
        public virtual decimal ActualMoney { get; set; }
        public virtual decimal Ratio { get; set; }
        public virtual decimal RatioMoney { get; set; }
        public virtual decimal Freight { get; set; }
        public virtual decimal OtherObject { get; set; }
        public virtual decimal ConvertNumber { get; set; }
        public virtual string SupplierCode { get; set; }
        public virtual string TicketNumber { get; set; }
        public virtual string CheckCode { get; set; }
        public virtual string Checker { get; set; }
        public virtual string CheckTime { get; set; }
        public virtual string Safekeeper { get; set; }
        public virtual string CollectTime { get; set; }
        public virtual string Contacter { get; set; }
        public virtual string RequestCode { get; set; }
        public virtual string FinanceApprove { get; set; }
        public virtual string PayProcess { get; set; }
        public virtual string Progress { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string CompactCode { get; set; }
    }
}