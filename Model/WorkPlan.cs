using System;

namespace ProjectMgt.Model
{
    public class WorkPlan
    {
        public WorkPlan()
        {
        }

        private int id;
        private int projectID;
        private int workID;
        private int verID;
        private string name;
        private DateTime makeDate;
        private DateTime start_date;
        private DateTime end_date;
        private string resource;
        private decimal budget;
        private decimal workHour;
        private string status;
        private int priorID;
        private string type;
        private decimal defaultSchedule;
        private decimal defaultCost;
        private string lockStatus;
        private int sortNumber;

        private string updateManCode;
        private DateTime updateTime;
        private string creatorCode;
        private int fromProjectID;
        private int fromProjectPlanVerID;
        private int parent_id;
        private int pid;

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

        public virtual int WorkID
        {
            get { return workID; }
            set { workID = value; }
        }

        public virtual int VerID
        {
            get { return verID; }
            set { verID = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        public virtual DateTime MakeDate
        {
            get { return makeDate; }
            set { makeDate = value; }
        }

        public virtual DateTime Start_Date
        {
            get { return start_date; }
            set { start_date = value; }
        }

        public virtual DateTime End_Date
        {
            get { return end_date; }
            set { end_date = value; }
        }

        public virtual string Resource
        {
            get { return resource; }
            set { resource = value; }
        }

        public virtual decimal Budget
        {
            get { return budget; }
            set { budget = value; }
        }

        public virtual decimal WorkHour
        {
            get { return workHour; }
            set { workHour = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual int PriorID
        {
            get { return priorID; }
            set { priorID = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual decimal DefaultSchedule
        {
            get { return defaultSchedule; }
            set { defaultSchedule = value; }
        }

        public virtual int Percent_Done
        {
            get;set;
        }

        public virtual decimal DefaultCost
        {
            get { return defaultCost; }
            set { defaultCost = value; }
        }

        public virtual string LockStatus
        {
            get { return lockStatus; }
            set { lockStatus = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }

        public virtual string UpdateManCode
        {
            get { return updateManCode; }
            set { updateManCode = value; }
        }

        public virtual string CreatorCode
        {
            get { return creatorCode; }
            set { creatorCode = value; }
        }

        public virtual DateTime UpdateTime
        {
            get { return updateTime; }
            set { updateTime = value; }
        }

        public virtual int FromProjectID
        {
            get { return fromProjectID; }
            set { fromProjectID = value; }
        }

        public virtual int FromProjectPlanVerID
        {
            get { return fromProjectPlanVerID; }
            set { fromProjectPlanVerID = value; }
        }

        public virtual int Parent_ID
        {
            get { return parent_id; }
            set { parent_id = value; }
        }

        public virtual int PID
        {
            get { return pid; }
            set { pid = value; }
        }

        //不能添加任何东西
    }
}