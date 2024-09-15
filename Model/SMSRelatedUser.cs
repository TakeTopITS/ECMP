namespace ProjectMgt.Model
{
    public class SMSRelatedUser
    {
        public SMSRelatedUser()
        {
        }

        private int id;
        private int smsID;
        private string userCode;
        private string userName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int SMSID
        {
            get { return smsID; }
            set { smsID = value; }
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
    }
}