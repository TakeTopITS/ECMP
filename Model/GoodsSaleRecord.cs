using System;

namespace ProjectMgt.Model
{
    public class GoodsSaleRecord
    {
        public GoodsSaleRecord()
        {
        }

        private int id;
        private int soID;
        private string goodsCode;
        private string goodsName;
        private decimal number;
        private decimal noticeOutNumber;
        private decimal checkOutNumber;
        private decimal deliveryNumber;
        private decimal realReceiveNumber;
        private string unit;
        private string type;
        private string modelNumber;
        private string spec;
        private string saleReason;
        private decimal price;
        private decimal amount;
        private string currencyType;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int SOID
        {
            get { return soID; }
            set { soID = value; }
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

        public virtual decimal Number
        {
            get { return number; }
            set { number = value; }
        }

        public virtual decimal NoticeOutNumber
        {
            get { return noticeOutNumber; }
            set { noticeOutNumber = value; }
        }

        public virtual decimal CheckOutNumber
        {
            get { return checkOutNumber; }
            set { checkOutNumber = value; }
        }

        public virtual decimal DeliveryNumber
        {
            get { return deliveryNumber; }
            set { deliveryNumber = value; }
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

        public virtual string SaleReason
        {
            get { return saleReason; }
            set { saleReason = value; }
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

        public virtual string Brand
        {
            set; get;
        }

        public virtual String SourceType
        {
            get; set;
        }


        public virtual int SourceID
        {
            get; set;
        }
    }
}
