using System;

namespace ProjectMgt.Model
{
    public class GoodsProductionOrder
    {
        public GoodsProductionOrder()
        {
        }

        private int pdID;
        private string pdName;
        private string routeName;
        private string productionType;
        private string creatorCode;
        private string creatorName;
        private DateTime productionDate;
        private DateTime finishedDate;

        private string curencyType;
        private decimal amount;

        private string relatedType;
        private int relatedID;

        private string status;

        private string belongDepartCode;
        private string belongDepartName;

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

        public virtual string RouteName
        {
            get { return routeName; }
            set { routeName = value; }
        }

        public virtual string ProductionType
        {
            get { return productionType; }
            set { productionType = value; }
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

        public virtual DateTime ProductionDate
        {
            get { return productionDate; }
            set { productionDate = value; }
        }

        public virtual DateTime FinishedDate
        {
            get { return finishedDate; }
            set { finishedDate = value; }
        }

        public virtual string CurrencyType
        {
            get { return curencyType; }
            set { curencyType = value; }
        }

        public virtual decimal Amount
        {
            get { return amount; }
            set { amount = value; }
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

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string BelongDepartCode
        {
            get { return belongDepartCode; }
            set { belongDepartCode = value; }
        }

        public virtual string BelongDepartName
        {
            get { return belongDepartName; }
            set { belongDepartName = value; }
        }

        public virtual string BusinessType
        {
            get; set;
        }

        public virtual string BusinessCode
        {
            get; set;
        }
    }
}