using System;

namespace ProjectMgt.Model
{
    public class UserTransactionRecord
    {
        public UserTransactionRecord()
        {
        }

        private int id;
        private string userCode;
        private string transType;
        private string description;
        private DateTime effectDate;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string TransType
        {
            get { return transType; }
            set { transType = value; }
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
    }
}