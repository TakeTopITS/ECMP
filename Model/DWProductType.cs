namespace ProjectMgt.Model
{
    public class DWProductType
    {
        public DWProductType()
        {
        }

        public virtual int ID { get; set; }
        public virtual string ProductType { get; set; }
        public virtual string ProductDesc { get; set; }
    }
}