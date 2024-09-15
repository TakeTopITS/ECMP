using System;

namespace ProjectMgt.Model
{
    public class GoodsApplicationDetail
    {
        public GoodsApplicationDetail()
        {
        }

        private int id;
        private int aaid;
        private string goodsCode;
        private string goodsName;
        private string type;
        private string spec;
        private string modelNumber;
        private decimal number;
        private decimal price;
        private string currencyType;
        private decimal amount;
        private decimal checkOutNumber;
        private string unit;
        private string ip;
        private string sourceType;
        private int sourceID;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int AAID
        {
            get { return aaid; }
            set { aaid = value; }
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

        public virtual decimal CheckOutNumber
        {
            get { return checkOutNumber; }
            set { checkOutNumber = value; }
        }

        public virtual string Unit
        {
            get { return unit; }
            set { unit = value; }
        }

        public virtual string IP
        {
            get { return ip; }
            set { ip = value; }
        }

        public virtual String SourceType
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