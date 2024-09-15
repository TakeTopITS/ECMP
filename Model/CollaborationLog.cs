using System;

namespace ProjectMgt.Model
{
    public class CollaborationLog
    {
        public CollaborationLog()
        {
        }

        private int logID;
        private int coID;
        private string userCode;
        private string userName;
        private string logContent;
        private DateTime createTime;

        public virtual int LogID
        {
            get { return logID; }
            set { logID = value; }
        }

        public virtual int CoID
        {
            get { return coID; }
            set { coID = value; }
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