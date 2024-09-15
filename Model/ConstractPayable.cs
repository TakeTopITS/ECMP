using System;

namespace ProjectMgt.Model
{
    public class ConstractPayable
    {
        public ConstractPayable()
        {
        }

        private int id;
        private string billCode;
        private string constractCode;
        private string account;
        private decimal payableAccount;
        private DateTime payableTime;
        private decimal outOfPocketAccount;
        private DateTime outOfPocketTime;
        private decimal unPayAmount;
        private decimal invoiceAccount;
        private string receiver;
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

        private decimal payOtherAccount;
        private decimal otherAccount;

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

        public virtual decimal PayableAccount
        {
            get { return payableAccount; }
            set { payableAccount = value; }
        }

        public virtual DateTime PayableTime
        {
            get { return payableTime; }
            set { payableTime = value; }
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

        public virtual decimal UNPayAmount
        {
            get { return unPayAmount; }
            set { unPayAmount = value; }
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

        public virtual decimal PayOtherAccount
        {
            get { return payOtherAccount; }
            set { payOtherAccount = value; }
        }

        public virtual decimal OtherAccount
        {
            get { return otherAccount; }
            set { otherAccount = value; }
        }

        public virtual int RelatedPJBudgetID
        {
            get; set;
        }

        public virtual string RelatedPJBudgetAccountCode
        {
            get; set;
        }

        public virtual string RelatedPJBudgetAccount
        {
            get; set;
        }
    }
}