namespace ProjectMgt.Model
{
    public class MemberAgencyWFType
    {
        public MemberAgencyWFType()
        {
        }

        private int id;
        private string userCode;
        private string agencyCode;
        private string wfType;

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

        public virtual string WFType
        {
            get { return wfType; }
            set { wfType = value; }
        }
    }
}