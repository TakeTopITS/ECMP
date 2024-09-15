namespace ProjectMgt.Model
{
    public class SMSInterface
    {
        public SMSInterface()
        {
        }

        private int id;
        private string spName;
        private string spInterface;
        private string status;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string SPName
        {
            get { return spName; }
            set { spName = value; }
        }

        public virtual string SPInterface
        {
            get { return spInterface; }
            set { spInterface = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}