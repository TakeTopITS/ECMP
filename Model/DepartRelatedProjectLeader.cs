using System;

namespace ProjectMgt.Model
{
    public class DepartRelatedProjectLeader
    {
        public DepartRelatedProjectLeader()
        {
        }

        private int id;
        private string departCode;
        private string userCode;
        private string userName;
        private DateTime effectDate;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
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

        public virtual DateTime EffectDate
        {
            get { return effectDate; }
            set { effectDate = value; }
        }
    }
}