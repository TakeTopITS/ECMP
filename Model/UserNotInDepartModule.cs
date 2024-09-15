namespace ProjectMgt.Model
{
    public class UserNotInDepartModule
    {
        public UserNotInDepartModule()
        {
        }

        private int id;
        private string departCode;
        private string userCode;
        private string userName;

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
    }
}