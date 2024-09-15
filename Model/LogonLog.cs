using System;

namespace ProjectMgt.Model
{
    public class LogonLog
    {
        public LogonLog()
        {
        }

        private int id;
        private string userCode;
        private string userName;
        private string userIP;
        private string userHostName;
        private string position;
        private DateTime loginTime;
        private DateTime lastestTime;
        private string deviceType;

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

        public virtual string UserIP
        {
            get { return userIP; }
            set { userIP = value; }
        }

        public virtual string UserHostName
        {
            get { return userHostName; }
            set { userHostName = value; }
        }

        public virtual string Position
        {
            get { return position; }
            set { position = value; }
        }

        public virtual DateTime LoginTime
        {
            get { return loginTime; }
            set { loginTime = value; }
        }

        public virtual DateTime LastestTime
        {
            get { return lastestTime; }
            set { lastestTime = value; }
        }

        public virtual string DeviceType
        {
            get { return deviceType; }
            set { deviceType = value; }
        }
    }
}