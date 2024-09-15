namespace ProjectMgt.Model
{
    public class AssetApplicationDetail
    {
        public AssetApplicationDetail()
        {
        }

        private int id;
        private int aaid;
        private string assetCode;
        private string assetName;
        private string spec;
        private string modelNumber;
        private decimal number;
        private string unit;
        private string manufacturer;
        private string ip;
        private string relatedType;
        private int relatedID;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int AAID
        {
            get { return aaid; }
            set { aaid = value; }
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

        public virtual string Manufacturer
        {
            get { return manufacturer; }
            set { manufacturer = value; }
        }

        public virtual string IP
        {
            get { return ip; }
            set { ip = value; }
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