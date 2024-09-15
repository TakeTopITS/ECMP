using System;

namespace ProjectMgt.Model
{
    public class WorkFlowStep
    {
        public WorkFlowStep()
        {
        }

        private int stepID;
        private int wlID;
        private int sortNumber;
        private string stepName;
        private int limitedOperator;
        private int limitedTime;
        private string departRelated;

        private DateTime activeTime;
        private string status;

        public virtual int StepID
        {
            get { return stepID; }
            set { stepID = value; }
        }

        public virtual int WLID
        {
            get { return wlID; }
            set { wlID = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
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

        public virtual string DepartRelated
        {
            get { return departRelated; }
            set { departRelated = value; }
        }

        public virtual DateTime ActiveTime
        {
            get { return activeTime; }
            set { activeTime = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}