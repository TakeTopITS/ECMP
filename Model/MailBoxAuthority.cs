namespace ProjectMgt.Model
{
    public class MailBoxAuthority
    {
        public MailBoxAuthority()
        {
        }

        private int id;
        private string userCode;
        private string passwordSet;
        private string deleteOperate;

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

        public virtual string PasswordSet
        {
            get { return passwordSet; }
            set { passwordSet = value; }
        }

        public virtual string DeleteOperate
        {
            get { return deleteOperate; }
            set { deleteOperate = value; }
        }
    }
}