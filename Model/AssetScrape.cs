using System;

namespace ProjectMgt.Model
{
    public class AssetScrape
    {
        public AssetScrape()
        {
        }

        private int id;
        private int assetID;
        private string assetCode;
        private string assetName;
        private string type;
        private string oldUserCode;
        private string oldUserName;
        private decimal scrapeNumber;
        private string scrapeReason;
        private DateTime scrapeTime;
        private string operatorCode;
        private string operatorName;
        private string afterScrapeUse;
        private decimal getAmount;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int AssetID
        {
            get { return assetID; }
            set { assetID = value; }
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

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string OldUserCode
        {
            get { return oldUserCode; }
            set { oldUserCode = value; }
        }

        public virtual string OldUserName
        {
            get { return oldUserName; }
            set { oldUserName = value; }
        }

        public virtual decimal ScrapeNumber
        {
            get { return scrapeNumber; }
            set { scrapeNumber = value; }
        }

        public virtual string ScrapeReason
        {
            get { return scrapeReason; }
            set { scrapeReason = value; }
        }

        public virtual DateTime ScrapeTime
        {
            get { return scrapeTime; }
            set { scrapeTime = value; }
        }

        public virtual string OperatorCode
        {
            get { return operatorCode; }
            set { operatorCode = value; }
        }

        public virtual string OperatorName
        {
            get { return operatorName; }
            set { operatorName = value; }
        }

        public virtual string AfterScrapeUse
        {
            get { return afterScrapeUse; }
            set { afterScrapeUse = value; }
        }

        public virtual decimal GetAmount
        {
            get { return getAmount; }
            set { getAmount = value; }
        }
    }
}