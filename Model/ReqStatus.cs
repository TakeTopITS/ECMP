namespace ProjectMgt.Model
{
    public class ReqStatus
    {
        public ReqStatus()
        {
        }

        private int id;
        private string status;
        private string homeName;
        private string langCode;
        private string makeType;
        private int sortNumber;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string HomeName
        {
            get { return homeName; }
            set { homeName = value; }
        }

        public virtual string LangCode
        {
            get { return langCode; }
            set { langCode = value; }
        }

        public virtual string MakeType
        {
            get { return makeType; }
            set { makeType = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }
    }
}