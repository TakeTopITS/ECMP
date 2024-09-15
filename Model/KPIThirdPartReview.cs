using System;

namespace ProjectMgt.Model
{
    public class KPIThirdPartReview
    {
        public KPIThirdPartReview()
        {
        }

        private int id;
        private int userKPIID;
        private string userCode;
        private string userName;
        private string comment;
        private decimal point;
        private DateTime reviewTime;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int UserKPIID
        {
            get { return userKPIID; }
            set { userKPIID = value; }
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

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
        }

        public virtual decimal Point
        {
            get { return point; }
            set { point = value; }
        }

        public virtual DateTime ReviewTime
        {
            get { return reviewTime; }
            set { reviewTime = value; }
        }
    }
}