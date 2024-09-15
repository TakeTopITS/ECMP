using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 工程回访
    /// </summary>
    public class QMEngineerReview
    {
        public QMEngineerReview()
        {
        }

        private string code;
        private string purchasingContractCode;
        private string purchasingContractName;
        private string supplier;
        private string reviewContent;
        private DateTime createTime;
        private string createPer;
        private string enterCode;

        /// <summary>
        /// 格式：QMEGRX
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

        public virtual string ReviewContent
        {
            get { return reviewContent; }
            set { reviewContent = value; }
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

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}