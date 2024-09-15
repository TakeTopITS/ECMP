using System;

namespace ProjectMgt.Model
{
    public class WZSend
    {
        public WZSend()
        {
        }

        public virtual string SendCode { get; set; }
        public virtual int PlanDetaiID { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual DateTime TicketTime { get; set; }
        public virtual string SendMethod { get; set; }
        public virtual string StoreRoom { get; set; }
        public virtual string ObjectCode { get; set; }
        public virtual decimal PlanNumber { get; set; }
        public virtual decimal ActualNumber { get; set; }
        public virtual decimal PlanPrice { get; set; }
        public virtual decimal PlanMoney { get; set; }
        public virtual decimal SalePrice { get; set; }
        public virtual decimal SaleMoney { get; set; }
        public virtual decimal ManageRate { get; set; }
        public virtual decimal ManageMoney { get; set; }
        public virtual decimal TotalMoney { get; set; }
        public virtual decimal DownMoney { get; set; }
        public virtual decimal CleanMoney { get; set; }
        public virtual string ReduceCode { get; set; }
        public virtual string WearyCode { get; set; }
        public virtual string GoodsCode { get; set; }
        public virtual string CheckCode { get; set; }
        public virtual string CheckTime { get; set; }
        public virtual string Checker { get; set; }
        public virtual string SendTime { get; set; }
        public virtual string Safekeeper { get; set; }
        public virtual string PurchaseEngineer { get; set; }
        public virtual string UnitCode { get; set; }
        public virtual string PickingUnit { get; set; }
        public virtual string UpLeader { get; set; }
        public virtual string Progress { get; set; }
        public virtual int IsMark { get; set; }

        public virtual string CarCode { get; set; }
        public virtual string Comment { get; set; }
    }
}