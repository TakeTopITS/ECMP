namespace ProjectMgt.Model
{
    public class DWProMatch
    {
        public DWProMatch()
        {
        }

        public virtual int ID { get; set; }
        public virtual int ProductID { get; set; }
        public virtual int MatchID { get; set; }
        public virtual decimal ProductPrice { get; set; }
    }
}