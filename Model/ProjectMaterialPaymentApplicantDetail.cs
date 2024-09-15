namespace ProjectMgt.Model
{
    public class ProjectMaterialPaymentApplicantDetail
    {
        public ProjectMaterialPaymentApplicantDetail()
        {
        }

        public virtual int ID
        {
            get;
            set;
        }

        public virtual int AOID
        {
            get;
            set;
        }

        public virtual string Type
        {
            get;
            set;
        }

        public virtual string GoodsCode
        {
            get;
            set;
        }

        public virtual string GoodsName
        {
            get;
            set;
        }

        public virtual string Spec
        {
            get;
            set;
        }

        public virtual string ModelNumber
        {
            get;
            set;
        }

        public virtual string Manufacture
        {
            get;
            set;
        }

        public virtual decimal Number
        {
            get;
            set;
        }

        public virtual string Unit
        {
            get;
            set;
        }

        public virtual decimal Price
        {
            get;
            set;
        }

        public virtual decimal Amount
        {
            get;
            set;
        }

        public virtual string AccountCode
        {
            get;
            set;
        }

        public virtual string AccountName
        {
            get;
            set;
        }

        public virtual string SourceType
        {
            get;
            set;
        }

        public virtual int SourceID
        {
            get;
            set;
        }

    }
}