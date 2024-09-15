namespace ProjectMgt.Model
{
    public class WZCardImport
    {
        public WZCardImport()
        {
        }

        public virtual int ID { get; set; }
        public virtual string NoCode { get; set; }
        public virtual string ObjectName { get; set; }
        public virtual decimal OutNumber { get; set; }
        public virtual decimal OutPrice { get; set; }
        public virtual decimal OutMoney { get; set; }
        public virtual decimal PlanMoney { get; set; }
        public virtual string ImportStatus { get; set; }
        public virtual string CardCode { get; set; }
        public virtual string PickingCode { get; set; }
        public virtual string MaterialPerson { get; set; }
        public virtual string TurnCode { get; set; }
    }
}