namespace ProjectMgt.Model
{
    public class VendorRelatedUser
    {
        public VendorRelatedUser()
        {
        }

        private int id;
        private string vendorCode;
        private string userCode;
        private string userName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string VendorCode
        {
            get { return vendorCode; }
            set { vendorCode = value; }
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
    }
}