using System;

namespace ProjectMgt.Model
{
    public class SupplierAssetPaymentApplicant
    {
        public SupplierAssetPaymentApplicant()
        { }

        public virtual int AOID
        {
            set;
            get;
        }

        public virtual string AOName
        {
            get;
            set;
        }

        public virtual int ProjectID
        {
            get;
            set;
        }

        public virtual string ProjectName
        {
            get;
            set;
        }

        public virtual string PartA
        {
            get;
            set;
        }

        public virtual string PartAContactInformation
        {
            get;
            set;
        }

        public virtual string PaymentMethod
        {
            get;
            set;
        }

        public virtual string Attachment
        {
            get;
            set;
        }

        public virtual string ContractPayCondition
        {
            get;
            set;
        }

        public virtual decimal CurrentTotalPaymentAmount
        {
            get;
            set;
        }

        public virtual string CurrencyType
        {
            get;
            set;
        }

        public virtual decimal AleadyTotalInvoice
        {
            get;
            set;
        }

        public virtual decimal ShouldTotalInvoice
        {
            get;
            set;
        }

        public virtual string CompanyName
        {
            get;
            set;
        }

        public virtual string BankName
        {
            get;
            set;
        }

        public virtual string BankCode
        {
            get;
            set;
        }

        public virtual string ReceiptVoucher
        {
            get;
            set;
        }

        public virtual string UserCode
        {
            get;
            set;
        }

        public virtual string UserName
        {
            get;
            set;
        }

        public virtual DateTime CreateTime
        {
            get;
            set;
        }

        public virtual string Status
        {
            get;
            set;
        }
    }
}