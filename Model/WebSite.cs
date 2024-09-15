namespace ProjectMgt.Model
{
    public class WebSite
    {
        public WebSite()
        {
        }

        private int id;
        private string siteName;
        private string siteAddress;
        private string userCode;
        private int sortNumber;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string SiteName
        {
            get { return siteName; }
            set { siteName = value; }
        }

        public virtual string SiteAddress
        {
            get { return siteAddress; }
            set { siteAddress = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }
    }
}