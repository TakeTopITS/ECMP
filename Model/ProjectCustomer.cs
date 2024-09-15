namespace ProjectMgt.Model
{
    public class ProjectCustomer
    {
        public ProjectCustomer()
        {
        }

        private int id;
        private int projectID;
        private string customerCode;

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

        public virtual string CustomerCode
        {
            get { return customerCode; }
            set { customerCode = value; }
        }
    }
}