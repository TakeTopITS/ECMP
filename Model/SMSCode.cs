using System;

namespace ProjectMgt.Model
{
    public class SMSCode
    {
        public SMSCode()
        {
        }

        private int id;
        private string userCode;
        private string randomCode;
        private DateTime sendTime;

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

        public virtual string RandomCode
        {
            get { return randomCode; }
            set { randomCode = value; }
        }

        public virtual DateTime SendTime
        {
            get { return sendTime; }
            set { sendTime = value; }
        }
    }
}