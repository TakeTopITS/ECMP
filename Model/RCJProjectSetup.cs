namespace ProjectMgt.Model
{
    public class RCJProjectSetup
    {
        private int id;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private int projectID;

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        private int isMonthPlan;

        public virtual int IsMonthPlan
        {
            get { return isMonthPlan; }
            set { isMonthPlan = value; }
        }
    }
}