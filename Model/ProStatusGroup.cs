namespace ProjectMgt.Model
{
    public class ProStatusGroup
    {
        private string status;
        private int groupCount;
        private string pmCode;

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual int GroupCount
        {
            get { return groupCount; }
            set { groupCount = value; }
        }

        public virtual string PMCode
        {
            get { return pmCode; }
            set { pmCode = value; }
        }
    }
}