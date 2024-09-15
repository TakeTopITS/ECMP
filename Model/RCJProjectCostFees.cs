namespace ProjectMgt.Model
{
    public class RCJProjectCostFees
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

        private int feeID;

        public virtual int FeeID
        {
            get { return feeID; }
            set { feeID = value; }
        }

        private int feeSubID;

        public virtual int FeeSubID
        {
            get { return feeSubID; }
            set { feeSubID = value; }
        }

        private double originalCost;

        public virtual double OriginalCost
        {
            get { return originalCost; }
            set { originalCost = value; }
        }

        private double targetCost;

        public virtual double TargetCost
        {
            get { return targetCost; }
            set { targetCost = value; }
        }

        private string dataSource;

        public virtual string DataSource
        {
            get { return dataSource; }
            set { dataSource = value; }
        }

        private int departNo;

        public virtual int DepartNo
        {
            get { return departNo; }
            set { departNo = value; }
        }
    }
}