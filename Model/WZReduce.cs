using System;

namespace ProjectMgt.Model
{
    public class WZReduce
    {
        public WZReduce()
        {
        }

        public virtual string ReduceCode { get; set; }
        public virtual string StoreRoom { get; set; }
        public virtual DateTime PlanTime { get; set; }
        public virtual decimal PlanMoney { get; set; }
        public virtual string ExcuteTime { get; set; }
        public virtual int DetailNumber { get; set; }
        public virtual decimal StoreTotalMoney { get; set; }
        public virtual decimal StoreDownMoney { get; set; }
        public virtual decimal CleanMoney { get; set; }
        public virtual int TotalNumber { get; set; }
        public virtual decimal TotalStore { get; set; }
        public virtual decimal TotalRatio { get; set; }
        public virtual decimal TotalDownMoney { get; set; }
        public virtual decimal TotalCleanMoney { get; set; }
        public virtual string Remark { get; set; }
        public virtual string Process { get; set; }
        public virtual string MainLeader { get; set; }
        public virtual string Marker { get; set; }
    }
}