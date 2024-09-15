namespace ProjectMgt.Model
{
    public class GoodsShipmentDetail
    {
        public GoodsShipmentDetail()
        {
        }

        private int id;
        private int shipmentNO;
        private string goodsCode;
        private string sn;
        private string goodsName;
        private string type;
        private string modelNumber;
        private string spec;
        private decimal number;
        private decimal aleadyOutNumber;
        private decimal deliveryNumber;
        private decimal price;
        private decimal amount;
        private string currencyType;
        private string unitName;
        private string manufacturer;
        private string fromPosition;
        private int fromGoodsID;
        private string toPosition;

        private int warrantyPeriod;

        private int relatedID;

        private string sourceType;
        private int sourceID;

        private string comment;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ShipmentNO
        {
            get { return shipmentNO; }
            set { shipmentNO = value; }
        }

        public virtual string GoodsCode
        {
            get { return goodsCode; }
            set { goodsCode = value; }
        }

        public virtual string SN
        {
            get { return sn; }
            set { sn = value; }
        }

        public virtual string GoodsName
        {
            get { return goodsName; }
            set { goodsName = value; }
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

        public virtual decimal AleadyOutNumber
        {
            get { return aleadyOutNumber; }
            set { aleadyOutNumber = value; }
        }

        public virtual decimal DeliveryNumber
        {
            get { return deliveryNumber; }
            set { deliveryNumber = value; }
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

        public virtual string UnitName
        {
            get { return unitName; }
            set { unitName = value; }
        }

        public virtual string Manufacturer
        {
            get { return manufacturer; }
            set { manufacturer = value; }
        }

        public virtual string FromPosition
        {
            get { return fromPosition; }
            set { fromPosition = value; }
        }

        public virtual int FromGoodsID
        {
            get { return fromGoodsID; }
            set { fromGoodsID = value; }
        }

        public virtual string ToPosition
        {
            get { return toPosition; }
            set { toPosition = value; }
        }

        public virtual string WHPosition
        {
            get; set;
        }

        public virtual string FromWHPosition
        {
            get; set;
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

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
        }
    }
}