namespace ProjectMgt.Model
{
    public class KPILibrary
    {
        public KPILibrary()
        {
        }

        private int id;
        private int sortNumber;
        private string kpiType;
        private string kpi;
        private string definition;
        private string kpiFunction;
        private string formula;
        private string sqlCode;
        private decimal unitSqlPoint;
        private string source;
        private string relatedDepartment;
        private string relatedDuty;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
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

        public virtual string RelatedDepartment
        {
            get { return relatedDepartment; }
            set { relatedDepartment = value; }
        }

        public virtual string RelatedDuty
        {
            get { return relatedDuty; }
            set { relatedDuty = value; }
        }
    }
}