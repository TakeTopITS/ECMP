using System;

namespace ProjectMgt.Model
{
    public class Project
    {
        public Project()
        {
        }

        private int projectID;
        private string projectCode;
        private string projectType;
        private string projectClass;
        private string userCode;
        private string userName;
        private string projectName;
        private string projectDetail;
        private string acceptStandard;
        private DateTime beginDate;
        private DateTime endDate;
        private string pmCode;
        private string pmName;
        private string customerPMName;
        private DateTime makeDate;
        private int parentID;
        private decimal projectAmount;
        private Decimal budget;
        private string currencyType;
        private decimal manHour;
        private decimal manNumber;
        private Decimal finishPercent;
        private string status;
        private string statusValue;
        private string priority;

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual string ProjectCode
        {
            get { return projectCode; }
            set { projectCode = value; }
        }

        public virtual string ProjectType
        {
            get { return projectType; }
            set { projectType = value; }
        }

        public virtual string ProjectClass
        {
            get { return projectClass; }
            set { projectClass = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public virtual string ProjectName
        {
            get { return projectName; }
            set { projectName = value; }
        }

        public virtual string ProjectDetail
        {
            get { return projectDetail; }
            set { projectDetail = value; }
        }

        public virtual string AcceptStandard
        {
            get { return acceptStandard; }
            set { acceptStandard = value; }
        }

        public virtual DateTime BeginDate
        {
            get { return beginDate; }
            set { beginDate = value; }
        }

        public virtual DateTime EndDate
        {
            get { return endDate; }
            set { endDate = value; }
        }

        public virtual string PMCode
        {
            get { return pmCode; }
            set { pmCode = value; }
        }

        public virtual string PMName
        {
            get { return pmName; }
            set { pmName = value; }
        }

        public virtual string CustomerPMName
        {
            get { return customerPMName; }
            set { customerPMName = value; }
        }

        public virtual DateTime MakeDate
        {
            get { return makeDate; }
            set { makeDate = value; }
        }

        public virtual int ParentID
        {
            get { return parentID; }
            set { parentID = value; }
        }

        public virtual decimal ProjectAmount
        {
            get { return projectAmount; }
            set { projectAmount = value; }
        }

        public virtual decimal Budget
        {
            get { return budget; }
            set { budget = value; }
        }

        public virtual string CurrencyType
        {
            get { return currencyType; }
            set { currencyType = value; }
        }

        public virtual decimal ManHour
        {
            get { return manHour; }
            set { manHour = value; }
        }

        public virtual decimal ManNumber
        {
            get { return manNumber; }
            set { manNumber = value; }
        }

        public virtual decimal FinishPercent
        {
            get { return finishPercent; }
            set { finishPercent = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string StatusValue
        {
            get { return statusValue; }
            set { statusValue = value; }
        }

        public virtual string Priority
        {
            get { return priority; }
            set { priority = value; }
        }

        public virtual string BelongDepartCode
        {
            get; set;
        }

        public virtual string BelongDepartName
        {
            get; set;
        }
    }
}