namespace ProjectMgt.Model
{
    public class DWMakeCost
    {
        public DWMakeCost()
        {
        }

        public virtual int ID { get; set; }
        public virtual string MakeType { get; set; }
        public virtual decimal Cost { get; set; }
        public virtual decimal TonCost { get; set; }
        public virtual string YearMonth { get; set; }
    }
}