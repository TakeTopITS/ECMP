using System;

namespace ProjectMgt.Model
{
    public class DailyWork
    {
        public DailyWork()
        {
        }

        private int workID;
        private string type;
        private string userCode;
        private string userName;
        private DateTime workDate;
        private DateTime recordTime;
        private string address;
        private int projectID;
        private string projectName;
        private string dailySummary;
        private string achievement;

        private decimal finishPercent;
        private decimal charge;
        private decimal confirmCharge;
        private decimal manHour;
        private decimal confirmManHour;
        private decimal salary;
        private decimal bonus;
        private decimal confirmBonus;
        private string authority;

        public virtual int WorkID
        {
            get { return workID; }
            set { workID = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
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

        public virtual DateTime WorkDate
        {
            get { return workDate; }
            set { workDate = value; }
        }

        public virtual DateTime RecordTime
        {
            get { return recordTime; }
            set { recordTime = value; }
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

        public virtual string DailySummary
        {
            get { return dailySummary; }
            set { dailySummary = value; }
        }

        public virtual string Achievement
        {
            get { return achievement; }
            set { achievement = value; }
        }

        public virtual string Address
        {
            get { return address; }
            set { address = value; }
        }

        public virtual decimal FinishPercent
        {
            get { return finishPercent; }
            set { finishPercent = value; }
        }

        public virtual decimal Charge
        {
            get { return charge; }
            set { charge = value; }
        }

        public virtual decimal ConfirmCharge
        {
            get { return confirmCharge; }
            set { confirmCharge = value; }
        }

        public virtual decimal ManHour
        {
            get { return manHour; }
            set { manHour = value; }
        }

        public virtual decimal ConfirmManHour
        {
            get { return confirmManHour; }
            set { confirmManHour = value; }
        }

        public virtual decimal Salary
        {
            get { return salary; }
            set { salary = value; }
        }

        public virtual decimal Bonus
        {
            get { return bonus; }
            set { bonus = value; }
        }

        public virtual decimal ConfirmBonus
        {
            get { return confirmBonus; }
            set { confirmBonus = value; }
        }

        public virtual string Authority
        {
            get { return authority; }
            set { authority = value; }
        }
    }
}