using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 质量奖惩通知单
    /// </summary>
    public class QMRewardPunishment
    {
        public QMRewardPunishment()
        {
        }

        private string code;
        private string penUnit;
        private string rewardsPunishment;
        private string qualityInspectionCode;
        private string qualityInspectionName;
        private DateTime createTime;
        private string createPer;

        /// <summary>
        /// 格式：QMRPTX
        /// </summary>
        public virtual string Code
        {
            get { return code; }
            set { code = value; }
        }

        public virtual string PenUnit
        {
            get { return penUnit; }
            set { penUnit = value; }
        }

        public virtual string RewardsPunishment
        {
            get { return rewardsPunishment; }
            set { rewardsPunishment = value; }
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