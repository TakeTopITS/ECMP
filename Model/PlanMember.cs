using System;

namespace ProjectMgt.Model
{
    public class PlanMember
    {
        public PlanMember()
        {
        }

        private int id;
        private int planID;
        private string userCode;
        private string userName;
        private string mainWork;
        private DateTime startWorkDate;
        private DateTime endWorkDate;
        private decimal budget;
        private DateTime joinDate;
        private string isLeader;

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

        public virtual string MainWork
        {
            get { return mainWork; }
            set { mainWork = value; }
        }

        public virtual DateTime StartWorkDate
        {
            get { return startWorkDate; }
            set { startWorkDate = value; }
        }

        public virtual DateTime EndWorkDate
        {
            get { return endWorkDate; }
            set { endWorkDate = value; }
        }

        public virtual decimal Budget
        {
            get { return budget; }
            set { budget = value; }
        }

        public virtual DateTime JoinDate
        {
            get { return joinDate; }
            set { joinDate = value; }
        }

        public virtual string IsLeader
        {
            get { return isLeader; }
            set { isLeader = value; }
        }
    }
}