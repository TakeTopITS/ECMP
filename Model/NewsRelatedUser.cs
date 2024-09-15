using System;

namespace ProjectMgt.Model
{
    public class NewsRelatedUser
    {
        public NewsRelatedUser()
        {
        }

        private int id;
        private int newsID;
        private string userCode;
        private DateTime readTime;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int NewsID
        {
            get { return newsID; }
            set { newsID = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual DateTime ReadTime
        {
            get { return readTime; }
            set { readTime = value; }
        }
    }
}