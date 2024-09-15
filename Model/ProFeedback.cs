using System;

namespace ProjectMgt.Model
{
    public class ProFeedback
    {
        private int id;
        private int projectID;
        private string userCode;
        private string feedback;
        private DateTime fbTime;

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

        public virtual string Feedback
        {
            get { return feedback; }
            set { feedback = value; }
        }

        public virtual DateTime FBTime
        {
            get { return fbTime; }
            set { fbTime = value; }
        }
    }
}