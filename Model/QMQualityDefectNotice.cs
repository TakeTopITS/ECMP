using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 采购质量缺陷通知单
    /// </summary>
    public class QMQualityDefectNotice
    {
        public QMQualityDefectNotice()
        {
        }

        private string code;
        private string name;
        private string matEquInsCode;
        private string matEquInsName;
        private string supplier;
        private string status;
        private string defectDescription;
        private DateTime createTime;
        private string createPer;

        /// <summary>
        /// 格式：QMQDNX
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

        public virtual string MatEquInsCode
        {
            get { return matEquInsCode; }
            set { matEquInsCode = value; }
        }

        public virtual string MatEquInsName
        {
            get { return matEquInsName; }
            set { matEquInsName = value; }
        }

        public virtual string Supplier
        {
            get { return supplier; }
            set { supplier = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string DefectDescription
        {
            get { return defectDescription; }
            set { defectDescription = value; }
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