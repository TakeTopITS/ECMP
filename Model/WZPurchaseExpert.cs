namespace ProjectMgt.Model
{
    public class WZPurchaseExpert
    {
        public WZPurchaseExpert()
        {
        }

        public virtual int ID { get; set; }
        public virtual string PurchaseCode { get; set; }
        public virtual string ExpertCode { get; set; }
        public virtual string ExpertName { get; set; }
    }
}