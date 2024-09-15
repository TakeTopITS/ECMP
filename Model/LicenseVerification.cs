namespace ProjectMgt.Model
{
    public class LicenseVerification
    {
        public LicenseVerification()
        {
        }

        private int id;
        private string serverName;
        private string verificationString;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string ServerName
        {
            get { return serverName; }
            set { serverName = value; }
        }

        public virtual string VerificationString
        {
            get { return verificationString; }
            set { verificationString = value; }
        }
    }
}