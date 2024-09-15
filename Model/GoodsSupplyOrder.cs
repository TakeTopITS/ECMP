using System;

namespace ProjectMgt.Model
{
    public class GoodsSupplyOrder
    {
        public GoodsSupplyOrder()
        {
        }

        private int suID;
        private string suName;
        private string supplier;
        private string supplierPhone;
        private DateTime supplyTime;
        private decimal amount;
        private string currencyType;
        private string comment;
        private string operatorCode;
        private string operatorName;
        private string status;
        private string sourceType;
        private int sourceID;

        public virtual int SUID
        {
            get { return suID; }
            set { suID = value; }
        }

        public virtual string SUName
        {
            get { return suName; }
            set { suName = value; }
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

        public virtual DateTime SupplyTime
        {
            get { return supplyTime; }
            set { supplyTime = value; }
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

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
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

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
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