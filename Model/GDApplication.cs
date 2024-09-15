namespace ProjectMgt.Model
{
    public class GDApplication
    {
        public GDApplication()
        {
        }

        public virtual int ID { get; set; }
        public virtual string LineUser { get; set; }
        public virtual string Instructions { get; set; }
        public virtual string TheSystem { get; set; }
        public virtual string Remark { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}