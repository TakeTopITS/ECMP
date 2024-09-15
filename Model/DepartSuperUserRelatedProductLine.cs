namespace ProjectMgt.Model
{
    public class DepartSuperUserRelatedProductLine
    {
        public DepartSuperUserRelatedProductLine()
        {
        }

        private int id;
        private string departCode;
        private string userCode;
        private string productLineName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string ProductLineName
        {
            get { return productLineName; }
            set { productLineName = value; }
        }
    }
}