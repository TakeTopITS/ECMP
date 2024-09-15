using System;

namespace ProjectMgt.Model
{
    public class GoodsReturnOrder
    {
        public GoodsReturnOrder()
        {
        }

        private int roID;
        private string type;
        private string returnName;
        private DateTime returnTime;
        private decimal amount;
        private string currencyType;
        private string customerCode;
        private string customerName;
        private string operatorCode;
        private string operatorName;
        private string applicant;
        private string status;

        public virtual int ROID
        {
            get { return roID; }
            set { roID = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string ReturnName
        {
            get { return returnName; }
            set { returnName = value; }
        }

        public virtual DateTime ReturnTime
        {
            get { return returnTime; }
            set { returnTime = value; }
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

        public virtual string CustomerCode
        {
            get { return customerCode; }
            set { customerCode = value; }
        }

        public virtual string CustomerName
        {
            get { return customerName; }
            set { customerName = value; }
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

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}