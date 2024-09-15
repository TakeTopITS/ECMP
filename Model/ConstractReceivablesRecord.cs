using System;

namespace ProjectMgt.Model
{
    public class ConstractReceivablesRecord
    {
        public ConstractReceivablesRecord()
        {
        }

        private int id;
        private int receivablesID;
        private string constractCode;

        private string reAndPayType;
        private string currency;
        private decimal exchangeRate;
        private string bank;

        private decimal receiverAccount;
        private DateTime receiverTime;

        private decimal invoiceAccount;

        private string payer;
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

        public virtual int ReceivablesID
        {
            get { return receivablesID; }
            set { receivablesID = value; }
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

        public virtual Decimal ReceiverAccount
        {
            get { return receiverAccount; }
            set { receiverAccount = value; }
        }

        public virtual DateTime ReceiverTime
        {
            get { return receiverTime; }
            set { receiverTime = value; }
        }

        public virtual decimal InvoiceAccount
        {
            get { return invoiceAccount; }
            set { invoiceAccount = value; }
        }

        public virtual string Payer
        {
            get { return payer; }
            set { payer = value; }
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