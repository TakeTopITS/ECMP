using System;

namespace ProjectMgt.Model
{
    public class ConstractGoodsDeliveryRecord
    {
        public ConstractGoodsDeliveryRecord()
        {
        }

        private int id;
        private int deliveryPlanID;
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

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int DeliveryPlanID
        {
            get { return deliveryPlanID; }
            set { deliveryPlanID = value; }
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

        public virtual string Brand
        {
            set; get;
        }
    }
}