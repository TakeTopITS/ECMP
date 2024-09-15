namespace ProjectMgt.Model
{
    public class GDStandardSize
    {
        public GDStandardSize()
        {
        }

        public virtual int ID { get; set; }
        public virtual string Size { get; set; }
        public virtual decimal DB { get; set; }
        public virtual int NPS { get; set; }
        public virtual decimal ODGB { get; set; }
        public virtual decimal ODANSI { get; set; }
        public virtual string BQMainCode { get; set; }
        public virtual string BQSubCode { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}