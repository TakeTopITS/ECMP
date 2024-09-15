namespace ProjectMgt.Model
{
    public class AssetReturnDetail
    {
        public AssetReturnDetail()
        {
        }

        private int id;
        private int roID;
        private string assetCode;
        private string assetName;
        private string type;
        private string modelNumber;
        private string spec;
        private decimal number;
        private string unitName;
        private decimal price;
        private decimal amount;
        private string currencyType;

        private string manufacturer;

        private string toPosition;

        private string sourceType;
        private int sourceID;

        private string returnReason;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ROID
        {
            get { return roID; }
            set { roID = value; }
        }

        public virtual string AssetCode
        {
            get { return assetCode; }
            set { assetCode = value; }
        }

        public virtual string AssetName
        {
            get { return assetName; }
            set { assetName = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string ModelNumber
        {
            get { return modelNumber; }
            set { modelNumber = value; }
        }

        public virtual string Spec
        {
            get { return spec; }
            set { spec = value; }
        }

        public virtual decimal Number
        {
            get { return number; }
            set { number = value; }
        }

        public virtual string UnitName
        {
            get { return unitName; }
            set { unitName = value; }
        }

        public virtual decimal Price
        {
            get { return price; }
            set { price = value; }
        }

        public virtual decimal Amount
        {
            get { return amount; }
            set { amount = value; }
        }

        public virtual string CurrencyType
        {
            get { return currencyType; }
            set { currencyType = value; }
        }

        public virtual string Manufacturer
        {
            get { return manufacturer; }
            set { manufacturer = value; }
        }

        public virtual string ToPosition
        {
            get { return toPosition; }
            set { toPosition = value; }
        }

        public virtual string SourceType
        {
            get { return sourceType; }
            set { sourceType = value; }
        }

        public virtual int SourceID
        {
            get { return sourceID; }
            set { sourceID = value; }
        }

        public virtual string ReturnReason
        {
            get { return returnReason; }
            set { returnReason = value; }
        }
    }
}