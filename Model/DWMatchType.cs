namespace ProjectMgt.Model
{
    public class DWMatchType
    {
        public DWMatchType()
        {
        }

        public virtual int ID { get; set; }
        public virtual string MatchType { get; set; }
        public virtual string MatchDesc { get; set; }
    }
}