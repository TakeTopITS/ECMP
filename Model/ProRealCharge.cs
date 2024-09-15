namespace ProjectMgt.Model
{
    public class ProRealCharge
    {
        public ProRealCharge()
        {
        }

        private int projectID;
        private decimal realCharge;

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual decimal RealCharge
        {
            get { return realCharge; }
            set { realCharge = value; }
        }
    }
}