using System;

namespace ProjectMgt.Model
{
    public class CarInformation
    {
        public CarInformation()
        {
        }

        private string carCode;
        private string carName;
        private string carBrand;
        private string carType;
        private string carColor;
        private decimal dwt;
        private int seatNumber;
        private decimal fuelConsumption;
        private decimal initialMileage;
        private string engineCode;
        private string frameCode;
        private string vendor;
        private decimal price;
        private DateTime purchaseTime;
        private string belongDepartCode;
        private string belongDepartName;
        private string status;

        public virtual string CarCode
        {
            get { return carCode; }
            set { carCode = value; }
        }

        public virtual string CarName
        {
            get { return carName; }
            set { carName = value; }
        }

        public virtual string CarBrand
        {
            get { return carBrand; }
            set { carBrand = value; }
        }

        public virtual string CarType
        {
            get { return carType; }
            set { carType = value; }
        }

        public virtual string CarColor
        {
            get { return carColor; }
            set { carColor = value; }
        }

        public virtual decimal DWT
        {
            get { return dwt; }
            set { dwt = value; }
        }

        public virtual int SeatNumber
        {
            get { return seatNumber; }
            set { seatNumber = value; }
        }

        public virtual decimal FuelConsumption
        {
            get { return fuelConsumption; }
            set { fuelConsumption = value; }
        }

        public virtual decimal InitialMileage
        {
            get { return initialMileage; }
            set { initialMileage = value; }
        }

        public virtual string EngineCode
        {
            get { return engineCode; }
            set { engineCode = value; }
        }

        public virtual string FrameCode
        {
            get { return frameCode; }
            set { frameCode = value; }
        }

        public virtual string Vendor
        {
            get { return vendor; }
            set { vendor = value; }
        }

        public virtual decimal Price
        {
            get { return price; }
            set { price = value; }
        }

        public virtual DateTime PurchaseTime
        {
            get { return purchaseTime; }
            set { purchaseTime = value; }
        }

        public virtual string BelongDepartCode
        {
            get { return belongDepartCode; }
            set { belongDepartCode = value; }
        }

        public virtual string BelongDepartName
        {
            get { return belongDepartName; }
            set { belongDepartName = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}