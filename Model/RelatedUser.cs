using System;

namespace ProjectMgt.Model
{
    public class RelatedUser
    {
        public RelatedUser()
        {
        }

        private int id;
        private int projectID;
        private string projectName;
        private string userCode;
        private string userName;
        private string departCode;
        private string departName;
        private string actor;
        private DateTime joinDate;
        private DateTime leaveDate;
        private string status;
        private string workDetail;
        private string actorGroup;
        private int smsCount;
        private string salaryMethod;
        private decimal promissionScale;
        private decimal unitHourSalary;
        private string canUpdatePlan;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual string ProjectName
        {
            get { return projectName; }
            set { projectName = value; }
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

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        public virtual string DepartName
        {
            get { return departName; }
            set { departName = value; }
        }

        public virtual string Actor
        {
            get { return actor; }
            set { actor = value; }
        }

        public virtual DateTime JoinDate
        {
            get { return joinDate; }
            set { joinDate = value; }
        }

        public virtual DateTime LeaveDate
        {
            get { return leaveDate; }
            set { leaveDate = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string WorkDetail
        {
            get { return workDetail; }
            set { workDetail = value; }
        }

        public virtual string ActorGroup
        {
            get { return actorGroup; }
            set { actorGroup = value; }
        }

        public virtual int SMSCount
        {
            get { return smsCount; }
            set { smsCount = value; }
        }

        public virtual string SalaryMethod
        {
            get { return salaryMethod; }
            set { salaryMethod = value; }
        }

        public virtual decimal PromissionScale
        {
            get { return promissionScale; }
            set { promissionScale = value; }
        }

        public virtual decimal UnitHourSalary
        {
            get { return unitHourSalary; }
            set { unitHourSalary = value; }
        }

        public virtual string CanUpdatePlan
        {
            get { return canUpdatePlan; }
            set { canUpdatePlan = value; }
        }
    }
}