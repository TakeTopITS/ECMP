using System;

namespace ProjectMgt.Model
{
    public class CustomerOperationRecord
    {
        public CustomerOperationRecord()
        {
        }

        private int id;
        private string userCode;
        private string userName;
        private string creater;
        private string createrName;
        private DateTime createTime;
        private string remark;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
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

        public virtual string Creater
        {
            get { return creater; }
            set { creater = value; }
        }

        public virtual string CreaterName
        {
            get { return createrName; }
            set { createrName = value; }
        }

        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }

        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }
    }
}