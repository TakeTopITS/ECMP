namespace ProjectMgt.Model
{
    public class Department
    {
        public Department()
        {
        }

        private string departCode;
        private string departName;
        private string parentCode;
        private string creatorCode;
        private string authority;
        private string productLineRelated;

        private string workAddress;
        private string longitude;
        private string latitude;
        private string isDefaultAddress;

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        public virtual string DepartName
        {
            get { return departName; }
            set { departName = value; }
        }

        public virtual string ParentCode
        {
            get { return parentCode; }
            set { parentCode = value; }
        }

        public virtual string CreatorCode
        {
            get { return creatorCode; }
            set { creatorCode = value; }
        }

        public virtual string Authority
        {
            get { return authority; }
            set { authority = value; }
        }

        public virtual string ProductLineRelated
        {
            get { return productLineRelated; }
            set { productLineRelated = value; }
        }

        public virtual string WorkAddress
        {
            get { return workAddress; }
            set { workAddress = value; }
        }

        public virtual string Longitude
        {
            get { return longitude; }
            set { longitude = value; }
        }

        public virtual string Latitude
        {
            get { return latitude; }
            set { latitude = value; }
        }

        public virtual string IsDefaultAddress
        {
            get { return isDefaultAddress; }
            set { isDefaultAddress = value; }
        }
    }
}