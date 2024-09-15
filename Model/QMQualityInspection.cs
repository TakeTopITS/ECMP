using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 质量检查
    /// </summary>
    public class QMQualityInspection
    {
        public QMQualityInspection()
        {
        }

        private string code;
        private string name;
        private string examinationContent;
        private DateTime inspectionDate;
        private string purchasingContractCode;
        private string purchasingContractName;
        private DateTime createTime;
        private string createPer;
        private string status;

        /// <summary>
        /// 格式：QMQINX
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }

        public virtual string ExaminationContent
        {
            get { return examinationContent; }
            set { examinationContent = value; }
        }

        public virtual DateTime InspectionDate
        {
            get { return inspectionDate; }
            set { inspectionDate = value; }
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