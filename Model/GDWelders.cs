namespace ProjectMgt.Model
{
    public class GDWelders
    {
        public GDWelders()
        {
        }

        public virtual string Welders { get; set; }
        public virtual string PublicTime { get; set; }
        public virtual string Status { get; set; }
        public virtual string WelderName { get; set; }
        public virtual string RequestCode { get; set; }
        public virtual string CompanyName { get; set; }
        public virtual string Qualification { get; set; }
        public virtual string WeldPosition1 { get; set; }
        public virtual string WeldPosition2 { get; set; }
        public virtual string Remarks { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}