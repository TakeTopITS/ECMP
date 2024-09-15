namespace ProjectMgt.Model
{
    public class GDRTNotQualified
    {
        public GDRTNotQualified()
        {
        }

        public virtual int ID { get; set; }
        public virtual string NotQualified { get; set; }
        public virtual string Description { get; set; }
        public virtual string WeldPosition { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}