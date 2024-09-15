using System;

namespace ProjectMgt.Model
{
    public class PlanRelatedLeader
    {
        public PlanRelatedLeader()
        {
        }

        private int id;
        private int planID;
        private string leaderCode;
        private string leaderName;
        private DateTime joinTime;
        private string actor;
        private string status;

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

        public virtual string LeaderCode
        {
            get { return leaderCode; }
            set { leaderCode = value; }
        }

        public virtual string LeaderName
        {
            get { return leaderName; }
            set { leaderName = value; }
        }

        public virtual DateTime JoinTime
        {
            get { return joinTime; }
            set { joinTime = value; }
        }

        public virtual string Actor
        {
            get { return actor; }
            set { actor = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}