namespace ProjectMgt.Model
{
    public class ProjectRelatedItem
    {
        public ProjectRelatedItem()
        {
        }

        private int id;
        private int projectID;
        private string itemCode;
        private string itemName;
        private string itemType;
        private string modelNumber;
        private string specification;
        private int bomVersionID;
        private decimal number;
        private decimal reservedNumber;
        private string unit;
        private string status;
        private string defaultProcess;
        private decimal aleadyPurchased;
        private decimal aleadyCheckIn;

        private decimal aleadyCheckOut;
        private string photoURL;

        private decimal purchasePrice;
        private decimal salePrice;
        private decimal puLeadTime;
        private decimal mfLeadTime;
        private decimal hrCost;
        private decimal mtCost;
        private decimal mfCost;

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

        public virtual int BomVersionID
        {
            get { return bomVersionID; }
            set { bomVersionID = value; }
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

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string DefaultProcess
        {
            get { return defaultProcess; }
            set { defaultProcess = value; }
        }

        public virtual decimal AleadySale
        {
            get; set;
        }

        public virtual decimal AleadyPurchased
        {
            get { return aleadyPurchased; }
            set { aleadyPurchased = value; }
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

        public virtual decimal AleadyPick
        {
            get; set;
        }

        public virtual decimal AleadyCheckOut
        {
            get { return aleadyCheckOut; }
            set { aleadyCheckOut = value; }
        }

        public virtual string PhotoURL
        {
            get { return photoURL; }
            set { photoURL = value; }
        }

        public virtual decimal PurchasePrice
        {
            get { return purchasePrice; }
            set { purchasePrice = value; }
        }

        public virtual decimal SalePrice
        {
            get { return salePrice; }
            set { salePrice = value; }
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

        public virtual string Brand
        {
            get; set;
        }

        public virtual string FirstDirectory
        {
            get; set;
        }

        public virtual string SecondDirectory
        {
            get; set;
        }

        public virtual string ThirdDirectory
        {
            get; set;
        }

        public virtual string FourthDirectory
        {
            get; set;
        }


        public virtual string Comment
        {
            get; set;
        }
    }
}