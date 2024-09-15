using System;

namespace ProjectMgt.Model
{
    public class AssetShipmentReport
    {
        public AssetShipmentReport()
        {
        }

        private int shipmentNO;
        private DateTime shipTime;
        private string operatorCode;
        private string operatorName;
        private string applicant;
        private string applicationReason;
        private string relatedType;
        private int relatedID;

        private int id;
        private string assetCode;
        private string assetName;
        private string modelNumber;
        private string spec;
        private decimal number;
        private string unitName;
        private string manufacturer;
        private string fromPosition;
        private int fromAssetID;
        private string toPosition;
        private string comment;

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

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string AssetCode
        {
            get { return assetCode; }
            set { assetCode = value; }
        }

        public virtual string AssetName
        {
            get { return assetName; }
            set { assetName = value; }
        }

        public virtual string ModelNumber
        {
            get { return modelNumber; }
            set { modelNumber = value; }
        }

        public virtual string Spec
        {
            get { return spec; }
            set { spec = value; }
        }

        public virtual decimal Number
        {
            get { return number; }
            set { number = value; }
        }

        public virtual string UnitName
        {
            get { return unitName; }
            set { unitName = value; }
        }

        public virtual string Manufacturer
        {
            get { return manufacturer; }
            set { manufacturer = value; }
        }

        public virtual string FromPosition
        {
            get { return fromPosition; }
            set { fromPosition = value; }
        }

        public virtual int FromAssetID
        {
            get { return fromAssetID; }
            set { fromAssetID = value; }
        }

        public virtual string ToPosition
        {
            get { return toPosition; }
            set { toPosition = value; }
        }

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
        }
    }
}