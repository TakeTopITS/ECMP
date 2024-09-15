using System;

namespace ProjectMgt.Model
{
    public class Goods
    {
        public Goods()
        {
        }

        private int id;

        private string goodsCode;
        private string sn;
        private string goodsName;
        private decimal number;
        private decimal checkInNumber;
        private decimal returnNumber;
        private string unitName;
        private string type;
        private string modelNumber;
        private string spec;
        private string position;

        private string ownerCode;
        private string ownerName;
        private decimal price;
        private string isTaxPrice;
        private string currencyType;
        private DateTime buyTime;
        private string manufacturer;
        private int warrantyPeriod;

        private string photoURL;

        private string memo;
        private string status;

        private int checkInID;
        private int checkInDetailID;
        private int returnDetailID;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
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

        public virtual decimal Number
        {
            get { return number; }
            set { number = value; }
        }

        public virtual decimal CheckInNumber
        {
            get { return checkInNumber; }
            set { checkInNumber = value; }
        }

        public virtual decimal ReturnNumber
        {
            get { return returnNumber; }
            set { returnNumber = value; }
        }

        public virtual string UnitName
        {
            get { return unitName; }
            set { unitName = value; }
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

        public virtual string Position
        {
            get { return position; }
            set { position = value; }
        }

        public virtual string WHPosition
        {
            get; set;
        }

        public virtual string OwnerCode
        {
            get { return ownerCode; }
            set { ownerCode = value; }
        }

        public virtual string OwnerName
        {
            get { return ownerName; }
            set { ownerName = value; }
        }

        public virtual decimal Price
        {
            get { return price; }
            set { price = value; }
        }

        public virtual string IsTaxPrice
        {
            get { return isTaxPrice; }
            set { isTaxPrice = value; }
        }

        public virtual string CurrencyType
        {
            get { return currencyType; }
            set { currencyType = value; }
        }

        public virtual DateTime BuyTime
        {
            get { return buyTime; }
            set { buyTime = value; }
        }

        public virtual string Manufacturer
        {
            get { return manufacturer; }
            set { manufacturer = value; }
        }

        public virtual int WarrantyPeriod
        {
            get { return warrantyPeriod; }
            set { warrantyPeriod = value; }
        }

        public virtual string Memo
        {
            get { return memo; }
            set { memo = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string PhotoURL
        {
            get { return photoURL; }
            set { photoURL = value; }
        }

        public virtual string BatchNumber
        {
            get; set;
        }

        public virtual DateTime ProductDate
        {
            get; set;
        }

        public virtual DateTime ExpiryDate
        {
            get; set;
        }

        public virtual string ProductionEquipmentNumber
        {
            get; set;
        }

        public virtual string MaterialFormNumber
        {
            get; set;
        }
    }
}