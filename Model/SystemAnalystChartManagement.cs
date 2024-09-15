namespace ProjectMgt.Model
{
    public class SystemAnalystChartManagement
    {
        public virtual int ID
        {
            get;
            set;
        }

        public virtual string ChartType
        {
            get;
            set;
        }

        public virtual string ChartName
        {
            get;
            set;
        }

        public virtual string LinkURL
        {
            get;
            set;
        }

        public virtual string SqlCode
        {
            get;
            set;
        }

        public virtual string Status
        {
            get;
            set;
        }
    }
}