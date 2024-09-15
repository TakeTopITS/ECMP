using System;

namespace ProjectMgt.Model
{
    public class AccountFinancialSet
    {
        public AccountFinancialSet()
        {
        }

        private int id;
        private string financialName;
        private string departCode;
        private string departName;
        private string industry;
        private string currencyType;
        private string status;
        private DateTime startTime;
        private DateTime endTime;
        private string createrCode;
        private decimal exchangeRate;
        private string financialCode;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string FinancialName
        {
            get { return financialName; }
            set { financialName = value; }
        }

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        public virtual string DepartName
        {
            get { return departName; }
            set { departName = value; }
        }

        public virtual string Industry
        {
            get { return industry; }
            set { industry = value; }
        }

        public virtual string CurrencyType
        {
            get { return currencyType; }
            set { currencyType = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual DateTime StartTime
        {
            get { return startTime; }
            set { startTime = value; }
        }

        public virtual DateTime EndTime
        {
            get { return endTime; }
            set { endTime = value; }
        }

        public virtual string CreaterCode
        {
            get { return createrCode; }
            set { createrCode = value; }
        }

        public virtual decimal ExchangeRate
        {
            get { return exchangeRate; }
            set { exchangeRate = value; }
        }

        public virtual string FinancialCode
        {
            get { return financialCode; }
            set { financialCode = value; }
        }
    }
}