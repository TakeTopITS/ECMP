using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 质量报验单
    /// </summary>
    public class QMQualityInspectionSheet
    {
        public QMQualityInspectionSheet()
        {
        }

        private string code;
        private string purchasingContractCode;
        private string purchasingContractName;
        private DateTime acceptDate;
        private string supplier;
        private string inspectionResults;
        private string type;
        private string dealResults;
        private DateTime createTime;
        private string createPer;
        private string status;

        /// <summary>
        /// 格式：QMQISX
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

        public virtual DateTime AcceptDate
        {
            get { return acceptDate; }
            set { acceptDate = value; }
        }

        public virtual string Supplier
        {
            get { return supplier; }
            set { supplier = value; }
        }

        public virtual string InspectionResults
        {
            get { return inspectionResults; }
            set { inspectionResults = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string DealResults
        {
            get { return dealResults; }
            set { dealResults = value; }
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