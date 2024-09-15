using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 质量隐患整改单
    /// </summary>
    public class QMQualityRectification
    {
        public QMQualityRectification()
        {
        }

        private string code;
        private string headUnit;
        private string responsibilityUnit;
        private string rectificationNoticeCode;
        private string rectificationNoticeName;
        private string rectificationRemark;
        private DateTime createTime;
        private string createPer;

        /// <summary>
        /// 格式：QMQRFX
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        public virtual string HeadUnit
        {
            get { return headUnit; }
            set { headUnit = value; }
        }

        public virtual string ResponsibilityUnit
        {
            get { return responsibilityUnit; }
            set { responsibilityUnit = value; }
        }

        public virtual string RectificationNoticeCode
        {
            get { return rectificationNoticeCode; }
            set { rectificationNoticeCode = value; }
        }

        public virtual string RectificationNoticeName
        {
            get { return rectificationNoticeName; }
            set { rectificationNoticeName = value; }
        }

        public virtual string RectificationRemark
        {
            get { return rectificationRemark; }
            set { rectificationRemark = value; }
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