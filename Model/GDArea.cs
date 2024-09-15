namespace ProjectMgt.Model
{
    public class GDArea
    {
        public GDArea()
        {
        }

        public virtual int ID { get; set; }
        public virtual string Place { get; set; }
        public virtual string MainArea { get; set; }
        public virtual string Area { get; set; }
        public virtual string Subcontractor { get; set; }
        public virtual string AreaDescription { get; set; }
        public virtual string TheSystem { get; set; }
        public virtual string UnitCode { get; set; }
        public virtual string UnitName { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}