using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 材料设备验收单
    /// </summary>
    public class QMMatEquInspection
    {
        public QMMatEquInspection()
        {
        }

        private string code;
        private string name;
        private string purchasingContractCode;
        private string purchasingContractName;
        private string supplier;
        private string transportUnit;
        private string receivingUnit;
        private string inspectionResults;
        private DateTime inspectionDate;
        private string inspectionPer;
        private string status;

        /// <summary>
        /// 格式：QMMEIX
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

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string TransportUnit
        {
            get { return transportUnit; }
            set { transportUnit = value; }
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

        public virtual string ReceivingUnit
        {
            get { return receivingUnit; }
            set { receivingUnit = value; }
        }

        public virtual string InspectionResults
        {
            get { return inspectionResults; }
            set { inspectionResults = value; }
        }

        public virtual DateTime InspectionDate
        {
            get { return inspectionDate; }
            set { inspectionDate = value; }
        }

        public virtual string InspectionPer
        {
            get { return inspectionPer; }
            set { inspectionPer = value; }
        }

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}