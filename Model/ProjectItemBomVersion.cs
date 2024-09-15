namespace ProjectMgt.Model
{
    public class ProjectItemBomVersion
    {
        public ProjectItemBomVersion()
        {
        }

        private int id;
        private int projectID;
        private int verID;
        private string type;

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

        public virtual int VerID
        {
            get { return verID; }
            set { verID = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }
    }
}