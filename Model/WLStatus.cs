namespace ProjectMgt.Model
{
    public class WLStatus
    {
        public WLStatus()
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
            set { status = value; }
            get { return status; }
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
            set { sortNumber = value; }
            get { return sortNumber; }
        }
    }
}