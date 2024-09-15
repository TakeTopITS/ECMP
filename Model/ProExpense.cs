using System;

namespace ProjectMgt.Model
{
    public class ProExpense
    {
        public ProExpense()
        {
        }

        private int id;
        private int projectID;
        private int taskID;
        private int recordID;
        private int constractPayID;
        private int questionID;
        private int planID;
        private int workflowID;

        private string accountCode;
        private string account;
        private string description;
        private decimal amount;

        private decimal confirmAmount;
        private string currencyType;
        private string financialStaffCode;
        private string financialStaffName;
        private DateTime effectDate;
        private string userCode;
        private string userName;
        private DateTime registerDate;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual int TaskID
        {
            get { return taskID; }
            set { taskID = value; }
        }

        public virtual int RecordID
        {
            get { return recordID; }
            set { recordID = value; }
        }

        public virtual int ConstractPayID
        {
            get { return constractPayID; }
            set { constractPayID = value; }
        }

        public virtual int QuestionID
        {
            get { return questionID; }
            set { questionID = value; }
        }

        public virtual int PlanID
        {
            get { return planID; }
            set { planID = value; }
        }

        public virtual int WorkflowID
        {
            get { return workflowID; }
            set { workflowID = value; }
        }

        public virtual int GoodsPOPayID
        {
            get;
            set;
        }

        public virtual int BMPUPayID
        {
            set;
            get;
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

        public virtual DateTime EffectDate
        {
            get { return effectDate; }
            set { effectDate = value; }
        }

        public virtual decimal Amount
        {
            get { return amount; }
            set { amount = value; }
        }

        public virtual decimal ConfirmAmount
        {
            get { return confirmAmount; }
            set { confirmAmount = value; }
        }

        public virtual string CurrencyType
        {
            get { return currencyType; }
            set { currencyType = value; }
        }

        public virtual string FinancialStaffCode
        {
            get { return financialStaffCode; }
            set { financialStaffCode = value; }
        }

        public virtual string FinancialStaffName
        {
            get { return financialStaffName; }
            set { financialStaffName = value; }
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