namespace ProjectMgt.Model
{
    public class RCJProjectCostPerformanceList
    {
        private int projectID;
        private int id;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private int itemNo;
        private string itemName;
        private int itemType;

        public virtual int ItemType
        {
            get { return itemType; }
            set { itemType = value; }
        }

        private string itemContent;
        private string itemUnit;
        private string subItem;

        public virtual string SubItem
        {
            get { return subItem; }
            set { subItem = value; }
        }

        private double itemPriceDevice;

        public virtual double ItemPriceDevice
        {
            get { return itemPriceDevice; }
            set { itemPriceDevice = value; }
        }

        private double itemPriceMainMaterial;

        public virtual double ItemPriceMainMaterial
        {
            get { return itemPriceMainMaterial; }
            set { itemPriceMainMaterial = value; }
        }

        private double itemPricePurchaseFee;

        public virtual double ItemPricePurchaseFee
        {
            get { return itemPricePurchaseFee; }
            set { itemPricePurchaseFee = value; }
        }

        private double itemPriceWage;

        public virtual double ItemPriceWage
        {
            get { return itemPriceWage; }
            set { itemPriceWage = value; }
        }

        private double itemPriceMaterial;

        public virtual double ItemPriceMaterial
        {
            get { return itemPriceMaterial; }
            set { itemPriceMaterial = value; }
        }

        private double itemPriceMachine;

        public virtual double ItemPriceMachine
        {
            get { return itemPriceMachine; }
            set { itemPriceMachine = value; }
        }

        private double itemPriceDeviceBudget;

        public virtual double ItemPriceDeviceBudget
        {
            get { return itemPriceDeviceBudget; }
            set { itemPriceDeviceBudget = value; }
        }

        private double itemPriceMainMaterialBudget;

        public virtual double ItemPriceMainMaterialBudget
        {
            get { return itemPriceMainMaterialBudget; }
            set { itemPriceMainMaterialBudget = value; }
        }

        private double itemPricePurchaseFeeBudget;

        public virtual double ItemPricePurchaseFeeBudget
        {
            get { return itemPricePurchaseFeeBudget; }
            set { itemPricePurchaseFeeBudget = value; }
        }

        private double itemPriceWageBudget;

        public virtual double ItemPriceWageBudget
        {
            get { return itemPriceWageBudget; }
            set { itemPriceWageBudget = value; }
        }

        private double itemComprehensiveFeeBudget;//

        public virtual double ItemComprehensiveFeeBudget
        {
            get { return itemComprehensiveFeeBudget; }
            set { itemComprehensiveFeeBudget = value; }
        }

        private double itemTaxesBudget;

        public virtual double ItemTaxesBudget
        {
            get { return itemTaxesBudget; }
            set { itemTaxesBudget = value; }
        }

        //private double itemPriceTotalBudget;

        //public virtual double ItemPriceTotalBudget
        //{
        //    get { return itemPriceTotalBudget; }
        //    set { itemPriceTotalBudget = value; }
        //}

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        public virtual int ItemNo
        {
            get { return itemNo; }
            set { itemNo = value; }
        }

        public virtual string ItemName
        {
            get { return itemName; }
            set { itemName = value; }
        }

        public virtual string ItemContent
        {
            get { return itemContent; }
            set { itemContent = value; }
        }

        public virtual string ItemUnit
        {
            get { return itemUnit; }
            set { itemUnit = value; }
        }

        //public virtual double ItemCount
        //{
        //    get { return itemCount; }
        //    set { itemCount = value; }
        //}

        private string projectSupplierID;

        public virtual string ProjectSupplierID
        {
            get { return projectSupplierID; }
            set { projectSupplierID = value; }
        }

        private double itemPriceMaterialBudget;

        public virtual double ItemPriceMaterialBudget
        {
            get { return itemPriceMaterialBudget; }
            set { itemPriceMaterialBudget = value; }
        }

        private double itemPriceMachineBudget;

        public virtual double ItemPriceMachineBudget
        {
            get { return itemPriceMachineBudget; }
            set { itemPriceMachineBudget = value; }
        }

        private int itemPriceChanged;

        public virtual int ItemPriceChanged
        {
            get { return itemPriceChanged; }
            set { itemPriceChanged = value; }
        }

        private int adjustID;

        public virtual int AdjustID
        {
            get { return adjustID; }
            set { adjustID = value; }
        }

        private string beginTime;

        public virtual string BeginTime
        {
            get { return beginTime; }
            set { beginTime = value; }
        }

        private string endTime;

        public virtual string EndTime
        {
            get { return endTime; }
            set { endTime = value; }
        }

        private int ifSplit;

        public virtual int IfSplit
        {
            get { return ifSplit; }
            set { ifSplit = value; }
        }

        public RCJProjectCostPerformanceList()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }
    }
}