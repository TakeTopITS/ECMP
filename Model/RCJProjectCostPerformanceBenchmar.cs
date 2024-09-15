/// <summary>
/// CDBRCJProjectCostItem类用来操作T_RCJProjectCostItems数据表
/// </summary>
namespace ProjectMgt.Model
{
    public class RCJProjectCostPerformanceBenchmar
    {
        private int projectID;

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        private int id;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private int itemNo;

        public virtual int ItemNo
        {
            get { return itemNo; }
            set { itemNo = value; }
        }

        private int itemType;

        public virtual int ItemType
        {
            get { return itemType; }
            set { itemType = value; }
        }

        private double itemPriceDeviceAdjust;//
        private double itemPriceMainMaterialAdjust;//
        private double itemPriceWageAdjust;//
        private double itemPriceMaterialAdjust;//
        private double itemPriceMachineAdjust;//

        private double itemPriceDeviceActual;

        public virtual double ItemPriceDeviceActual
        {
            get { return itemPriceDeviceActual; }
            set { itemPriceDeviceActual = value; }
        }

        private double itemPriceMainMaterialActual;

        public virtual double ItemPriceMainMaterialActual
        {
            get { return itemPriceMainMaterialActual; }
            set { itemPriceMainMaterialActual = value; }
        }

        private double itemPricePurchaseFeeActual;

        public virtual double ItemPricePurchaseFeeActual
        {
            get { return itemPricePurchaseFeeActual; }
            set { itemPricePurchaseFeeActual = value; }
        }

        private double itemPriceWageActual;

        public virtual double ItemPriceWageActual
        {
            get { return itemPriceWageActual; }
            set { itemPriceWageActual = value; }
        }

        private double itemComprehensiveFeeActual;

        public virtual double ItemComprehensiveFeeActual
        {
            get { return itemComprehensiveFeeActual; }
            set { itemComprehensiveFeeActual = value; }
        }

        private double itemTaxesActual;

        public virtual double ItemTaxesActual
        {
            get { return itemTaxesActual; }
            set { itemTaxesActual = value; }
        }

        private double itemPriceTotalActual;

        public virtual double ItemPriceTotalActual
        {
            get { return itemPriceTotalActual; }
            set { itemPriceTotalActual = value; }
        }

        private double projectPlanCompleteBalance;

        public virtual double ProjectPlanCompleteBalance
        {
            get { return projectPlanCompleteBalance; }
            set { projectPlanCompleteBalance = value; }
        }

        private double projectBCRWP;

        public virtual double ProjectBCRWP
        {
            get { return projectBCRWP; }
            set { projectBCRWP = value; }
        }

        private double projectAI;

        public virtual double ProjectAI
        {
            get { return projectAI; }
            set { projectAI = value; }
        }

        private double projectEAV;

        public virtual double ProjectEAV
        {
            get { return projectEAV; }
            set { projectEAV = value; }
        }

        private string projectBV;

        public virtual string ProjectBV
        {
            get { return projectBV; }
            set { projectBV = value; }
        }

        private double projectPBCWP;

        public virtual double ProjectPBCWP
        {
            get { return projectPBCWP; }
            set { projectPBCWP = value; }
        }

        private double projectRV;

        public virtual double ProjectRV
        {
            get { return projectRV; }
            set { projectRV = value; }
        }

        public virtual double ItemPriceDeviceAdjust
        {
            get { return itemPriceDeviceAdjust; }
            set { itemPriceDeviceAdjust = value; }
        }

        public virtual double ItemPriceMainMaterialAdjust
        {
            get { return itemPriceMainMaterialAdjust; }
            set { itemPriceMainMaterialAdjust = value; }
        }

        public virtual double ItemPriceWageAdjust
        {
            get { return itemPriceWageAdjust; }
            set { itemPriceWageAdjust = value; }
        }

        public virtual double ItemPriceMaterialAdjust
        {
            get { return itemPriceMaterialAdjust; }
            set { itemPriceMaterialAdjust = value; }
        }

        public virtual double ItemPriceMachineAdjust
        {
            get { return itemPriceMachineAdjust; }
            set { itemPriceMachineAdjust = value; }
        }

        private double projectRVI;

        public virtual double ProjectRVI
        {
            get { return projectRVI; }
            set { projectRVI = value; }
        }

        public RCJProjectCostPerformanceBenchmar()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }
    }
}