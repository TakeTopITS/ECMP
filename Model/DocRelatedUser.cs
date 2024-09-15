namespace ProjectMgt.Model
{
    public class DocRelatedUser
    {
        public DocRelatedUser()
        {
        }

        private int id;
        private int docID;
        private string userCode;
        private string userName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int DocID
        {
            get { return docID; }
            set { docID = value; }
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