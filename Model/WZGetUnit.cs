namespace ProjectMgt.Model
{
    public class WZGetUnit
    {
        public WZGetUnit()
        {
        }

        public virtual string UnitCode { get; set; }
        public virtual string UnitName { get; set; }
        public virtual string Leader { get; set; }
        public virtual string DelegateAgent { get; set; }
        public virtual string FeeManage { get; set; }
        public virtual string MaterialPerson { get; set; }
        public virtual int IsMark { get; set; }
    }
}