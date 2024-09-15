using System;

namespace ProjectMgt.Model
{
    public class WZRequest
    {
        public WZRequest()
        {
        }

        public virtual string RequestCode { get; set; }
        public virtual string CompactCode { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual string SupplierCode { get; set; }
        public virtual string UseWay { get; set; }
        public virtual decimal ActualMoney { get; set; }
        public virtual decimal RatioMoney { get; set; }
        public virtual decimal Freight { get; set; }
        public virtual decimal OtherObject { get; set; }
        public virtual decimal BorrowMoney { get; set; }
        public virtual int RowNumber { get; set; }
        public virtual string Borrower { get; set; }
        public virtual DateTime RequestTime { get; set; }
        public virtual string Approver { get; set; }
        public virtual string CancelTime { get; set; }
        public virtual decimal BeforePayMoney { get; set; }
        public virtual decimal PayMoney { get; set; }
        public virtual decimal Arrearage { get; set; }
        public virtual string Progress { get; set; }
        public virtual int IsPay { get; set; }
        public virtual int IsMark { get; set; }
        public virtual int IsFinisth { get; set; }
    }
}