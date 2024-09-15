namespace ProjectMgt.Model
{
    public class GDJointRevision
    {
        public GDJointRevision()
        {
        }

        public virtual int ID { get; set; }
        public virtual string Code { get; set; }
        public virtual string Description { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}