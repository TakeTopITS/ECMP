using System;

namespace ProjectMgt.Model
{
    public class PlanWorkLog
    {
        public PlanWorkLog()
        {
        }

        private int id;
        private int planID;
        private string logDetail;
        private int progress;
        private DateTime workTime;
        private string userCode;
        private string userName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int PlanID
        {
            get { return planID; }
            set { planID = value; }
        }

        public virtual string LogDetail
        {
            get { return logDetail; }
            set { logDetail = value; }
        }

        public virtual int Progress
        {
            get { return progress; }
            set { progress = value; }
        }

        public virtual DateTime WorkTime
        {
            get { return workTime; }
            set { workTime = value; }
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
    }
}