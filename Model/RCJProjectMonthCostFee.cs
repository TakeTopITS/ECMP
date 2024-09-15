namespace ProjectMgt.Model
{
    public class RCJProjectMonthCostFee
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

        private int workMonth;

        public virtual int WorkMonth
        {
            get { return workMonth; }
            set { workMonth = value; }
        }

        private int workYear;

        public virtual int WorkYear
        {
            get { return workYear; }
            set { workYear = value; }
        }

        private double feeMoney;

        public virtual double FeeMoney
        {
            get { return feeMoney; }
            set { feeMoney = value; }
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