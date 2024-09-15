using System;

namespace ProjectMgt.Model
{
    public class GoodsBorrowOrder
    {
        public GoodsBorrowOrder()
        {
        }

        private int borrowNO;
        private string boName;
        private DateTime borrowTime;
        private string operatorCode;
        private string operatorName;
        private string applicant;
        private string applicationReason;
        private string relatedType;
        private int relatedID;
        private string relatedCode;
        private string currencyType;
        private string status;

        public virtual int BorrowNO
        {
            get { return borrowNO; }
            set { borrowNO = value; }
        }

        public virtual string BOName
        {
            get { return boName; }
            set { boName = value; }
        }

        public virtual DateTime BorrowTime
        {
            get { return borrowTime; }
            set { borrowTime = value; }
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

        public virtual string ApplicationReason
        {
            get { return applicationReason; }
            set { applicationReason = value; }
        }

        public virtual string CurrencyType
        {
            get { return currencyType; }
            set { currencyType = value; }
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

        public virtual string RelatedCode
        {
            get { return relatedCode; }
            set { relatedCode = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}