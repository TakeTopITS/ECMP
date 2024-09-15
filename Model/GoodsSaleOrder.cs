using System;

namespace ProjectMgt.Model
{
    public class GoodsSaleOrder
    {
        public GoodsSaleOrder()
        {
        }

        private int soID;
        private string soName;
        private string customerCode;
        private string customerName;
        private string salesCode;
        private string salesName;
        private DateTime saleTime;
        private DateTime arrivalTime;
        private decimal amount;
        private string currencyType;
        private string comment;
        private string operatorCode;
        private string operatorName;
        private string status;
        private string relatedType;
        private int relatedID;

        public virtual int SOID
        {
            get { return soID; }
            set { soID = value; }
        }

        public virtual string SOName
        {
            get { return soName; }
            set { soName = value; }
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

        public virtual DateTime SaleTime
        {
            get { return saleTime; }
            set { saleTime = value; }
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

        public virtual string SaleType
        {
            set; get;
        }

        public virtual string InvoiceType
        {
            set; get;
        }

        public virtual string ReceiverAddress
        {
            set; get;
        }

        public virtual string ContactPerson
        {
            set; get;
        }


        public virtual string ContactPhoneNumber
        {
            set; get;
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