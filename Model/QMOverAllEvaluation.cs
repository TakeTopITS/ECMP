using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 采购业务综合评价
    /// </summary>
    public class QMOverAllEvaluation
    {
        public QMOverAllEvaluation()
        {
        }

        private string code;
        private string purchasingContractCode;
        private string purchasingContractName;
        private string overAllEvaluation;
        private DateTime createTime;
        private string createPer;
        private string status;

        /// <summary>
        /// 格式：QMOAEX
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

        public virtual string OverAllEvaluation
        {
            get { return overAllEvaluation; }
            set { overAllEvaluation = value; }
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

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}