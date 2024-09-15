using System;

namespace ProjectMgt.Model
{
    public class Plan
    {
        public Plan()
        {
        }

        private int planID;
        private string planType;
        private string planName;
        private string planDetail;
        private DateTime startTime;
        private DateTime endTime;
        private int progress;
        private decimal scoringBySelf;
        private decimal scoringByLeader;
        private int parentID;
        private int backupPlanID;
        private string userCode;
        private string userName;

        private string submitTime;

        private string creatorCode;
        private string creatorName;

        private string status;

        private int relatedID;
        private string relatedType;
        private string relatedCode;

        public virtual int PlanID
        {
            get { return planID; }
            set { planID = value; }
        }

        public virtual string PlanType
        {
            get { return planType; }
            set { planType = value; }
        }

        public virtual string PlanName
        {
            get { return planName; }
            set { planName = value; }
        }

        public virtual string PlanDetail
        {
            get { return planDetail; }
            set { planDetail = value; }
        }

        public virtual DateTime StartTime
        {
            get { return startTime; }
            set { startTime = value; }
        }

        public virtual DateTime EndTime
        {
            get { return endTime; }
            set { endTime = value; }
        }

        public virtual int Progress
        {
            get { return progress; }
            set { progress = value; }
        }

        public virtual decimal ScoringBySelf
        {
            get { return scoringBySelf; }
            set { scoringBySelf = value; }
        }

        public virtual decimal ScoringByLeader
        {
            get { return scoringByLeader; }
            set { scoringByLeader = value; }
        }

        public virtual int ParentID
        {
            get { return parentID; }
            set { parentID = value; }
        }

        public virtual int BackupPlanID
        {
            get { return backupPlanID; }
            set { backupPlanID = value; }
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

        public virtual string SubmitTime
        {
            get { return submitTime; }
            set { submitTime = value; }
        }

        public virtual string CreatorCode
        {
            get { return creatorCode; }
            set { creatorCode = value; }
        }

        public virtual string CreatorName
        {
            get { return creatorName; }
            set { creatorName = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual int RelatedID
        {
            get { return relatedID; }
            set { relatedID = value; }
        }

        public virtual string RelatedType
        {
            get { return relatedType; }
            set { relatedType = value; }
        }

        public virtual string RelatedCode
        {
            get { return relatedCode; }
            set { relatedCode = value; }
        }
    }
}