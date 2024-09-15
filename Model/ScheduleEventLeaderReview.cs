using System;

namespace ProjectMgt.Model
{
    public class ScheduleEventLeaderReview
    {
        public ScheduleEventLeaderReview()
        {
        }

        private int reviewID;
        private int scheduleID;
        private string leaderCode;
        private string leaderName;
        private DateTime reviewTime;
        private string review;
        private decimal scoring;

        public virtual int ReviewID
        {
            get { return reviewID; }
            set { reviewID = value; }
        }

        public virtual int ScheduleID
        {
            get { return scheduleID; }
            set { scheduleID = value; }
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