using System;

namespace ProjectMgt.Model
{
    public class ExpenseClaimDetail
    {
        public ExpenseClaimDetail()
        {
        }

        private int id;
        private int ecID;
        private string relatedType;
        private int relatedID;
        private int relatedExpenseID;
        private string accountCode;
        private string account;
        private string description;
        private decimal amount;
        private string userCode;
        private string userName;
        private DateTime registerDate;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

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

        public virtual int RelatedExpenseID
        {
            get { return relatedExpenseID; }
            set { relatedExpenseID = value; }
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

        public virtual string Description
        {
            get { return description; }
            set { description = value; }
        }

        public virtual decimal Amount
        {
            get { return amount; }
            set { amount = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public virtual DateTime RegisterDate
        {
            get { return registerDate; }
            set { registerDate = value; }
        }
    }
}