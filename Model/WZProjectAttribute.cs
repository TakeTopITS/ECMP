namespace ProjectMgt.Model
{
    public class WZProjectAttribute
    {
        public WZProjectAttribute()
        {
        }

        public virtual int ID { get; set; }
        public virtual string AttributeCode { get; set; }
        public virtual string AttributeDesc { get; set; }
        public virtual int IsMark { get; set; }
    }
}