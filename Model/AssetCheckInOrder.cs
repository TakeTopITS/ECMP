using System;

namespace ProjectMgt.Model
{
    public class AssetCheckInOrder
    {
        public AssetCheckInOrder()
        {
        }

        private int checkInID;
        private DateTime checkInDate;
        private string wareHouse;
        private string sourceType;
        private int sourceID;
        private decimal amount;
        private string currencyType;
        private string creatorCode;
        private string creatorName;

        public virtual int CheckInID
        {
            get { return checkInID; }
            set { checkInID = value; }
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

        public virtual string SourceType
        {
            get { return sourceType; }
            set { sourceType = value; }
        }

        public virtual int SourceID
        {
            get { return sourceID; }
            set { sourceID = value; }
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
    }
}