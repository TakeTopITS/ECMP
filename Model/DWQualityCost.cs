namespace ProjectMgt.Model
{
    public class DWQualityCost
    {
        public DWQualityCost()
        {
        }

        public virtual int ID { get; set; }
        public virtual string CustomName { get; set; }
        public virtual decimal PayMoney { get; set; }
        public virtual string YearMonth { get; set; }

        public virtual string Workshop { get; set; }
    }
}