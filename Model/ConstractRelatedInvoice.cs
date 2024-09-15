using System;

namespace ProjectMgt.Model
{
    public class ConstractRelatedInvoice
    {
        public ConstractRelatedInvoice()
        {
        }

        private int id;
        private string receiveOpen;
        private string taxType;
        private string constractCode;
        private string invoiceCode;
        private decimal amount;
        private decimal taxRate;
        private DateTime openDate;
        private string relatedType;
        private string relatedID;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string ReceiveOpen
        {
            get { return receiveOpen; }
            set { receiveOpen = value; }
        }

        public virtual string TaxType
        {
            get { return taxType; }
            set { taxType = value; }
        }

        public virtual string ConstractCode
        {
            get { return constractCode; }
            set { constractCode = value; }
        }

        public virtual string InvoiceCode
        {
            get { return invoiceCode; }
            set { invoiceCode = value; }
        }

        public virtual decimal Amount
        {
            get { return amount; }
            set { amount = value; }
        }

        public virtual decimal TaxRate
        {
            get { return taxRate; }
            set { taxRate = value; }
        }

        public virtual DateTime OpenDate
        {
            get { return openDate; }
            set { openDate = value; }
        }

        public virtual string RelatedType
        {
            get { return relatedType; }
            set { relatedType = value; }
        }

        public virtual string RelatedID
        {
            get { return relatedID; }
            set { relatedID = value; }
        }
    }
}