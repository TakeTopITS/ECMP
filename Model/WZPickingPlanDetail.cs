namespace ProjectMgt.Model
{
    public class WZPickingPlanDetail
    {
        public WZPickingPlanDetail()
        {
        }

        public virtual int ID { get; set; }
        public virtual string PlanCode { get; set; }
        public virtual string ObjectCode { get; set; }
        public virtual decimal PlanNumber { get; set; }
        public virtual decimal ConvertNumber { get; set; }
        public virtual decimal PlanCost { get; set; }
        public virtual string Remark { get; set; }
        public virtual decimal ReceivedNumber { get; set; }
        public virtual decimal ShortNumber { get; set; }
        public virtual decimal ShortConver { get; set; }
        public virtual string PurchaseCode { get; set; }
        public virtual string ContractCode { get; set; }
        public virtual string TurnCode { get; set; }
        public virtual string StoreSign { get; set; }
        public virtual string Progress { get; set; }
        public virtual string OldCode { get; set; }
        public virtual int IsMark { get; set; }
    }
}