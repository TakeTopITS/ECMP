using System;

namespace ProjectMgt.Model
{
    public class AccountingIntervalSet
    {
        public AccountingIntervalSet()
        {
        }

        private int id;
        private string financialCode;
        private string intervalName;
        private string status;
        private DateTime startTime;
        private DateTime endTime;
        private string createrCode;
        private string intervalCode;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string FinancialCode
        {
            get { return financialCode; }
            set { financialCode = value; }
        }

        public virtual string IntervalName
        {
            get { return intervalName; }
            set { intervalName = value; }
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

        public virtual string IntervalCode
        {
            get { return intervalCode; }
            set { intervalCode = value; }
        }
    }
}