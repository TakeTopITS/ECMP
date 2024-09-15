namespace ProjectMgt.Model
{
    public class MemberAgency
    {
        public MemberAgency()
        {
        }

        private int id;
        private string userCode;
        private string agencyCode;
        private string agencyName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string AgencyCode
        {
            get { return agencyCode; }
            set { agencyCode = value; }
        }

        public virtual string AgencyName
        {
            get { return agencyName; }
            set { agencyName = value; }
        }
    }
}