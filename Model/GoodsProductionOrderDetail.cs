using System;

namespace ProjectMgt.Model
{
    public class GoodsProductionOrderDetail
    {
        public GoodsProductionOrderDetail()
        {
        }

        private int id;
        private int pdID;
        private string goodsCode;
        private string goodsName;
        private string type;
        private string modelNumber;
        private string spec;
        private int bomVerID;
        private decimal number;
        private decimal checkInNumber;
        private string unitName;
        private DateTime deliveryDate;
        private string defaultProcess;
        private string packagingSystem;
        private string comment;
        private string status;
        private string sourceType;
        private int sourceID;

        private decimal price;
        private decimal amount;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int PDID
        {
            get { return pdID; }
            set { pdID = value; }
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

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
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

        public virtual int BomVerID
        {
            get { return bomVerID; }
            set { bomVerID = value; }
        }

        public virtual decimal Number
        {
            get { return number; }
            set { number = value; }
        }

        public virtual decimal CheckInNumber
        {
            get { return checkInNumber; }
            set { checkInNumber = value; }
        }

        public virtual string UnitName
        {
            get { return unitName; }
            set { unitName = value; }
        }

        public virtual decimal Price
        {
            get { return price; }
            set { price = value; }
        }

        public virtual decimal Amount
        {
            get { return amount; }
            set { amount = value; }
        }

        public virtual DateTime DeliveryDate
        {
            get { return deliveryDate; }
            set { deliveryDate = value; }
        }

        public virtual string DefaultProcess
        {
            get { return defaultProcess; }
            set { defaultProcess = value; }
        }

        public virtual string PackagingSystem
        {
            get { return packagingSystem; }
            set { packagingSystem = value; }
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

        public virtual string Brand
        {
            get; set;
        }
    }
}