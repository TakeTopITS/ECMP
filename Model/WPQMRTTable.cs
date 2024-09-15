using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// RT
    /// </summary>
    public class WPQMRTTable
    {
        public WPQMRTTable()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 无损检测类别
        /// </summary>
        public virtual string NondestructTestCategory { get; set; }

        /// <summary>
        /// 探伤比例
        /// </summary>
        public virtual string InspectionProportion { get; set; }

        /// <summary>
        /// 合格级别
        /// </summary>
        public virtual string QualifiedLevel { get; set; }

        /// <summary>
        /// RT评定标准
        /// </summary>
        public virtual string RTEvaluationCriteria { get; set; }

        /// <summary>
        /// 试件数量
        /// </summary>
        public virtual string NumberSpecimens { get; set; }

        /// <summary>
        /// RT委托日期
        /// </summary>
        public virtual DateTime RTCommissionedDate { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}