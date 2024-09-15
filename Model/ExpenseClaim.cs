using System;

namespace ProjectMgt.Model
{
    public class ExpenseClaim
    {
        public ExpenseClaim()
        {
        }

        private int ecID;
        private string relatedType;
        private int relatedID;
        private string expenseName;
        private string purpose;
        private decimal amount;
        private string currencyType;
        private string applicantCode;
        private string applicantName;
        private DateTime applyTime;
        private string status;

        public virtual int ECID
        {
            get { return ecID; }
            set { ecID = value; }
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

        public virtual string ExpenseName
        {
            get { return expenseName; }
            set { expenseName = value; }
        }

        public virtual string Purpose
        {
            get { return purpose; }
            set { purpose = value; }
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

        public virtual string ApplicantCode
        {
            get { return applicantCode; }
            set { applicantCode = value; }
        }

        public virtual string ApplicantName
        {
            get { return applicantName; }
            set { applicantName = value; }
        }

        public virtual DateTime ApplyTime
        {
            get { return applyTime; }
            set { applyTime = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}