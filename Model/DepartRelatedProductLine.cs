namespace ProjectMgt.Model
{
    public class DepartRelatedProductLine
    {
        public DepartRelatedProductLine()
        {
        }

        private int id;
        private string departCode;
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

        public virtual string ProductLineName
        {
            get { return productLineName; }
            set { productLineName = value; }
        }
    }
}