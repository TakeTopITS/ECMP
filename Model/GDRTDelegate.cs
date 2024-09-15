namespace ProjectMgt.Model
{
    public class GDRTDelegate
    {
        public GDRTDelegate()
        {
        }

        public virtual int ID { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual string Isom_no { get; set; }
        public virtual string LotCount { get; set; }
        public virtual string Cover { get; set; }
        public virtual string JtNo { get; set; }
        public virtual string Size { get; set; }
        public virtual string Fluid { get; set; }
        public virtual string LotNo { get; set; }
        public virtual string SampleNo { get; set; }
        public virtual string Res { get; set; }
        public virtual string LockStatus { get; set; }
        public virtual string InstrnDate { get; set; }
        public virtual string InstrnNo { get; set; }
        public virtual string RTRecord { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}