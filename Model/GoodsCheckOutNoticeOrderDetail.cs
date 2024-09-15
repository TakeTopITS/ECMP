using System;

namespace ProjectMgt.Model
{
    public class GoodsCheckOutNoticeOrderDetail
    {
        public GoodsCheckOutNoticeOrderDetail()
        {
        }

        private int id;
        private int cooID;
        private string goodsCode;
        private string goodsName;
        private string type;
        private string spec;
        private string modelNumber;
        private string customerModelNumber;
        private string barCode;
        private decimal number;
        private decimal boxNumber;
        private decimal price;
        private string currencyType;
        private decimal amount;
        private decimal checkOutNumber;
        private string unit;
        private string finishStatus;
        private string deliveryAddress;
        private DateTime checkOutTime;
        private string comment;
        private int pdID;
        private string pdName;
        private string sourceType;
        private int sourceID;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int COOID
        {
            get { return cooID; }
            set { cooID = value; }
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

        public virtual string CustomerModelNumber
        {
            get { return customerModelNumber; }
            set { customerModelNumber = value; }
        }

        public virtual string Spec
        {
            get { return spec; }
            set { spec = value; }
        }

        public virtual string Brand
        {
            get; set;
        }

        public virtual string BarCode
        {
            get { return barCode; }
            set { barCode = value; }
        }

        public virtual decimal Number
        {
            get { return number; }
            set { number = value; }
        }

        public virtual decimal BoxNumber
        {
            get { return boxNumber; }
            set { boxNumber = value; }
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

        public virtual string FinishStatus
        {
            get { return finishStatus; }
            set { finishStatus = value; }
        }

        public virtual string DeliveryAddress
        {
            get { return deliveryAddress; }
            set { deliveryAddress = value; }
        }

        public virtual DateTime CheckOutTime
        {
            get { return checkOutTime; }
            set { checkOutTime = value; }
        }

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
        }

        public virtual int PDID
        {
            get { return pdID; }
            set { pdID = value; }
        }

        public virtual string PDName
        {
            get { return pdName; }
            set { pdName = value; }
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
    }
}