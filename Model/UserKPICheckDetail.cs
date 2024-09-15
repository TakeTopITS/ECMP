namespace ProjectMgt.Model
{
    public class UserKPICheckDetail
    {
        public UserKPICheckDetail()
        {
        }

        private int id;
        private int kpiCheckID;
        private int sortNumber;
        private string kpiType;
        private string kpi;
        private string definition;
        private string kpiFunction;
        private string formula;
        private string sqlCode;
        private decimal unitSqlPoint;
        private string source;
        private decimal weight;
        private string target;
        private decimal selfPoint;
        private decimal leaderPoint;
        private decimal thirdPartPoint;
        private decimal sqlPoint;
        private decimal hrPoint;
        private decimal point;
        private string selfComment;
        private string leaderComment;
        private string thirdPartComment;
        private string hrComment;
        private string totalComment;

        private string operatorCode;
        private string operatorName;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual int KPICheckID
        {
            get { return kpiCheckID; }
            set { kpiCheckID = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }

        public virtual string KPIType
        {
            get { return kpiType; }
            set { kpiType = value; }
        }

        public virtual string KPI
        {
            get { return kpi; }
            set { kpi = value; }
        }

        public virtual string Definition
        {
            get { return definition; }
            set { definition = value; }
        }

        public virtual string KPIFunction
        {
            get { return kpiFunction; }
            set { kpiFunction = value; }
        }

        public virtual string Formula
        {
            get { return formula; }
            set { formula = value; }
        }

        public virtual string SqlCode
        {
            get { return sqlCode; }
            set { sqlCode = value; }
        }

        public virtual decimal UnitSqlPoint
        {
            get { return unitSqlPoint; }
            set { unitSqlPoint = value; }
        }

        public virtual string Source
        {
            get { return source; }
            set { source = value; }
        }

        public virtual decimal Weight
        {
            get { return weight; }
            set { weight = value; }
        }

        public virtual string Target
        {
            get { return target; }
            set { target = value; }
        }

        public virtual decimal SelfPoint
        {
            get { return selfPoint; }
            set { selfPoint = value; }
        }

        public virtual decimal LeaderPoint
        {
            get { return leaderPoint; }
            set { leaderPoint = value; }
        }

        public virtual decimal ThirdPartPoint
        {
            get { return thirdPartPoint; }
            set { thirdPartPoint = value; }
        }

        public virtual decimal SqlPoint
        {
            get { return sqlPoint; }
            set { sqlPoint = value; }
        }

        public virtual decimal HRPoint
        {
            get { return hrPoint; }
            set { hrPoint = value; }
        }

        public virtual decimal Point
        {
            get { return point; }
            set { point = value; }
        }

        public virtual string SelfComment
        {
            get { return selfComment; }
            set { selfComment = value; }
        }

        public virtual string LeaderComment
        {
            get { return leaderComment; }
            set { leaderComment = value; }
        }

        public virtual string HRComment
        {
            get { return hrComment; }
            set { hrComment = value; }
        }

        public virtual string ThirdPartComment
        {
            get { return thirdPartComment; }
            set { thirdPartComment = value; }
        }

        public virtual string TotalComment
        {
            get { return totalComment; }
            set { totalComment = value; }
        }

        public virtual string OperatorCode
        {
            get { return operatorCode; }
            set { operatorCode = value; }
        }

        public virtual string OperatorName
        {
            get { return operatorName; }
            set { operatorName = value; }
        }
    }
}