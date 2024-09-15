using System;

namespace ProjectMgt.Model
{
    public class ConstractPayableVisa
    {
        public ConstractPayableVisa()
        {
        }

        public virtual int ID
        {
            get; set;
        }

        public virtual int ProjectID
        {
            get; set;
        }

        public virtual int ConstractPayableID
        {
            get; set;
        }

        public virtual string VisaName
        {
            get; set;
        }

        public virtual string VisaSignMan
        {
            get; set;
        }

        public virtual decimal VisaAmount
        {
            get; set;
        }

        public virtual string CurrencyType
        {
            get; set;
        }

        public virtual DateTime VisaSignTime
        {
            get; set;
        }

        public virtual string OperatorCode
        {
            get; set;
        }

        public virtual string OperatorName
        {
            get; set;
        }

        public virtual string Comment
        {
            get; set;
        }

        public virtual string Status
        {
            get; set;
        }

        public virtual string RelatedImpact
        {
            get; set;
        }

        public virtual string RelatedResult
        {
            get; set;
        }
    }
}