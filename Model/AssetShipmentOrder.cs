using System;

namespace ProjectMgt.Model
{
    public class AssetShipmentOrder
    {
        public AssetShipmentOrder()
        {
        }

        private int shipmentNO;
        private DateTime shipTime;
        private string wareHouse;
        private string operatorCode;
        private string operatorName;
        private string applicant;
        private string applicationReason;
        private string relatedType;
        private int relatedID;
        private string sourceType;
        private int sourceID;

        public virtual int ShipmentNO
        {
            get { return shipmentNO; }
            set { shipmentNO = value; }
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

        public virtual string SourceType
        {
            get { return sourceType; }
            set { sourceType = value; }
        }

        public virtual int SourceID
        {
            get { return sourceID; }
            set { sourceID = value; }
        }
    }
}