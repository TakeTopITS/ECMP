using System;

namespace ProjectMgt.Model
{
    public class AccountGeneralLedger
    {
        public AccountGeneralLedger()
        {
        }

        private int id;
        private int receivablesRecordID;
        private int payableRecordID;
        private string financialCode;
        private string intervalCode;
        private string accountCode;
        private string accountName;
        private decimal totalMoney;
        private string creater;
        private DateTime createTime;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ReceivablesRecordID
        {
            get { return receivablesRecordID; }
            set { receivablesRecordID = value; }
        }

        public virtual int PayableRecordID
        {
            get { return payableRecordID; }
            set { payableRecordID = value; }
        }

        public virtual string FinancialCode
        {
            get { return financialCode; }
            set { financialCode = value; }
        }

        public virtual string IntervalCode
        {
            get { return intervalCode; }
            set { intervalCode = value; }
        }

        public virtual string AccountCode
        {
            get { return accountCode; }
            set { accountCode = value; }
        }

        public virtual string AccountName
        {
            get { return accountName; }
            set { accountName = value; }
        }

        public virtual decimal TotalMoney
        {
            get { return totalMoney; }
            set { totalMoney = value; }
        }

        public virtual string Creater
        {
            get { return creater; }
            set { creater = value; }
        }

        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }
    }
}