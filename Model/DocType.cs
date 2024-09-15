namespace ProjectMgt.Model
{
    public class DocType
    {
        public DocType()
        {
        }

        private int id;
        private string type;
        private int sortNumber;
        private int parentID;
        private string userCode;
        private string saveType;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }

        public virtual int ParentID
        {
            get { return parentID; }
            set { parentID = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string SaveType
        {
            get { return saveType; }
            set { saveType = value; }
        }
    }
}