using System;

namespace ProjectMgt.Model
{
    public class Schedule
    {
        public Schedule()
        {
        }

        private int id;
        private string userCode;
        private string userName;
        private DateTime planDate;
        private string planTitle;
        private string planDetail;
        private DateTime beginTime;
        private DateTime endTime;
        private string status;
        private string relatedType;
        private int relatedID;

        public virtual int ID
        {
            set { id = value; }
            get { return id; }
        }

        public virtual string UserCode
        {
            set { userCode = value; }
            get { return userCode; }
        }

        public virtual string UserName
        {
            set { userName = value; }
            get { return userName; }
        }

        public virtual DateTime PlanDate
        {
            set { planDate = value; }
            get { return planDate; }
        }

        public virtual string PlanTitle
        {
            set { planTitle = value; }
            get { return planTitle; }
        }

        public virtual string PlanDetail
        {
            set { planDetail = value; }
            get { return planDetail; }
        }

        public virtual DateTime BeginTime
        {
            set { beginTime = value; }
            get { return beginTime; }
        }

        public virtual DateTime EndTime
        {
            set { endTime = value; }
            get { return endTime; }
        }

        public virtual string Status
        {
            set { status = value; }
            get { return status; }
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