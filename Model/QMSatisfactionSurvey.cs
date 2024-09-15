using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 满意度调查
    /// </summary>
    public class QMSatisfactionSurvey
    {
        public QMSatisfactionSurvey()
        {
        }

        private string code;
        private string purchasingContractCode;
        private string purchasingContractName;
        private string supplier;
        private string satisfactionDegree;
        private string remark;
        private DateTime evaluationDate;
        private DateTime createTime;
        private string createPer;

        /// <summary>
        /// 格式：QMSFSX
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        public virtual string PurchasingContractCode
        {
            get { return purchasingContractCode; }
            set { purchasingContractCode = value; }
        }

        public virtual string PurchasingContractName
        {
            get { return purchasingContractName; }
            set { purchasingContractName = value; }
        }

        public virtual string Supplier
        {
            get { return supplier; }
            set { supplier = value; }
        }

        public virtual string SatisfactionDegree
        {
            get { return satisfactionDegree; }
            set { satisfactionDegree = value; }
        }

        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        public virtual DateTime EvaluationDate
        {
            get { return evaluationDate; }
            set { evaluationDate = value; }
        }

        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }

        public virtual string CreatePer
        {
            get { return createPer; }
            set { createPer = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}