using System;

namespace ProjectMgt.Model
{
    public class GoodsCheckOutNoticeOrder
    {
        public GoodsCheckOutNoticeOrder()
        {
        }

        private int cooID;
        private string cooName;
        private decimal amount;
        private string currencyType;
        private string type;
        private string applicantCode;
        private string applicantName;
        private DateTime applyTime;
        private DateTime finishTime;
        private string applyReason;
        private string status;
        private string relatedType;
        private int relatedID;

        public virtual int COOID
        {
            get { return cooID; }
            set { cooID = value; }
        }

        public virtual string COOName
        {
            get { return cooName; }
            set { cooName = value; }
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

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
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

        public virtual DateTime FinishTime
        {
            get { return finishTime; }
            set { finishTime = value; }
        }

        public virtual string ApplyReason
        {
            get { return applyReason; }
            set { applyReason = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
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
    }
}