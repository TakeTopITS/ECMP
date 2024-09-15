using System;

namespace ProjectMgt.Model
{
    public class ProLeaderReview
    {
        private int id;
        private int projectID;
        private string userCode;
        private string userName;
        private string review;
        private DateTime reviewTime;

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

        public virtual string Review
        {
            get { return review; }
            set { review = value; }
        }

        public virtual DateTime ReviewTime
        {
            get { return reviewTime; }
            set { reviewTime = value; }
        }
    }
}