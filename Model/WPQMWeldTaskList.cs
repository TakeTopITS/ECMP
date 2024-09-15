using System;

namespace ProjectMgt.Model
{
    /// <summary>
    /// 焊接任务单
    /// </summary>
    public class WPQMWeldTaskList
    {
        public WPQMWeldTaskList()
        {
        }

        public virtual int ID { get; set; }

        /// <summary>
        /// 焊接工艺评定编码
        /// </summary>
        public virtual string WeldProCode { get; set; }

        /// <summary>
        /// 施焊时间
        /// </summary>
        public virtual DateTime UpTime { get; set; }

        /// <summary>
        /// 坡口形式
        /// </summary>
        public virtual string GrooveForm { get; set; }

        /// <summary>
        /// 背面清根方法
        /// </summary>
        public virtual string BackClearRootMethod { get; set; }

        /// <summary>
        /// 焊接技术措施
        /// </summary>
        public virtual string WeldTechnicalMeasures { get; set; }

        /// <summary>
        /// 任务单委托时间
        /// </summary>
        public virtual DateTime WeldTaskCommissionTime { get; set; }

        /// <summary>
        /// 任务单委托人
        /// </summary>
        public virtual string TaskPrincipal { get; set; }

        /// <summary>
        /// 任务单审核人
        /// </summary>
        public virtual string ReviewerTask { get; set; }

        /// <summary>
        /// 创建者编码
        /// </summary>
        public virtual string EnterCode { get; set; }
    }
}