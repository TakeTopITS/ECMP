namespace ProjectMgt.Model
{
    public class BMAnnInvitRelatedProject
    {
        public BMAnnInvitRelatedProject()
        {
        }

        private int id;
        private int projectID;
        private int bMAnnInID;

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

        public virtual int BMAnnInID
        {
            get { return bMAnnInID; }
            set { bMAnnInID = value; }
        }
    }
}