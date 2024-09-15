namespace ProjectMgt.Model
{
    public class SMSNetSegment
    {
        public SMSNetSegment()
        {
        }

        private int id;
        private string beginSegment;
        private string endSegment;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string BeginSegment
        {
            get { return beginSegment; }
            set { beginSegment = value; }
        }

        public virtual string EndSegment
        {
            get { return endSegment; }
            set { endSegment = value; }
        }
    }
}