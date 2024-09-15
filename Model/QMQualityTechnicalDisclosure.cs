using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 质量技术交底
    /// </summary>
    public class QMQualityTechnicalDisclosure
    {
        public QMQualityTechnicalDisclosure()
        {
        }

        private string code;
        private string purchasingContractCode;
        private string purchasingContractName;
        private string clarificationUnit;
        private string acceptClariUnit;
        private string disclosureContent;
        private DateTime createTime;
        private string createPer;
        private string status;

        /// <summary>
        /// 格式：QMQTDX
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

        public virtual string ClarificationUnit
        {
            get { return clarificationUnit; }
            set { clarificationUnit = value; }
        }

        public virtual string AcceptClariUnit
        {
            get { return acceptClariUnit; }
            set { acceptClariUnit = value; }
        }

        public virtual string DisclosureContent
        {
            get { return disclosureContent; }
            set { disclosureContent = value; }
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