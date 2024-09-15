namespace ProjectMgt.Model
{
    public class WorkFlowPage
    {
        public WorkFlowPage()
        {
        }

        private int id;
        private string wfType;
        private string wfName;
        private string homeName;
        private string langCode;
        private string pageName;
        private int sortNumber;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string WFType
        {
            get { return wfType; }
            set { wfType = value; }
        }

        public virtual string WFName
        {
            get { return wfName; }
            set { wfName = value; }
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

        public virtual string PageName
        {
            get { return pageName; }
            set { pageName = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }
    }
}