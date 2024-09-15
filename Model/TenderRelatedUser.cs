namespace ProjectMgt.Model
{
    public class TenderRelatedUser
    {
        public TenderRelatedUser()
        {
        }

        private int id;
        private int tenderID;
        private string userCode;
        private string userName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int TenderID
        {
            get { return tenderID; }
            set { tenderID = value; }
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