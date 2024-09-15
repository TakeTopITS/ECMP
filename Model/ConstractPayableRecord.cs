using System;

namespace ProjectMgt.Model
{
    public class ConstractPayableRecord
    {
        public ConstractPayableRecord()
        {
        }

        private int id;
        private int payableID;

        private string constractCode;

        private string reAndPayType;
        private string currency;
        private decimal exchangeRate;
        private string bank;

        private decimal outOfPocketAccount;
        private DateTime outOfPocketTime;

        private decimal homeCurrencyAmount;
        private decimal handlingCharge;

        private decimal invoiceAccount;
        private string receiver;
        private string operatorCode;
        private string operatorName;
        private DateTime operateTime;

        private string comment;

        private int relatedProjectID;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int PayableID
        {
            get { return payableID; }
            set { payableID = value; }
        }

        public virtual string ConstractCode
        {
            get { return constractCode; }
            set { constractCode = value; }
        }

        public virtual string ReAndPayType
        {
            get { return reAndPayType; }
            set { reAndPayType = value; }
        }

        public virtual string Currency
        {
            get { return currency; }
            set { currency = value; }
        }

        public virtual decimal ExchangeRate
        {
            get { return exchangeRate; }
            set { exchangeRate = value; }
        }

        public virtual string Bank
        {
            get { return bank; }
            set { bank = value; }
        }

        public virtual Decimal OutOfPocketAccount
        {
            get { return outOfPocketAccount; }
            set { outOfPocketAccount = value; }
        }

        public virtual DateTime OutOfPocketTime
        {
            get { return outOfPocketTime; }
            set { outOfPocketTime = value; }
        }

        public virtual decimal HomeCurrencyAmount
        {
            get { return homeCurrencyAmount; }
            set { homeCurrencyAmount = value; }
        }

        public virtual decimal HandlingCharge
        {
            get { return handlingCharge; }
            set { handlingCharge = value; }
        }

        public virtual decimal InvoiceAccount
        {
            get { return invoiceAccount; }
            set { invoiceAccount = value; }
        }

        public virtual string Receiver
        {
            get { return receiver; }
            set { receiver = value; }
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

        public virtual DateTime OperateTime
        {
            get { return operateTime; }
            set { operateTime = value; }
        }

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
        }

        public virtual int RelatedProjectID
        {
            get { return relatedProjectID; }
            set { relatedProjectID = value; }
        }
    }
}