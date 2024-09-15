using System;

namespace ProjectMgt.Model
{
    public class KPIHRReview
    {
        public KPIHRReview()
        {
        }

        private int id;
        private int userKPIID;
        private string hrCode;
        private string hrName;
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

        public virtual string HRCode
        {
            get { return hrCode; }
            set { hrCode = value; }
        }

        public virtual string HRName
        {
            get { return hrName; }
            set { hrName = value; }
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