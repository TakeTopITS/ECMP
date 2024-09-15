namespace ProjectMgt.Model
{
    public class ConstractRelatedUser
    {
        public ConstractRelatedUser()
        {
        }

        private int id;
        private string constractCode;
        private string userCode;
        private string userName;
        private string authority;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string ConstractCode
        {
            get { return constractCode; }
            set { constractCode = value; }
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

        public virtual string Authority
        {
            get { return authority; }
            set { authority = value; }
        }
    }
}