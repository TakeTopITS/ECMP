namespace ProjectMgt.Model
{
    public class RCJProjectAdjustPrice
    {
        private int id;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string itemNo;

        public virtual string ItemNo
        {
            get { return itemNo; }
            set { itemNo = value; }
        }

        private string adjustItem;

        public virtual string AdjustItem
        {
            get { return adjustItem; }
            set { adjustItem = value; }
        }

        private double priceBeforeAdjust;

        public virtual double PriceBeforeAdjust
        {
            get { return priceBeforeAdjust; }
            set { priceBeforeAdjust = value; }
        }

        private double priceAfterAdjust;

        public virtual double PriceAfterAdjust
        {
            get { return priceAfterAdjust; }
            set { priceAfterAdjust = value; }
        }

        private string adjustByWho;

        public virtual string AdjustByWho
        {
            get { return adjustByWho; }
            set { adjustByWho = value; }
        }

        private string adjustTime;

        public virtual string AdjustTime
        {
            get { return adjustTime; }
            set { adjustTime = value; }
        }
    }
}