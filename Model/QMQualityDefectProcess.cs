using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 采购质量缺陷处理报险
    /// </summary>
    public class QMQualityDefectProcess
    {
        public QMQualityDefectProcess()
        {
        }

        private string code;
        private string qualityDefectNoticeCode;
        private string qualityDefectNoticeName;
        private string dealRemark;
        private DateTime createTime;
        private string createPer;

        /// <summary>
        /// 格式：QMQDPX
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        public virtual string QualityDefectNoticeCode
        {
            get { return qualityDefectNoticeCode; }
            set { qualityDefectNoticeCode = value; }
        }

        public virtual string QualityDefectNoticeName
        {
            get { return qualityDefectNoticeName; }
            set { qualityDefectNoticeName = value; }
        }

        public virtual string DealRemark
        {
            get { return dealRemark; }
            set { dealRemark = value; }
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