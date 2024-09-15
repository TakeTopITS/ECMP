namespace ProjectMgt.Model
{
    /// <summary>
    /// 预算数据
    /// </summary>
    public class BDBaseData
    {
        public BDBaseData()
        {
        }

        private int id;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string departCode;

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        private string departName;

        public virtual string DepartName
        {
            get { return departName; }
            set { departName = value; }
        }

        private string accountCode;

        public virtual string AccountCode
        {
            get
            {
                return accountCode;
            }
            set { accountCode = value; }
        }

        private string accountName;

        public virtual string AccountName
        {
            get { return accountName; }
            set { accountName = value; }
        }

        private int yearNum;

        public virtual int YearNum
        {
            get { return yearNum; }
            set { yearNum = value; }
        }

        private int monthNum;

        public virtual int MonthNum
        {
            get { return monthNum; }
            set { monthNum = value; }
        }

        private decimal moneyNum;

        public virtual decimal MoneyNum
        {
            get { return moneyNum; }
            set { moneyNum = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }

        private string type;

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        private int projectCostID;

        public virtual int ProjectCostID
        {
            get { return projectCostID; }
            set { projectCostID = value; }
        }
    }
}