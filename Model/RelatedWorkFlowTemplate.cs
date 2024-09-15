namespace ProjectMgt.Model
{
    public class RelatedWorkFlowTemplate
    {
        public RelatedWorkFlowTemplate()
        {
        }

        private int id;
        private string relatedType;
        private int relatedID;
        private string relatedName;
        private string wfTemplateName;
        private string identifyString;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string RelatedType
        {
            get { return relatedType; }
            set { relatedType = value; }
        }

        public virtual int RelatedID
        {
            get { return relatedID; }
            set { relatedID = value; }
        }

        public virtual string RelatedName
        {
            get { return relatedName; }
            set { relatedName = value; }
        }

        public virtual string WFTemplateName
        {
            get { return wfTemplateName; }
            set { wfTemplateName = value; }
        }

        public virtual string IdentifyString
        {
            set { identifyString = value; }
            get { return identifyString; }
        }
    }
}