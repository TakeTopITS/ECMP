namespace ProjectMgt.Model
{
    public class DocRelatedDepartment
    {
        public DocRelatedDepartment()
        {
        }

        private int id;
        private int docID;
        private string departCode;
        private string departName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int DocID
        {
            get { return docID; }
            set { docID = value; }
        }

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
    }
}