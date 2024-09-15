namespace ProjectMgt.Model
{
    public class ReportRelatedUser
    {
        public ReportRelatedUser()
        {
        }

        private int id;
        private int reportID;
        private string userCode;
        private string userName;
        private string status;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ReportID
        {
            get { return reportID; }
            set { reportID = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}