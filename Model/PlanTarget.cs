namespace ProjectMgt.Model
{
    public class PlanTarget
    {
        public PlanTarget()
        {
        }

        private int id;
        private int planID;
        private string target;
        private int progress;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int PlanID
        {
            get { return planID; }
            set { planID = value; }
        }

        public virtual string Target
        {
            get { return target; }
            set { target = value; }
        }

        public virtual int Progress
        {
            get { return progress; }
            set { progress = value; }
        }
    }
}