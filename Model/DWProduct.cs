namespace ProjectMgt.Model
{
    public class DWProduct
    {
        public DWProduct()
        {
        }

        public virtual int ID { get; set; }
        public virtual string ProductName { get; set; }
        public virtual int TypeID { get; set; }
        public virtual string ProductCode { get; set; }
    }
}