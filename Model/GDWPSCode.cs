namespace ProjectMgt.Model
{
    public class GDWPSCode
    {
        public GDWPSCode()
        {
        }

        public virtual string WPSNo { get; set; }
        public virtual string Description { get; set; }
        public virtual string Remarks { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}