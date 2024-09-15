namespace ProjectMgt.Model
{
    public class GDSystem
    {
        public GDSystem()
        {
        }

        public virtual int ID { get; set; }
        public virtual string TheSystem { get; set; }
        public virtual string Instructions { get; set; }
        public virtual string MCDate { get; set; }
        public virtual string Remark { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}