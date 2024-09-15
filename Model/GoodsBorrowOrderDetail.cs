namespace ProjectMgt.Model
{
    public class GoodsBorrowOrderDetail
    {
        public GoodsBorrowOrderDetail()
        {
        }

        private int id;
        private int borrowNO;
        private string goodsCode;
        private string goodsName;
        private string type;
        private string sn;
        private string modelNumber;
        private string spec;
        private decimal number;
        private decimal returnNumber;
        private decimal price;
        private decimal amount;
        private string currencyType;
        private string unitName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int BorrowNO
        {
            get { return borrowNO; }
            set { borrowNO = value; }
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

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string SN
        {
            get { return sn; }
            set { sn = value; }
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

        public virtual decimal ReturnNumber
        {
            get { return returnNumber; }
            set { returnNumber = value; }
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
        public virtual string Brand
        {
            set; get;
        }

    }
}