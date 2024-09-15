using System;

namespace ProjectMgt.Model
{
    public class AssetCheckInOrderDetail
    {
        public AssetCheckInOrderDetail()
        {
        }

        private int id;
        private int checkInID;
        private string assetCode;
        private string assetName;
        private decimal number;
        private decimal checkInNumber;
        private string unitName;
        private string type;
        private string modelNumber;
        private string spec;
        private string position;
        private string ip;
        private string ownerCode;
        private string ownerName;
        private decimal price;
        private decimal amount;
        private string currencyType;
        private DateTime buyTime;
        private string manufacturer;

        private string memo;
        private string status;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int CheckInID
        {
            get { return checkInID; }
            set { checkInID = value; }
        }

        public virtual string AssetCode
        {
            get { return assetCode; }
            set { assetCode = value; }
        }

        public virtual string AssetName
        {
            get { return assetName; }
            set { assetName = value; }
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

        public virtual string IP
        {
            get { return ip; }
            set { ip = value; }
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
    }
}