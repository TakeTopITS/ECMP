using System;

namespace ProjectMgt.Model
{
    public class KPILeaderReview
    {
        public KPILeaderReview()
        {
        }

        private int id;
        private int userKPIID;
        private string leaderCode;
        private string leaderName;
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

        public virtual string LeaderCode
        {
            get { return leaderCode; }
            set { leaderCode = value; }
        }

        public virtual string LeaderName
        {
            get { return leaderName; }
            set { leaderName = value; }
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