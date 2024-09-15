namespace ProjectMgt.Model
{
    public class Item
    {
        public Item()
        {
        }

        private string itemCode;
        private string itemName;
        private string type;
        private string bigType;
        private string smallType;
        private string unit;
        private string modelNumber;
        private string specification;
        private decimal puLeadTime;
        private decimal mfLeadTime;
        private decimal purchasePrice;
        private decimal salePrice;
        private string currencyType;
        private decimal hrCost;
        private decimal mtCost;
        private decimal mfCost;
        private decimal safetyStock;
        private decimal lossRate;
        private string defaultProcess;
        private string photoURL;
        private int warrantyPeriod;
        private string relatedType;
        private int relatedID;
        private string brand;

        public virtual string ItemCode
        {
            get { return itemCode; }
            set { itemCode = value; }
        }

        public virtual string ItemName
        {
            get { return itemName; }
            set { itemName = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string BigType
        {
            get { return bigType; }
            set { bigType = value; }
        }

        public virtual string SmallType
        {
            get { return smallType; }
            set { smallType = value; }
        }

        public virtual string Unit
        {
            get { return unit; }
            set { unit = value; }
        }

        public virtual string ModelNumber
        {
            get { return modelNumber; }
            set { modelNumber = value; }
        }

        public virtual string Specification
        {
            get { return specification; }
            set { specification = value; }
        }

        public virtual decimal PULeadTime
        {
            get { return puLeadTime; }
            set { puLeadTime = value; }
        }

        public virtual decimal MFLeadTime
        {
            get { return mfLeadTime; }
            set { mfLeadTime = value; }
        }

        public virtual decimal PurchasePrice
        {
            get { return purchasePrice; }
            set { purchasePrice = value; }
        }

        public virtual decimal SalePrice
        {
            get { return salePrice; }
            set { salePrice = value; }
        }

        public virtual string CurrencyType
        {
            get { return currencyType; }
            set { currencyType = value; }
        }

        public virtual decimal HRCost
        {
            get { return hrCost; }
            set { hrCost = value; }
        }

        public virtual decimal MTCost
        {
            get { return mtCost; }
            set { mtCost = value; }
        }

        public virtual decimal MFCost
        {
            get { return mfCost; }
            set { mfCost = value; }
        }

        public virtual decimal SafetyStock
        {
            get { return safetyStock; }
            set { safetyStock = value; }
        }

        public virtual decimal LossRate
        {
            get { return lossRate; }
            set { lossRate = value; }
        }

        public virtual string RegistrationNumber
        {
            get; set;
        }

        public virtual string PackingType
        {
            get; set;
        }

        public virtual string DefaultProcess
        {
            get { return defaultProcess; }
            set { defaultProcess = value; }
        }

        public virtual int WarrantyPeriod
        {
            get { return warrantyPeriod; }
            set { warrantyPeriod = value; }
        }

        public virtual string PhotoURL
        {
            get { return photoURL; }
            set { photoURL = value; }
        }

        public virtual string RelatedType
        {
            get { return relatedType; }
            set { relatedType = value; }
        }

        public virtual int RelatedID
        {
            get { return relatedID; }
            set { relatedID = value; }
        }

        public virtual string Brand
        {
            set; get;
        }
    }
}