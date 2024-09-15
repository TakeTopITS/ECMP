using System;

namespace ProjectMgt.Model
{
    public class GoodsPurRecord
    {
        public GoodsPurRecord()
        {
        }

        private int id;
        private int poID;
        private string goodsCode;
        private string goodsName;
        private decimal number;
        private decimal checkInNumber;
        private decimal supplyNumber;
        private decimal returnNumber;
        private string unit;
        private string type;
        private string modelNumber;
        private string spec;
        private int bomVerID;

        private string purReason;
        private decimal price;
        private decimal amount;
        private string currencyType;
        private DateTime purTime;

        private string applicantCode;
        private string applicantName;
        private decimal taxRate;
        private string clearingForm;
        private decimal taxPrice;
        private decimal taxAmount;
        private string sourceType;
        private int sourceID;
        private string comment;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int POID
        {
            get { return poID; }
            set { poID = value; }
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

        public virtual int BomVerID
        {
            get { return bomVerID; }
            set { bomVerID = value; }
        }

        public virtual decimal CheckInNumber
        {
            get { return checkInNumber; }
            set { checkInNumber = value; }
        }

        public virtual decimal SupplyNumber
        {
            get { return supplyNumber; }
            set { supplyNumber = value; }
        }

        public virtual decimal ReturnNumber
        {
            get { return returnNumber; }
            set { returnNumber = value; }
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

        public virtual string PurReason
        {
            get { return purReason; }
            set { purReason = value; }
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

        public virtual DateTime PurTime
        {
            get { return purTime; }
            set { purTime = value; }
        }

        public virtual string CurrencyType
        {
            get { return currencyType; }
            set { currencyType = value; }
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

        public virtual Decimal TaxRate
        {
            get { return taxRate; }
            set { taxRate = value; }
        }

        public virtual string ClearingForm
        {
            get { return clearingForm; }
            set { clearingForm = value; }
        }

        public virtual decimal TaxPrice
        {
            get { return taxPrice; }
            set { taxPrice = value; }
        }

        public virtual decimal TaxAmount
        {
            get { return taxAmount; }
            set { taxAmount = value; }
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

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
        }

        public virtual string Brand
        {
            set; get;
        }
    }
}