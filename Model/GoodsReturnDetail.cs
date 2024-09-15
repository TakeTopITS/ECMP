namespace ProjectMgt.Model
{
    public class GoodsReturnDetail
    {
        public GoodsReturnDetail()
        {
        }

        private int id;
        private int roID;
        private string goodsCode;
        private string goodsName;
        private string sn;
        private string type;
        private string modelNumber;
        private string spec;
        private decimal number;
        private string unitName;
        private decimal price;
        private decimal amount;

        private int warrantyPeriod;

        private int relatedID;
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

        public virtual int WarrantyPeriod
        {
            get { return warrantyPeriod; }
            set { warrantyPeriod = value; }
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

        public virtual string ReturnReason
        {
            get { return returnReason; }
            set { returnReason = value; }
        }

        public virtual string Brand
        {
            set; get;
        }
    }
}