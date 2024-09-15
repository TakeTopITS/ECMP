using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 工程保修
    /// </summary>
    public class QMEngineerWarranty
    {
        public QMEngineerWarranty()
        {
        }

        private string code;
        private string brieflyDescribe;
        private DateTime notificationDate;
        private DateTime warrantyDate;
        private string purchasingContractCode;
        private string purchasingContractName;
        private DateTime createTime;
        private string createPer;

        /// <summary>
        /// 格式：QMEGWX
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        public virtual string BrieflyDescribe
        {
            get { return brieflyDescribe; }
            set { brieflyDescribe = value; }
        }

        public virtual DateTime NotificationDate
        {
            get { return notificationDate; }
            set { notificationDate = value; }
        }

        public virtual DateTime WarrantyDate
        {
            get { return warrantyDate; }
            set { warrantyDate = value; }
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

        private string enterCode;

        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}