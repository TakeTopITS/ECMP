using System;

namespace ProjectMgt.Model
{
    public class ConstractReceivables
    {
        public ConstractReceivables()
        {
        }

        private int id;
        private string constractCode;
        private string billCode;
        private string account;
        private decimal receivablesAccount;
        private DateTime receivablesTime;
        private decimal receiverAccount;
        private DateTime receiverTime;
        private decimal invoiceAccount;
        private decimal unReceiveAmount;
        private string payer;
        private string currencyType;
        private string operatorCode;
        private string operatorName;
        private DateTime operateTime;
        private int preDays;
        private string status;
        private string comment;

        private string relatedType;
        private int relatedID;
        private int relatedRecordID;
        private int relatedProjectID;
        private int relatedPlanID;

        private decimal exchangeRate;
        private string accountCode;
        private string isSecrecy;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string ConstractCode
        {
            get { return constractCode; }
            set { constractCode = value; }
        }

        public virtual string BillCode
        {
            get { return billCode; }
            set { billCode = value; }
        }

        public virtual string Account
        {
            get { return account; }
            set { account = value; }
        }

        public virtual decimal ReceivablesAccount
        {
            get { return receivablesAccount; }
            set { receivablesAccount = value; }
        }

        public virtual DateTime ReceivablesTime
        {
            get { return receivablesTime; }
            set { receivablesTime = value; }
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

        public virtual Decimal UNReceiveAmount
        {
            get { return unReceiveAmount; }
            set { unReceiveAmount = value; }
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

        public virtual DateTime OperateTime
        {
            get { return operateTime; }
            set { operateTime = value; }
        }

        public virtual int PreDays
        {
            get { return preDays; }
            set { preDays = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
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

        public virtual int RelatedRecordID
        {
            get { return relatedRecordID; }
            set { relatedRecordID = value; }
        }

        public virtual int RelatedProjectID
        {
            get { return relatedProjectID; }
            set { relatedProjectID = value; }
        }

        public virtual int RelatedPlanID
        {
            get { return relatedPlanID; }
            set { relatedPlanID = value; }
        }

        public virtual decimal ExchangeRate
        {
            get { return exchangeRate; }
            set { exchangeRate = value; }
        }

        public virtual string AccountCode
        {
            get { return accountCode; }
            set { accountCode = value; }
        }

        public virtual string IsSecrecy
        {
            get { return isSecrecy; }
            set { isSecrecy = value; }
        }
    }
}