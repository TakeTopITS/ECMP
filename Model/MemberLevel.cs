namespace ProjectMgt.Model
{
    public class MemberLevel
    {
        public MemberLevel()
        {
        }

        private int id;
        private string userCode;
        private string underCode;
        private int agencyStatus;
        private string projectVisible;
        private string planVisible;
        private string kpiVisible;
        private string workloadVisible;
        private string scheduleVisible;
        private string workflowVisible;
        private string customerServiceVisible;
        private string constractVisible;
        private string positionVisible;
        private int sortNumber;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string UnderCode
        {
            get { return underCode; }
            set { underCode = value; }
        }

        public virtual int AgencyStatus
        {
            get { return agencyStatus; }
            set { agencyStatus = value; }
        }

        public virtual string ProjectVisible
        {
            get { return projectVisible; }
            set { projectVisible = value; }
        }

        public virtual string PlanVisible
        {
            get { return planVisible; }
            set { planVisible = value; }
        }

        public virtual string KPIVisible
        {
            get { return kpiVisible; }
            set { kpiVisible = value; }
        }

        public virtual string WorkloadVisible
        {
            get { return workloadVisible; }
            set { workloadVisible = value; }
        }

        public virtual string ScheduleVisible
        {
            get { return scheduleVisible; }
            set { scheduleVisible = value; }
        }

        public virtual string WorkflowVisible
        {
            get { return workflowVisible; }
            set { workflowVisible = value; }
        }

        public virtual string CustomerServiceVisible
        {
            get { return customerServiceVisible; }
            set { customerServiceVisible = value; }
        }

        public virtual string ConstractVisible
        {
            get { return constractVisible; }
            set { constractVisible = value; }
        }

        public virtual string PositionVisible
        {
            get { return positionVisible; }
            set { positionVisible = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }
    }
}