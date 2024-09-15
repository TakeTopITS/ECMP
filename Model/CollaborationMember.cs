using System;

namespace ProjectMgt.Model
{
    public class CollaborationMember
    {
        public CollaborationMember()
        {
        }

        private int memID;
        private int coID;
        private string userCode;
        private string userName;
        private DateTime createTime;
        private DateTime lastLoginTime;

        public virtual int MemID
        {
            get { return memID; }
            set { memID = value; }
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

        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }

        public virtual DateTime LastLoginTime
        {
            get { return lastLoginTime; }
            set { lastLoginTime = value; }
        }
    }
}