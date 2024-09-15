namespace ProjectMgt.Model
{
    public class RCJProjectWorkDetailsLog
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

        private int adjustID;

        public virtual int AdjustID
        {
            get { return adjustID; }
            set { adjustID = value; }
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

        private double workNum;

        public virtual double WorkNum
        {
            get { return workNum; }
            set { workNum = value; }
        }

        private string changedByWho;

        public virtual string ChangedByWho
        {
            get { return changedByWho; }
            set { changedByWho = value; }
        }

        private string changedTime;

        public virtual string ChangedTime
        {
            get { return changedTime; }
            set { changedTime = value; }
        }

        private string changedMemo;

        public virtual string ChangedMemo
        {
            get { return changedMemo; }
            set { changedMemo = value; }
        }
    }
}