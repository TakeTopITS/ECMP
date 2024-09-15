namespace ProjectMgt.Model
{
    public class GDWeldType
    {
        public GDWeldType()
        {
        }

        public virtual int ID { get; set; }
        public virtual string Type { get; set; }
        public virtual string Description { get; set; }
        public virtual decimal Factor { get; set; }
        public virtual string Code { get; set; }
        public virtual string KeyCode { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}