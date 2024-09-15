using System;

namespace ProjectMgt.Model
{
    public class GoodsSaleQuotationOrder
    {
        public GoodsSaleQuotationOrder()
        {
        }

        private int qoID;
        private string qoName;
        private string customerCode;
        private string customerName;
        private string salesCode;
        private string salesName;
        private DateTime quotationTime;
        private DateTime validityPeriod;
        private decimal amount;
        private string currencyType;
        private string comment;
        private string operatorCode;
        private string operatorName;
        private string status;
        private string relatedType;
        private int relatedID;

        public virtual int QOID
        {
            get { return qoID; }
            set { qoID = value; }
        }

        public virtual string QOName
        {
            get { return qoName; }
            set { qoName = value; }
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

        public virtual string SalesCode
        {
            get { return salesCode; }
            set { salesCode = value; }
        }

        public virtual string SalesName
        {
            get { return salesName; }
            set { salesName = value; }
        }

        public virtual DateTime QuotationTime
        {
            get { return quotationTime; }
            set { quotationTime = value; }
        }

        public virtual DateTime ValidityPeriod
        {
            get { return validityPeriod; }
            set { validityPeriod = value; }
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

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
        }
    }
}