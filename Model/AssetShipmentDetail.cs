namespace ProjectMgt.Model
{
    public class AssetShipmentDetail
    {
        public AssetShipmentDetail()
        {
        }

        private int id;
        private int shipmentNO;
        private string assetCode;
        private string assetName;
        private string modelNumber;
        private string spec;
        private decimal number;
        private string unitName;
        private string manufacturer;
        private string fromPosition;
        private int fromAssetID;
        private string toPosition;
        private string comment;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ShipmentNO
        {
            get { return shipmentNO; }
            set { shipmentNO = value; }
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

        public virtual string UnitName
        {
            get { return unitName; }
            set { unitName = value; }
        }

        public virtual string Manufacturer
        {
            get { return manufacturer; }
            set { manufacturer = value; }
        }

        public virtual string FromPosition
        {
            get { return fromPosition; }
            set { fromPosition = value; }
        }

        public virtual int FromAssetID
        {
            get { return fromAssetID; }
            set { fromAssetID = value; }
        }

        public virtual string ToPosition
        {
            get { return toPosition; }
            set { toPosition = value; }
        }

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
        }
    }
}