using System;

namespace ProjectMgt.Model
{
    public class CustomerQuestionHandleRecord
    {
        public CustomerQuestionHandleRecord()
        {
        }

        private int id;
        private int questionID;
        private string handleDetail;
        private string handleStatus;
        private string handleWay;
        private DateTime handleTime;
        private decimal usedTime;
        private string timeUnit;
        private string customerComment;
        private string customerAcceptor;
        private string acceptorContactWay;
        private int preDays;
        private DateTime nextServiceTime;
        private string operatorCode;
        private string operatorName;

        private DateTime upDoorDate;
        private string toBank;
        private DateTime sumApplyTime;
        private string dealSituation;
        private DateTime newTime;
        private string newNum;
        private string signing;
        private string lending;
        private DateTime collectionTime;
        private string collectionPer;
        private string rebates;
        private DateTime rebatesTime;

        public virtual DateTime UpDoorDate
        {
            get { return upDoorDate; }
            set { upDoorDate = value; }
        }

        public virtual DateTime SumApplyTime
        {
            get { return sumApplyTime; }
            set { sumApplyTime = value; }
        }

        public virtual DateTime NewTime
        {
            get { return newTime; }
            set { newTime = value; }
        }

        public virtual DateTime CollectionTime
        {
            get { return collectionTime; }
            set { collectionTime = value; }
        }

        public virtual DateTime RebatesTime
        {
            get { return rebatesTime; }
            set { rebatesTime = value; }
        }

        public virtual string ToBank
        {
            get { return toBank; }
            set { toBank = value; }
        }

        public virtual string DealSituation
        {
            get { return dealSituation; }
            set { dealSituation = value; }
        }

        public virtual string NewNum
        {
            get { return newNum; }
            set { newNum = value; }
        }

        public virtual string Signing
        {
            get { return signing; }
            set { signing = value; }
        }

        public virtual string Lending
        {
            get { return lending; }
            set { lending = value; }
        }

        public virtual string CollectionPer
        {
            get { return collectionPer; }
            set { collectionPer = value; }
        }

        public virtual string Rebates
        {
            get { return rebates; }
            set { rebates = value; }
        }

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int QuestionID
        {
            get { return questionID; }
            set { questionID = value; }
        }

        public virtual string HandleDetail
        {
            get { return handleDetail; }
            set { handleDetail = value; }
        }

        public virtual string HandleStatus
        {
            get { return handleStatus; }
            set { handleStatus = value; }
        }

        public virtual string HandleWay
        {
            get { return handleWay; }
            set { handleWay = value; }
        }

        public virtual DateTime HandleTime
        {
            get { return handleTime; }
            set { handleTime = value; }
        }

        public virtual decimal UsedTime
        {
            get { return usedTime; }
            set { usedTime = value; }
        }

        public virtual string TimeUnit
        {
            get { return timeUnit; }
            set { timeUnit = value; }
        }

        public virtual string CustomerComment
        {
            get { return customerComment; }
            set { customerComment = value; }
        }

        public virtual string CustomerAcceptor
        {
            get { return customerAcceptor; }
            set { customerAcceptor = value; }
        }

        public virtual string AcceptorContactWay
        {
            get { return acceptorContactWay; }
            set { acceptorContactWay = value; }
        }

        public virtual int PreDays
        {
            get { return preDays; }
            set { preDays = value; }
        }

        public virtual DateTime NextServiceTime
        {
            get { return nextServiceTime; }
            set { nextServiceTime = value; }
        }

        public virtual string OperatorCode
        {
            get { return operatorCode; }
            set { operatorCode = value; }
        }

        public virtual string OperatorName
        {
            get { return operatorName; }
            set { operatorName = value; }
        }
    }
}