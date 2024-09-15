using System;

namespace ProjectMgt.Model
{
    public class SystemActiveUser
    {
        public SystemActiveUser()
        {
        }

        private string userCode;
        private string userName;
        private DateTime joinTime;
        private string operatorCode;
        private string webUser;
        private string appUser;

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

        public virtual DateTime JoinTime
        {
            get { return joinTime; }
            set { joinTime = value; }
        }

        public virtual string OperatorCode
        {
            get { return operatorCode; }
            set { operatorCode = value; }
        }

        public virtual string WebUser
        {
            get { return webUser; }
            set { webUser = value; }
        }

        public virtual string AppUser
        {
            get { return appUser; }
            set { appUser = value; }
        }
    }
}