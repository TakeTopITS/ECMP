namespace ProjectMgt.Model
{
    public class GDPressureObject
    {
        public GDPressureObject()
        {
        }

        public virtual int ID { get; set; }
        public virtual string PressureObject { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}