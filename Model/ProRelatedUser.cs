using System;

namespace ProjectMgt.Model
{
    public class ProRelatedUser
    {
        public ProRelatedUser()
        {
        }

        private int id;
        private int projectID;
        private string projectName;
        private string projectType;
        private int parentID;
        private DateTime beginDate;
        private DateTime endDate;
        private string userCode;
        private string userName;
        private string actor;
        private DateTime joinDate;
        private string pmCode;
        private string pmName;
        private string makeManCode;
        private string makeManName;
        private decimal budget;
        private decimal manHour;
        private decimal manNumber;
        private int finishPercent;
        private string myStatus;
        private string proSatus;
        private decimal unitHourSalary;

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

        public virtual string ProjectType
        {
            get { return projectType; }
            set { projectType = value; }
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

        public virtual int ParentID
        {
            get { return parentID; }
            set { parentID = value; }
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

        public virtual string MakeManCode
        {
            get { return makeManCode; }
            set { makeManCode = value; }
        }

        public virtual string MakeManName
        {
            get { return makeManName; }
            set { makeManName = value; }
        }

        public virtual decimal Budget
        {
            get { return budget; }
            set { budget = value; }
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

        public virtual int FinishPercent
        {
            get { return finishPercent; }
            set { finishPercent = value; }
        }

        public virtual string MyStatus
        {
            get { return myStatus; }
            set { myStatus = value; }
        }

        public virtual string ProStatus
        {
            get { return proSatus; }
            set { proSatus = value; }
        }

        public virtual decimal UnitHourSalary
        {
            get { return unitHourSalary; }
            set { unitHourSalary = value; }
        }
    }
}