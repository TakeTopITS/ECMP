namespace ProjectMgt.Model
{
    public class Account
    {
        public Account()
        {
        }

        private int id;
        private int parentID;
        private string accountName;
        private int sortNumber;
        private string accountType;
        private string typeArea;
        private string accountCode;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ParentID
        {
            get { return parentID; }
            set { parentID = value; }
        }

        public virtual string AccountName
        {
            get { return accountName; }
            set { accountName = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }

        public virtual string AccountType
        {
            get { return accountType; }
            set { accountType = value; }
        }

        public virtual string TypeArea
        {
            get { return typeArea; }
            set { typeArea = value; }
        }

        public virtual string AccountCode
        {
            get { return accountCode; }
            set { accountCode = value; }
        }
    }
}