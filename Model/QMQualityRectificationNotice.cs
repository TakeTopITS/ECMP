using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 质量隐患整改通知单
    /// </summary>
    public class QMQualityRectificationNotice
    {
        public QMQualityRectificationNotice()
        {
        }

        private string code;
        private string name;
        private string responsibilityUnit;
        private DateTime inspectDate;
        private string inspectionMembers;
        private string informContent;
        private string status;
        private string qualityInspectionCode;
        private string qualityInspectionName;
        private DateTime createTime;
        private string createPer;

        /// <summary>
        /// 格式：QMQRNX
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

        public virtual string ResponsibilityUnit
        {
            get { return responsibilityUnit; }
            set { responsibilityUnit = value; }
        }

        public virtual DateTime InspectDate
        {
            get { return inspectDate; }
            set { inspectDate = value; }
        }

        public virtual string InspectionMembers
        {
            get { return inspectionMembers; }
            set { inspectionMembers = value; }
        }

        public virtual string InformContent
        {
            get { return informContent; }
            set { informContent = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string QualityInspectionCode
        {
            get { return qualityInspectionCode; }
            set { qualityInspectionCode = value; }
        }

        public virtual string QualityInspectionName
        {
            get { return qualityInspectionName; }
            set { qualityInspectionName = value; }
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