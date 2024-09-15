using System;

namespace ProjectMgt.Model
{
    public class ProjectBudget
    {
        public ProjectBudget()
        {
        }

        private int id;
        private string accountCode;
        private string account;
        private int projectID;
        private string description;
        private decimal amount;
        private string currencyType;
        private string creatorCode;
        private string creatorName;
        private DateTime createTime;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
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

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
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

        public virtual string CurrencyType
        {
            get { return currencyType; }
            set { currencyType = value; }
        }

        public virtual string CreatorCode
        {
            get { return creatorCode; }
            set { creatorCode = value; }
        }

        public virtual string CreatorName
        {
            get { return creatorName; }
            set { creatorName = value; }
        }

        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }
    }
}