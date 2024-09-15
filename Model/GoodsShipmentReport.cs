using System;

namespace ProjectMgt.Model
{
    public class GoodsShipmentReport
    {
        public GoodsShipmentReport()
        {
        }

        private int shipmentNO;
        private string shipmentType;
        private DateTime shipTime;
        private string operatorCode;
        private string operatorName;
        private string applicant;
        private string applicationReason;
        private string relatedType;
        private int relatedID;
        private string relatedCode;

        private int id;
        private string goodsCode;
        private string goodsName;
        private string sn;
        private string modelNumber;
        private string spec;
        private decimal number;
        private string unitName;
        private string manufacturer;
        private string fromPosition;
        private int fromGoodsID;
        private string toPosition;
        private string comment;
        private int warrantyPeriod;
        private DateTime warrantyEndTime;
        private string sourceType;
        private int sourceID;

        private string customerCode;
        private string customerName;

        private string goodsSN;

        public virtual int ShipmentNO
        {
            get { return shipmentNO; }
            set { shipmentNO = value; }
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

        public virtual string RelatedCode
        {
            get { return relatedCode; }
            set { relatedCode = value; }
        }

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string GoodsCode
        {
            get { return goodsCode; }
            set { goodsCode = value; }
        }

        public virtual string GoodsName
        {
            get { return goodsName; }
            set { goodsName = value; }
        }

        public virtual string SN
        {
            get { return sn; }
            set { sn = value; }
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

        public virtual int FromGoodsID
        {
            get { return fromGoodsID; }
            set { fromGoodsID = value; }
        }

        public virtual string ToPosition
        {
            get { return toPosition; }
            set { toPosition = value; }
        }

        public virtual int WarrantyPeriod
        {
            get { return warrantyPeriod; }
            set { warrantyPeriod = value; }
        }

        public virtual DateTime WarrantyEndTime
        {
            get { return warrantyEndTime; }
            set { warrantyEndTime = value; }
        }

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
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

        public virtual string GoodsSN
        {
            get { return goodsSN; }
            set { goodsSN = value; }
        }
    }
}