namespace ProjectMgt.Model
{
    public class GDFri
    {
        public GDFri()
        {
        }

        public virtual int ID { get; set; }
        public virtual string Area { get; set; }
        public virtual string CodeName { get; set; }
        public virtual string FRICode { get; set; }
        public virtual string Edition { get; set; }
        public virtual string PublicTime { get; set; }
        public virtual string Description { get; set; }
        public virtual string Remarks { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}