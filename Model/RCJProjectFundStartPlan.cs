namespace ProjectMgt.Model
{
    public class RCJProjectFundStartPlan
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

        private double amount;

        public virtual double Amount
        {
            get { return amount; }
            set { amount = value; }
        }

        private string purpose;

        public virtual string Purpose
        {
            get { return purpose; }
            set { purpose = value; }
        }

        private int classID;

        public virtual int ClassID
        {
            get { return classID; }
            set { classID = value; }
        }

        private string budgetTime;

        public virtual string BudgetTime
        {
            get { return budgetTime; }
            set { budgetTime = value; }
        }

        private double amountLevel;

        public virtual double AmountLevel
        {
            get { return amountLevel; }
            set { amountLevel = value; }
        }

        private int isReviewed;

        public virtual int IsReviewed
        {
            get { return isReviewed; }
            set { isReviewed = value; }
        }

        private double actualAmount;

        public virtual double ActualAmount
        {
            get { return actualAmount; }
            set { actualAmount = value; }
        }

        private string operateTime;

        public virtual string OperateTime
        {
            get { return operateTime; }
            set { operateTime = value; }
        }

        private string memo;

        public virtual string Memo
        {
            get { return memo; }
            set { memo = value; }
        }
    }
}