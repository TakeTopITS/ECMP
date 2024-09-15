namespace ProjectMgt.Model
{
    public class BookClassification
    {
        public BookClassification()
        {
        }

        private int id;
        private string classificationType;
        private string classificationCode;
        private string remark;
        private string dataType;

        public virtual string ClassificationType
        {
            get { return classificationType; }
            set { classificationType = value; }
        }

        public virtual string ClassificationCode
        {
            get { return classificationCode; }
            set { classificationCode = value; }
        }

        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        public virtual string DataType
        {
            get { return dataType; }
            set { dataType = value; }
        }

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }
    }
}