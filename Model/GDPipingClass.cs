namespace ProjectMgt.Model
{
    public class GDPipingClass
    {
        public GDPipingClass()
        {
        }

        public virtual int ID { get; set; }
        public virtual string LevelClass { get; set; }
        public virtual string LineLevel { get; set; }
        public virtual string MediumCode { get; set; }
        public virtual string SinceNumber { get; set; }
        public virtual string PNo { get; set; }
        public virtual string RT { get; set; }
        public virtual string Docking { get; set; }
        public virtual string Branch { get; set; }
        public virtual string Splice { get; set; }
        public virtual string Attached { get; set; }
        public virtual string HotHandler { get; set; }
        public virtual string PMIMaterial { get; set; }
        public virtual string Material { get; set; }
        public virtual string WeldingMaterial { get; set; }
        public virtual string Remark { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}