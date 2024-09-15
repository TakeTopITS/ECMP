using System;

namespace ProjectMgt.Model
{
    public class ProStatusChange
    {
        public ProStatusChange()
        {
        }

        private int id;
        private int projectID;
        private string userCode;
        private string userName;
        private string oldStatus;
        private string newStatus;
        private string oldStatusValue;
        private string newStatusValue;
        private DateTime changeTime;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
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

        public virtual string OldStatus
        {
            get { return oldStatus; }
            set { oldStatus = value; }
        }

        public virtual string NewStatus
        {
            get { return newStatus; }
            set { newStatus = value; }
        }

        public virtual string OldStatusValue
        {
            get { return oldStatusValue; }
            set { oldStatusValue = value; }
        }

        public virtual string NewStatusValue
        {
            get { return newStatusValue; }
            set { newStatusValue = value; }
        }

        public virtual DateTime ChangeTime
        {
            get { return changeTime; }
            set { changeTime = value; }
        }
    }
}