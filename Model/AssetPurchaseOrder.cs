using System;

namespace ProjectMgt.Model
{
    public class AssetPurchaseOrder
    {
        public AssetPurchaseOrder()
        {
        }

        private int poID;
        private string poName;
        private string purManCode;
        private string purManName;
        private DateTime purTime;
        private DateTime arrivalTime;
        private decimal amount;
        private string currencyType;
        private string comment;
        private string operatorCode;
        private string operatorName;
        private string status;
        private string relatedType;
        private int relatedID;

        public virtual int POID
        {
            get { return poID; }
            set { poID = value; }
        }

        public virtual string POName
        {
            get { return poName; }
            set { poName = value; }
        }

        public virtual string PurManCode
        {
            get { return purManCode; }
            set { purManCode = value; }
        }

        public virtual string PurManName
        {
            get { return purManName; }
            set { purManName = value; }
        }

        public virtual DateTime PurTime
        {
            get { return purTime; }
            set { purTime = value; }
        }

        public virtual DateTime ArrivalTime
        {
            get { return arrivalTime; }
            set { arrivalTime = value; }
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

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
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

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
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
    }
}