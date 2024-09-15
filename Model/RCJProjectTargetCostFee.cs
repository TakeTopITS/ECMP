namespace ProjectMgt.Model
{
    public class RCJProjectTargetCostFee
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

        private int costFeeSubID;

        public virtual int CostFeeSubID
        {
            get { return costFeeSubID; }
            set { costFeeSubID = value; }
        }

        private int costFeeID;

        public virtual int CostFeeID
        {
            get { return costFeeID; }
            set { costFeeID = value; }
        }

        private int costType;

        public virtual int CostType
        {
            get { return costType; }
            set { costType = value; }
        }

        private double originalCost;

        public virtual double OriginalCost
        {
            get { return originalCost; }
            set { originalCost = value; }
        }

        private double actualCost;

        public virtual double ActualCost
        {
            get { return actualCost; }
            set { actualCost = value; }
        }

        private double targetCost;

        public virtual double TargetCost
        {
            get { return targetCost; }
            set { targetCost = value; }
        }

        private string inputUser;

        public virtual string InputUser
        {
            get { return inputUser; }
            set { inputUser = value; }
        }

        private string lastTime;

        public virtual string LastTime
        {
            get { return lastTime; }
            set { lastTime = value; }
        }

        private string memo;

        public virtual string Memo
        {
            get { return memo; }
            set { memo = value; }
        }
    }
}