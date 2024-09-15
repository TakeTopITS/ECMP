using System;

namespace ProjectMgt.Model
{
    public class LeaveApplyForm
    {
        public LeaveApplyForm()
        {
        }

        private int id;
        private string userName;
        private string departCode;
        private string departName;
        private string duty;
        private string leaveType;
        private string applyBecause;
        private DateTime startTime;
        private DateTime endTime;
        private string status;
        private string creator;
        private DateTime createTime;
        private decimal hourNum;
        private decimal dayNum;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual decimal HourNum
        {
            get { return hourNum; }
            set { hourNum = value; }
        }

        public virtual decimal DayNum
        {
            get { return dayNum; }
            set { dayNum = value; }
        }

        public virtual string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        public virtual string DepartName
        {
            get { return departName; }
            set { departName = value; }
        }

        public virtual string Duty
        {
            get { return duty; }
            set { duty = value; }
        }

        public virtual string LeaveType
        {
            get { return leaveType; }
            set { leaveType = value; }
        }

        public virtual string ApplyBecause
        {
            get { return applyBecause; }
            set { applyBecause = value; }
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

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string Creator
        {
            get { return creator; }
            set { creator = value; }
        }

        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }
    }
}