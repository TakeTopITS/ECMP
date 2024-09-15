namespace ProjectMgt.Model
{
    public class RCJProjectCostFeeSubIDs
    {
        private int id;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string subTitle;

        public virtual string SubTitle
        {
            get { return subTitle; }
            set { subTitle = value; }
        }

        private int costFeeID;

        public virtual int CostFeeID
        {
            get { return costFeeID; }
            set { costFeeID = value; }
        }

        private int isFixed;

        public virtual int IsFixed
        {
            get { return isFixed; }
            set { isFixed = value; }
        }
    }
}