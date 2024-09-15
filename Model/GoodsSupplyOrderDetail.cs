using System;

namespace ProjectMgt.Model
{
    public class GoodsSupplyOrderDetail
    {
        public GoodsSupplyOrderDetail()
        {
        }

        private int id;
        private int suID;
        private string goodsCode;
        private string goodsName;
        private decimal number;
        private string unit;
        private string type;
        private string modelNumber;
        private string spec;
        private string purReason;
        private decimal price;
        private decimal amount;
        private string currencyType;
        private string purManCode;
        private string purManName;
        private DateTime purTime;
        private string applicantCode;
        private string applicantName;
        private string qcResult;
        private decimal defectiveNumber;
        private string sourceType;
        private int sourceID;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int SUID
        {
            get { return suID; }
            set { suID = value; }
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

        public virtual decimal Number
        {
            get { return number; }
            set { number = value; }
        }

        public virtual string Unit
        {
            get { return unit; }
            set { unit = value; }
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

        public virtual string CurrencyType
        {
            get { return currencyType; }
            set { currencyType = value; }
        }

        public virtual string PurManCode
        {
            get { return purManCode; }
            set { purManCode = value; }
        }

        public virtual string PurManName
        {
            get { return purManName; }
            set { purManName = value; }
        }

        public virtual DateTime PurTime
        {
            get { return purTime; }
            set { purTime = value; }
        }

        public virtual string PurReason
        {
            get { return purReason; }
            set { purReason = value; }
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

        public virtual string QCResult
        {
            get { return qcResult; }
            set { qcResult = value; }
        }

        public virtual decimal DefectiveNumber
        {
            get { return defectiveNumber; }
            set { defectiveNumber = value; }
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
            set; get;
        }
    }
}