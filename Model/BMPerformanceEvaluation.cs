using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 业绩评价
    /// </summary>
    public class BMPerformanceEvaluation
    {
        public BMPerformanceEvaluation()
        {
        }

        private int id;

        /// <summary>
        /// 自增ID
        /// </summary>
        public virtual int ID
        {
            get { return id; }
            set { id = value; }
        }

        private int bidPlanID;

        /// <summary>
        /// 招标方案ID
        /// </summary>
        public virtual int BidPlanID
        {
            get { return bidPlanID; }
            set { bidPlanID = value; }
        }

        private string bidPlanName;

        /// <summary>
        /// 招标方案名称
        /// </summary>
        public virtual string BidPlanName
        {
            get { return bidPlanName; }
            set { bidPlanName = value; }
        }

        private int expertID;

        /// <summary>
        /// 专家ID
        /// </summary>
        public virtual int ExpertID
        {
            get { return expertID; }
            set { expertID = value; }
        }

        private string cooperateDegree;

        /// <summary>
        /// 个人表现
        /// </summary>
        public virtual string CooperateDegree
        {
            get { return cooperateDegree; }
            set { cooperateDegree = value; }
        }

        private string remark;

        /// <summary>
        /// 业绩评估备注
        /// </summary>
        public virtual string Remark
        {
            get { return remark; }
            set { remark = value; }
        }

        private DateTime createTime;

        /// <summary>
        /// 创建时间
        /// </summary>
        public virtual DateTime CreateTime
        {
            get { return createTime; }
            set { createTime = value; }
        }

        private string enterCode;

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode
        {
            get { return enterCode; }
            set { enterCode = value; }
        }
    }
}