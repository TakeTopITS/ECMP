namespace ProjectMgt.Model
{
    public class WZPurchaseFile
    {
        public WZPurchaseFile()
        {
        }

        public virtual int ID { get; set; }
        public virtual string PurchaseCode { get; set; }
        public virtual string FileUrl { get; set; }
    }
}