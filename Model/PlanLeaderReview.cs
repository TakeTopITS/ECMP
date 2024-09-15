using System;

namespace ProjectMgt.Model
{
    public class PlanLeaderReview
    {
        public PlanLeaderReview()
        {
        }

        private int id;
        private int planID;
        private string leaderCode;
        private string leaderName;
        private DateTime reviewTime;
        private string review;
        private decimal scoring;

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

        public virtual DateTime ReviewTime
        {
            get { return reviewTime; }
            set { reviewTime = value; }
        }

        public virtual string Review
        {
            get { return review; }
            set { review = value; }
        }

        public virtual decimal Scoring
        {
            get { return scoring; }
            set { scoring = value; }
        }
    }
}