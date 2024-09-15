namespace ProjectMgt.Model
{
    public class ItemBomPart
    {
        private int id;
        private string itemCode;
        private string parentItemCode;

        private string childItemCode;
        private string childItemName;
        private string childItemType;
        private string childItemModelNumber;
        private string childItemSpecification;
        private string childItemPhotoURL;

        private decimal number;
        private decimal reservedNumber;
        private string unit;
        private int childItemVerID;
        private int verID;
        private decimal lossRate;
        private int sortNumber;

        private decimal puLeadTime;
        private decimal mfLeadTime;
        private decimal hrCost;
        private decimal mtCost;
        private decimal mfCost;
        private string defaultProcess;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string ItemCode
        {
            get { return itemCode; }
            set { itemCode = value; }
        }

        public virtual string ParentItemCode
        {
            get { return parentItemCode; }
            set { parentItemCode = value; }
        }

        public virtual string ChildItemCode
        {
            get { return childItemCode; }
            set { childItemCode = value; }
        }

        public virtual string ChildItemName
        {
            get { return childItemName; }
            set { childItemName = value; }
        }

        public virtual string ChildItemType
        {
            get;
            set;
        }

        public virtual string ChildItemSpecification
        {
            get;
            set;
        }

        public virtual string ChildItemModelNumber
        {
            get;
            set;
        }

        public virtual string ChildItemPhotoURL
        {
            get;
            set;
        }

        public virtual decimal Number
        {
            get { return number; }
            set { number = value; }
        }

        public virtual decimal ReservedNumber
        {
            get { return reservedNumber; }
            set { reservedNumber = value; }
        }

        public virtual string Unit
        {
            get { return unit; }
            set { unit = value; }
        }

        public virtual int ChildItemVerID
        {
            get { return childItemVerID; }
            set { childItemVerID = value; }
        }

        public virtual int VerID
        {
            get { return verID; }
            set { verID = value; }
        }

        public virtual decimal LossRate
        {
            get { return lossRate; }
            set { lossRate = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }

        public virtual decimal PULeadTime
        {
            get { return puLeadTime; }
            set { puLeadTime = value; }
        }

        public virtual decimal MFLeadTime
        {
            get { return mfLeadTime; }
            set { mfLeadTime = value; }
        }

        public virtual decimal HRCost
        {
            get { return hrCost; }
            set { hrCost = value; }
        }

        public virtual decimal MTCost
        {
            get { return mtCost; }
            set { mtCost = value; }
        }

        public virtual decimal MFCost
        {
            get { return mfCost; }
            set { mfCost = value; }
        }

        public virtual string DefaultProcess
        {
            get { return defaultProcess; }
            set { defaultProcess = value; }
        }

        public virtual string ChildItemBrand
        {
            set; get;
        }
    }
}