using System;

namespace ProjectMgt.Model
{
    public class WorkExperience
    {
        public WorkExperience()
        {
        }

        private int id;
        private string userCode;
        private DateTime startTime;
        private DateTime endTime;
        private string company;
        private string duty;
        private decimal salary;
        private string resignReason;
        private string renterence;
        private string renterenceCall;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
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

        public virtual string Company
        {
            get { return company; }
            set { company = value; }
        }

        public virtual string Duty
        {
            get { return duty; }
            set { duty = value; }
        }

        public virtual decimal Salary
        {
            get { return salary; }
            set { salary = value; }
        }

        public virtual string ResignReason
        {
            get { return resignReason; }
            set { resignReason = value; }
        }

        public virtual string Renterence
        {
            get { return renterence; }
            set { renterence = value; }
        }

        public virtual string RenterenceCall
        {
            get { return renterenceCall; }
            set { renterenceCall = value; }
        }
    }
}