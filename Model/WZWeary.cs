using System;

namespace ProjectMgt.Model
{
    public class WZWeary
    {
        public WZWeary()
        {
        }

        public virtual string WearyCode { get; set; }
        public virtual string StoreRoom { get; set; }
        public virtual DateTime PlanTime { get; set; }
        public virtual decimal WearyTotalMoney { get; set; }
        public virtual int RowNumber { get; set; }
        public virtual decimal WearyBalance { get; set; }
        public virtual int OverNumber { get; set; }
        public virtual string Remark { get; set; }
        public virtual string Process { get; set; }
        public virtual string MainLeader { get; set; }
        public virtual string Marker { get; set; }
        public virtual int TotalYear { get; set; }
    }
}