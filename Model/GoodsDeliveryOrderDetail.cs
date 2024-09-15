namespace ProjectMgt.Model
{
    public class GoodsDeliveryOrderDetail
    {
        public GoodsDeliveryOrderDetail()
        {
        }

        private int id;
        private int doID;
        private string goodsCode;
        private string goodsName;
        private string sn;
        private decimal number;
        private decimal realReceiveNumber;
        private string unit;
        private string type;
        private string modelNumber;
        private string spec;
        private decimal price;
        private decimal amount;
        private string currencyType;
        private int relatedID;
        private string sourceType;
        private int sourceID;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int DOID
        {
            get { return doID; }
            set { doID = value; }
        }

        public virtual string GoodsCode
        {
            get { return goodsCode; }
            set { goodsCode = value; }
        }

        public virtual string GoodsName
        {
            get { return goodsName; }
            set { goodsName = value; }
        }

        public virtual string SN
        {
            get { return sn; }
            set { sn = value; }
        }

        public virtual decimal Number
        {
            get { return number; }
            set { number = value; }
        }

        public virtual decimal RealReceiveNumber
        {
            get { return realReceiveNumber; }
            set { realReceiveNumber = value; }
        }

        public virtual string Unit
        {
            get { return unit; }
            set { unit = value; }
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

        public virtual int RelatedID
        {
            get { return relatedID; }
            set { relatedID = value; }
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

        public virtual string Brand
        {
            set; get;
        }
    }
}