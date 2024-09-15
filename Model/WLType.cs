namespace ProjectMgt.Model
{
    public class WLType
    {
        public WLType()
        {
        }

        private int id;
        private string type;
        private string homeName;
        private string langCode;
        private string makeType;
        private int sortNumber;

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