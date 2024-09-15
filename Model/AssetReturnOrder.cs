using System;

namespace ProjectMgt.Model
{
    public class AssetReturnOrder
    {
        public AssetReturnOrder()
        {
        }

        private int roID;
        private string returnName;
        private decimal amount;
        private string currencyType;
        private DateTime returnTime;
        private string operatorCode;
        private string operatorName;
        private string applicant;

        public virtual int ROID
        {
            get { return roID; }
            set { roID = value; }
        }

        public virtual string ReturnName
        {
            get { return returnName; }
            set { returnName = value; }
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

        public virtual DateTime ReturnTime
        {
            get { return returnTime; }
            set { returnTime = value; }
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

        public virtual string Applicant
        {
            get { return applicant; }
            set { applicant = value; }
        }
    }
}