namespace ProjectMgt.Model
{
    /// <summary>
    /// 环境因素清单
    /// </summary>
    public class HSEEnvironmentalFactors
    {
        public HSEEnvironmentalFactors()
        {
        }

        private string code;

        /// <summary>
        /// 格式 HSEENFX
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        private string name;

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string process;

        public virtual string Process
        {
            get { return process; }
            set { process = value; }
        }

        private string activity;

        public virtual string Activity
        {
            get { return activity; }
            set { activity = value; }
        }

        private string tenses;

        public virtual string Tenses
        {
            get { return tenses; }
            set { tenses = value; }
        }

        private string status;

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        private string factorType;

        public virtual string FactorType
        {
            get { return factorType; }
            set { factorType = value; }
        }

        private string envirImpact;

        public virtual string EnvirImpact
        {
            get { return envirImpact; }
            set { envirImpact = value; }
        }

        private string copeStrategy;

        public virtual string CopeStrategy
        {
            get { return copeStrategy; }
            set { copeStrategy = value; }
        }

        private string lawRegulationReq;

        public virtual string LawRegulationReq
        {
            get { return lawRegulationReq; }
            set { lawRegulationReq = value; }
        }

        private string termFeatureReq;

        public virtual string TermFeatureReq
        {
            get { return termFeatureReq; }
            set { termFeatureReq = value; }
        }

        private string enterCode;

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}