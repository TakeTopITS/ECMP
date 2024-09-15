namespace ProjectMgt.Model
{
    public class TaskTestCase
    {
        public TaskTestCase()
        {
        }

        private int id;
        private int projectID;
        private int taskID;
        private string caseName;
        private string description;
        private string requisite;
        private string status;

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

        public virtual int TaskID
        {
            get { return taskID; }
            set { taskID = value; }
        }

        public virtual string CaseName
        {
            get { return caseName; }
            set { caseName = value; }
        }

        public virtual string Description
        {
            get { return description; }
            set { description = value; }
        }

        public virtual string Requisite
        {
            get { return requisite; }
            set { requisite = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}