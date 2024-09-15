using System;

namespace ProjectMgt.Model
{
    public class UserKPICheck
    {
        public UserKPICheck()
        {
        }

        private int kpiCheckID;
        private string kpiCheckName;
        private DateTime startTime;
        private DateTime endTime;
        private decimal totalSelfPoint;
        private decimal totalLeaderPoint;
        private decimal totalThirdPartPoint;
        private decimal totalSqlPoint;
        private decimal totalHRPoint;
        private decimal totalPoint;
        private string userCode;
        private string userName;
        private string creatorCode;
        private string creatorName;
        private string status;

        public virtual int KPICheckID
        {
            get { return kpiCheckID; }
            set { kpiCheckID = value; }
        }

        public virtual string KPICheckName
        {
            get { return kpiCheckName; }
            set { kpiCheckName = value; }
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

        public virtual decimal TotalSelfPoint
        {
            get { return totalSelfPoint; }
            set { totalSelfPoint = value; }
        }

        public virtual decimal TotalLeaderPoint
        {
            get { return totalLeaderPoint; }
            set { totalLeaderPoint = value; }
        }

        public virtual decimal TotalThirdPartPoint
        {
            get { return totalThirdPartPoint; }
            set { totalThirdPartPoint = value; }
        }

        public virtual decimal TotalSqlPoint
        {
            get { return totalSqlPoint; }
            set { totalSqlPoint = value; }
        }

        public virtual decimal TotalHRPoint
        {
            get { return totalHRPoint; }
            set { totalHRPoint = value; }
        }

        public virtual decimal TotalPoint
        {
            get { return totalPoint; }
            set { totalPoint = value; }
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
    }
}