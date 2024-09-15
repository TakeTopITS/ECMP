namespace ProjectMgt.Model
{
    public class RelatedDefect
    {
        public RelatedDefect()
        {
        }

        private int id;
        private int projectID;
        private int defectID;

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

        public virtual int DefectID
        {
            get { return defectID; }
            set { defectID = value; }
        }
    }
}