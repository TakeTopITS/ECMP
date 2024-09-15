namespace ProjectMgt.Model
{
    public class DWLineTransport
    {
        public DWLineTransport()
        {
        }

        public virtual int ID { get; set; }
        public virtual string CustomName { get; set; }
        public virtual decimal Amount { get; set; }
        public virtual decimal Cost { get; set; }
        public virtual string YearMonth { get; set; }
    }
}