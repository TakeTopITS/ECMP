using System;

namespace ProjectMgt.Model
{
    public class SMSSendDIY
    {
        public SMSSendDIY()
        {
        }

        private int id;
        private string message;
        private string userCode;
        private string userName;
        private DateTime sendTime;
        private string status;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string Message
        {
            get { return message; }
            set { message = value; }
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

        public virtual DateTime SendTime
        {
            get { return sendTime; }
            set { sendTime = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}