namespace ProjectMgt.Model
{
    public class ConstractRelatedProject
    {
        public ConstractRelatedProject()
        {
        }

        private int id;
        private int projectID;
        private string constractCode;

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

        public virtual string ConstractCode
        {
            get { return constractCode; }
            set { constractCode = value; }
        }
    }
}