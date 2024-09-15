namespace ProjectMgt.Model
{
    public class DWMatch
    {
        public DWMatch()
        {
        }

        public virtual int ID { get; set; }
        public virtual string MatchName { get; set; }
        public virtual int MatchType { get; set; }
        public virtual decimal MaterialPrice { get; set; }
    }
}