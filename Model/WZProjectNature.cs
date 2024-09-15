namespace ProjectMgt.Model
{
    public class WZProjectNature
    {
        public WZProjectNature()
        {
        }

        public virtual int ID { get; set; }
        public virtual string NatureCode { get; set; }
        public virtual string NatureDesc { get; set; }
        public virtual int IsMark { get; set; }
    }
}