namespace ProjectMgt.Model
{
    public class AllProStatusGroup
    {
        private string status;
        private int groupCount;

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
    }
}