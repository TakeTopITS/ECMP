using System;

namespace ProjectMgt.Model
{
    public class CollaborationLogWithCustomerQuestionCandidate
    {
        public CollaborationLogWithCustomerQuestionCandidate()
        {
        }

        private int logID;
        private int questionID;

        private string userName;
        private string logContent;
        private DateTime createTime;

        public virtual int LogID
        {
            get { return logID; }
            set { logID = value; }
        }

        public virtual int QuestionID
        {
            get { return questionID; }
            set { questionID = value; }
        }

        public virtual string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public virtual string LogContent
        {
            get { return logContent; }
            set { logContent = value; }
        }

        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }
    }
}