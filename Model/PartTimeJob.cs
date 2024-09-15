using System;

namespace ProjectMgt.Model
{
    public class PartTimeJob
    {
        public PartTimeJob()
        {
        }

        private int id;
        private string userCode;
        private string userName;
        private string departCode;
        private string departName;
        private string duty;
        private DateTime effectTime;

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

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        public virtual string DepartName
        {
            get { return departName; }
            set { departName = value; }
        }

        public virtual string Duty
        {
            get { return duty; }
            set { duty = value; }
        }

        public virtual DateTime EffectTime
        {
            get { return effectTime; }
            set { effectTime = value; }
        }
    }
}