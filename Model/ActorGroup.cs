namespace ProjectMgt.Model
{
    public class ActorGroup
    {
        public ActorGroup()
        {
        }

        private int id;
        private string groupName;
        private string type;
        private string identifyString;
        private string makeUserCode;
        private string belongDepartCode;
        private string belongDepartName;
        private string homeName;
        private string langCode;
        private string makeType;
        private int sortNumber;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string GroupName
        {
            get { return groupName; }
            set { groupName = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string IdentifyString
        {
            get { return identifyString; }
            set { identifyString = value; }
        }

        public virtual string MakeUserCode
        {
            get { return makeUserCode; }
            set { makeUserCode = value; }
        }

        public virtual string BelongDepartCode
        {
            get { return belongDepartCode; }
            set { belongDepartCode = value; }
        }

        public virtual string BelongDepartName
        {
            get { return belongDepartName; }
            set { belongDepartName = value; }
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