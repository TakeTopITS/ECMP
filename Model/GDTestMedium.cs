namespace ProjectMgt.Model
{
    public class GDTestMedium
    {
        public GDTestMedium()
        {
        }

        public virtual int ID { get; set; }
        public virtual string TestMedium { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}