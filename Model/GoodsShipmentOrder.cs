using System;

namespace ProjectMgt.Model
{
    public class GoodsShipmentOrder
    {
        public GoodsShipmentOrder()
        {
        }

        private int shipmentNO;
        private string gshoName;
        private DateTime shipTime;
        private string shipmentType;
        private string wareHouse;
        private string operatorCode;
        private string operatorName;
        private string applicant;
        private string applicationReason;
        private string customerCode;
        private string customerName;

        private string relatedType;
        private int relatedID;
        private string relatedCode;

        private string currencyType;

        public virtual int ShipmentNO
        {
            get { return shipmentNO; }
            set { shipmentNO = value; }
        }

        public virtual string GSHOName
        {
            get { return gshoName; }
            set { gshoName = value; }
        }

        public virtual string ShipmentType
        {
            get { return shipmentType; }
            set { shipmentType = value; }
        }

        public virtual DateTime ShipTime
        {
            get { return shipTime; }
            set { shipTime = value; }
        }

        public virtual string WareHouse
        {
            get { return wareHouse; }
            set { wareHouse = value; }
        }

        public virtual string OperatorCode
        {
            get { return operatorCode; }
            set { operatorCode = value; }
        }

        public virtual string OperatorName
        {
            get { return operatorName; }
            set { operatorName = value; }
        }

        public virtual string Applicant
        {
            get { return applicant; }
            set { applicant = value; }
        }

        public virtual string ApplicationReason
        {
            get { return applicationReason; }
            set { applicationReason = value; }
        }

        public virtual string CurrencyType
        {
            get { return currencyType; }
            set { currencyType = value; }
        }

        public virtual string RelatedType
        {
            get { return relatedType; }
            set { relatedType = value; }
        }

        public virtual int RelatedID
        {
            get { return relatedID; }
            set { relatedID = value; }
        }

        public virtual string RelatedCode
        {
            get { return relatedCode; }
            set { relatedCode = value; }
        }

        public virtual string CustomerCode
        {
            get { return customerCode; }
            set { customerCode = value; }
        }

        public virtual string CustomerName
        {
            get { return customerName; }
            set { customerName = value; }
        }
    }
}