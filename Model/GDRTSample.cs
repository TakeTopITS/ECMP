namespace ProjectMgt.Model
{
    public class GDRTSample
    {
        public GDRTSample()
        {
        }

        public virtual int ID { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual string Isom_no { get; set; }
        public virtual string Joint { get; set; }
        public virtual string Cover { get; set; }
        public virtual string CoverDate { get; set; }
        public virtual string RTLotNo { get; set; }
        public virtual string RTSampleNo { get; set; }
        public virtual string RTInstrNo { get; set; }
        public virtual string RTSampleSerialNo { get; set; }
        public virtual string Remark { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}