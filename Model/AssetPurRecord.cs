using System;

namespace ProjectMgt.Model
{
    public class AssetPurRecord
    {
        public AssetPurRecord()
        {
        }

        private int id;
        private int poID;
        private string assetCode;
        private string assetName;
        private decimal number;
        private string unit;
        private string type;
        private string modelNumber;
        private string spec;
        private string purReason;
        private decimal price;
        private decimal amount;
        private string currencyType;
        private DateTime purTime;
        private string supplier;
        private string supplierPhone;
        private string applicantCode;
        private string applicantName;
        private string status;

        private string relatedType;
        private int relatedID;

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

        public virtual string CurrencyType
        {
            get { return currencyType; }
            set { currencyType = value; }
        }

        public virtual DateTime PurTime
        {
            get { return purTime; }
            set { purTime = value; }
        }

        public virtual string Supplier
        {
            get { return supplier; }
            set { supplier = value; }
        }

        public virtual string SupplierPhone
        {
            get { return supplierPhone; }
            set { supplierPhone = value; }
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

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
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
    }
}