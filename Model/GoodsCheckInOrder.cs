using System;

namespace ProjectMgt.Model
{
    public class GoodsCheckInOrder
    {
        public GoodsCheckInOrder()
        {
        }

        private int checkInID;
        private string gcioName;
        private DateTime checkInDate;
        private string checkInType;
        private string wareHouse;

        private decimal amount;
        private string currencyType;
        private string creatorCode;
        private string creatorName;
        private string vendorName;

        private string relatedType;
        private int relatedID;

        public virtual int CheckInID
        {
            get { return checkInID; }
            set { checkInID = value; }
        }

        public virtual string GCIOName
        {
            get { return gcioName; }
            set { gcioName = value; }
        }

        public virtual string CheckInType
        {
            get { return checkInType; }
            set { checkInType = value; }
        }

        public virtual DateTime CheckInDate
        {
            get { return checkInDate; }
            set { checkInDate = value; }
        }

        public virtual string WareHouse
        {
            get { return wareHouse; }
            set { wareHouse = value; }
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

        public virtual string CreatorCode
        {
            get { return creatorCode; }
            set { creatorCode = value; }
        }

        public virtual string CreatorName
        {
            get { return creatorName; }
            set { creatorName = value; }
        }

        public virtual string VendorName
        {
            get { return vendorName; }
            set { vendorName = value; }
        }

        public virtual string RelatedType
        {
            get { return relatedType; }
            set { relatedType = value; }
        }

        public virtual int RelatedID
        {
            get { return relatedID; }
            set { relatedID = value; }
        }

        public virtual string PayStatus
        {
            get;
            set;
        }
    }
}