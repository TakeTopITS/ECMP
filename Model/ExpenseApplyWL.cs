using System;

namespace ProjectMgt.Model
{
    public class ExpenseApplyWL
    {
        public ExpenseApplyWL()
        {
        }

        private int id;
        private string relatedType;
        private int relatedID;
        private string expenseName;
        private string purpose;
        private string accountCode;
        private string account;
        private decimal amount;
        private string currencyType;
        private DateTime payBackTime;
        private string applicantCode;
        private string applicantName;
        private DateTime applyTime;
        private string status;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
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

        public virtual string AccountCode
        {
            get { return accountCode; }
            set { accountCode = value; }
        }

        public virtual string Account
        {
            get { return account; }
            set { account = value; }
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

        public virtual DateTime PayBackTime
        {
            get { return payBackTime; }
            set { payBackTime = value; }
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