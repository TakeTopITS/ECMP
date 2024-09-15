using System;

namespace ProjectMgt.Model
{
    public class WZTurn
    {
        public WZTurn()
        {
        }

        public virtual string TurnCode { get; set; }
        public virtual int ID { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual string ProjectName { get; set; }
        public virtual string UnitCode { get; set; }
        public virtual string PickingUnit { get; set; }
        public virtual DateTime TurnTime { get; set; }
        public virtual string PurchaseEngineer { get; set; }
        public virtual string SingTime { get; set; }
        public virtual string MaterialPerson { get; set; }
        public virtual string FinishTime { get; set; }
        public virtual string CheckPerson { get; set; }
        public virtual int RowNumber { get; set; }
        public virtual string StoreRoom { get; set; }
        public virtual string Progress { get; set; }
        public virtual int IsMark { get; set; }
    }
}