using System;

namespace ProjectMgt.Model
{
    public class ConstractGoodsDeliveryPlan
    {
        public ConstractGoodsDeliveryPlan()
        {
        }

        private int id;
        private string constractCode;
        private string goodsCode;
        private string goodsName;
        private string spec;
        private string type;
        private string modelNumber;
        private decimal number;
        private string unit;
        private decimal price;
        private decimal amount;
        private DateTime deliveryTime;
        private string deliveryAddress;
        private decimal deliveredNumber;
        private decimal unDeliveredNumber;
        private int preDay;
        private string status;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string ConstractCode
        {
            get { return constractCode; }
            set { constractCode = value; }
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

        public virtual string Spec
        {
            get { return spec; }
            set { spec = value; }
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

        public virtual decimal Number
        {
            get { return number; }
            set { number = value; }
        }

        public virtual string Unit
        {
            get { return unit; }
            set { unit = value; }
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

        public virtual DateTime DeliveryTime
        {
            get { return deliveryTime; }
            set { deliveryTime = value; }
        }

        public virtual string DeliveryAddress
        {
            get { return deliveryAddress; }
            set { deliveryAddress = value; }
        }

        public virtual decimal DeliveredNumber
        {
            get { return deliveredNumber; }
            set { deliveredNumber = value; }
        }

        public virtual decimal UNDeliveredNumber
        {
            get { return unDeliveredNumber; }
            set { unDeliveredNumber = value; }
        }

        public virtual int PreDay
        {
            get { return preDay; }
            set { preDay = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string Brand
        {
            set; get;
        }
    }
}