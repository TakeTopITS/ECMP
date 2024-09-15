namespace ProjectMgt.Model
{
    public class RCJProjectAdjustPriceList
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

        private int adjustID;

        public virtual int AdjustID
        {
            get { return adjustID; }
            set { adjustID = value; }
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

        private double comprehensivePriceAdjust;

        public virtual double ComprehensivePriceAdjust
        {
            get { return comprehensivePriceAdjust; }
            set { comprehensivePriceAdjust = value; }
        }

        private double taxesPriceAdjust;

        public virtual double TaxesPriceAdjust
        {
            get { return taxesPriceAdjust; }
            set { taxesPriceAdjust = value; }
        }

        private double projectBCWS;

        public virtual double ProjectBCWS
        {
            get { return projectBCWS; }
            set { projectBCWS = value; }
        }

        private double itemNum;

        public virtual double ItemNum
        {
            get { return itemNum; }
            set { itemNum = value; }
        }

        private string memo;

        public virtual string Memo
        {
            get { return memo; }
            set { memo = value; }
        }
    }
}