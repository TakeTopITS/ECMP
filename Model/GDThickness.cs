namespace ProjectMgt.Model
{
    public class GDThickness
    {
        public GDThickness()
        {
        }

        public virtual int ID { get; set; }
        public virtual string LineLevel { get; set; }
        public virtual string Size { get; set; }
        public virtual string Rules { get; set; }
        public virtual decimal Thickness { get; set; }
        public virtual string HotHandler { get; set; }
        public virtual int IsMark { get; set; }
        public virtual string UserCode { get; set; }
    }
}