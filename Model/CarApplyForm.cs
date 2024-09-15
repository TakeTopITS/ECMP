using System;

namespace ProjectMgt.Model
{
    public class CarApplyForm
    {
        public CarApplyForm()
        {
        }

        private int id;
        private string departCode;
        private string departName;
        private string applicantCode;
        private string applicantName;
        private string attendant;
        private string boardingSite;
        private string destination;
        private string applyReason;
        private string carType;
        private DateTime departTime;
        private DateTime backTime;
        private string status;
        private string makeUserCode;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
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

        public virtual string ApplicantCode
        {
            get { return applicantCode; }
            set { applicantCode = value; }
        }

        public virtual string ApplicantName
        {
            get { return applicantName; }
            set { applicantName = value; }
        }

        public virtual string Attendant
        {
            get { return attendant; }
            set { attendant = value; }
        }

        public virtual string BoardingSite
        {
            get { return boardingSite; }
            set { boardingSite = value; }
        }

        public virtual string Destination
        {
            get { return destination; }
            set { destination = value; }
        }

        public virtual string ApplyReason
        {
            get { return applyReason; }
            set { applyReason = value; }
        }

        public virtual string CarType
        {
            get { return carType; }
            set { carType = value; }
        }

        public virtual DateTime DepartTime
        {
            get { return departTime; }
            set { departTime = value; }
        }

        public virtual DateTime BackTime
        {
            get { return backTime; }
            set { backTime = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string MakeUserCode
        {
            get { return makeUserCode; }
            set { makeUserCode = value; }
        }
    }
}