namespace ProjectMgt.Model
{
    public class ProjectStatus
    {
        public ProjectStatus()
        {
        }

        private int id;
        private string status;
        private int sortNumber;
        private string reviewControl;
        private string projectType;
        private string identityString;

        private string homeName;
        private string langCode;
        private string makeType;

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

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }

        public virtual string ReviewControl
        {
            get { return reviewControl; }
            set { reviewControl = value; }
        }

        public virtual string ProjectType
        {
            get { return projectType; }
            set { projectType = value; }
        }

        public virtual string IdentityString
        {
            get { return identityString; }
            set { identityString = value; }
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
    }
}