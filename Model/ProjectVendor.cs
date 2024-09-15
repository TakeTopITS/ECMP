namespace ProjectMgt.Model
{
    public class ProjectVendor
    {
        public ProjectVendor()
        {
        }

        private int id;
        private int projectID;
        private string vendorCode;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual string VendorCode
        {
            get { return vendorCode; }
            set { vendorCode = value; }
        }
    }
}