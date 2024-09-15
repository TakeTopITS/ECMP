namespace ProjectMgt.Model
{
    public class CustomerRelatedUser
    {
        public CustomerRelatedUser()
        {
        }

        private int id;
        private string customerCode;
        private string userCode;
        private string userName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string CustomerCode
        {
            get { return customerCode; }
            set { customerCode = value; }
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