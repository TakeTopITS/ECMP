using System;

namespace ProjectMgt.Model
{
    public class ConstractRelatedGoods
    {
        public ConstractRelatedGoods()
        {
        }

        private int id;
        private string constractCode;
        private string type;
        private string goodsCode;
        private string goodsName;
        private string modelNumber;
        private string spec;
        private decimal number;
        private string unit;
        private decimal price;
        private decimal amount;

        private DateTime saleTime;
        private DateTime deleveryTime;
        private string deleveryAddress;
        private decimal saleOrderNumber;
        private decimal purchaseOrderNumber;

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

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
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

        public virtual DateTime SaleTime
        {
            get { return saleTime; }
            set { saleTime = value; }
        }

        public virtual DateTime DeleveryTime
        {
            get { return deleveryTime; }
            set { deleveryTime = value; }
        }

        public virtual string DeleveryAddress
        {
            get { return deleveryAddress; }
            set { deleveryAddress = value; }
        }

        public virtual decimal SaleOrderNumber
        {
            get { return saleOrderNumber; }
            set { saleOrderNumber = value; }
        }

        public virtual decimal PurchaseOrderNumber
        {
            get { return purchaseOrderNumber; }
            set { purchaseOrderNumber = value; }
        }

        public virtual string Brand
        {
            get; set;
        }

        public virtual string FirstDirectory
        {
            get; set;
        }

        public virtual string SecondDirectory
        {
            get; set;
        }

        public virtual string ThirdDirectory
        {
            get; set;
        }

        public virtual string FourthDirectory
        {
            get; set;
        }

        public virtual string Comment
        {
            get; set;
        }
    }
}