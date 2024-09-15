namespace ProjectMgt.Model
{
    public class GDOrderCode
    {
        public GDOrderCode()
        {
        }

        public virtual int ID { get; set; }
        public virtual string Code { get; set; }
        public virtual string Description { get; set; }
        public virtual string Remark { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}