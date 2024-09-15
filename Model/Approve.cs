using System;

namespace ProjectMgt.Model
{
    public class Approve
    {
        public Approve()
        {
        }

        private int id;
        private string type;
        private int relatedID;
        private string relatedName;
        private int stepID;
        private string userCode;
        private string userName;
        private string operation;
        private string content;
        private DateTime assignTime;
        private DateTime approveTime;
        private string receiverCode;
        private string receiverName;
        private int priorID;
        private int routeNumber;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual int RelatedID
        {
            get { return relatedID; }
            set { relatedID = value; }
        }

        public virtual string RelatedName
        {
            get { return relatedName; }
            set { relatedName = value; }
        }

        public virtual int StepID
        {
            get { return stepID; }
            set { stepID = value; }
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

        public virtual string Operation
        {
            get { return operation; }
            set { operation = value; }
        }

        public virtual string Content
        {
            get { return content; }
            set { content = value; }
        }

        public virtual DateTime AssignTime
        {
            get { return assignTime; }
            set { assignTime = value; }
        }

        public virtual DateTime ApproveTime
        {
            get { return approveTime; }
            set { approveTime = value; }
        }

        public virtual string ReceiverCode
        {
            get { return receiverCode; }
            set { receiverCode = value; }
        }

        public virtual string ReceiverName
        {
            get { return receiverName; }
            set { receiverName = value; }
        }

        public virtual int PriorID
        {
            get { return priorID; }
            set { priorID = value; }
        }

        public virtual int RouteNumber
        {
            get { return routeNumber; }
            set { routeNumber = value; }
        }
    }
}