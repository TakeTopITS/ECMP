namespace ProjectMgt.Model
{
    public class Admin
    {
        public Admin()
        {
        }

        private string userCode;
        private string password;

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string Password
        {
            get { return password; }
            set { password = value; }
        }
    }
}