using System;

namespace ProjectMgt.Model
{
    public class CarAssignForm
    {
        public CarAssignForm()
        {
        }

        private int id;
        private int applyFormID;
        private string carCode;

        private string departCode;
        private string departName;
        private string applicantCode;
        private string applicantName;
        private string attendant;

        private string driverCode;
        private string driverName;

        private string guardCode;
        private string guardName;

        private string boardingSite;
        private string destination;
        private string applyReason;
        private decimal mileage;

        private DateTime departTime;
        private DateTime backTime;

        private DateTime realDepartTime;
        private DateTime realBackTime;

        private decimal roadToll;
        private decimal parkingCharge;

        private decimal oilVolume;
        private decimal oilCharge;

        private decimal currentMileage;

        private string comment;
        private string status;
        private string makeUserCode;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ApplyFormID
        {
            get { return applyFormID; }
            set { applyFormID = value; }
        }

        public virtual string CarCode
        {
            get { return carCode; }
            set { carCode = value; }
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

        public virtual string DriverCode
        {
            get { return driverCode; }
            set { driverCode = value; }
        }

        public virtual string DriverName
        {
            get { return driverName; }
            set { driverName = value; }
        }

        public virtual string GuardCode
        {
            get { return guardCode; }
            set { guardCode = value; }
        }

        public virtual string GuardName
        {
            get { return guardName; }
            set { guardName = value; }
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

        public virtual decimal Mileage
        {
            get { return mileage; }
            set { mileage = value; }
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

        public virtual DateTime RealDepartTime
        {
            get { return realDepartTime; }
            set { realDepartTime = value; }
        }

        public virtual DateTime RealBackTime
        {
            get { return realBackTime; }
            set { realBackTime = value; }
        }

        public virtual decimal RoadToll
        {
            get { return roadToll; }
            set { roadToll = value; }
        }

        public virtual decimal ParkingCharge
        {
            get { return parkingCharge; }
            set { parkingCharge = value; }
        }

        public virtual decimal OilVolume
        {
            get { return oilVolume; }
            set { oilVolume = value; }
        }

        public virtual decimal OilCharge
        {
            get { return oilCharge; }
            set { oilCharge = value; }
        }

        public virtual decimal CurrentMileage
        {
            get { return currentMileage; }
            set { currentMileage = value; }
        }

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
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