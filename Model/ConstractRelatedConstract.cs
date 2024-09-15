namespace ProjectMgt.Model
{
    public class ConstractRelatedConstract
    {
        public ConstractRelatedConstract()
        {
        }

        private int id;
        private string constractCode;
        private string relatedConstractCode;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string ConstractCode
        {
            get { return constractCode; }
            set { constractCode = value; }
        }

        public virtual string RelatedConstractCode
        {
            get { return relatedConstractCode; }
            set { relatedConstractCode = value; }
        }
    }
}