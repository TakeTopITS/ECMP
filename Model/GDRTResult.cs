namespace ProjectMgt.Model
{
    public class GDRTResult
    {
        public GDRTResult()
        {
        }

        public virtual int ID { get; set; }
        public virtual string ProjectCode { get; set; }
        public virtual string Isom_no { get; set; }
        public virtual string ReturnWelder1 { get; set; }
        public virtual string ReturnWelder2 { get; set; }
        public virtual string RTRecord1 { get; set; }
        public virtual string RTRecord2 { get; set; }
        public virtual string RTInspectionDate1 { get; set; }
        public virtual string RTInspectionDate2 { get; set; }
        public virtual string RF1 { get; set; }
        public virtual string RF2 { get; set; }
        public virtual string RTResult { get; set; }
        public virtual string RTRender { get; set; }
        public virtual string RTCovering { get; set; }
        public virtual string RTFilm { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}