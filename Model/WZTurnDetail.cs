using System;

namespace ProjectMgt.Model
{
    public class WZTurnDetail
    {
        public WZTurnDetail()
        {
        }

        public virtual int ID { get; set; }
        public virtual string TurnCode { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual string PickingUnit { get; set; }
        public virtual string StoreRoom { get; set; }
        public virtual string PickingCode { get; set; }
        public virtual string PickingMethod { get; set; }
        public virtual string NoCode { get; set; }
        public virtual string PlanCode { get; set; }
        public virtual string ObjectCode { get; set; }
        public virtual decimal TicketNumber { get; set; }
        public virtual decimal ActualNumber { get; set; }
        public virtual decimal TicketPrice { get; set; }
        public virtual decimal TicketMoney { get; set; }
        public virtual DateTime TicketTime { get; set; }
        public virtual DateTime PickingTime { get; set; }
        public virtual string MaterialPerson { get; set; }
        public virtual string Progress { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string CardCode { get; set; }
        public virtual decimal PlanPrice { get; set; }
        public virtual decimal PlanMoney { get; set; }
        public virtual string CardPerson { get; set; }
        public virtual int CardIsMark { get; set; }
    }
}