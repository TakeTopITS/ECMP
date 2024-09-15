namespace ProjectMgt.Model
{
    public class ConstractPayableVisaDetail
    {
        public ConstractPayableVisaDetail()
        {
        }

        public virtual int ID
        {
            get; set;
        }

        public virtual int VisaID
        {
            get; set;
        }

        public virtual string VisaDetailName
        {
            get; set;
        }

        public virtual string UnitName
        {
            get; set;
        }

        public virtual decimal VisaNumber
        {
            get; set;
        }

        public virtual decimal VisaPrice
        {
            get; set;
        }

        public virtual decimal VisaAmount
        {
            get; set;
        }

        public virtual string Comment
        {
            get; set;
        }
    }
}