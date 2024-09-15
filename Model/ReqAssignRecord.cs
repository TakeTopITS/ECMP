using System;

namespace ProjectMgt.Model
{
    public class ReqAssignRecord
    {
        public ReqAssignRecord()
        {
        }

        private int id;
        private int reqID;
        private string type;
        private string reqName;
        private string operatorCode;
        private string operatorName;
        private string operatorContent;
        private DateTime operationTime;
        private string assignManCode;
        private string assignManName;
        private string content;
        private string operation;
        private int priorID;
        private int routeNumber;
        private DateTime beginDate;
        private DateTime endDate;
        private DateTime makeDate;
        private decimal expense;
        private decimal manHour;
        private string status;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ReqID
        {
            get { return reqID; }
            set { reqID = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string ReqName
        {
            get { return reqName; }
            set { reqName = value; }
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

        public virtual string OperatorContent
        {
            get { return operatorContent; }
            set { operatorContent = value; }
        }

        public virtual DateTime OperationTime
        {
            get { return operationTime; }
            set { operationTime = value; }
        }

        public virtual DateTime BeginDate
        {
            get { return beginDate; }
            set { beginDate = value; }
        }

        public virtual DateTime EndDate
        {
            get { return endDate; }
            set { endDate = value; }
        }

        public virtual string AssignManCode
        {
            get { return assignManCode; }
            set { assignManCode = value; }
        }

        public virtual string AssignManName
        {
            get { return assignManName; }
            set { assignManName = value; }
        }

        public virtual string Content
        {
            get { return content; }
            set { content = value; }
        }

        public virtual string Operation
        {
            get { return operation; }
            set { operation = value; }
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

        public virtual DateTime MakeDate
        {
            get { return makeDate; }
            set { makeDate = value; }
        }

        public virtual decimal Expense
        {
            get { return expense; }
            set { expense = value; }
        }

        public virtual decimal ManHour
        {
            get { return manHour; }
            set { manHour = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual DateTime MoveTime
        {
            get; set;
        }
    }
}