namespace ProjectMgt.Model
{
    public class ConstractRelatedEntryOrderForInner
    {
        public ConstractRelatedEntryOrderForInner()
        {
        }

        private int id;
        private string constractCode;
        private decimal amount;
        private string currency;
        private decimal exchangeRate;
        private decimal entryTax;
        private decimal addedValueTax;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string ConstractCode
        {
            get { return constractCode; }
            set { constractCode = value; }
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
    }
}