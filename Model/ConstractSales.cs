using System;

namespace ProjectMgt.Model
{
    public class ConstractSales
    {
        public ConstractSales()
        {
        }

        private int id;
        private string constractCode;
        private string salesName;
        private string duty;
        private decimal commission;
        private DateTime giveTime;
        private string commissionStatus;
        private string comment;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string ConstractCode
        {
            get { return constractCode; }
            set { constractCode = value; }
        }

        public virtual string SalesName
        {
            get { return salesName; }
            set { salesName = value; }
        }

        public virtual string Duty
        {
            get { return duty; }
            set { duty = value; }
        }

        public virtual decimal Commission
        {
            get { return commission; }
            set { commission = value; }
        }

        public virtual DateTime GiveTime
        {
            get { return giveTime; }
            set { giveTime = value; }
        }

        public virtual string CommissionStatus
        {
            get { return commissionStatus; }
            set { commissionStatus = value; }
        }

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
        }
    }
}