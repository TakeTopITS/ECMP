using System;

namespace ProjectMgt.Model
{
    public class ConstractRelatedEntryOrder
    {
        public ConstractRelatedEntryOrder()
        {
        }

        private int id;
        private string entryCode;
        private string preEntryCode;
        private string entryName;
        private DateTime importDate;
        private DateTime reportDate;

        private decimal amount;
        private decimal entryTax;
        private decimal exchangeRate;
        private string currency;

        private decimal addedValueTax;
        private string constractCode;
        private string customs;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string EntryCode
        {
            get { return entryCode; }
            set { entryCode = value; }
        }

        public virtual string PreEntryCode
        {
            get { return preEntryCode; }
            set { preEntryCode = value; }
        }

        public virtual DateTime ImportDate
        {
            get { return importDate; }
            set { importDate = value; }
        }

        public virtual DateTime ReportDate
        {
            get { return reportDate; }
            set { reportDate = value; }
        }

        public virtual string EntryName
        {
            get { return entryName; }
            set { entryName = value; }
        }

        public virtual decimal Amount
        {
            get { return amount; }
            set { amount = value; }
        }

        public virtual decimal EntryTax
        {
            get { return entryTax; }
            set { entryTax = value; }
        }

        public virtual decimal ExchangeRate
        {
            get { return exchangeRate; }
            set { exchangeRate = value; }
        }

        public virtual string Currency
        {
            get { return currency; }
            set { currency = value; }
        }

        public virtual decimal AddedValueTax
        {
            get { return addedValueTax; }
            set { addedValueTax = value; }
        }

        public virtual string ConstractCode
        {
            get { return constractCode; }
            set { constractCode = value; }
        }

        public virtual string Customs
        {
            get { return customs; }
            set { customs = value; }
        }
    }
}