namespace ProjectMgt.Model
{
    public class RCJProjectWorkMoney
    {
        private int id;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private int workConfirmID;

        public virtual int WorkConfirmID
        {
            get { return workConfirmID; }
            set { workConfirmID = value; }
        }

        private int projectID;

        public virtual int ProjectID
        {
            get { return projectID; }
            set { projectID = value; }
        }

        private int itemType;

        public virtual int ItemType
        {
            get { return itemType; }
            set { itemType = value; }
        }

        private int itemNo;

        public virtual int ItemNo
        {
            get { return itemNo; }
            set { itemNo = value; }
        }

        private int workMonth;

        public virtual int WorkMonth
        {
            get { return workMonth; }
            set { workMonth = value; }
        }

        private int workYear;

        public virtual int WorkYear
        {
            get { return workYear; }
            set { workYear = value; }
        }

        private double moneyNum;

        public virtual double MoneyNum
        {
            get { return moneyNum; }
            set { moneyNum = value; }
        }

        private int approveID;

        public virtual int ApproveID
        {
            get { return approveID; }
            set { approveID = value; }
        }
    }
}