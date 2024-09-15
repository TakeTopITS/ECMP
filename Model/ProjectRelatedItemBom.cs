namespace ProjectMgt.Model
{
    public class ProjectRelatedItemBom
    {
        public ProjectRelatedItemBom()
        {
        }

        private int id;
        private int projectID;
        private string parentGuid;
        private string childGuid;
        private string itemCode;
        private string itemName;
        private string itemType;
        private string modelNumber;
        private string specification;
        private decimal number;
        private decimal reservedNumber;
        private string unit;
        private int verID;

        private decimal aleadyPurchased;
        private decimal aleadyCheckIn;
        private decimal aleadyProduction;
        private decimal aleadyCheckOut;

        private decimal puchasePrice;
        private decimal salePrice;
        private decimal puLeadTime;
        private decimal mfLeadTime;
        private decimal hrCost;
        private decimal mtCost;
        private decimal mfCost;

        private string defaultProcess;
        private string comment;

        private string photoURL;
        private int sortNumber;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual string ParentGuid
        {
            get { return parentGuid; }
            set { parentGuid = value; }
        }

        public virtual string ChildGuid
        {
            get { return childGuid; }
            set { childGuid = value; }
        }

        public virtual string ItemCode
        {
            get { return itemCode; }
            set { itemCode = value; }
        }

        public virtual string ItemName
        {
            get { return itemName; }
            set { itemName = value; }
        }

        public virtual string ItemType
        {
            get { return itemType; }
            set { itemType = value; }
        }

        public virtual string Specification
        {
            get { return specification; }
            set { specification = value; }
        }

        public virtual string ModelNumber
        {
            get { return modelNumber; }
            set { modelNumber = value; }
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

        public virtual int VerID
        {
            get { return verID; }
            set { verID = value; }
        }

        public virtual decimal AleadyPurchased
        {
            get { return aleadyPurchased; }
            set { aleadyPurchased = value; }
        }

        public virtual decimal AleadyPick
        {
            get; set;
        }

        public virtual decimal AleadyCheckIn
        {
            get { return aleadyCheckIn; }
            set { aleadyCheckIn = value; }
        }

        public virtual decimal AleadyProduction
        {
            get;
            set;
        }

        public virtual decimal AleadyCheckOut
        {
            get { return aleadyCheckOut; }
            set { aleadyCheckOut = value; }
        }

        public virtual decimal AleadySale
        {
            get; set;
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

        public virtual decimal PurchasePrice
        {
            get { return puchasePrice; }
            set { puchasePrice = value; }
        }

        public virtual decimal SalePrice
        {
            get { return salePrice; }
            set { salePrice = value; }
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

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
        }

        public virtual string PhotoURL
        {
            get { return photoURL; }
            set { photoURL = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }

        public virtual string Brand
        {
            get; set;
        }
    }
}