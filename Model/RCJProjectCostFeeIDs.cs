namespace ProjectMgt.Model
{
    public class RCJProjectCostFeeIDs
    {
        private int id;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string title;

        public virtual string Title
        {
            get { return title; }
            set { title = value; }
        }

        private int feeType;

        public virtual int FeeType
        {
            get { return feeType; }
            set { feeType = value; }
        }
    }
}