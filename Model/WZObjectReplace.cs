namespace ProjectMgt.Model
{
    public class WZObjectReplace
    {
        public WZObjectReplace()
        {
        }

        public virtual int ID { get; set; }
        public virtual string OldObjectCode { get; set; }
        public virtual string NewObjectCode { get; set; }
    }
}