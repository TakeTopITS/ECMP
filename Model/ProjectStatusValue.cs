using System;

namespace ProjectMgt.Model
{
    public class ProjectStatusValue
    {
        public ProjectStatusValue()
        {
        }

        private int id;
        private string relatedType;
        private int relatedID;
        private string status;
        private string statusValue;
        private DateTime changeTime;

        public virtual int ID
        {
            set { id = value; }
            get { return id; }
        }

        public virtual string RelatedType
        {
            set { relatedType = value; }
            get { return relatedType; }
        }

        public virtual int RelatedID
        {
            set { relatedID = value; }
            get { return relatedID; }
        }

        public virtual string Status
        {
            set { status = value; }
            get { return status; }
        }

        public virtual string StatusValue
        {
            set { statusValue = value; }
            get { return statusValue; }
        }

        public virtual DateTime ChangeTime
        {
            set { changeTime = value; }
            get { return changeTime; }
        }
    }
}