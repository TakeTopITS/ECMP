namespace ProjectMgt.Model
{
    public class WorkFlowTStep
    {
        public WorkFlowTStep()
        {
        }

        private int stepID;
        private int sortNumber;
        private string temName;
        private string stepName;
        private int limitedOperator;
        private int limitedTime;
        private int nextSortNumber;

        private string nextStepMust;

        private string selfReview;
        private string departRelated;
        private int departRelatedLevelNumber;

        private string operatorSelect;
        private string isPriorStepSelect;
        private string allowSelfPass;
        private string allowPriorOperatorPass;

        private string partTimeReview;
        private string projectRelated;

        private string sendSMS;
        private string sendEMail;
        private string guid;

        private decimal finishPercent;

        public virtual int StepID
        {
            get { return stepID; }
            set { stepID = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }

        public virtual string TemName
        {
            get { return temName; }
            set { temName = value; }
        }

        public virtual string StepName
        {
            get { return stepName; }
            set { stepName = value; }
        }

        public virtual int LimitedOperator
        {
            get { return limitedOperator; }
            set { limitedOperator = value; }
        }

        public virtual int LimitedTime
        {
            get { return limitedTime; }
            set { limitedTime = value; }
        }

        public virtual int NextSortNumber
        {
            get { return nextSortNumber; }
            set { nextSortNumber = value; }
        }

        public virtual string NextStepMust
        {
            get { return nextStepMust; }
            set { nextStepMust = value; }
        }

        public virtual string SelfReview
        {
            get { return selfReview; }
            set { selfReview = value; }
        }

        public virtual string IsPriorStepSelect
        {
            get { return isPriorStepSelect; }
            set { isPriorStepSelect = value; }
        }

        public virtual string AllowSelfPass
        {
            get { return allowSelfPass; }
            set { allowSelfPass = value; }
        }

        public virtual string AllowPriorOperatorPass
        {
            get { return allowPriorOperatorPass; }
            set { allowPriorOperatorPass = value; }
        }

        public virtual string DepartRelated
        {
            get { return departRelated; }
            set { departRelated = value; }
        }

        public virtual int DepartRelatedLevelNumber
        {
            get { return departRelatedLevelNumber; }
            set { departRelatedLevelNumber = value; }
        }

        public virtual string OperatorSelect
        {
            get { return operatorSelect; }
            set { operatorSelect = value; }
        }

        public virtual string PartTimeReview
        {
            get { return partTimeReview; }
            set { partTimeReview = value; }
        }

        public virtual string ProjectRelated
        {
            get { return projectRelated; }
            set { projectRelated = value; }
        }

        public virtual string SendSMS
        {
            get { return sendSMS; }
            set { sendSMS = value; }
        }

        public virtual string SendEMail
        {
            get { return sendEMail; }
            set { sendEMail = value; }
        }

        public virtual string GUID
        {
            get { return guid; }
            set { guid = value; }
        }

        public virtual decimal FinishPercent
        {
            get { return finishPercent; }
            set { finishPercent = value; }
        }

        public virtual string AllowCurrentStepAddApprover
        {
            get; set;
        }

        public virtual string AllowNextStepAddApprover
        {
            get; set;
        }

        public virtual string OverTimeAutoAgree
        {
            get; set;
        }

        public virtual int OverTimeHourNumber
        {
            get; set;
        }
    }
}