namespace ProjectMgt.Model
{
    public class GDWelderWPSNo
    {
        public GDWelderWPSNo()
        {
        }

        public virtual int ID { get; set; }
        public virtual string Welder_no { get; set; }
        public virtual string WPSNo { get; set; }
        public virtual string Remarks { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}