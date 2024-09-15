namespace ProjectMgt.Model
{
    /// <summary>
    /// 环境因素调查明细
    /// </summary>
    public class HSEEnvirFactorSurDetail
    {
        public HSEEnvirFactorSurDetail()
        {
        }

        private int id;
        private string envirFactorSurveyCode;
        private string envirFactorSurveyName;
        private string factorCode;
        private string factorName;
        private string evaluationResult;
        private string significantDegree;

        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        public virtual string EnvirFactorSurveyCode
        {
            get { return envirFactorSurveyCode; }
            set { envirFactorSurveyCode = value; }
        }

        public virtual string EnvirFactorSurveyName
        {
            get { return envirFactorSurveyName; }
            set { envirFactorSurveyName = value; }
        }

        public virtual string FactorCode
        {
            get { return factorCode; }
            set { factorCode = value; }
        }

        public virtual string FactorName
        {
            get { return factorName; }
            set { factorName = value; }
        }

        public virtual string EvaluationResult
        {
            get { return evaluationResult; }
            set { evaluationResult = value; }
        }

        public virtual string SignificantDegree
        {
            get { return significantDegree; }
            set { significantDegree = value; }
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