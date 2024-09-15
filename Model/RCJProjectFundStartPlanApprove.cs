namespace ProjectMgt.Model
{
    public class RCJProjectFundStartPlanApprove
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

        private int fundPlanID;

        public virtual int FundPlanID
        {
            get { return fundPlanID; }
            set { fundPlanID = value; }
        }

        private string approverer;

        public virtual string Approverer
        {
            get { return approverer; }
            set { approverer = value; }
        }

        private int ifAgreed;

        public virtual int IfAgreed
        {
            get { return ifAgreed; }
            set { ifAgreed = value; }
        }

        private string approveTime;

        public virtual string ApproveTime
        {
            get { return approveTime; }
            set { approveTime = value; }
        }

        private string memo;

        public virtual string Memo
        {
            get { return memo; }
            set { memo = value; }
        }

        private double actualAmount;

        public virtual double ActualAmount
        {
            get { return actualAmount; }
            set { actualAmount = value; }
        }
    }
}