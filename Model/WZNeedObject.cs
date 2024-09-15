namespace ProjectMgt.Model
{
    public class WZNeedObject
    {
        public WZNeedObject()
        {
        }

        public virtual int ID { get; set; }
        public virtual string NeedCode { get; set; }
        public virtual string Vendee { get; set; }
        public virtual string PersonDelegate { get; set; }
        public virtual string OpeningBank { get; set; }
        public virtual string AccountNumber { get; set; }
        public virtual string RateNumber { get; set; }
        public virtual string UnitAddress { get; set; }
        public virtual string ZipCode { get; set; }
        public virtual string AccountPhone { get; set; }
        public virtual string InternetUrl { get; set; }
        public virtual string PurchaseEngineer { get; set; }
        public virtual string Fax { get; set; }
        public virtual string ContactPhone { get; set; }
        public virtual string Mobile { get; set; }
        public virtual string Email { get; set; }
        public virtual string QQ { get; set; }
        public virtual int IsMark { get; set; }
    }
}