using System;

namespace ProjectMgt.Model
{
    public class WZPickingPlan
    {
        public WZPickingPlan()
        {
        }

        public virtual string PlanCode { get; set; }
        public virtual string SinceNumber { get; set; }
        public virtual string PlanName { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual string ProjectName { get; set; }
        public virtual string StoreRoom { get; set; }
        public virtual string PickingUnit { get; set; }
        public virtual string UnitCode { get; set; }
        public virtual string SupplyMethod { get; set; }
        public virtual int DetailCount { get; set; }
        public virtual decimal PlanCost { get; set; }
        public virtual string PlanMarker { get; set; }
        public virtual DateTime MarkerTime { get; set; }
        public virtual string CommitTime { get; set; }
        public virtual string FeeManage { get; set; }
        public virtual string ApproveTime { get; set; }
        public virtual string PurchaseEngineer { get; set; }
        public virtual string SignTime { get; set; }
        public virtual string ReturnReason { get; set; }
        public virtual string CancelTime { get; set; }
        public virtual string Progress { get; set; }
        public virtual int IsMark { get; set; }
    }
}