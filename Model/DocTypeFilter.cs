namespace ProjectMgt.Model
{
    public class DocTypeFilter
    {
        public DocTypeFilter()
        {
        }

        private string docType;
        private int docTypeID;
        private string relatedType;
        private int relatedID;

        public virtual string DocType
        {
            get { return docType; }
            set { docType = value; }
        }

        public virtual int DocTypeID
        {
            get { return docTypeID; }
            set { docTypeID = value; }
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
    }
}