namespace ProjectMgt.Model
{
    public class GDHotHandler
    {
        public GDHotHandler()
        {
        }

        public virtual int ID { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual string Isom_no { get; set; }
        public virtual string Joint { get; set; }
        public virtual string THK { get; set; }
        public virtual string Fluid { get; set; }
        public virtual string Size { get; set; }
        public virtual string HotType { get; set; }
        public virtual string HotRoot { get; set; }
        public virtual string Cover { get; set; }
        public virtual string CoverDate { get; set; }
        public virtual string PWHTReport { get; set; }
        public virtual string PWHTDate { get; set; }
        public virtual string Grd { get; set; }
        public virtual string RT { get; set; }
        public virtual string ReportNo { get; set; }
        public virtual string ReportDate { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}