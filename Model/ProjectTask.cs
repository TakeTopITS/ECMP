using System;

namespace ProjectMgt.Model
{
    public class ProjectTask
    {
        public ProjectTask()
        {
        }

        private int taskID;
        private string type;
        private string task;
        private DateTime beginDate;
        private DateTime endDate;
        private string makeManCode;
        private string makeManName;
        private DateTime makeDate;
        private string status;
        private decimal budget;
        private decimal expense;
        private decimal manHour;
        private decimal realManHour;
        private int projectID;
        private decimal finishPercent;
        private string priority;
        private int reqID;
        private int defectID;
        private int planID;
        private int riskID;
        private int meetingID;
        private int collaborationID;
        private string goodsSN;
        private string isPlanMainTask;

        public virtual int TaskID
        {
            get { return taskID; }
            set { taskID = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string Task
        {
            get { return task; }
            set { task = value; }
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

        public virtual DateTime MakeDate
        {
            get { return makeDate; }
            set { makeDate = value; }
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

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual decimal Budget
        {
            get { return budget; }
            set { budget = value; }
        }

        public virtual decimal Expense
        {
            get { return expense; }
            set { expense = value; }
        }

        public virtual decimal ManHour
        {
            get { return manHour; }
            set { manHour = value; }
        }

        public virtual decimal RealManHour
        {
            get { return realManHour; }
            set { realManHour = value; }
        }

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual decimal FinishPercent
        {
            get { return finishPercent; }
            set { finishPercent = value; }
        }

        public virtual string Priority
        {
            get { return priority; }
            set { priority = value; }
        }

        public virtual int ReqID
        {
            get { return reqID; }
            set { reqID = value; }
        }

        public virtual int DefectID
        {
            get { return defectID; }
            set { defectID = value; }
        }

        public virtual int PlanID
        {
            get { return planID; }
            set { planID = value; }
        }

        public virtual int RiskID
        {
            get { return riskID; }
            set { riskID = value; }
        }

        public virtual int MeetingID
        {
            get { return meetingID; }
            set { meetingID = value; }
        }

        public virtual int CollaborationID
        {
            get { return collaborationID; }
            set { collaborationID = value; }
        }

        public virtual string GoodsSN
        {
            get { return goodsSN; }
            set { goodsSN = value; }
        }

        public virtual string IsPlanMainTask
        {
            get { return isPlanMainTask; }
            set { isPlanMainTask = value; }
        }


        public virtual decimal RequireNumber
        {
            get; set;
        }

        public virtual decimal FinishedNumber
        {
            get; set;
        }

        public virtual string UnitName
        {
            get; set;
        }

        public virtual decimal Price
        {
            get; set;
        }
    }
}